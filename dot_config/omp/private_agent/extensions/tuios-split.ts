import type { ExtensionAPI } from "@oh-my-pi/pi-coding-agent";

// /split opens a fresh OMP conversation to the right in the current TUIOS session.
export default function (pi: ExtensionAPI) {
  pi.registerCommand("split", {
    description: "Open a new OMP conversation in a TUIOS split",
    handler: async (_args, ctx) => {
      if (process.env.TUIOS_ENV !== "1") {
        ctx.ui.notify("/split requires a TUIOS pane", "error");
        return;
      }
      try {
        const result = await pi.exec("tuios", ["split-window", "right", "--cwd", ctx.cwd, "--", "omp"]);
        if (result.code !== 0) {
          ctx.ui.notify(`Could not open split: ${result.stderr.trim() || `exit ${result.code}`}`, "error");
        }
      } catch (error) {
        ctx.ui.notify(`Could not open split: ${error instanceof Error ? error.message : String(error)}`, "error");
      }
    },
  });
}
