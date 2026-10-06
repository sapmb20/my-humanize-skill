# Signs of AI writing — distilled notes

Source: [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing),
an advice page from WikiProject AI Cleanup. Retrieved 2026-10-06. The source text is licensed
under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). These notes are a
paraphrased adaptation and are shared under the same license. Shortcuts such as `WP:AILEGACY`
point back to the matching section of the page.

The page is a field guide for spotting undisclosed AI text on Wikipedia. It describes what it has
observed; it doesn't set rules. Some signs are specific to Wikipedia. The patterns are symptoms of
deeper problems: unsourced synthesis, puffery, and fabricated sources. Fixing only the surface
makes detection harder without fixing the text.

As of October 2026, the most common signs in new AI text on Wikipedia were:
- Markdown
- AI-written edit summaries
- hedging disclaimers about source availability or usage
- vague "connected with / associated with" phrasing
- canned emphasis on attribution and media coverage

---

## Caveats

- **Detector tools** (GPTZero, Pangram) beat chance but have non-trivial error rates. Paraphrasing,
  markup, or spacing changes can fool them, as can models they weren't trained on. A high detector
  score alone is not grounds for speedy deletion under G15.
- **Human judgment is unreliable.** One 2025 study found people no better than chance. A German theses
  study found 57% recognition for AI text and 64% for human text. Frequent LLM users acting as
  "expert" annotators reached about 90% recall with about 3.3% false positives.
- **Convergence runs one way.** Human speech and writing are drifting toward LLM style (podcasts and word
  choice show it). LLM output is not drifting toward human style.

## Content (`WP:AIWTW`, `WP:AI-ISM`)

**Why it happens.** Models predict the statistically likely continuation, and RLHF then tunes them toward broadly
palatable prose. Rare, specific facts get smoothed into generic praise. The text becomes less specific
and more exaggerated at the same time.

- **Undue significance, legacy, broader trends** (`WP:AILEGACY`). Typical wording: *stands/serves as,
  testament/reminder, crucial/pivotal/vital/key role or moment, underscores/highlights its importance,
  reflects broader, enduring/lasting, contributing to, setting the stage for, marking/shaping,
  represents a shift, turning point, evolving landscape, focal point, indelible mark, deeply rooted*.
  - Places a subject amid "broader debates", or says it "participated in public discussions".
  - Shows up even for mundane facts like etymology and population figures, sometimes after a hedge that the
    topic is minor.
  - In biology, it overstates ecosystem links and conservation efforts.
- **Canned notability, attribution, media coverage** (`WP:OVERATTRIBUTION`). Typical wording: *independent
  coverage, local/national media outlets, trade publications, cited/featured/profiled in, leading
  expert, active social media presence*.
  - Describes the *kind* of sources rather than their content, and echoes Wikipedia's own guideline
    wording. More common in 2025+ models.
  - "Maintains an active social media presence" is a strong idiosyncratic tell.
- **Superficial analyses** (`WP:SUPERFICIAL`). These are trailing present-participle clauses: *highlighting,
  underscoring, emphasizing, ensuring, reflecting, symbolizing, contributing to, cultivating, fostering,
  encompassing, enhancing, valuable insights, align/resonate with*. Newer RAG-enabled bots pin these
  claims on named sources that don't actually say them.
- **Promotional language** (`WP:AIPEACOCK`). Typical wording: *boasts, vibrant, rich, profound, enhancing,
  showcasing, exemplifies, commitment to, natural beauty, nestled, in the heart of, groundbreaking,
  renowned, featuring, diverse array*.
  - Reads like a travel guide or press release, even when asked for an encyclopedic tone. It can even
    appear in a rewrite that claims to have "removed promotional tone".
  - "Cultural heritage" topics get constant reminders of their importance.
  - Older models (GPT-4) are blatantly positive. Newer ones are subtler and avoid "the best".
- **Vague connection or association** (`WP:AICONNECT`). *associated with, connected to, in connection
  with*, used instead of stating the relationship, and often piled up with buzzwords.
- **Vague attributions and overgeneralization** (`WP:AIWEASEL`). *Industry reports, observers have cited,
  experts argue, some critics argue, several sources* (when only one is cited), and *such as* before an
  exhaustive list. These present one or two views as widely held.
- **"Challenges" conclusions** (`WP:FACESCHALLENGES`). The formula "Despite its [praise], [subject] faces
  several challenges..." ends on a vaguely positive note or on speculation about future initiatives,
  often alongside a "Future prospects" section. The tell is the rigid formula, not the mere mention of challenges.
- **"Awards and recognition" sections.** "X and Y" headers in general, and this exact one, are far
  more common in AI drafts, even compared with promotional human drafts.

## Language and grammar

- **AI vocabulary** (`WP:AIVOCAB`). These words are overused after 2022 and tend to co-occur. One or two
  is coincidence; many is one of the strongest tells. Grouped by model era:
  - *2023 to mid-2024 (GPT-4):* additionally, boasts, bolstered, crucial, delve, emphasizing, enduring,
    garner, intricate/intricacies, interplay, key, landscape, meticulous, pivotal, underscore,
    tapestry, testament, valuable, vibrant
  - *Mid-2024 to mid-2025 (GPT-4o):* align with, bolstered, crucial, emphasizing, enhance, enduring,
    fostering, highlighting, pivotal, showcasing, underscore, vibrant
  - *Mid-2025 onward (GPT-5):* emphasizing, enhance, highlighting, showcasing, plus the canned
    notability wording
  - *Grok:* pseudo-scientific words (causal, empirical, correlate) and, still in 2026, *underscore*
  - "Delve" peaked in 2023 and early 2024, then fell sharply in 2025.

  Take the list literally. Synonyms aren't implicated, and literal senses are fine.
- **Avoiding copulas** (`WP:AINOCOPULA`).
  - *serves as, stands as, marks, functions as, represents* used in place of *is*
  - *boasts, features, maintains, offers* used in place of *has*
  - *refers to* in leads
  - Newer output uses fancier forms: *ventured into politics as a candidate*, *began his career as*.
  - One study found use of *is/are* in academic writing dropped by more than 10% in 2023. AI copyedits
    "improve" text in exactly this direction.
- **Negative parallelisms** (`WP:AIPARALLEL`). The forms include:
  - *Not only... but also*, and *It's not just X, it's Y*. These can span two sentences ("X. Y, however,
    ...").
  - *Not X, but Y*, and *no X, no Y, just Z*
  - *Y rather than X*, which is especially common in recent output
- **Leads that treat list or broad titles as proper nouns.** "List of X is a..." or a lead that defines a generic
  topic as if it were an entity.
- **Rule of three** (`WP:RO3`). Triplets of adjectives or short phrases make thin analysis look complete.
  The sign is stronger where nobody would bother, as in edit summaries.

## Style

- **Title case in headings** (`WP:AITITLECASE`).
- **Boldface overuse** (`WP:AIBOLD`). Every instance of a phrase gets bolded, in "key takeaways" style, a habit inherited from
  READMEs, slide decks, and listicles.
- **Inline-header vertical lists** (`WP:AILIST`). The shape is marker, then **Bold label**, then a colon, then text.
  - Markers can be •, -, –, #, or emoji, and numbered lists use literal "1." instead of wikitext.
  - Some versions omit the colon.
- **Em dashes** (`WP:AIDASH`). More frequent than in comparable human writing, used where a comma,
  parenthesis, or colon would fit, and in punchy sales cadence. They are often spaced, against typographic
  convention.
  - The sign is weak alone and more common in talk pages than in articles.
  - GPT-5.1 was tuned to suppress them. A July 2026 study found **only Claude** still used them more than
    professional writers, and ChatGPT used them less.
  - The page flags this sign as possibly moving to the historical list.
- **Heading errors.** These include:
  - a title heading repeating the article name
  - skipped H2 levels, jumping straight to `===`
  - level-1 `= Heading =` sections, which come from Markdown conversion
  - headings that contain only other headings
- **Emoji as formatting** (`WP:AIEMOJI`), in headings and bullets. This is rarer now.
- **Odd tables** (`WP:AITABLE`). Tiny tables that should be prose or an infobox, or Markdown tables pasted inside wikitables.
- **Curly quotes and apostrophes** (`WP:AICURLY`). ChatGPT and DeepSeek use them, sometimes mixed with straight quotes.
  - This is weak evidence. Word, macOS/iOS smart quotes, LanguageTool, CMOS style, and citation tools all
    produce them too.
  - Gemini and Claude usually use straight quotes.

## Communication intended for the user

- **Collaborative chatter** (`WP:COLLABCOMM`). Examples: *a Wikipedia-style article, I hope this helps, Of course!,
  Certainly!, You're absolutely right!, Would you like..., is there anything else, let me know, more
  detailed breakdown, here is a...*.
  - Also covers pasted prewriting or advice: "Delete this section before submission",
    submission-notes comments, and "To have a good chance of acceptance, your channel should have...".
- **Hedging disclaimers about sources** (`WP:AIDISCLAIMER`). Examples: *specific details are limited/scarce, not widely
  available/documented, in the provided/available sources, based on available information*.
  - These usually come with speculation about what the information "likely" is.
  - For people, the version is "maintains a low profile" or "keeps personal details private".
  - Since mid-2026 there are also usage disclaimers such as "X should be treated as Y rather than Z" and "this
    does not by itself establish...".
- **Phrasal templates and placeholders** (`WP:AIPLACEHOLDER`). Examples include `[Entertainer's Name]`, "(Add your
  channel URL here)", `2025-xx-xx` access dates, and infobox comments like "Add if available with citation". Some
  templates ship with legitimate boilerplate comments, so check before citing this sign.

## Markup

- **Markdown in wikitext** (`WP:AIMARKDOWN`). Chatbots default to Markdown. Wikitext mixed with Markdown, or
  wrapped in a fenced ```` ```wikitext ```` block, is a strong indicator. Markdown alone is weak, because many
  people write it.
- **Asterisks** for bold (`WP:AIASTERISK`). **`##` headings** (`WP:AIHASHTAG`), which render as numbered lists.
  **`[url](url)` links**. **`---` thematic breaks** between sections.
- **Broken wikitext.** Example: a garbled `{{AfC submission}}` category with mangled dates.
- **Leaked internal citation markup** (`WP:OAICITE`), which is **unambiguous**:
  - ChatGPT: `:contentReference[oaicite:0]{index=0}`, `oai_citation`, `Example+1`,
    `citeturn0search0` (wrapped in Private Use Area characters; the number climbs), `iturn0image0...`,
    `citeturn0news0`, `({"attribution":{"attributableIndex":"X-Y"}})`
  - Gemini: `[cite: 1]`, `[cite: 3, 12, 13]`, `[span_1](start_span)` / `(end_span)`
  - Grok: `grok_card` tags, `grok_render_citation_card_json`
  - DeepSeek: `【85†L261-269】`
  - Perplexity: `[attached_file:1]`, `[web:1]`, `ppl-ai-file-upload` S3 URLs
  - Unclassified (2026): `:::writing{variant="document" id="12345"}`
- **Hallucinated categories** (`WP:AIREDCAT`). Red-linked or obsolete category names. This is corroborating
  evidence only.
- **Hallucinated templates and parameters.** Examples: plausible infobox names that don't exist, deleted templates such as `lang-??`, and
  `== <!-- EDIT BELOW THIS LINE --> ==`.

## Citations (`WP:AIFICTREF`)

- **Broken external links.** Several dead links in a new page, with no archive copies, suggest the links never
  existed. Rule out paywalls, links mangled by bots, and truncated pastes first.
- **Invalid ISBN checksums, unresolvable DOIs**, or **DOIs that resolve to unrelated papers**.
  - Example: fabricated *Proceedings of the IEEE* citations whose DOIs led elsewhere, including one
    credited to an author who had been dead for 30 years.
  - Note: low-number PMIDs, from a 2018–2023 VisualEditor bug, look similar but aren't AI.
- **Book citations with no page numbers or URL.** Also real books cited at pages that don't say what is
  claimed.
- **Wrong reference reuse syntax.** Examples: a ref repeated after every sentence, `↩` characters, and list-defined refs left
  unused.
- **UTM parameters.** `utm_source=chatgpt.com`, `utm_source=openai`, `utm_source=copilot.com`, and
  `referrer=grok.com` show the tool was used to *find* sources, though not necessarily to write the text.

## Comments and messages (`WP:AICOMMENT`)

LLM-written comments tend to show these behaviors:
- misquoting policies or citing made-up shortcuts
- transcluding maintenance banners
- posting long sectioned replies
- downplaying LLM use
- asking critics to say exactly what to fix
- dismissing AI concerns as "speculation"
- redirecting critics to "focus on content"

The register is customer service: "carefully reviewed", "apologize for any inconvenience", "If there are
specific issues, please point them out". Searchable openers include "I understand your concerns
regarding AI-generated...", "Dear Wikipedia Editorial Team", "I am writing to...", and "I hope this message finds you
well".

## Edit summaries (`WP:AISUMMARY`)

These follow rigid templates. Older ones are first-person, with AI vocabulary, emoji, Markdown, and "**Concise edit
summary:**". Newer ones are exhaustively procedural. Signs:
- **Canned assurances of guideline compliance.** Words like *ensured... adheres to, refined, enhanced, streamlined,
  improved, in compliance with, Wikipedia guidelines, verifiability, neutrality, encyclopedic tone,
  clarity, flow*. Humans write "removed excess links per MOS:OVERLINK"; AI writes "improved neutrality and
  clarity in line with Wikipedia standards".
- **Mentions of what was not done.** Words like *preserved, retained, avoided, ensured, aimed to*. The usual shape is "Revised X for
  neutrality while preserving Y".
- **Emphasis on being "sourced".** Phrases like *added sourced content, added verified information, improved attribution,
  with independent/secondary sources*, which talk about the sourcing instead of what the content was.
- **Itemized parameter and template names**, including markup, and stating "inline citations" and "internal links".
- **Announcing that reviewer feedback was addressed**, which is too obvious to need saying.
- **Leaked chat preamble.** Example: "Claude responded: ..." pasted into the summary.

Abbreviations such as "ce" point to a human.

## Miscellaneous

- **Sudden style shift.** Writing suddenly becomes flawless next to the editor's other text, or their style tracks each
  year's model output. A mismatch between the English variety and the topic's national ties is another sign (LLMs default to American
  English). Weigh against non-native speakers and code-switching.
- **AfC "submission statements" or "reviewer notes"** arguing the draft's notability, and AI-use
  disclosures that claim compliance.
- **Pre-placed maintenance templates.** For example, `{{AfC submission|d}}` pre-declining one's own draft, or
  stray `{{Use mdy dates}}`, `{{BLP sources}}`, or protection templates.
- **Canned user pages.** Sections like "Welcome To My User Page!", "About Me", "My Interests", and "Let's Connect!", with emoji.
- **Permissions gaming.** Mass benign AI rewrites made to boost edit count. This only works as inference in one direction.

## Differences between models

Each model has its own idiolect. ChatGPT (GPT-4o era) and Grok stress broad context more than Gemini and Claude,
and Gemini and Claude are more concise. ChatGPT is the most common source of AI edits on Wikipedia. Models
also show some pro-authoritarian bias on political prompts (2026 reporting), and more so in Chinese.

## Signs of human writing

- The text predates **30 November 2022**, ChatGPT's public launch. You can check with Who Wrote That? or WikiBlame.
- The author can explain their own choices and mistakes.
- The syntax is something AI avoids. Humans write more of the following:
  - plain *is/has* (*there is a*, *it has a*)
  - plain verbs: *wrote* (not authored), *moved* (not relocated), *used* (not utilized), *tried* (not attempted),
    *died* (not passed away)
  - superlatives and definite claims: *one of the best*, *the only*, *the first*
  - qualifiers and intensifiers: *very*, *perhaps*, *tends to*
  - wordy bits like *as a result of*, *in order to*, *the fact that*

## Ineffective indicators (don't rely on these)

The following do not reliably signal AI:
- perfect grammar
- mixed casual and formal registers
- "bland" or "robotic" feel
- fancy or academic prose in general
- transition words in isolation
- unsourced content
- bizarre wikitext, which more likely comes from extensions or VisualEditor bugs
- correct wikitext

False accusations drive people away, so watch for confirmation bias.

## Historical indicators (older models)

- **Knowledge-cutoff statements** (`WP:AICUTOFF`). "As of my last knowledge update..."
- **Didactic disclaimers** (`WP:DIDACTIC`, 2022–2024). "It's important/crucial to note", "worth noting", "may
  vary", and safety asides.
- **Section summaries** (`WP:CONCLUSION`). "In summary", "In conclusion", "Overall", Conclusion sections, and
  paragraphs that restate themselves at the end.
- **Prompt refusals.** "As an AI language model, I can't..." followed by an offer to do something else.
- **Abrupt cut-offs** from token limits. This can also come from a bad paste or a copyvio.
- **Stale access dates.** Access dates about a year older than the edit.
- **Elegant variation** (`WP:AIELEVAR`). Repetition penalties lead to synonym cycling. Note that some school
  traditions, such as Italian ones, teach this to human writers too.
