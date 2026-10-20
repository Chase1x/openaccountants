---
name: ru-freelance-intake
description: ALWAYS USE THIS SKILL when a user asks for help with their Russian taxes AND mentions freelancing, self-employment, самозанятый, ИП, or being an individual entrepreneur in Russia. Trigger on phrases like "help me with my Russian taxes", "I'm самозанятый", "I'm an ИП", "налог на профессиональный доход", "НПД", "УСН", "ОСНО", "I freelance in Russia", "do my Russian self-employed return", "сколько налогов я плачу", or any similar phrasing where the user is a Russia-resident self-employed individual needing tax help. This is the REQUIRED entry point for the Russia self-employed workflow; downstream skills (ru-self-employed-npd, ru-usn, ru-income-tax, ru-social-contributions, russia-vat, ru-return-assembly) depend on it running first to produce a structured intake package. Russia-resident self-employed only.
version: 0.1
jurisdiction: RU
tax_year: 2026
last_updated: 2026-07-13
review_status: pending_review
trust_label: Built by Michael Cutajar and the OpenAccountants team
category: orchestrator
tier: 2
license: AGPL-3.0-or-later (code) / OpenAccountants Guide License v1.0 (content)
---

# RU Freelance Intake

## What this file is

The intake orchestrator for a Russia-resident self-employed person (самозанятый, ИП). Every downstream Russia content skill — `ru-self-employed-npd`, `ru-usn`, `ru-income-tax`, `ru-social-contributions`, `russia-vat` — and the assembly orchestrator `ru-return-assembly` depend on this skill running first to produce a structured intake package.

This skill **computes nothing**. Its only job is to establish the facts, parse the uploaded documents, confirm them once, and route to the correct regime. Russia's self-employed landscape has three main tax paths and the routing decision drives everything downstream, so getting the routing right is the whole point of this file.

Reply to the user in their own language. If they write in Russian, answer in Russian; if in English, answer in English. Embed the native Russian terms (самозанятый, ИП, ООО, УСН, ОСНО, НПД, НДС, НДФЛ, страховые взносы) so the user recognises exactly which regime and form is meant.

## Design principles (upload-first)

Upload-first, inference-then-confirm:
1. **Compact refusal/routing sweep** — a few interactive questions, ~30 seconds, to establish form of business, regime, residency, the НПД cap, and VAT exposure.
2. **Upload-first** — the user dumps everything they have (the «Мой налог» / «Налоги ФЛ» export, bank statements, registration extract, prior declarations).
3. **Inference pass** — parse every document, extract as much as possible before asking anything.
4. **Gap-filling only** — ask only about what is genuinely missing or ambiguous after the inference pass.
5. **Single confirmation pass** — show the full picture once, then hand off downstream.

Do not narrate phases ("now I am inferring…"). Do not re-ask anything already visible in the uploaded documents. Apply conservative defaults when an answer is missing and flag the assumption for the reviewer rather than blocking.

## Step 1 — Refusal / routing sweep (route to the right regime)

- **ООО (legal entity) out of scope** — ООО (a legal entity) → out of scope. Escalate to a qualified Russian accountant. This workflow covers individuals only, not corporate profit tax (налог на прибыль).
- **НПД tax rate on income from individuals** — 4%  _(Skill body: 'Tax: 4% on income from individuals, 6% from legal entities / ИП.')_
- **НПД tax rate on income from legal entities / ИП** — 6%  _(Skill body: 'Tax: 4% on income from individuals, 6% from legal entities / ИП.')_
- **НПД routing** — НПД (налог на профессиональный доход) routes to ru-self-employed-npd.
- **УСН «доходы» rate** — 6% percent (regional reduced rates may apply)
- **УСН «доходы минус расходы» rate** — 15% percent (regional reduced rates may apply)
- **УСН routing** — УСН (упрощённая система) — for ИП, two objects «доходы» (6%) or «доходы минус расходы» (15%); regional reduced rates may apply → routes to ru-usn.
- **ОСНО НДФЛ rate** — 13%/15% percent (progressive; plus НДС; default for an ИП who never elected a special regime, or who exceeded a special-regime limit)
- **ОСНО routing** — ОСНО (общая система) — НДФЛ (13%/15% progressive) plus НДС. Default for an ИП who never elected a special regime, or who exceeded a special-regime limit → routes to ru-income-tax.
- **Regime inference from documents** — If the user does not know their regime, infer it from the documents (a «Мой налог» export ⇒ НПД; a УСН declaration / object on the ЕГРИП extract ⇒ УСН; otherwise treat as ОСНО pending confirmation).
- **Residency determination** — Russian tax resident for the year (183+ days in Russia in the 12-month period)? Non-residents have materially different НДФЛ treatment and cannot use some regimes the same way → flag prominently and escalate if non-resident; do not silently assume residency.
- **НПД annual income cap** — 2,400,000 ₽ (per calendar year for 2026 (the experiment runs to 2028 and the cap is not being changed); there is no monthly cap, only the annual one)
- **Cap breach mid-year** — If a самозанятый exceeds 2.4M ₽ mid-year, НПД status is lost for the rest of the year and income must move to another regime (УСН if previously elected, otherwise ОСНО). Flag this and route the post-cap income accordingly.
- **НПД VAT treatment** — Самозанятые on НПД do not charge НДС.
- **УСН revenue threshold for НДС exemption (2026)** — 20,000,000 ₽ (was 60M in 2025; scheduled to fall further to 15M in 2027 and 10M in 2028. If 2025 income exceeded 20M ₽, an НДС obligation arises from 1 January 2026; if the threshold is crossed during 2026, НДС applies from the 1st of the month following the breach.)
- **ОСНО VAT default** — ИП on ОСНО charge НДС by default (subject to any Art. 145 exemption).
- **Conservative defaults if unanswered** — Самозанятый/НПД where a «Мой налог» export exists; otherwise ИП on УСН «доходы»; Russian resident; income under the 2.4M cap; no НДС. Always flag each default for the reviewer.

## Step 2 — Collect

Ask the user to upload (whatever they have — partial is fine):
- «Мой налог» / «Налоги ФЛ» export — the справка о доходах / receipts (чеки) for НПD users; this is the authoritative income record for самозанятые.
- Bank statements for all accounts (RUB and any FX) for the full year — to reconcile against declared income and catch unreported receipts.
- Registration extract (выписка из ЕГРИП) for an ИП — confirms regime, ОКВЭД activity codes, and employee status.
- Prior-year declarations — УСН declaration (КНД 1152017), 3-НДФЛ, НДС returns — and страховые взносы payment history (фиксированные взносы and any 1%-over-300k payments).
- Any patent (ПСН) documents if the user mentions a patent — note that ПСН is a separate ИП regime; flag for the reviewer and escalate if it materially affects routing.

## Step 3 — Infer & confirm

- **Determine form of business and regime** — Determine form of business and regime from the documents if not stated (export ⇒ НПД; ЕГРИП object ⇒ УСН; otherwise ОСНО).
- **НПД cap check** — For НПД: total the чеки and check the running annual total against the 2,400,000 ₽ cap; flag if the user is approaching or has breached it.
- **УСН/ОСНО income separation** — For УСН/ОСНО: separate genuine business income from internal transfers, loan movements, and personal funds in the bank data.
- **FX conversion rule** — Convert any FX receipts to RUB at the Bank of Russia (ЦБ РФ) rate on the date of receipt.
- **НДС exposure check** — Check НДС exposure against the 2026 УСН threshold (20M ₽) and ОСНО default.
- **2026 fixed страховые взносы contribution** — roughly 57,390 ₽ (plus 1% on income over 300,000 ₽ — for the reviewer to compute, not this skill)
- **Consolidated summary and confirmation** — Present one consolidated summary: form of business, regime, residency, income vs cap, НДС status, contributions status. Get a single confirmation.

## Step 4 — Hand off (the routing map)

- **Самозанятый / НПД routing** — `ru-self-employed-npd` (4%/6% НПД). No страховые взносы and no НДС unless the user voluntarily pays pension contributions — note that for the reviewer. → `ru-return-assembly`.
- **ИП on УСН routing** — `ru-usn` («доходы» 6% or «доходы минус расходы» 15%) + `ru-social-contributions` (фиксированные взносы + 1% over 300k) + `russia-vat` if 2026 income exceeds the 20M ₽ НДС threshold → `ru-return-assembly`.
- **ИП or individual on ОСНО routing** — `ru-income-tax` (НДФЛ) + `russia-vat` (НДС by default) + `ru-social-contributions` for an ИП → `ru-return-assembly`.
- **Cap breach mid-year routing** — Route НПД income up to the breach date to `ru-self-employed-npd`, and post-breach income to `ru-usn` or `ru-income-tax` as applicable; flag prominently.
- **Escalation cases** — ООО, non-resident, or ПСН-driven complexity: stop and escalate to a qualified Russian accountant.
- **Always pass forward** — Always pass forward: form of business, regime, residency status, annual income figure, НДС determination, страховые взносы status, and every assumption made under a conservative default.

## Disclaimer

This skill orchestrates intake only and computes no tax. It establishes facts and routes to downstream skills. All figures, regime determinations, and downstream outputs must be reviewed and signed off by a qualified Russian accountant (бухгалтер / налоговый консультант) before anything is filed with the ФНС. The most up-to-date version is maintained at [openaccountants.com](https://openaccountants.com).

## Step 1 — Refusal / routing sweep (route to the right regime)

0. **Route to ru-self-employed-npd** — Route to НПД processing when self-employed physical person or ИП without employees on НПД.

## Step 4 — Hand off (the routing map)

0. **Route to ru-self-employed-npd** — Самозанятый / НПД routes to ru-self-employed-npd.
0. **Route to ru-usn** — ИП on УСН routes to ru-usn.
0. **Route to ru-social-contributions (УСН)** — ИП on УСН also routes to ru-social-contributions.
0. **Route to russia-vat (УСН threshold)** — ИП on УСН routes to russia-vat if 2026 income exceeds the 20M ₽ НДС threshold.
0. **Route to ru-income-tax** — ИП or individual on ОСНО routes to ru-income-tax (НДФЛ).
0. **Route to russia-vat (ОСНО default)** — ИП or individual on ОСНО routes to russia-vat (НДС by default).
0. **Route to ru-social-contributions (ОСНО)** — ИП on ОСНО routes to ru-social-contributions.
0. **Route to ru-return-assembly** — All confirmed regime paths route to ru-return-assembly for final assembly.
0. **Escalate complex cases** — ООО, non-resident, or ПСН-driven complexity: stop and escalate to a qualified Russian accountant instead of routing downstream.

<!-- openaccountants-cta-block -->

---

## Talk to a verified accountant

This guide is maintained by the OpenAccountants network — accountants who put
their name behind the tax answers AI gives people. The live, always-current
version (and the professional behind it) is at
[openaccountants.com](https://www.openaccountants.com).

- Use it in your AI: https://www.openaccountants.com/connect
- Meet the accountants: https://www.openaccountants.com/network

> **General reference only.** This document does not constitute tax, legal, or
> financial advice. Verify figures against the cited primary sources or with a
> licensed professional before relying on them.
