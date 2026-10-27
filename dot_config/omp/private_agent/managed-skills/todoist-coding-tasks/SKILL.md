---
name: todoist-coding-tasks
description: Create and manage personal coding tasks in Todoist when they must not become Linear issues.
---

# Todoist Coding Tasks

Use this skill when a user asks to create, find, or change a personal coding task in Todoist. Also use this skill for a user-requested task when the current directory is `~/Developer` or one of its child directories. Do not use Linear for these tasks.

## Command

Run Todoist through mise:

```sh
mise exec -- td <command>
```

Do not run bare `td`. The shell can define `td` as a different alias.

## Create a task

1. Get the available projects and labels before task creation.

   ```sh
   mise exec -- td project list --json
   mise exec -- td label list --json
   ```

2. Always apply the `Coding Projects` label. Do not omit it because the user does not name a label.

3. Resolve the project from user language. For a long-term coding task, use `LONG TERM / ON HOLD` when it exists.

4. Create the task with structured flags. Do not use the quick-add command.

   ```sh
   mise exec -- td task add "<task title>" \
     --project "<project id or name>" \
     --labels "Coding Projects" \
     --description "<task details>" \
     --json
   ```

5. Do not set a due date, deadline, or priority unless the user gives one.

6. Verify the created item by ID.

   ```sh
   mise exec -- td task view id:<task-id> --json
   ```

## Boundaries

- Create only the Todoist task that the user requests.
- Do not create, update, or link a Linear issue.
- Report the task title, project, labels, and Todoist URL after verification.
