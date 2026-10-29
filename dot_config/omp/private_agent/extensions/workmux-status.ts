/**
 * Workmux status tracking extension for oh-my-pi.
 *
 * Reports agent status to workmux for tmux window status display.
 * See: https://workmux.dev/guide/status-tracking
 */

import { spawn } from "node:child_process";
import type { ExtensionAPI } from "@oh-my-pi/pi-coding-agent";

type PendingPrompt = { text: string; cwd: string };

function execWithPrompt(args: string[], prompt: PendingPrompt): Promise<number> {
  const { promise, resolve } = Promise.withResolvers<number>();
  try {
    const child = spawn("workmux", args, {
      cwd: prompt.cwd,
      shell: false,
      stdio: ["pipe", "ignore", "ignore"],
    });
    child.on("error", () => resolve(1));
    child.on("close", (code) => resolve(code ?? 1));
    child.stdin.on("error", () => {});
    child.stdin.end(JSON.stringify({ prompt: prompt.text }));
  } catch {
    resolve(1);
  }
  return promise;
}

export default function (pi: ExtensionAPI) {
  let lastStatus: string | undefined;
  let pendingPrompt: PendingPrompt | undefined;
  let statusQueue = Promise.resolve();

  function writeStatus(status: string, prompt?: PendingPrompt) {
    const args = ["set-window-status", status];
    const task = prompt ? execWithPrompt(args, prompt) : pi.exec("workmux", args);
    return task.then(() => {}, () => {});
  }

  function setStatus(status: string) {
    const prompt = status === "working" ? pendingPrompt : undefined;
    if (status === lastStatus && !prompt) return statusQueue;
    lastStatus = status;
    if (prompt) pendingPrompt = undefined;
    statusQueue = statusQueue.then(
      () => writeStatus(status, prompt),
      () => writeStatus(status, prompt),
    );
    return statusQueue;
  }

  pi.on("session_start", async () => {
    pendingPrompt = undefined;
    await pi.exec("workmux", ["register-agent"]).catch(() => {});
  });

  pi.on("input", async (event, ctx) => {
    const text = event.text.trimStart();
    if (event.source === "extension" || !text || text.startsWith("!") || text.startsWith("$")) return;
    pendingPrompt = { text: event.text, cwd: ctx.cwd };
    if (lastStatus === "working" && !text.startsWith("/")) await setStatus("working");
  });

  pi.on("agent_start", async () => { await setStatus("working"); });
  pi.on("tool_call", async (event) => { await setStatus(event.toolName === "ask" ? "waiting" : "working"); });
  pi.on("tool_execution_start", async () => { await setStatus("working"); });
  pi.on("agent_end", async () => {
    pendingPrompt = undefined;
    await setStatus("done");
  });
}
