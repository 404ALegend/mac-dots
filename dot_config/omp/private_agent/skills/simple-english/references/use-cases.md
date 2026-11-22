# Use cases beyond documentation

STE was built for aircraft maintenance manuals. The same rules apply where a misreading has a cost: one meaning per word, short sentences, and condition-first commands.

## Error messages and CLI output

Mode: procedural. State what happened in simple past, state the cause if known, then give the corrective command or condition.

## Runbooks and standard operating procedures

Mode: procedural. Every step is imperative and has one instruction. Put each required condition first. Put warnings before the step. No sentence has more than 20 words.

## Incident reports and postmortems

Mode: descriptive and simple past only. State what is known. State "unknown" for the rest.

## Commit messages and PR descriptions

Mode: imperative subject line and descriptive body. Apply the word swaps and the 25-word body limit. Delete "this PR aims to".

## API changelogs and release notes

Mode: descriptive. One entry, one change, one sentence where possible. A breaking change follows the warning pattern: command first, risk second.

## Instructions for AI agents

Mode: procedural. One instruction per sentence keeps each rule quotable. One word, one meaning prevents models from treating similar words as different operations. Do not use "should". Write "must" or delete the rule.

## Support macros and status-page updates

Mode: descriptive with a 25-word limit. State facts for readers who might not be native speakers.

## Translation and localization prep

Mode: strict. One meaning per word and complete grammar reduce translation ambiguity.

## UI copy and empty states

Mode: procedural with hard length limits. Buttons and labels are technical names and are exempt.

## Where STE does not fit

Do not use STE for marketing pages, launch posts, blog posts, or brand writing. It removes persuasion. Use it for the documentation that those texts link to.
