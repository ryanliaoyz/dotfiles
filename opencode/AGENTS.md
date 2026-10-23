# Agent rules

These rules apply to every project. Each project's own `AGENTS.md` adds what is
specific to it. When the two conflict, the project file wins; when my request
conflicts with either, point it out, then follow my request. `AGENTS.md` files
never hold project status: what works belongs in the README's Overview, and
planned work in `TODO.md`. If a project has no `AGENTS.md`, tell me, and suggest
`/new-project` if it has no code yet.

## Working with me

- Ask when a decision is mine: scope, trade-offs, anything hard to undo.
  Otherwise pick the conventional option and say which you picked.
- Report what you checked and what you couldn't. Never claim a command, test or
  check that didn't run, and never describe planned work as done.
- Follow the project's existing conventions. Keep dependencies and abstractions
  proportional to the task.
- Never commit `AGENTS.md`, secrets, credentials, model weights, or generated
  build output.

## Planning

- `TODO.md` holds planned work only: a `## Version N` section with milestones as
  `###` headings, in the order to do them and with at most five items each, then
  a `## Later` section.
- Write each item as an outcome I can check by using or running the project, not
  as an implementation step.
- Work through the current milestone (the first with open items) unless I ask for
  something else. Stop for review when that work is done, when a decision is
  mine, or when you're blocked, not after every item.
- Don't add TODO items after the fact to cover fixes; describe a fix in its commit.

## Git

1. Before changing files, run `git status`. If there are changes you didn't make,
   stop and ask.
2. Put the changes for each milestone or other request on one branch, named
   `<type>/<slug>` (`feat`, `fix`, `docs`, `test`, `refactor`, `chore`). Branch
   from `main`, or from an unmerged branch when the work depends on it, and say
   which in the handoff.
3. Make one commit per item, fix, or other request, using Conventional Commits,
   with its tests and doc updates. An item's commit also checks it off in
   `TODO.md` and ends its subject with `(TODO: <item>)`.
4. If a check fails, don't commit. Report what failed and what you tried.
5. A branch is low-risk when every file in `git diff --name-only main...HEAD` is a
   Markdown file outside `.opencode/`, `.agents/` and `.claude/`, a stylesheet, or
   a test file, and no test or assertion is removed or loosened. A low-risk branch
   with all checks passing may be fast-forwarded into `main` locally; everything
   else waits for me to merge.
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

Before handing off a branch that isn't low-risk, run the `reviewer` subagent on it
if the branch touches persisting, deleting, or migrating data; concurrency or
async ordering; security; or the project's architecture rules. Give it only the
base branch, never your task or reasoning. Fix its findings or list the unfixed
ones in the handoff, and run it again only if a fix changes code it didn't cover.
Run it once per branch, when the milestone’s work is done, not after each commit.
To re-review after fixes, continue the same reviewer session (pass its `sessionID`) instead of starting a new one.”

## Handoff

Finish each branch with a short note, also used as the pull request description
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
- Diagnostics, and explanations of how a feature works, belong in the debug
  surface, tooltips, or logs, not in the main interface or normal output. Errors
  the user can act on do belong there.

## Documentation

- Write for a person new to the project and its stack, and keep it concise. Edit
  existing text rather than append, and delete what's no longer true. Describe
  behaviour and decisions, not test inventories.
- Update the affected doc when behaviour, setup, or a module's responsibility
  changes. Don't restructure docs as a side effect of unrelated work.
- Give each fact one home and link to it rather than repeating it. Record
  decisions a later agent would find surprising, with the reason, where the
  project file says.
- Check that every command and path a doc mentions exists. Docs never mention
  `AGENTS.md`; they explain the design themselves.

## Context budget

Every tool result stays in the conversation until compaction, so fetch only what the task needs.

- For questions that span several files, use the `explore` subagent and ask for file paths,
  line numbers and a short summary.
- Find code with the `grep` tool, then `read` only the range you need with `offset` and `limit`.
  Read whole files only when they're short.
- Make independent reads and searches in one step, or use `execute` (Code Mode) when you only
  need a digest of their results.
- When you only need pass/fail or the failures from a build or test, filter the output.
  Summarize JSON with `jq` or Code Mode instead of printing it.
