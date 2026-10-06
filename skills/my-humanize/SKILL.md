---
name: my-humanize
description: "Find and remove the tells of AI-generated writing, using the pattern catalog from Wikipedia's \"Signs of AI writing\" (WikiProject AI Cleanup). Runs detect, rewrite, and self-audit passes covering puffed-up significance, canned notability claims, superficial -ing analysis, promotional tone, vague \"associated with\" links, weasel attributions, \"despite challenges\" conclusions, AI vocabulary (delve, pivotal, underscore, tapestry, showcase...), copula avoidance (\"serves as\"), negative parallelisms (\"not just X, but Y\"), rule-of-three lists, title-case headings, bold overuse, inline-header bullet lists, em dashes, emoji, curly quotes, chatbot correspondence (\"I hope this helps\"), source-availability disclaimers, placeholders, leaked citation markup (oaicite, turn0search, [cite: 1]), and AI edit summaries. Use when asked to humanize, de-AI, de-slop, or un-ChatGPT a draft; to make text sound less like AI or more like a person; to check whether something reads as AI-written; or to audit a draft for AI tells before it is sent or submitted."
---

# my-humanize

Rewrite text so it stops reading like chatbot output, or audit text for the signs that it does.
The catalog comes from Wikipedia's [Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)
field guide, as scraped on 2026-10-06. The full distilled notes, including the Wikipedia-only
markup and citation signs, are in `references/signs-of-ai-writing.md`. Load that file when
auditing wiki text or citations, or when a pattern below needs more detail.

## When to Use

- "Humanize this", "make it sound less like AI", "de-slop this", "does this read as ChatGPT?"
- A last pass on any draft Claude wrote that a human will send under their own name
- Auditing someone else's text for AI tells, which yields a report rather than a rewrite

Don't use it to evade a disclosure rule, such as an AI-use policy for a class or a publication.
Say so if the request looks like that.

## The core idea

LLMs regress to the mean. They swap specific, unusual facts for generic, positive, important-sounding
claims that could describe almost anything. "Inventor of the first train-coupling device"
becomes "a revolutionary titan of industry". The subject ends up **less specific and more
exaggerated** at once.

So the real fix is not deleting tell-words. It is **putting back the specific facts**, then saying
them plainly. Wikipedia's own warning applies: treat the signs as symptoms, not the
disease. Swapping synonyms just hides the problem.

## Workflow

### 1. Detect
Read the whole text once. Tag every hit against the catalog below, with its category
(Content, Language, Style, Communication, Markup). Hits cluster: where one AI-vocabulary word
appears, others usually follow. Density matters more than any single hit.

For an **audit-only** request, stop here and report the findings: each pattern, a quote, and why it
reads as AI. Then give an overall judgment hedged appropriately (see Caveats).

### 2. Rewrite
Work in this order, because the content fixes change the sentences that the style fixes would touch:
1. **Content:** delete puffery, legacy claims, and fake analysis. Replace each with the concrete
   fact underneath it. If no fact exists, cut the sentence. **Never invent facts to fill the
   gap**; ask the user or leave a visible `[TODO: specific]`.
2. **Language:** restore plain verbs (*is*, *has*, *was*), drop AI vocabulary, and break up formulaic
   parallelisms and triplets.
3. **Style and formatting:** fix headings to sentence case, strip decorative bold, turn
   inline-header lists back into prose where prose reads easily, and thin out em dashes.
4. **Communication residue:** remove chatbot asides, disclaimers, placeholders, and leaked markup.

Keep the author's meaning, facts, register, and variety of English. A casual text stays casual.

### 3. Self-audit
Re-scan the rewrite against the catalog. Rewrites tend to introduce new tells, especially *serves as*,
*-ing* tails, and triplets. Read it aloud mentally: would a knowledgeable person who cares about the
subject have written this sentence? Then deliver:
- the rewritten text
- a short list of what changed, grouped by category, only if the user wants it or the edit is large

## Pattern catalog

### Content

| Pattern | Tells | Fix |
| --- | --- | --- |
| **Undue significance / legacy** | stands/serves as, is a testament/reminder, pivotal/crucial/key role or moment, underscores its importance, reflects broader trends, enduring/lasting legacy, setting the stage for, marks a shift, evolving landscape, indelible mark, deeply rooted | State what happened. Delete claims that X "contributes to" a broader theme unless a source says so. |
| **Canned notability / media coverage** | independent coverage, featured/profiled in, national media outlets, trade publications, leading expert, active social media presence | Say what the coverage *said*, or drop it. Describing a source is not the same as citing its content. |
| **Superficial -ing analysis** | sentence ends with ", highlighting / underscoring / reflecting / symbolizing / contributing to / fostering / ensuring ..."; valuable insights; aligns/resonates with | Cut the participle tail. If the analysis is real, make it its own sentence with a named source. |
| **Promotional tone** | boasts, vibrant, rich, profound, showcasing, exemplifies, commitment to, nestled, in the heart of, groundbreaking, renowned, diverse array, natural beauty | Neutral description. Replace adjectives with measurable facts (dates, numbers, names). |
| **Vague connection** | associated with, connected to, in connection with, linked to | State the actual relationship: "was CEO of", "taught chemistry at". |
| **Weasel attributions** | experts argue, observers note, critics say, several sources (citing one), "such as" before a complete list | Name who said it, or remove the claim. Don't inflate one source into many. |
| **"Despite challenges" formula** | "Despite its X, Y faces several challenges...", "Future outlook", a hopeful closing line | Present specific problems where they belong in the text. Drop the formula and the uplift. |
| **"X and Y" sections / "Awards and recognition"** | headers pairing two nouns; recognition sections | Use headings that describe the real content. Fold awards into the narrative if they're minor. |

### Language and grammar

- **AI vocabulary.** These words are high-signal when several appear together: *additionally* (opening a sentence),
  *align with, boasts, bolstered, crucial, delve, emphasizing, enduring, enhance, fostering,
  garner, highlight* (verb), *interplay, intricate, key* (adjective), *landscape* (abstract),
  *meticulous, pivotal, robust, showcase, tapestry* (abstract), *testament, underscore* (verb),
  *valuable, vibrant*. Newer models lean on *emphasizing, enhance, highlighting, showcasing*. Grok
  favors *causal, empirical, correlate*. Take the list literally: synonyms are not suspect, and
  literal senses (an underscore character) are fine.
- **Copula avoidance.** *serves as / stands as / functions as / represents / marks* used where *is* would do.
  *features / offers / boasts / maintains* used where *has* would do. *Began his career as* or *ventured into X
  as* used where *was* would do. *Refers to* in a lead about a thing rather than a word. Use **is / are / has**.
- **Negative parallelism.** Watch for *Not only X but also Y*, *It's not X, it's Y*, *no X, no Y, just Z*, and *Y rather than X*.
  Say the positive claim directly unless a real misconception is being corrected.
- **Rule of three.** Reflexive triplets of adjectives or phrases make thin analysis look complete. Keep
  the items that carry information. Two or four is fine.
- **Elegant variation.** This is cycling synonyms to avoid repeating a noun ("the artist... the painter... the
  creator"). Repeat the clear word. Mostly a sign of older models, but worth fixing anyway.

### Style and formatting

- **Title Case Headings.** Use sentence case unless the house style says otherwise.
- **Bold overuse.** Bolding every instance of a key phrase in "key takeaways" style. Keep bold for real
  warnings or defined terms, if at all.
- **Inline-header vertical lists.** `- **Label:** description` repeated down the page. Turn short
  ones into prose. Keep a list only when the items are parallel and scannable.
- **Em dashes.** Frequent, spaced (" — "), and used for punchy sales emphasis. Replace most with
  commas, colons, parentheses, or full stops. A single dash is fine. Claude in particular overuses
  them, so check its own output.
- **Emoji** in headings or bullets. Remove them.
- **Curly vs. straight quotes.** Don't "fix" this as a humanizing step. Smart quotes come from Word and macOS by
  default. Only normalize to match the destination's convention, or when the two styles are mixed inconsistently.
- **Small tables** that would read better as a sentence. Convert them.
- **Heading structure.** Watch for a title heading repeating the document name, skipped levels, headings that only
  contain other headings, and `---` rules between every section. Clean these up.

### Communication residue (chatbot talking to its user)

- **Collaborative chatter.** *Certainly!*, *Of course!*, *I hope this helps*, *Let me know if...*, *Would you like
  me to...*, *Here is a...*, *You're absolutely right*. Delete these.
- **Source-availability hedges.** *While specific details are limited*, *not widely documented*, *based on
  available information*, *maintains a low profile*, *X should be treated as Y rather than Z*,
  *does not by itself establish*. Delete them. The writer either knows the fact or omits it. Also flag
  any speculation that follows the hedge.
- **Didactic disclaimers.** *It's important to note*, *worth noting*, *may vary*. These are mostly a sign of older models. Cut them.
- **Section summaries.** *In summary*, *In conclusion*, *Overall*, or a closing paragraph restating the
  point. Cut them unless the format needs one.
- **Knowledge-cutoff and refusal lines.** *As of my last update*, *As an AI language model*. Delete them.
- **Placeholders.** `[Name]`, `(Add URL here)`, `2025-xx-xx`. Fill them from the user or flag them.
  Never ship them.
- **Customer-service register** in messages. *I have carefully reviewed*, *I apologize for any
  inconvenience*, *I hope this message finds you well*, *I am writing to...*. Write like a person who
  knows the reader.

### Leaked markup (delete on sight)

Remove any of these:
- `:contentReference[oaicite:0]{index=0}`, `oai_citation`, `citeturn0search0`, and `({"attribution":...})` from ChatGPT
- `[cite: 1]` and `[span_1](start_span)` from Gemini
- `grok_card` from Grok
- `【85†L261-269】` from DeepSeek
- `[attached_file:1]` and `[web:1]` from Perplexity
- `:::writing{...}`
- `utm_source=chatgpt.com` or `=openai`, `utm_source=copilot.com`, and `referrer=grok.com` in URLs
- Markdown `**bold**` or `## headings` pasted into a destination that doesn't render Markdown

### Edit summaries and change notes

AI change notes follow templates. They promise "clarity, flow, and neutrality", list things
"preserved" or "avoided", stress that content is "sourced", and itemize parameter names. Rewrite them the
way a human would: brief and specific about the content. For example, "Added her 2019 debut album" or "ce", not
"Refined tone and enhanced clarity while preserving references".

## What humans do that AI avoids

Leaning toward these patterns makes text read human. They are also often just better prose:
- plain *is / has* sentences, such as *there is a*, *it has a*
- plain verbs over stiff ones: *wrote* (not authored), *moved* (not relocated), *used* (not utilized),
  *tried* (not attempted), *died* (not passed away)
- committed claims where they're true, like *the first* or *the only*
- ordinary qualifiers such as *very*, *perhaps*, *tends to*
- some ordinary wordiness, such as *in order to* or *the fact that*. Don't strip every one.

## Caveats

- **Signs are not proof.** People are about as good as chance at spotting AI text by style, and
  detector tools have real error rates. Hedge any "this is AI" verdict, and weigh how many signs cluster together.
- **These are weak signals on their own:** perfect grammar, mixed registers, formal or "fancy" prose,
  isolated transitions, missing citations, curly quotes, and dash use alone.
- **Don't over-correct.** Removing every em dash and every instance of *key* produces stilted text and
  just moves the tells elsewhere. The goal is specific, plain, accurate prose.
- **Preserve meaning and facts.** If a sentence has nothing specific underneath it, flag it for the
  author. Don't make something up.
- The catalog reflects the models as of late 2026. Word lists drift with each model era, so update this
  skill when the source page changes. See the README for how.
