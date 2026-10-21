---
description: Prepare a tagged release with notes from git history
---

Prepare release $ARGUMENTS.

1. Check that `main` is clean and all checks pass. If not, stop and report.
2. Draft release notes from `git log <previous tag>..HEAD`, or the whole history
   for a first release. Group them into features, fixes, and other changes, in
   plain language, and leave out `docs` and `chore` commits.
3. Show me the notes and the tag command (`git tag -a <version>`, with the notes as
   its message), and wait for my approval.
4. Once I approve, make a `docs` commit that removes the done items from `TODO.md`,
   along with any heading left empty, and adds the notes to `CHANGELOG.md` if the
   project has one. Tag that commit. Publish a release only when I ask.
