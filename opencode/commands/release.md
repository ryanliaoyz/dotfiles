---
description: Prepare a tagged release with notes from git history
---

Prepare release $ARGUMENTS.

1. Check that `main` is clean and all checks pass. If not, stop and report.
2. Draft release notes from `git log <previous tag>..HEAD`, or the whole history
   for a first release. Group them into features, fixes, and other changes, in
   plain language, and leave out docs and chore commits that don't matter to users.
3. In a docs commit, remove the done items from `TODO.md` and keep the open ones.
4. Show me the notes and the tag command (`git tag -a <version>`, with the notes as
   its message). Tag, push, or publish a release only after I approve.
5. Update a `CHANGELOG.md` only if the project already has one.
