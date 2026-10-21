---
description: Start a new project: rules, plan, README, scaffold, and CI
---

We're starting a new project: $ARGUMENTS

Don't write application code until I approve the plan. If this folder isn't a git
repository yet, run `git init -b main` first.

1. If the description above doesn't settle the project's purpose, its users, and
   its non-goals, ask about them in one message before drafting anything.
2. Draft the project's `AGENTS.md` with these sections only, leaving out anything
   the global rules (`~/.config/opencode/AGENTS.md`) already cover:
   - purpose and non-goals;
   - architecture rules: the invariants that must always hold;
   - scope limits: what not to add (services, dependencies, features);
   - commands for build, test, lint/format, and type-check, which the scaffold
     will create;
   - verification: which risks need deterministic tests, and any real-runtime
     checks that unit tests can't cover;
   - the debug surface, where internal state is shown during development;
   - the documentation layout, and where decisions are recorded;
   - files to preserve.
3. Write `TODO.md` in the layout the global Planning rules describe. Start
   `## Version 1` with what "version 1 is done" means in terms a user would
   notice, and make the scaffold its first milestone.
4. Write a README skeleton with three sections: **Overview** (what the project is
   for, and that nothing works yet), **Quickstart** (a heading only, until the
   scaffold adds working commands), and **Further reading** (links to docs that
   exist).
5. Show me all three, ask which CI service to use, and wait for my approval.
6. Once I approve, add `AGENTS.md` to `.gitignore`, and commit `README.md`,
   `TODO.md` and `.gitignore` directly to `main`; my approval stands in for the
   merge.
7. Then do the scaffold milestone on a `chore/scaffold` branch like any other
   milestone: the commands above working on an empty app, one passing test, the
   Quickstart filled in, and CI running the same checks on every push. CI can't
   run until I push, so list it under checks not run in the handoff.
