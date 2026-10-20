---
description: Start a new project: rules, plan, README, scaffold, and CI
---

We're starting a new project: $ARGUMENTS

Don't write application code yet. Work through these steps with me, and ask
whenever the answer is mine:

1. Agree on the project's purpose, its users, and its non-goals.
2. Draft the project's `AGENTS.md` with these sections, and ask whether to commit
   it or keep it out of git:
   - purpose and non-goals (no status);
   - architecture rules: the few invariants that must always hold;
   - scope limits: what not to add (services, dependencies, features);
   - commands for build, test, lint/format, and type-check;
   - verification: which risks need deterministic tests, and any real-runtime
     checks that unit tests can't cover;
   - the debug surface, where internal state is shown during development;
   - the documentation layout, and where decisions are recorded;
   - files to preserve.
3. Write `TODO.md`, starting with what "version 1 is done" means in terms a user
   would notice, followed by the first milestones.
4. Write a README skeleton: what the project is, quickstart, further reading.
5. Show me all three and wait for my approval.
6. Then do the first milestone, the scaffold: the commands above working on an
   empty app, one passing test, and CI running the checks on every push (ask me
   which CI service to use).
