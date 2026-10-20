---
name: lithuania-vat-return
description: "Use this skill whenever asked to prepare, review, or classify transactions for a Lithuanian VAT return (FR0600 form) for any client. Trigger on phrases like \"prepare VAT return\", \"Lithuanian VAT\", \"PVM return\", \"FR0600\", \"pridetines vertes mokestis\", or any request involving Lithuania VAT filing. MUST be loaded alongside BOTH vat-workflow-base and eu-vat-directive companion skills. ALWAYS read this skill before touching any Lithuania VAT work."
license: "AGPL-3.0-or-later (code) / OpenAccountants Guide License v1.0 (content)"
metadata:
  source: openaccountants
  openaccountants_url: "https://www.openaccountants.com/skills/lithuania-vat-return"
  jurisdiction: "LT"
  tax_year: "2025"
  last_updated: "2026-07-13"
  trust_label: "Built by Michael Cutajar and the OpenAccountants team"
  review_status: "pending_review"
---

# Lithuania VAT Return

## Lithuania PVM Return Skill (FR0600) v2.0

## Section 1 — Quick reference

The workflow runbook is in `vat-workflow-base`. EU directive content is in `eu-vat-directive`.

**Quick reference table**

| Field | Value |
| --- | --- |
| Country | Lithuania (Lietuva) |
| Standard rate | 21% |
| Reduced rates | 9% (books, periodicals, heating, hotel accommodation), 5% (medicines, medical devices) |
| Zero rate | Exports, intra-EU B2B supplies |
| Return form | FR0600 (PVM deklaracija) |
| Filing portal | https://www.vmi.lt (VMI EDS) |
| Authority | VMI (Valstybine mokesciu inspekcija) |
| Currency | EUR |
| Filing frequency | Monthly (default), quarterly (turnover < EUR 300,000), bi-annual (< EUR 60,000) |
| Deadline | 25th of month following period |
| i.SAF | Mandatory monthly invoicing data submission to VMI |
| Companion skills | vat-workflow-base v0.1+, eu-vat-directive v0.1+ |
| Contributor | Open Accountants Skills Registry |
| Validated by | Pending |

**Conservative defaults**

| Ambiguity | Default |
| --- | --- |
| Unknown rate | 21% |
| Unknown purchase status | Not deductible |
| Unknown counterparty country | Domestic Lithuania |
| Unknown B2B/B2C for EU | B2C, charge 21% |
| Unknown business-use | 0% |
| Unknown blocked status | Blocked |

**Red flag thresholds**

| Threshold | Value |
| --- | --- |
| HIGH single-transaction | EUR 3,000 |
| HIGH tax-delta | EUR 200 |
| MEDIUM concentration | >40% |
| MEDIUM defaults count | >4 |
| LOW net position | EUR 5,000 |

## Section 2 — Required inputs and refusal catalogue

### Required inputs

- **Minimum viable** — Bank statement. Banks: Swedbank, SEB, Luminor, Siauliu bankas, Revolut.  _(Unsure — no citation)_
- **Recommended** — Invoices, PVM ID (LT + 9 or 12 digits).  _(Unsure — no citation)_
- **Ideal** — i.SAF data, prior FR0600.  _(Unsure — no citation)_

### Refusal catalogue (supplements eu-vat-directive R-EU-1 through R-EU-12)

- **R-LT-1 — Small business scheme** — Trigger: turnover < EUR 45,000. Message: "Small business exemption may apply."  _(R-LT-1)_
- **R-LT-2 — Partial exemption** — Trigger: mixed supplies. Message: "Pro-rata per Art. 60. Flag for reviewer."  _(R-LT-2)_
- **R-LT-3 — Construction reverse charge** — Trigger: construction services. Message: "Domestic reverse charge may apply. Flag."  _(R-LT-3)_

## Section 3 — Supplier pattern library

### 3.1 Lithuanian banks

**Lithuanian banks pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| SWEDBANK, SEB, LUMINOR, ŠIAULIŲ BANKAS | EXCLUDE | Financial service exempt |
| PALŪKANOS, INTEREST | EXCLUDE | Interest exempt |

### 3.2 Government

**Government pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| VMI, SODRA | EXCLUDE | Tax/social security |
| REGISTRŲ CENTRAS | EXCLUDE | Company registry |

### 3.3 Utilities

**Utilities pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| IGNITIS, ESO | Domestic 21% | Electricity/gas |
| VILNIAUS ŠILUMOS TINKLAI | Domestic 9% | Heating (reduced) |
| TELIA, BITĖ, TELE2 | Domestic 21% | Telecoms |

### 3.4 SaaS — EU (reverse charge)

**SaaS EU pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| GOOGLE IRELAND, MICROSOFT IRELAND, ADOBE IRELAND | EU reverse charge |  |
| SPOTIFY AB (SE), ATLASSIAN (NL) | EU reverse charge |  |

### 3.5 SaaS — non-EU

**SaaS non-EU pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| NOTION, ANTHROPIC, OPENAI, FIGMA, CANVA | Non-EU reverse charge |  |

### 3.6 Food and entertainment

**Food and entertainment pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| MAXIMA, IKI, LIDL, RIMI, NORFA | Default BLOCK | Personal provisioning |
| RESTORANAS, KAVINĖ | Default BLOCK | Entertainment/representation limited |

### 3.7 Insurance

**Insurance pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| LIETUVOS DRAUDIMAS, ERGO, BTA | EXCLUDE | Insurance exempt |

### 3.8 Professional services

**Professional services pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| AUDITORIUS, ADVOKATAS, NOTARAS | Domestic 21% |  |

### 3.9 Internal transfers

**Internal transfers pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| VIDINIS PERVEDIMAS | EXCLUDE |  |
| ATLYGINIMAS, DARBO UŽMOKESTIS | EXCLUDE | Salary |

## Section 4 — Worked examples

### Example 1 — Non-EU SaaS reverse charge

Input: `NOTION LABS INC ; DEBIT ; EUR 14.68`
Treatment: Non-EU reverse charge at 21%. Net zero.

### Example 2 — EU service reverse charge (Google)

Input: `GOOGLE IRELAND ; DEBIT ; EUR 850`
Treatment: EU reverse charge at 21%. Net zero.

### Example 3 — Representation expense

Input: `RESTORANAS STIKLIAI ; DEBIT ; EUR 200`
Treatment: Representation expenses limited to 50% PVM recovery. Conservative default: 0%.

### Example 4 — Heating at reduced rate

Input: `VILNIAUS ŠILUMOS TINKLAI ; DEBIT ; EUR 109`
Treatment: Heating at 9%. Net = 100. PVM = 9.

### Example 5 — EU B2B service sale

Input: `STUDIO KREBS GMBH (DE) ; CREDIT ; EUR 3,500`
Treatment: B2B service to EU. Zero-rated. Verify DE VAT ID via VIES.

### Example 6 — Motor vehicle

Input: `UAB AUTOCENTRAS ; DEBIT ; car lease ; EUR 650`
Treatment: Passenger vehicle PVM recovery limited. Conservative default: 0%. Flag for reviewer.

## Section 5 — Tier 1 classification rules (compressed)

### 5.1 Standard rate 21%

- **Standard rate 21%** — Standard rate 21%  _(Unsure — no citation)_

### 5.2 Reduced rate 9% — books, periodicals, heating, accommodation

- **Reduced rate 9%** — Reduced rate 9% — books, periodicals, heating, accommodation  _(Unsure — no citation)_

### 5.3 Reduced rate 5% — medicines, medical devices

- **Reduced rate 5%** — Reduced rate 5% — medicines, medical devices  _(Unsure — no citation)_

### 5.4 Zero rate — exports, intra-EU B2B

- **Zero rate** — Zero rate — exports, intra-EU B2B  _(Unsure — no citation)_

### 5.5 Exempt — financial, insurance, medical, education, residential rental

- **Exempt categories** — Exempt — financial, insurance, medical, education, residential rental  _(Unsure — no citation)_

### 5.6 EU reverse charge — per eu-vat-directive

- **EU reverse charge** — EU reverse charge — per eu-vat-directive  _(Unsure — no citation)_

### 5.7 Non-EU reverse charge — self-assess 21%

- **Non-EU reverse charge** — Non-EU reverse charge — self-assess 21%  _(Unsure — no citation)_

### 5.8 Domestic reverse charge — construction services

- **Domestic reverse charge** — Domestic reverse charge — construction services  _(Unsure — no citation)_

### 5.9 Blocked input PVM — entertainment (above representation cap), personal use, vehicles (limited)

- **Blocked input PVM** — Blocked input PVM — entertainment (above representation cap), personal use, vehicles (limited)  _(Unsure — no citation)_

### 5.10 i.SAF — mandatory monthly invoice data submission

- **i.SAF** — i.SAF — mandatory monthly invoice data submission  _(Unsure — no citation)_

## Section 6 — Tier 2 catalogue (compressed)

### 6.1 Vehicle costs — limited recovery, flag

- **Vehicle costs** — Vehicle costs — limited recovery, flag  _(Unsure — no citation)_

### 6.2 Representation — 50% cap, flag

- **Representation** — Representation — 50% cap, flag  _(Unsure — no citation)_

### 6.3 Construction reverse charge — flag

- **Construction reverse charge** — Construction reverse charge — flag  _(Unsure — no citation)_

### 6.4 Mixed-use — 0% default

- **Mixed-use default** — Mixed-use — 0% default  _(Unsure — no citation)_

## Section 7 — Excel working paper template

Standard layout. Column H accepts FR0600 box codes.

## Section 8 — Bank statement reading guide

Format: Swedbank/SEB CSV, YYYY-MM-DD, EUR. Language: Lithuanian.

## Section 9 — Onboarding fallback

### 9.1 PVM ID — "LT + 9 or 12 digits?"

- **PVM ID** — PVM ID — "LT + 9 or 12 digits?"  _(Unsure — no citation)_

### 9.2 Filing frequency — infer from turnover

- **Filing frequency** — Filing frequency — infer from turnover  _(Unsure — no citation)_

### 9.3 i.SAF compliance — "Are you filing i.SAF monthly?"

- **i.SAF compliance** — i.SAF compliance — "Are you filing i.SAF monthly?"  _(Unsure — no citation)_

### 9.4 Prior credit — always ask

- **Prior credit** — Prior credit — always ask  _(Unsure — no citation)_

## Section 10 — Reference material

### Sources

1. PVM istatymas No. IX-751 — Lithuanian VAT Act
2. EU VAT Directive 2006/112/EC
3. VMI portal — https://www.vmi.lt

### Change log

- v2.0 (April 2026): Full rewrite to 10-section architecture.
- v1.0-draft: Initial skill.

## Disclaimer

This skill and its outputs are provided for informational and computational purposes only and do not constitute tax, legal, or financial advice. Open Accountants and its contributors accept no liability for any errors, omissions, or outcomes arising from the use of this skill. All outputs must be reviewed and signed off by a qualified professional (such as a CPA, EA, tax attorney, or equivalent licensed practitioner in your jurisdiction) before filing or acting upon.

The most up-to-date, verified version of this skill is maintained at [openaccountants.com](https://openaccountants.com). Log in to access the latest version, request a professional review from a licensed accountant, and track updates as tax law changes.

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

## Today's figures and who stands behind this skill

This file is an AI skill (tax rules your AI follows) from OpenAccountants, copied on 2026-07-13. Rates, thresholds and deadlines change. For the current version of this skill, its official sources and the named accountant (if any) who stands behind it, call `get_skill` with slug `lithuania-vat-return` on the OpenAccountants connector (https://www.openaccountants.com/connect), or read https://www.openaccountants.com/skills/lithuania-vat-return. If neither is available, confirm every figure against the official source pages cited above before relying on it.
