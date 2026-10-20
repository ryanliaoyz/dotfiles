---
name: guided-review
description: Walk me through a branch's changes as annotated code excerpts, explained for my background, so I can review them before merging.
metadata:
  opencode/slash: "true"
  opencode/autoinvoke: "false"
---

Walk me through the changes on the current branch against `main`, or the commit
or range I name. Don't modify files, and don't run tests, builds, or type checks;
the implementing agent's handoff lists what ran.

Start with `git log --oneline main..HEAD` and `git diff --stat main...HEAD`. Read
only the diff and the files needed to explain it.

About me: I'm an experienced C++ engineer who debugs with breakpoints. Explain
other languages' idioms through their closest C++ equivalent.

## Output format

Write the review as a walkthrough of code excerpts. Never refer to code by line
number alone: every point quotes the code it's about.

1. **Summary.** Three sentences on what changed and why. If the project's
   `AGENTS.md` states architecture rules, name the ones this change touches.

2. **Walkthrough.** Go through the core logic in reading order: data types first,
   then the main functions. Skip trivial or boilerplate changes. For each excerpt:
   - Show the code in a fenced block with its file name and line range, at most
     about 15 lines. Split longer functions into several excerpts.
   - Explain what it does in plain language, in 1–3 sentences.
   - If it uses an idiom I wouldn't know, show the closest C++ equivalent as a
     short snippet, only at its first occurrence.
   - Where useful, say where you'd set a breakpoint, or which debug output to
     watch, to see this code run.
   - If the excerpt is risky, say why, and name the test that covers it or say
     that none does.

3. **Tests.** List test names grouped by the behaviour they check, one line each.
   Quote test code only where it shows something the walkthrough didn't.

4. **Questions.** End with 2–3 questions I should be able to answer before
   approving.
