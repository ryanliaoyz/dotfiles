# Agent rules

These rules apply to every project. Each project's own `AGENTS.md` adds what is
specific to it: purpose, architecture rules, commands, verification, the debug
surface, and the documentation layout. When the two conflict, the project file
wins; when my request conflicts with either, point it out, then follow my request.
Rule files hold rules only; project status belongs in the README and `TODO.md`.
If the project has no `AGENTS.md`, tell me and suggest `/new-project`.

## Working with me

- Ask when a decision is mine: scope, trade-offs, anything hard to undo.
  Otherwise pick the conventional option and say which you picked.
- Report what you checked and what you couldn't. Never claim a command, test or
  check that didn't run, and never describe planned work as done.
- Follow the project's existing conventions. Keep dependencies and abstractions
  proportional to the task.
- Never commit secrets, credentials, model weights, or generated build output.

## Planning

- `TODO.md` holds planned work only: the current version's items, then "Later".
  Write items as capabilities a user would notice, not implementation steps, and
  split them into commits yourself.
- Work through the current milestone, or the batch I name. Stop for review when
  it's done, when a decision is mine, or when you're blocked, not after every item.
- Don't add TODO items after the fact to cover fixes; describe a fix in its commit.

## Git

1. Before starting, run `git status`. If there are changes you didn't make, stop
   and ask.
2. Use one branch per milestone or session, named `<type>/<slug>` (`feat`, `fix`,
   `docs`, `test`, `refactor`, `chore`). Branch from `main`, or from an unmerged
   branch when the work depends on it, and say which in the handoff.
3. Make one commit per item or fix, using Conventional Commits, including its
   tests and doc updates. When a commit completes a TODO item, check the item off
   in the same commit and end the subject with `(TODO: <item>)`.
4. If a check fails, don't commit. Report what failed and what you tried.
5. A low-risk branch (docs, copy, styling, or tests only) with all checks passing
   may be fast-forwarded into `main` locally. Everything else waits for me to merge.
6. Never amend or rebase existing commits, delete branches, or skip hooks. Push or
   open pull requests only when I ask.

## Verification

- Use the project's real scripts; don't invent lint, build, or test commands.
- Write deterministic tests for the risks the project lists, and mock external
  services (models, network) in unit tests.
- A bug fix includes a test that would have caught the bug.
- When a change depends on runtime behaviour that tests can't observe, verify it
  the way the project file describes, and say how.

## Review

Before handing off a branch, run the `reviewer` subagent on it if the branch
touches persisting, deleting, or migrating data; concurrency or async ordering;
security; or the project's architecture rules. Skip branches that only change
docs, copy, styling, or tests. Give the reviewer only the base branch, never your
task or reasoning. Fix its findings or list the unfixed ones in the handoff, and
run it again only if a fix changes code it didn't cover.

## Handoff

End each milestone with a short note, also used as the pull request description
when I ask for one:

- what changed, by commit;
- what to read closely (risky files or functions) and what to skim;
- what to try by hand;
- checks run, checks not run, and review findings left open.

## Observability

- Make every feature with internal state inspectable during development, in the
  same change: what it holds, what it's waiting for, and why it last decided
  something. Use the project's debug surface (a debug panel, a console or log
  behind a flag, verbose CLI output).
- Diagnostics and explanations belong in the debug surface, tooltips, or logs, not
  in the main interface or normal output. Once a feature settles, remove its
  explanatory text from the main interface and keep its diagnostics.

## Documentation

- Write for a person new to the project and its stack, and keep it concise. Edit
  existing text rather than append, and delete what's no longer true. Describe
  behaviour and decisions, not test inventories.
- Update the affected doc in the same commit when behaviour, setup, or a module's
  responsibility changes. Don't restructure docs as a side effect of unrelated work.
- Give each fact one home and link to it rather than repeating it. Record
  decisions a later agent would find surprising, with the reason, where the
  project file says.
- Check that every command and path a doc mentions exists.
