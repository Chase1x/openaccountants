---
name: ro-cas-cass
description: Use this skill whenever asked about Romanian self-employed social and health contributions (CAS/CASS). Trigger on phrases like "CAS Romania", "CASS Romania", "contribuții sociale PFA", "Declarația Unică", "pensie PFA", "Romanian social contributions", or any question about social/health insurance obligations for a self-employed client in Romania. Covers CAS 25% and CASS 10% on fixed tier bases tied to minimum gross wage multiples. ALWAYS read this skill before touching any Romania social contributions work.
version: 2.0
jurisdiction: RO
tax_year: 2025
last_updated: 2026-07-13
review_status: pending_review
trust_label: Built by Michael Cutajar and the OpenAccountants team
tier: 2
license: AGPL-3.0-or-later (code) / OpenAccountants Guide License v1.0 (content)
---

# RO Cas Cass

## Section 1 -- Quick reference

**Quick reference**

| Field | Value |
| --- | --- |
| Country | Romania |
| Authority | ANAF (Agenția Națională de Administrare Fiscală) |
| Primary legislation | Codul Fiscal (Legea nr. 227/2015), Titlul V (CAS) and Titlul VI (CASS) |
| Supporting legislation | OUG nr. 168/2022; annual minimum wage ordinances |
| CAS rate | 25% on fixed tier base |
| CASS rate | 10% on fixed tier base |
| Minimum gross wage (2025) | RON 3,590/month |
| CAS threshold | 12x min wage = RON 48,600 (below: voluntary) |
| CAS upper tier | 24x min wage = RON 97,200 |
| CASS lowest tier | 6x min wage = RON 24,300 |
| Filing form | Declarația Unică (Formular 212) |
| Payment deadline | 25 May of following year |
| Currency | RON only |
| Contributor | Open Accountants |
| Validated by | Pending -- requires validation by Romanian consultant fiscal |
| Validation date | Pending |

## Section 2 -- Required inputs and refusal catalogue

### Required inputs

- **Required inputs before computing** — Before computing, you MUST obtain: 1. Entity type -- PFA, II, or liberal profession? 2. Estimated annual net income -- determines which tier applies 3. Income type -- independent activities, intellectual property, rental, agricultural? 4. Is the client also employed? -- CAS may not be required if already paying through employment 5. Year of activity -- first year or ongoing?  _(Section 2 -- Required inputs and refusal catalogue)_
- **Stop condition** — If net income estimate is unknown, STOP. The tier-based system requires knowing anticipated income.  _(Section 2 -- Required inputs and refusal catalogue)_

### Refusal catalogue

- **R-RO-SOC-1 -- Multiple income source aggregation** — Trigger: client has PFA + IP + rental income and asks how they interact. Message: "Aggregation rules for multiple income categories require confirmation with consultant fiscal. Flag for reviewer."  _(Section 2 -- Required inputs and refusal catalogue)_

### Prohibitions

- **Prohibitions list** — NEVER compute CAS/CASS on actual income -- the contribution base is a FIXED tier multiple of minimum wage; NEVER forget that below the 6x threshold, the client has NO health insurance coverage; NEVER confuse annual thresholds with monthly amounts; NEVER ignore that CAS and CASS are both deductible from income tax; NEVER tell a client below the CAS threshold that they have pension coverage (unless voluntary opt-in); NEVER present a single rate (e.g., "25% of income") -- CAS is 25% of the FIXED BASE; NEVER assume employment CAS exempts from self-employment CAS if self-employment income crosses the threshold  _(Section 2 -- Required inputs and refusal catalogue)_

## Section 3 -- CAS (pension) tier system

- **CAS legislation citation** — Codul Fiscal, art. 148-150  _(Codul Fiscal, art. 148-150)_

**CAS (pension) tier system**  _(Codul Fiscal, art. 148-150)_

| Estimated annual net income | CAS due? | Contribution base | Annual CAS (25%) |
| --- | --- | --- | --- |
| Below RON 48,600 (< 12x min wage) | Voluntary only | N/A | RON 0 (unless opt-in at RON 12,150) |
| RON 48,600 -- RON 97,200 | Mandatory | RON 48,600 | RON 12,150 |
| Above RON 97,200 (> 24x min wage) | Mandatory | RON 97,200 | RON 24,300 |

- **CAS base determination** — CAS is based on ESTIMATED net income declared in the Declarația Unică. The base is fixed at tier level, NOT at actual income.  _(Codul Fiscal, art. 148-150)_

## Section 4 -- CASS (health insurance) tier system

- **CASS legislation citation** — Codul Fiscal, art. 170-174  _(Codul Fiscal, art. 170-174)_

**CASS (health insurance) tier system**  _(Codul Fiscal, art. 170-174)_

| Estimated annual net income | CASS due? | Contribution base | Annual CASS (10%) |
| --- | --- | --- | --- |
| Below RON 24,300 (< 6x min wage) | No (but no health coverage) | N/A | RON 0 |
| RON 24,300 -- RON 48,600 | Yes | RON 24,300 | RON 2,430 |
| RON 48,600 -- RON 97,200 | Yes | RON 48,600 | RON 4,860 |
| Above RON 97,200 | Yes | RON 97,200 | RON 9,720 |

## Section 5 -- Computation steps

### Step 5.1 -- Estimate annual net income

- **Net income formula** — net_income = gross_revenue - deductible_expenses  _(Section 5 -- Computation steps)_

### Step 5.2 -- Determine CAS tier

- **CAS tier determination** — IF net_income < 48,600: CAS = 0  (voluntary opt-in at RON 12,150) ELIF net_income <= 97,200: CAS = 48,600 x 25% = 12,150 ELSE: CAS = 97,200 x 25% = 24,300  _(Section 5 -- Computation steps)_

### Step 5.3 -- Determine CASS tier

- **CASS tier determination** — IF net_income < 24,300: CASS = 0  (no health coverage) ELIF net_income < 48,600: CASS = 24,300 x 10% = 2,430 ELIF net_income <= 97,200: CASS = 48,600 x 10% = 4,860 ELSE: CASS = 97,200 x 10% = 9,720  _(Section 5 -- Computation steps)_

### Step 5.4 -- Total

- **Total contribution formula** — total = CAS + CASS  _(Section 5 -- Computation steps)_

## Section 6 -- Filing, payment, and tax deductibility

### Declarația Unică

**Declarația Unică obligations**

| Obligation | Detail |
| --- | --- |
| Form | Declarația Unică (Formular 212) |
| Initial filing | By 25 May of current year (estimate + prior-year reconciliation) |
| Reconciliation | Actual income in next year's filing |

### Payment schedule

**Payment schedule**

| Payment | Due date |
| --- | --- |
| Full annual CAS + CASS | By 25 May of following year |
| Optional advances | Any time (recommended) |

- **Late payment penalties** — Late payment: interest (0.01%/day) and penalties (0.01%/day).  _(Section 6 -- Filing, payment, and tax deductibility)_

### Tax deductibility

**Tax deductibility**

| Question | Answer |
| --- | --- |
| Is CAS deductible? | YES -- from net income for income tax |
| Is CASS deductible? | YES |
| When deductible? | Year contributions relate to (accrual) |
| Effect | Reduces 10% income tax base |

## Section 7 -- Interaction with employment and special situations

### Employed AND self-employed

**Employed and self-employed scenarios**

| Scenario | CAS obligation | CASS obligation |
| --- | --- | --- |
| SE income < 12x min wage | No additional CAS | CASS at applicable tier on SE income |
| SE income >= 12x min wage | CAS at applicable tier | CASS at applicable tier |

- **Employment CAS does not exempt SE CAS** — Employment CAS does NOT exempt from self-employment CAS if SE income crosses threshold.  _(Section 7 -- Interaction with employment and special situations)_

### Norma de venit (income norm)

- **Norma de venit threshold rule** — CAS/CASS thresholds apply to the norma de venit amount, not actual income.  _(Section 7 -- Interaction with employment and special situations)_

### First year of activity

- **First year of activity rule** — Estimated income for remaining months only. Thresholds are NOT pro-rated -- they remain annual.  _(Section 7 -- Interaction with employment and special situations)_

## Section 8 -- Edge case registry

### EC1 -- Below all thresholds

Situation: PFA net income RON 15,000/year.
Resolution: CAS RON 0. CASS RON 0. Flag: no health coverage. Recommend voluntary CASS (RON 2,430).

### EC2 -- Just above 12x threshold

Situation: PFA net income RON 44,000.
Resolution: CAS RON 12,150. CASS RON 4,860. Total RON 15,078.

### EC3 -- Voluntary CAS opt-in

Situation: Income below RON 48,600, client wants pension credits.
Resolution: Voluntary CAS at RON 12,150. Provides pension credit for the year.

### EC4 -- Multiple income sources

Situation: PFA + IP + rental income.
Resolution: All categories aggregated to determine tier. Flag for reviewer to confirm rules.

### EC5 -- Concurrent employment, high SE income

Situation: Employment RON 60,000, PFA RON 100,000.
Resolution: SE CAS: RON 24,300 (>24x tier). SE CASS: RON 9,720. Employment handled separately.

## Section 9 -- Reviewer escalation protocol

When a situation requires reviewer judgement:

```
REVIEWER FLAG
Tier: T2
Client: [name]
Situation: [description]
Issue: [what is ambiguous]
Options: [possible treatments]
Recommended: [most likely correct treatment and why]
Action Required: Qualified consultant fiscal must confirm before advising client.
```

When a situation is outside skill scope:

```
ESCALATION REQUIRED
Tier: T3
Client: [name]
Situation: [description]
Issue: [outside skill scope]
Action Required: Do not advise. Refer to qualified consultant fiscal. Document gap.
```

## Section 10 -- Test suite

### Test 1 -- Low income, below all thresholds

Input: PFA net income RON 18,000, no employment.
Expected output: CAS RON 0. CASS RON 0. Flag: no health coverage.

### Test 2 -- Mid-range, 12-24x tier

Input: PFA net income RON 60,000, no employment.
Expected output: CAS RON 12,150. CASS RON 4,860. Total RON 15,078.

### Test 3 -- High income, above 24x

Input: PFA net income RON 150,000.
Expected output: CAS RON 24,300. CASS RON 9,720. Total RON 30,156.

### Test 4 -- Between 6x and 12x

Input: PFA net income RON 30,000.
Expected output: CAS RON 0. CASS RON 2,430. Total RON 2,430.

### Test 5 -- Employed plus self-employed

Input: Employment RON 50,000, PFA RON 50,000.
Expected output: SE CAS RON 12,150. SE CASS RON 4,860. Total additional RON 15,078.

### Test 6 -- Voluntary CAS opt-in

Input: PFA net income RON 20,000, opts in.
Expected output: Voluntary CAS RON 12,150. CASS RON 2,430. Total RON 12,924.

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
