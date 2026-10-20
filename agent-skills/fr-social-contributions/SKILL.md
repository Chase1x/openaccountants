---
name: fr-social-contributions
description: "Use this skill whenever asked about French social contributions (cotisations sociales URSSAF) for self-employed individuals (travailleurs independants), including professions liberales and BNC taxpayers. Trigger on phrases like \"cotisations URSSAF\", \"charges sociales independant\", \"CSG CRDS freelance France\", \"CIPAV retraite\", \"ACRE reduction\", \"social contributions France\", \"cotisations minimales\", \"prelevement URSSAF\", \"cotisations trimestrielles\", or any question about French self-employed social security. Also trigger when classifying bank statement transactions showing URSSAF prelevements, CIPAV debits, or cotisations trimestrielles. ALWAYS read this skill before touching any French social contribution work."
license: "AGPL-3.0-or-later (code) / OpenAccountants Guide License v1.0 (content)"
metadata:
  source: openaccountants
  openaccountants_url: "https://www.openaccountants.com/skills/fr-social-contributions"
  jurisdiction: "FR"
  tax_year: "2026"
  last_updated: "2026-10-19"
  authored_by: "Michael Cutajar and the OpenAccountants team"
  trust_label: "Built by Michael Cutajar and the OpenAccountants team"
  review_status: "pending_review"
---

# France: social contributions for the self-employed (cotisations URSSAF)

This skill covers the compulsory social contributions (cotisations et contributions sociales) that a French travailleur independant pays to URSSAF: artisans, commercants, professions liberales non reglementees, professions liberales reglementees inside and outside Cipav, and the company directors who are treated as self-employed rather than as employees. Figures are for tax year 2026. The reformed base and the reformed scales govern the income of 2025 declared in 2026 (URSSAF prints them as "Barèmes 2025 appliqués à compter de 2026", in shares of the annual ceiling); the euro thresholds, minimums, maximums and first-year amounts in the tables below are the figures URSSAF prints for 2026, in force for the contributions called during 2026 and regularised on the 2026 income declared in 2027. Every rate and amount below is taken from an URSSAF page that prints it, and each table names the page it came from.

**Read the transition note before you use any rate.** The base on which a self-employed person's contributions are computed was rewritten by article 18 of the social security financing law for 2024 (loi 2023-1250 of 26 December 2023) and by decret 2024-688 of 5 July 2024. URSSAF says the new base and the new rate scales apply together "à partir d’avril 2026 avec l’ouverture de la campagne de la déclaration des revenus 2025", that is from the regularisation of the 2025 contribution year. So in 2026 a client can hold two documents at once: provisional instalments called on the old scale early in the year, and a new echeancier on the new scale once the 2025 income is declared. Say which one you are computing.

## Section 1: Quick reference

**Read this whole section before computing or classifying anything.**

**Quick reference table (no figures, see the sourced tables below)**

| Field | Value |
| --- | --- |
| Country | France |
| Primary legislation | Code de la Securite Sociale; loi 2023-1250 of 26 December 2023, article 18 |
| Supporting legislation | Decret 2024-688 of 5 July 2024 (rate scales); CGI art. 154 bis (deductibility) |
| Collecting body | URSSAF (pension and invalidity for a regulated liberal profession are set by the profession's own caisse) |
| Who is covered | Artisan, commercant, profession liberale non reglementee, profession liberale reglementee (Cipav and non Cipav), majority manager of a SARL, sole member manager of an EURL, members of an SNC |
| Who is NOT covered here | Micro-entrepreneurs paying on turnover (see the micro table in Section 5), employees, assimiles salaries such as an SAS or SASU president, praticiens et auxiliaires medicaux, artistes-auteurs, marins |
| Base for an income tax business | Turnover less allowable business costs, without deducting social contributions, then a flat allowance applied by URSSAF |
| Base for a corporation tax business | Director's pay and non-deductible personal benefits, plus the part of distributed income above a threshold, then the same flat allowance |
| Payment options | Monthly on the 5th or the 20th, or quarterly on 5 February, 5 May, 5 August and 5 November |
| Annual declaration | Declaration de revenus des independants, filed with the income tax return on impots.gouv.fr between April and June |
| Currency | EUR only |

**The social security ceiling (plafond annuel de la Securite sociale, the Pass)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/plafonds-securite-sociale.html |
| Annual ceiling 2026, mainland France and overseas except Mayotte | EUR 48,060 | "2026 Année 48 060 €" |
| Quarterly ceiling 2026 | EUR 12,015 | "Trimestre 12 015 €" |
| Monthly ceiling 2026 | EUR 4,005 | "Mois 4 005 €" |
| Annual ceiling 2026, Mayotte only | EUR 36,264 | "2026 Année 36 264 €" |
| Monthly ceiling 2026, Mayotte only | EUR 3,022 | "Mois 3 022 €" |
| Annual ceiling 2025, the previous year, printed on the same page | EUR 47,100 | "2025 Année 47 100 €" |

Almost every threshold in this skill is a multiple of the annual ceiling in the table above. The rate pages print euro thresholds for 2026 only. For the regularisation of 2025 contributions, the 2025 scales on the reform page are written as shares of the ceiling; take the euro figures from the regularised echeancier rather than rebuilding them. Mayotte has its own ceiling and its own rules; this skill does not carry the Mayotte scales.

**Conservative defaults**

| Ambiguity | Default |
| --- | --- |
| Unknown activity type | STOP, do not compute |
| Unknown BIC or BNC | Ask, it decides the caisse and the training levy |
| Unknown Cipav, other regulated caisse, or the general self-employed scheme | Ask, the pension and invalidity rates differ |
| Unknown income | Apply the minimum bases in Section 5 |
| Unknown Acre eligibility | Do not apply Acre without written confirmation |
| Unknown whether the client is on the old or the reformed base | Ask which echeancier the figure comes from, then say so in the file |
| Mainland or overseas unknown | Ask, the overseas scales and start-up exemptions are different |

## Section 2: Required inputs and refusal catalogue

### Required inputs

- **Minimum viable**: activity type (profession liberale reglementee or non reglementee, artisan, commercant, company manager), caisse affiliation, whether the business is taxed to income tax or to corporation tax, and the prior year income figure URSSAF used.
- **Recommended**: bank statements showing URSSAF prelevements, the caisse statements, the URSSAF echeancier de paiement, the 2042 and 2042-C-PRO.
- **Ideal**: the complete liasse fiscale (2033-D, 2035-B or 2058-C), the URSSAF echeancier before and after the annual regularisation, the caisse releve de situation, the Acre confirmation letter, and for a company the capital, share premium and average associate current account balances.

### Refusal catalogue

- **R-FR-SC-1, activity type unknown**: Trigger: activity type or caisse not provided. Message: "Activity type and caisse affiliation are mandatory. The pension and invalidity rates differ between the general self-employed scheme, Cipav and the other regulated caisses. Cannot proceed." _(R-FR-SC-1)_
- **R-FR-SC-2, caisses other than Cipav and the general self-employed scheme**: Trigger: client is an avocat (CNBF), medecin (CARMF), paramedic (CARPIMKO), expert-comptable (CNPADC) or similar. Message: "This skill carries the URSSAF pages for the general self-employed scheme, for Cipav and for the common part of a regulated liberal profession outside Cipav. The pension and invalidity rates of the other caisses are published by those caisses. Escalate." _(R-FR-SC-2)_
- **R-FR-SC-3, micro-entrepreneur**: Trigger: client pays on turnover under the micro-entrepreneur (auto-entrepreneur) scheme. Message: "A micro-entrepreneur pays a single percentage of turnover collected. Do NOT apply the regime reel rate tables to them. Use the micro-entrepreneur table in Section 5." _(R-FR-SC-3)_
- **R-FR-SC-4, international social security**: Trigger: an A1 certificate, posting, or a bilateral treaty question. Message: "EU social security coordination and bilateral agreements require specialist advice. Escalate." _(R-FR-SC-4)_
- **R-FR-SC-5, praticiens et auxiliaires medicaux**: Trigger: client is a health professional in the conventionne scheme. Message: "Health professionals have their own URSSAF rate page and their own contribution paid by the health insurance fund. Not covered here. Escalate." _(R-FR-SC-5)_
- **R-FR-SC-6, computing a single yearly total for a client on zero income**: Trigger: a request for "the" minimum yearly cotisation. Message: "URSSAF publishes each minimum contribution separately and does not publish a single total. State the components from Section 5 and let the echeancier give the total." _(R-FR-SC-6)_

## Section 3: Payment pattern library

This is the deterministic pre-classifier for bank statement transactions related to French social contributions. It carries no amounts: the amounts live in Sections 5 and 10.

### 3.1 URSSAF prelevements (monthly or quarterly)

**URSSAF prelevements patterns**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| URSSAF | EXCLUDE, cotisations sociales | Monthly or quarterly prelevement |
| URSSAF IDF, URSSAF PACA, URSSAF RHONE-ALPES | EXCLUDE, cotisations | Regional URSSAF entities |
| COTISATIONS SOCIALES | EXCLUDE, cotisations | Generic reference |
| PRELEVEMENT URSSAF | EXCLUDE, cotisations | Direct debit description |
| ACOMPTE PROVISIONNEL URSSAF | EXCLUDE, cotisations | Provisional instalment |
| REGULARISATION URSSAF | EXCLUDE, cotisations | Annual regularisation adjustment |

### 3.2 Cipav debits (profession liberale reglementee)

**Cipav debits patterns**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| CIPAV | EXCLUDE, retraite de base and complementaire | Cipav pension contribution |
| CAISSE INTERPROFESSIONNELLE DE PREVOYANCE | EXCLUDE, Cipav | Full name |

### 3.3 Other caisses (escalate, do not classify)

**Other caisses patterns**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| CNBF | ESCALATE, avocats caisse | Out of scope |
| CARMF | ESCALATE, medecins caisse | Out of scope |
| CARPIMKO | ESCALATE, paramedics caisse | Out of scope |
| CNPADC | ESCALATE, experts-comptables | Out of scope |
| IRCEC | ESCALATE, artistes-auteurs complementaire | Out of scope |

### 3.4 CSG/CRDS (collected via URSSAF)

**CSG and CRDS patterns**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| CSG, CRDS | EXCLUDE, social levies | Normally inside the URSSAF prelevement, not a separate debit |

### 3.5 Formation professionnelle (CFP)

**Training levy patterns**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| CFP, CONTRIBUTION FORMATION | EXCLUDE, training levy | Once a year, called with the November instalment |

### 3.6 Tax authority (NOT social contributions)

**Tax authority patterns**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| DGFIP, DIRECTION GENERALE DES FINANCES | EXCLUDE, income tax | Not cotisations sociales |
| IMPOT, IMPOTS.GOUV | EXCLUDE, income tax | Not cotisations |
| TVA, TAXE SUR LA VALEUR AJOUTEE | EXCLUDE, VAT | Not cotisations |
| PRELEVEMENT A LA SOURCE | EXCLUDE, income tax withholding | Not cotisations |

## Section 4: Worked examples

Six bank statement classifications. The amounts used are the ones URSSAF itself publishes for a first year of activity in 2026, so nothing here is invented.

### Example 1, monthly URSSAF prelevement

**Input line:**
`05.04.2026 ; URSSAF ILE DE FRANCE ; PRELEVEMENT ; COTISATIONS AVRIL 2026`

**Reasoning:**
Matches "URSSAF" (pattern 3.1). Monthly prelevement on the 5th, which is one of the two monthly dates URSSAF offers. It is a provisional instalment based on the most recently known income, and it covers maladie, retraite, invalidite-deces, allocations familiales and the combined CSG and CRDS in one debit.

**Classification:** EXCLUDE, cotisations sociales. Compulsory contributions are deductible from professional income under CGI art. 154 bis. For the deductible part of the CSG, use the attestation de versement URSSAF issues, not a rate of your own (see Rule 5).

### Example 2, quarterly URSSAF payment

**Input line:**
`05.05.2026 ; URSSAF ; PRELEVEMENT ; ECHEANCE TRIMESTRIELLE`

**Reasoning:**
Matches "URSSAF" (pattern 3.1). The client is on the quarterly schedule, so four debits fall on 5 February, 5 May, 5 August and 5 November. The amount comes from the echeancier sent after the income declaration, not from a rate applied by you.

**Classification:** EXCLUDE, quarterly cotisations sociales.

### Example 3, URSSAF regularisation

**Input line:**
`20.09.2026 ; URSSAF RHONE-ALPES ; PRELEVEMENT ; REGULARISATION 2025`

**Reasoning:**
Matches "URSSAF" and "REGULARISATION" (pattern 3.1). Once the 2025 income reached URSSAF from the tax administration, the 2025 contributions were regularised and the remaining 2026 instalments recalculated. In 2026 this regularisation is the first one computed on the reformed base and the reformed scales, so it can move a long way in either direction.

**Classification:** EXCLUDE, cotisations regularisation. Deductible in the year it is paid.

### Example 4, Cipav pension debit

**Input line:**
`15.06.2026 ; CIPAV ; PRELEVEMENT ; COTISATION RETRAITE`

**Reasoning:**
Matches "CIPAV" (pattern 3.2). A regulated liberal profession attached to Cipav pays maladie, allocations familiales, the combined CSG and CRDS and the training levy through URSSAF, and pension and invalidity-death at the Cipav rates in Rule 4.

**Classification:** EXCLUDE, Cipav pension contribution. Deductible from professional income.

### Example 5, DGFIP income tax (NOT cotisations)

**Input line:**
`15.04.2026 ; DGFIP ; PRELEVEMENT ; PRELEVEMENT A LA SOURCE`

**Reasoning:**
Matches "DGFIP" (pattern 3.6). This is income tax withholding, not a social contribution. Do not classify it as cotisations sociales.

**Classification:** EXCLUDE, income tax. NOT cotisations sociales.

### Example 6, first year of activity with Acre

**Input line:**
`05.03.2026 ; URSSAF ; PRELEVEMENT ; COTISATIONS MARS 2026 ACRE`

**Reasoning:**
Matches "URSSAF" and "ACRE" (pattern 3.1). In a first year of activity the contributions that Acre does not exempt are computed on a flat base, and Acre itself is no longer a half reduction: URSSAF describes it as an exemption equal to a quarter of the maladie, daily benefit, family, basic pension and invalidity-death contributions, for 12 months, and only while income stays at or below the Acre threshold in Rule 7. The combined CSG and CRDS and the training levy are never exempted by Acre.

**Classification:** EXCLUDE, Acre-reduced cotisations. Deduct the amount actually paid, not a pre-Acre figure.

## Section 5: Tier 1 rules

### Rule 1: rate table, artisan, commercant and profession liberale non reglementee, mainland France

**Contribution rates for 2026**

| Contribution | Rate | Base, and the page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Maladie-maternite 1 | See the scale in Rule 2 | Progressive on the whole income |
| Maladie 2, daily sickness benefit | 0.50% | Up to EUR 240,300, "Dans la limite de 240 300 € (5 plafonds annuel de la Sécurité sociale - Pass) 0,50 %" |
| Retraite de base, capped part | 17.87% | Up to EUR 48,060, "Revenus dans la limite de 48 060 € (1 plafond annuel de la Sécurité sociale - Pass) 17,87 %" |
| Retraite de base, uncapped part | 0.72% | On the part above EUR 48,060, "Part des revenus supérieure à 48 060 € (1 Pass) 0,72 %" |
| Retraite complementaire, band 1 | 8.10% | Up to EUR 48,060 |
| Retraite complementaire, band 2 | 9.10% | On the part between EUR 48,060 and EUR 192,240, "Part du revenus compris entre 48 060 € et 192 240 € (entre 1 et 4 Pass) 9,10 %" |
| Invalidite-deces | 1.30% | Up to EUR 48,060, "Invalidité - décès en métropole Base de calcul Taux Revenus dans la limite de 48 060 € (1 plafond annuel de la Sécurité sociale - Pass) 1,30 %" |
| Allocations familiales | See the scale in Rule 3 | Progressive |
| CSG and CRDS, earned income | 9.70% | "Revenus d'activité 9,70 %" |
| CSG and CRDS, replacement income | 6.70% | "Revenus de remplacement 6,70 %" |
| Training levy, commercant or profession liberale non reglementee | 0.25% | On EUR 48,060, due for 2026, payable November 2026 |
| Training levy, artisan | 0.29% | On EUR 48,060, due for 2026, payable November 2026 |
| Training levy, with a conjoint collaborateur | 0.34% | On EUR 48,060, due for 2026, payable November 2026 |

Two rates that look alike are not alike. The daily sickness benefit contribution of an artisan, commercant or unregulated liberal profession runs to five annual ceilings; for a regulated liberal profession it is a different rate and a different cap (Rule 4a). There is no employer half and no employee half: a self-employed person bears the whole of every line above.

### Rule 2: maladie-maternite 1 progressive scale

**Health contribution scale for 2026, mainland France**

| Income band | Rate | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Below EUR 9,612 (20% of the ceiling) | 0% | "Revenus inférieurs à 9 612 € (20 % du plafond annuel de la Sécurité sociale - Pass) 0 %" |
| EUR 9,612 to EUR 19,224 (20% to 40% of the ceiling) | Rises from 0% to 1.50% | "Taux progressif de 0 % à 1,50 %" |
| EUR 19,224 to EUR 28,836 (40% to 60% of the ceiling) | Rises from 1.50% to 4% | "Taux progressif de 1,50 % à 4 %" |
| EUR 28,836 to EUR 52,866 (60% to 110% of the ceiling) | Rises from 4% to 6.50% | "Taux progressif de 4 % à 6,50 %" |
| EUR 52,866 to EUR 96,120 (110% to 200% of the ceiling) | Rises from 6.50% to 7.70% | "Taux progressif de 6,50 % à 7,70 %" |
| EUR 96,120 to EUR 144,180 (200% to 300% of the ceiling) | Rises from 7.70% to 8.50% | "Taux progressif de 7,70 % à 8,50 %" |
| The part above EUR 144,180 (300% of the ceiling) | 6.50% | "Part des revenus supérieure 144 180 € (300 % du Pass) 6,50 %" |

Read the scale as URSSAF writes it. The rate rises with income and then falls back on the top slice: the highest rate in the scale is reached at three annual ceilings, and only the part of the income above that point carries the lower rate. The same scale now applies to a regulated liberal profession as well, which was not true before the reform.

### Rule 3: allocations familiales progressive scale

**Family allowances scale for 2026, mainland France**

| Income band | Rate | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Below EUR 52,866 (110% of the ceiling) | 0% | "Revenus inférieurs à 52 866 € (110 % du plafond annuel de la Sécurité sociale - Pass) 0 %" |
| EUR 52,866 to EUR 67,284 (110% to 140% of the ceiling) | Rises from 0% to 3.10% | "Taux progressif de 0 % à 3,10 %" |
| Above EUR 67,284 (140% of the ceiling) | 3.10% | "Revenus supérieurs à 67 284 € (140 % du Pass) 3,10 %" |

**Two official pages disagree for a regulated liberal profession.** The rate page for a regulated liberal profession outside Cipav, updated 27 February 2026, prints the same progressive scale as above. The general page "Quelles sont vos cotisations en tant qu'independant", updated 5 October 2026, says instead that for a regulated liberal profession the family allowances rate is set at the full rate on the whole professional income. Both are URSSAF pages. Print both to the client, say they disagree, and take the figure from the echeancier rather than from either page.

### Rule 4: rates for a profession liberale reglementee attached to Cipav

**Cipav rates for 2026, mainland France**

| Contribution | Rate | Base, and the page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-cipav.html |
| Maladie-maternite 1 | The scale in Rule 2 | The same six band scale, printed on this page too |
| Maladie 2, daily sickness benefit | 0.30% | Up to EUR 144,180, "Dans la limite de 144 180 € (3 plafonds annuel de la Sécurité sociale - Pass) 0,30 %" |
| Retraite de base Cipav, capped part | 8.73% | "Revenus de 0 € à 48 060 € (1 plafond annuel de la Sécurité sociale - Pass) 8,73 %" |
| Retraite de base Cipav, uncapped part | 1.87% | On income from zero up to EUR 240,300, "Revenus de 0 € à 240 300 € (5 Pass) 1,87 %" |
| Retraite complementaire Cipav, band 1 | 11% | "Revenus de 0 € à 48 060 € (1 plafond annuel de la Sécurité sociale - Pass) 11 %" |
| Retraite complementaire Cipav, band 2 | 21% | "Revenus de 48 060 € (1 Pass) à 192 240 € (4 Pass) 21 %" |
| Invalidite-deces Cipav | 0.50% | Up to EUR 88,911, "Revenus de 0 € à 88 911 € (1,85 plafond annuel de la Sécurité sociale - Pass) 0,50 %" |
| Allocations familiales | The scale in Rule 3 | Printed on this page as the progressive scale |
| CSG and CRDS, earned income | 9.70% | "Revenu d'activité 9,70 %" |
| Training levy | 0.25% | On EUR 48,060 |
| Training levy with a conjoint collaborateur | 0.34% | On EUR 48,060 |

The Cipav supplementary pension band 2 rate went DOWN in the reform while band 1 went UP. Do not assume every rate moved the same way.

### Rule 4a: rates for a profession liberale reglementee outside Cipav

**Rates for 2026 outside Cipav, mainland France**

| Contribution | Rate | Base, and the page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-hors-cipav.html |
| Maladie-maternite 1 | The scale in Rule 2 | The same six band scale |
| Maladie 2, daily sickness benefit | 0.30% | Up to EUR 144,180, "Dans la limite de 144 180 € (3 plafonds annuel de la Sécurité sociale - Pass) 0,30 %" |
| Allocations familiales | The scale in Rule 3 | "Revenus supérieurs à 67 284 € (140 % du Pass) 3,10 %" |
| CSG and CRDS, earned income | 9.70% | "Revenu d'activité 9,70 %" |
| Training levy | 0.25% | On EUR 48,060 |
| Retraite de base CnavPL, the rate the page uses for the minimum contribution | 8.73% plus 1.87% | "Cotisations Retraite de base CnavPL Base de calcul 5 409 € Taux 8,73 % + 1,87 % Montant minimal annuel 573 €" |
| Minimum yearly basic pension contribution outside Cipav | EUR 573 on a base of EUR 5,409 | "Cotisations Retraite de base CnavPL Base de calcul 5 409 € Taux 8,73 % + 1,87 % Montant minimal annuel 573 €" |
| Retraite complementaire and invalidite-deces | Not printed, they depend on the caisse | URSSAF: "Le montant des cotisations de retraite complémentaire et d'invalidité décès est variable suivant la caisse de retraite." Get them from the profession's caisse |

This is why R-FR-SC-2 exists. For a doctor, a lawyer, a chartered accountant and the rest, URSSAF publishes the common part, and the basic pension rate it uses for the minimum contribution. The supplementary pension and invalidite-deces are the caisse's own, and URSSAF says in terms that they vary by caisse. The same page adds that the minimum basic pension contribution validates three quarters of pension, and that four quarters in 2026 need a yearly professional income of 600 times the hourly Smic.

### Rule 5: the base, and the CSG and CRDS

- **One base since the reform**: URSSAF computes both the social contributions and the CSG and CRDS on a single base. For a business taxed to income tax the base is turnover or receipts less the business costs allowed for tax, WITHOUT deducting the social contributions or the deductible part of the CSG, and then the flat allowance in the table below. Long term professional gains and losses are left out. Tax exemptions are not left out: the 2026 declaration notice says "Les exonérations fiscales ne sont pas admises en déduction socialement." A business with a zoned relief, a jeune entreprise innovante relief or another exempt profit listed in the notice still contributes on the exempted profit.
- **A business taxed to corporation tax**: the base is the director's pay plus non-deductible personal benefits, plus the part of distributed income above the dividend threshold in Rule 11, less real business expenses if that option is taken, then the same flat allowance.
- **A micro-fiscal business that is not an auto-entrepreneur**: the tax allowance for the activity replaces the flat allowance, applied to turnover.
- **What replaced what**: the flat allowance replaces the old deduction of contributions, and the contributions are no longer added back to build the CSG base. URSSAF says the overall level of the levy is unchanged: the CSG and CRDS share falls and the pension share rises.

**The flat allowance and the rates it works with**

| Item | Value | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/reforme-cotisations-independants.html |
| Flat allowance on the single base | 26% | "le revenu brut abattu de 26 %" |
| New full health rate for every self-employed worker | 8.5% | "Le nouveau taux « plein » est fixé à 8,5 % pour l'ensemble des travailleurs indépendants" |

**The micro-fiscal allowances that replace the flat one, for a micro-fiscal business that is not an auto-entrepreneur**

| Activity | Allowance on turnover | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/files/live/sites/urssaffr/files/outils-documentation/formulaires-modeles/independant-notice-revenus-2026.pdf |
| Sales of goods, taxed as BIC | 71% | "71% (BIC ventes), 50% (BIC prestations), 34 % (BNC)" |
| Services taxed as BIC | 50% | "71% (BIC ventes), 50% (BIC prestations), 34 % (BNC)" |
| Non-commercial activity, taxed as BNC | 34% | "71% (BIC ventes), 50% (BIC prestations), 34 % (BNC)" |
| Unclassified furnished letting, and agricultural profits | 30% and 87% | "30% (location meublée non" and "ou 87% (BA). Cet abattement sera réalisé par l'Urssaf" |

**The combined CSG and CRDS rate, and what is deductible**

| Item | Value | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/vos-cotisations.html |
| CSG and CRDS on earned income | 9.70% | "Le taux de CSG-CRDS est fixé à 9,70 % (9,20 % + 0,50 %)" |
| The CSG part of that rate | 9.20% | "Le taux de CSG-CRDS est fixé à 9,70 % (9,20 % + 0,50 %)" |
| The CRDS part of that rate | 0.50% | "Le taux de CSG-CRDS est fixé à 9,70 % (9,20 % + 0,50 %)" |
| CSG on replacement income, and it is deductible | 6.80% | "Si vous bénéficiez de revenus de remplacement, le taux de la CSG est fixé à 6,80 % et le montant de la CSG acquittée est déductible de votre revenu d'activité imposable" |
| Minimum contribution for the CSG and CRDS | None | "La CSG et la CRDS sont dues quel que soit le montant du revenu professionnel. Il n'est pas fait application d'une cotisation minimale." |

Rule 1 prints a different replacement-income figure, taken from the rate page, which gives the combined CSG and CRDS rather than the CSG alone. Both are URSSAF. Replacement income is not what this skill is about: take that figure from the statement of the body that pays the benefit.

**Do not split the CSG of a self-employed person into a deductible and a non-deductible rate from memory.** The rate above that carries the word deductible on an URSSAF page is the one on replacement income. For earned income the page does not print a split; it says URSSAF sends an attestation de versement de la CSG-CRDS that states the deductible amount. Use that document.

**The two pages disagree on the base.** The page above, updated 5 October 2026, still describes the pre-reform base: the CSG and CRDS computed on the contribution base plus the compulsory contributions. The reform page and the 2026 declaration notice describe the single base with the flat allowance, from the 2025 income declared in 2026. Both are URSSAF. For a 2026 regularisation, follow the reform page; say in the file which you used.

### Rule 6: minimum contributions when income is low or negative

**Minimum bases and the minimum contributions they produce, 2026, mainland France**

| Contribution | Minimum base | Rate and minimum yearly amount |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Maladie 2, daily sickness benefit | EUR 19,224 (40% of the ceiling) | 0.50%, minimum EUR 96 |
| Retraite de base | EUR 5,409 (450 times the hourly Smic) | 17.87%, minimum EUR 967 |
| Invalidite-deces | EUR 5,527 (11.5% of the ceiling) | 1.30%, minimum EUR 72 |
| Training levy, commercant or profession liberale non reglementee | EUR 48,060 | 0.25%, minimum EUR 120 |
| Training levy, artisan | EUR 48,060 | 0.29%, minimum EUR 139 |
| Training levy with a conjoint collaborateur | EUR 48,060 | 0.34%, minimum EUR 163 |

- **When the minimums apply, and when they do not**: URSSAF: "Si vos revenus sont déficitaires ou inférieurs à certains seuils, vous devez cotiser sur une base annuelle minimale (sauf cas particulier) même si vous êtes par ailleurs salarié ou retraité." The exception is printed in the same paragraph: "En revanche, les cotisations minimales ne s'appliquent pas si vous êtes bénéficiaire du RSA ou de la prime d'activité. Dans ce cas, vos cotisations sont calculées sur votre revenu réel, sauf demande contraire de votre part." So a client on the RSA or on the prime d'activite pays on real income unless they ask otherwise.
- **No minimum for**: maladie 1, allocations familiales, the CSG and CRDS, and the supplementary pension.
- **Do not publish a single yearly minimum total.** URSSAF prints the components, not a total. Adding them yourself invents a figure, and the training levy line depends on whether the client is an artisan, a commercant or has a conjoint collaborateur.
- **Cipav minimums are different**: see Rule 6a.

### Rule 6a: minimum contributions for a Cipav member

**Cipav minimum contributions, 2026, mainland France**

| Contribution | Minimum base | Rate and minimum yearly amount |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-cipav.html |
| Maladie 2, daily sickness benefit | EUR 19,224 (40% of the ceiling) | 0.30%, minimum EUR 58 |
| Retraite de base Cipav | EUR 5,409 (450 times the hourly Smic) | 8.73% plus 1.87%, minimum EUR 573 |
| Invalidite-deces Cipav | EUR 17,782 (37% of the ceiling) | 0.50%, minimum EUR 89 |
| Training levy | EUR 48,060 | 0.25%, minimum EUR 120 |
| Training levy with a conjoint collaborateur | EUR 48,060 | 0.34%, minimum EUR 163 |

URSSAF adds that the minimum basic pension contribution is set to validate three quarters of pension, not four, and that the other contributions are computed on real income.

The same carve-out as in Rule 6 applies here. URSSAF, on the Cipav page: "En revanche, les cotisations minimales ne s'appliquent pas si vous êtes bénéficiaire du RSA ou de la prime d'activité. Dans ce cas, vos cotisations sont calculées sur votre revenu réel, sauf demande contraire de votre part."

### Rule 7: Acre in the first year

- **What Acre is now**: an exemption from part of the maladie 1, daily benefit, allocations familiales, retraite de base and invalidite-deces contributions, for 12 months from the creation of the business, granted under conditions. It is NOT a half reduction and it is NOT four quarters.
- **What Acre never covers**: the CSG and CRDS, the supplementary pension and the training levy. URSSAF: "Si vous bénéficiez de l'aide à la création et à la reprise d'entreprise (Acre), l'exonération de cotisations ne porte pas sur la CSG-CRDS."

**Acre by income level, 2026**

| Income | What the exemption is | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| At or below EUR 36,045 (75% of the ceiling) | A quarter of the maladie-maternite, daily benefit, allocations familiales, retraite de base and invalidite-deces contributions | "Revenu inférieur ou égal à 36 045 € (75 % du Pass) Exonération égale au quart du montant des cotisations maladie/maternité, indemnités journalières, allocations familiales, retraite de base et invalidité-décès" |
| Above EUR 36,045 and below EUR 48,060 | Tapering exemption | "Exonération dégressive" |
| Above EUR 48,060 (one ceiling) | No exemption at all | "Revenu supérieur à 48 060 € (1 Pass) Pas d'exonération" |

### Rule 8: payment schedule and the annual declaration

- **The declaration**: URSSAF: "Chaque année entre avril et juin, vous devez déclarer vos revenus en ligne sur impots.gouv.fr." The declaration de revenus des independants is filed with the income tax return; there is no separate URSSAF return.
- **Monthly**: twelve direct debits from January to December, on the 5th or the 20th, the client's choice.
- **Quarterly**: 5 February, 5 May, 5 August and 5 November. URSSAF warns that late payment surcharges may be applied if those dates are missed.
- **Changing frequency**: from the online account, at any time, but only once per calendar year.
- **Start of activity**: the first payments fall after a minimum delay of 90 days.
- **Cessation**: the balance is due within 30 days of the date the avis d'appel is sent, computed from the declarations for every period not yet finally assessed.
- **After the declaration**: URSSAF regularises the closed year, recalculates the provisional instalments for the current year and shows the first instalments of the following year for information. An overpayment can be refunded if the account allows it.
- **The training levy**: called once a year, with the November instalment, and it is calculated finally rather than regularised.

### Rule 9: the first years of activity

**First year of activity in 2026, no Acre, mainland France, general self-employed scheme**

| Contribution | Base and rate | Yearly amount |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Retraite de base | EUR 9,131 at 17.87% | EUR 1,632 |
| Retraite complementaire | EUR 9,131 at 8.10% | EUR 740 |
| Invalidite-deces | EUR 9,131 at 1.30% | EUR 119 |
| Maladie 2, daily benefit | EUR 19,224 at 0.50% | EUR 96 |
| Maladie 1 | EUR 9,131 at 0% | EUR 0 |
| Allocations familiales | EUR 9,131 at 0% | EUR 0 |
| CSG and CRDS | EUR 9,131 at 9.70% | EUR 886 |
| Total, training levy excluded | | EUR 3,473 |

**The training levy on top of that total, first year 2026**

| Who | Base and rate | Yearly amount |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Commercant or profession liberale non reglementee | EUR 48,060 at 0.25% | EUR 120 |
| Artisan | EUR 48,060 at 0.29% | EUR 139 |
| With a conjoint collaborateur | EUR 48,060 at 0.34% | EUR 163 |

- **The flat base**: for the first two years the base is a flat EUR 9,131 for 2026, being 19% of the annual ceiling, prorated when the business starts during the year. The training levy is not prorated. The second year uses 19% of the 2027 ceiling, which URSSAF says is not yet known.
- **With Acre**: the page describes Acre as an exemption equal to a quarter of the maladie 1, daily benefit, allocations familiales, retraite de base and invalidite-deces contributions (Rule 7), so on the page's own words most of each of those five lines is NOT exempted. Yet the page's table of "cotisations non exonérées, calculées sur la base forfaitaire" lists only the three lines reproduced below. The page does not print what remains due on the five partly exempted contributions. Do not compute it and do not state a first-year total for a client with Acre: give the lines below, say that the five partly exempted contributions are also due in part, and take the total from the echeancier (T2-1, R-FR-SC-6).

**First year of activity in 2026 WITH Acre: the contributions Acre never exempts, general self-employed scheme**

| Contribution | Base and rate | Yearly amount |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Retraite complementaire | EUR 9,131 at 8.10% | EUR 740 |
| CSG and CRDS | EUR 9,131 at 9.70% | EUR 886 |
| Training levy, commercant or profession liberale non reglementee | EUR 48,060 at 0.25% | EUR 120 |
| Training levy, artisan | EUR 48,060 at 0.29% | EUR 139 |
| Training levy with a conjoint collaborateur | EUR 48,060 at 0.34% | EUR 163 |

**First year of activity in 2026 WITH Acre: the Cipav supplementary pension in place of the general one**

| Contribution | Base and rate | Yearly amount |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-cipav.html |
| Retraite complementaire Cipav | EUR 9,131 at 11% | EUR 1,004 |

- **It is provisional**: URSSAF: "Un complément de cotisations vous sera éventuellement réclamé en 2027 lors de la régularisation effectuée sur la base de la déclaration de vos revenus définitifs 2026." Tell the client the first year is a loan against a later bill.
- **If the flat base is wrong for the client**: URSSAF's page on choosing a legal form says an estimate of income, up or down, can be made at any time from the online account, and the provisional contributions are recalculated.

### Rule 10: deductibility

- **Compulsory contributions**: deductible from professional income under CGI art. 154 bis, in the year they are paid.
- **The CSG**: part of the CSG paid is deductible. The rate for earned income is not printed as a split on an URSSAF page, so take the deductible amount from the attestation de versement de la CSG-CRDS URSSAF sends each year. The CRDS is not deductible.
- **Where it is claimed**: on the 2042-C-PRO, through the liasse for a business on the regime reel. Deduct the amount actually paid, Acre included, not a pre-Acre figure.

### Rule 11: company managers, and the cost of a manager who is a travailleur independant

This is the question the payroll and formation skills route here. They are right to refuse it themselves: a majority manager of a SARL is not on the payroll and has no payslip, so no employer cost calculation applies to them.

**Who is a travailleur independant and who is an employee for social purposes**

| Position | Social status | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/choisir-forme-juridique/creer-societe.html |
| SARL, majority manager or majority board of managers | Travailleur independant, contributions on professional activity income | "le gérant majoritaire ou le collège de gérance majoritaire (1) (détention de plus de 50 % des parts entre les gérants) sont travailleurs indépendants et paient leurs cotisations sociales sur leur revenu d'activité professionnelle" |
| SARL, minority or equal manager | Assimile salarie, so payroll, not this skill | "le gérant minoritaire ou égalitaire ou collège de gérance minoritaire ou égalitaire (détention d'au plus 50 % des parts) est assimilé salarié" |
| EURL or SARL majority manager, including SELARLU and SELARL | Travailleur independant | "les gérants majoritaires d'EURL, SARL, SELARLU et SELARL, qu'ils soient artisans, commerçants, professionnels libéraux réglementés ou non" |
| SAS or SASU president and directeurs generaux | Assimile salarie, so payroll, not this skill | "Dans une SAS, le président et les directeurs généraux sont assimilés salariés" |
| SNC, every member whether manager or not | Travailleur independant | "tous les associés qu'ils soient gérants ou non sont travailleurs indépendants" |
| Entreprise individuelle | Travailleur independant | "Le dirigeant d'une entreprise individuelle a le statut de travailleur indépendant" |

Note what the majority test counts: the shares of ALL the managers added together, not each manager alone. URSSAF's own example is two co-managers whose holdings add up to more than half, which makes both of them majority managers.

**What the manager pays on**

| Item | Value | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/files/live/sites/urssaffr/files/outils-documentation/formulaires-modeles/independant-notice-revenus-2026.pdf |
| Threshold above which distributed income enters the contribution base, company taxed to corporation tax | 10% | "Déclarez la part perçue (montant brut) des revenus distribués (dividendes et intérêts versés des comptes courants d'associés) supérieure à : Pour les sociétés soumises à l'impôt sur les sociétés : 10% du montant du capital social, des primes d'émission et des sommes versées en compte courant d'associé détenu par l'associé" |
| Threshold for a sole trader taxed to corporation tax: 10% of net profit, or for an EIRL 10% of the affected assets if higher | 10% | "Pour les entreprises individuelles : 10% du bénéfice net ou, pour les EIRL, 10 % du patrimoine affecté si celui-ci est supérieur." |
| Flat allowance applied by URSSAF to the whole of that base | 26% | "Ces éléments constituent le montant de revenus sur lequel l'abattement forfaitaire de 26% est appliqué" |

So the cost of a majority manager of a company taxed to corporation tax is built like this, and every rate in it comes from Rule 1 if the company is commercial or from Rule 4 or Rule 4a if it is a regulated liberal profession:

1. Take the manager's pay plus non-deductible personal benefits. Deduct real business expenses only if that option was taken. Do not deduct the social contributions or the deductible CSG.
2. Add the part of dividends and associate current account interest above the threshold in the table above. The threshold is measured on the capital, the share premiums and the associate current account amounts held by that associate; the holdings and income of the spouse or PACS partner and of minor unemancipated children count too. Capital and premiums are taken at the last day of the preceding financial year, and the current account at its annual average balance.
3. Apply the flat allowance in the table above to give the single base.
4. Apply the rate table in Rule 1 (or Rule 4 or 4a) to that base, band by band, and add the training levy.
5. Check the minimum contributions in Rule 6, because they bite even on a manager who takes no pay, and check whether the first year flat base in Rule 9 applies instead.

There is no employer share to add: every line in the rate tables is borne in full by the person. On unemployment cover, URSSAF's page on choosing a legal form says of the OTHER status, the assimile salarie, that "ils ne relèvent pas du droit du travail et ne cotisent pas à l'assurance chômage"; it says nothing about unemployment cover for a travailleur independant, so this skill does not either. If the company also has staff, the employer cost of those employees is a payroll question and belongs in `france-payroll`, not here.

### Rule 12: micro-entrepreneurs, for completeness

A micro-entrepreneur pays a single percentage of turnover collected and none of the tables above apply to them. The rates are here so that nobody reaches for the wrong table.

**Micro-entrepreneur social contribution rates, 2026**

| Activity | Full rate | Reduced Acre rate, activity started up to 30 June 2026 | Reduced Acre rate, activity starting from 1 July 2026 |
| --- | --- | --- | --- |
| Source | all figures below | https://www.autoentrepreneur.urssaf.fr/portail/accueil/sinformer-sur-le-statut/lessentiel-du-statut.html | see the source row |
| Sale of goods, taxed as BIC | 12.3% | 6.2% | 9.3% |
| Commercial and craft services, taxed as BIC | 21.2% | 10.6% | 15.9% |
| Other services, taxed as BNC | 25.6% | 12.8% | 19.2% |
| Regulated liberal profession attached to Cipav | 23.2% | 13.4% | 17.4% |
| Classified tourist accommodation | 6% | 3% | 4.5% |
| Classified tourist accommodation let by a Cipav liberal profession | 6% | 3.5% | 4.5% |

**Micro-entrepreneur training levy, 2026**

| Who | Rate on turnover |
| --- | --- |
| Source | https://www.autoentrepreneur.urssaf.fr/portail/accueil/sinformer-sur-le-statut/lessentiel-du-statut.html |
| Artisans | 0.3% |
| Commercants | 0.1% |
| Liberal professions, regulated and unregulated | 0.2% |

Two conditions matter here. The Acre column that applies is chosen by the date the activity STARTED, not by the current year, and Acre for a micro-entrepreneur became less generous for businesses started from 1 July 2026. The page marks the Cipav figures in the first Acre column with an asterisk and explains it under the table: for a Cipav liberal profession the reduced rate is raised to the floor made of the CSG and CRDS rate and the supplementary pension rate, which Acre does not exempt. URSSAF: "pour les professions libérales relevant de la Cipav, le taux est réhaussé en tenant compte du taux minimum (somme des taux CSG/CRDS et du taux de retraite complémentaire non exonérés par l'Acre - article L.613-7 alinéa 1 )".

How long the reduced column runs: URSSAF says the reduced micro-entrepreneur rate applies until the end of the third calendar quarter after the quarter in which the activity started. That is not twelve months for everyone: the page's own example is a business created on 20 February whose reduced rate runs to 31 December of the same year. The request must also be sent to URSSAF, with its supporting documents, no later than 60 days after the start date declared on the Guichet unique.

## Section 6: Tier 2 catalogue

### T2-1: Acre eligibility

- **T2-1**: Trigger: client claims Acre. Issue: eligibility is conditional and is granted for 12 months, and the exemption is now a quarter of five named contributions rather than a half of everything. Action: flag for the reviewer, verify with URSSAF, and check the income against the thresholds in Rule 7.

### T2-2: transfer between Cipav and the general self-employed scheme

- **T2-2**: Trigger: client's profession moved out of Cipav under the 2018 reform, or the client exercised an option. Issue: the applicable pension rates depend on the registration date and on whether the option was exercised. Action: escalate to an expert-comptable.

### T2-3: dual salarie and independant

- **T2-3**: Trigger: client is both employed and self-employed. Issue: both sets of contributions apply, and URSSAF states that the minimum contributions apply "même si vous êtes par ailleurs salarié ou retraité". Action: flag for the reviewer to check how the capped pension bands interact across the two schemes.

### T2-4: the 2025 base reform, applied in 2026

- **T2-4**: Trigger: computing or explaining the regularisation of the 2025 contribution year, processed in 2026. Issue: this is the first year the single base with the flat allowance and the new rate scales apply, and URSSAF dates the change to April 2026. Action: flag for the reviewer and state on the file which base and which scale were used.

### T2-5: late registration (activite non declaree)

- **T2-5**: Trigger: the client has been trading without registering with URSSAF. Issue: contributions can be claimed retrospectively with surcharges. Action: escalate to an expert-comptable immediately.

### T2-6: first year income above the Acre cut-off

- **T2-6**: Trigger: a client with Acre whose income passes the thresholds in Rule 7. Issue: the exemption tapers and then disappears entirely once income exceeds one annual ceiling. Action: flag for the reviewer and compute the taper from the echeancier, not by a rate of your own.

### T2-7: a manager who is on the borderline of the majority test

- **T2-7**: Trigger: co-managers whose combined holding is close to half the shares, or a change in holdings during the year. Issue: crossing the line moves the person between this skill and payroll, with a completely different cost. Action: get the share register and the dates, and flag for the reviewer.

### T2-8: overseas departments

- **T2-8**: Trigger: the client is established in Guadeloupe, Guyane, Martinique, La Reunion or Mayotte. Issue: the overseas scales are fixed rather than progressive for health, there is a 24 month start-up exemption and then an abatement in the third and later years, and Mayotte has its own ceiling entirely. Action: use the overseas part of the URSSAF rate page, not the mainland tables above, and flag for the reviewer.

## Section 7: Excel working paper template

Fill the rates and bases from the tables in Section 5 rather than from memory, so that this sheet cannot go stale.

~~~
FRANCE COTISATIONS SOCIALES, WORKING PAPER
Client: [name]
Contribution year: [year]
Prepared: [date]

INPUT DATA
  Activity type:                 [artisan / commercant / PL non reglementee / PL reglementee]
  Caisse:                        [general self-employed scheme / Cipav / other, name it]
  Legal form and role:           [EI / EURL gerant / SARL gerant majoritaire / SNC associe]
  Tax regime of the business:    [income tax reel / micro-fiscal / corporation tax]
  Mainland or overseas:          [mainland / DROM / Mayotte]
  First or second year:          [YES/NO, date of creation]
  Acre granted:                  [YES/NO/UNKNOWN, date of grant]
  Also employed or retired:      [YES/NO]
  On the RSA or prime activite:  [YES/NO]

BASE
  Gross figure from the liasse or the pay:  EUR [____]
  Add, dividends above the threshold:       EUR [____]   (Rule 11)
  Less, real expenses if that option taken: EUR [____]
  Flat allowance applied by URSSAF:         EUR [____]   (Rule 5)
  SINGLE BASE:                              EUR [____]

CONTRIBUTIONS (rate from Rule 1, Rule 4 or Rule 4a)
  Maladie 1, progressive:        EUR [____]   (Rule 2)
  Maladie 2, daily benefit:      EUR [____]
  Retraite de base, capped:      EUR [____]
  Retraite de base, uncapped:    EUR [____]
  Retraite complementaire, b1:   EUR [____]
  Retraite complementaire, b2:   EUR [____]
  Invalidite-deces:              EUR [____]
  Allocations familiales:        EUR [____]   (Rule 3)
  CSG and CRDS combined:         EUR [____]
  Training levy:                 EUR [____]
  TOTAL:                         EUR [____]

MINIMUM CHECK (Rule 6 or Rule 6a)
  Any contribution below its minimum?       [YES/NO, list them]
  Client on the RSA or prime d'activite?    [if YES the minimums do not apply]

DEDUCTIBILITY (Rule 10)
  Compulsory contributions paid in year:    EUR [____]
  Deductible CSG per the URSSAF attestation:EUR [____]
  CRDS, not deductible:                     EUR [____]

REVIEWER FLAGS
  [List any Tier 2 flags]
~~~

## Section 8: Bank statement reading guide

### How French social contribution debits appear

**URSSAF prelevements:**
- Description: "URSSAF" or "URSSAF [REGION]" with "PRELEVEMENT" or "COTISATIONS"
- Timing: the 5th or the 20th of each month, or 5 February, 5 May, 5 August and 5 November
- Amount: a steady figure until the annual regularisation resets the remaining instalments
- Regularisation debits carry "REGULARISATION" in the reference

**Cipav and other caisse debits:**
- Description: "CIPAV" or "CAISSE INTERPROFESSIONNELLE"
- Timing: varies by caisse
- Amount: based on declared income and the caisse's own scale

**Key identification tips:**
1. URSSAF debits are the most common, monthly or quarterly on fixed dates.
2. A regularisation debit can be large if the income estimate was well out, and the 2026 regularisation also carries the change of base and of scale.
3. A caisse debit is separate from the URSSAF debit for a regulated liberal profession.
4. A DGFIP debit is tax, not cotisations.
5. First-year amounts are low because they sit on a flat base. Warn the client about the regularisation that follows.
6. A November debit that is larger than the rest usually carries the training levy.

## Section 9: Onboarding fallback

If the client provides only a bank statement:

1. **Scan for URSSAF debits** and identify monthly or quarterly prelevements and regularisations.
2. **Scan for caisse debits** such as Cipav, which tell you the client is a regulated liberal profession.
3. **Sum the contributions actually paid in the year** across URSSAF and the caisse.
4. **Identify regularisation adjustments**, whether debits or refunds.
5. **Ask for the echeancier**, because the split between contributions and the base is on it and cannot be recovered from a bank line.
6. **Flag:** "Contribution classification derived from bank statement patterns. The caisse affiliation, the Acre status, the legal form and the income base have not been independently verified. The reviewer must confirm before completing the 2042-C-PRO."

## Section 10: Reference material

### Key reference values for 2026

**Multiples of the annual ceiling used in this skill**

| Reference | Value | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| One annual ceiling | EUR 48,060 | "48 060 € (1 plafond annuel de la Sécurité sociale - Pass)" |
| 20% of the ceiling | EUR 9,612 | "9 612 € (20 % du plafond annuel de la Sécurité sociale - Pass)" |
| 40% of the ceiling | EUR 19,224 | "19 224 € (40 % du plafond annuel de la Sécurité sociale - Pass)" |
| 60% of the ceiling | EUR 28,836 | "28 836 € (entre 40 % et 60 % du Pass)" |
| 110% of the ceiling | EUR 52,866 | "52 866 € (110 % du plafond annuel de la Sécurité sociale - Pass)" |
| 140% of the ceiling | EUR 67,284 | "67 284 € (140 % du Pass)" |
| 200% of the ceiling | EUR 96,120 | "96 120 € (entre 110 % et 200 % du Pass)" |
| 300% of the ceiling | EUR 144,180 | "144 180 € (300 % du Pass)" |
| Four ceilings | EUR 192,240 | "192 240 € (entre 1 et 4 Pass)" |
| Five ceilings | EUR 240,300 | "240 300 € (5 plafonds annuel de la Sécurité sociale - Pass)" |
| First year flat base, 19% of the ceiling | EUR 9,131 | "9 131 € (19 % du Pass)" |

**Maximum contributions for 2026, general self-employed scheme, mainland France and overseas except Mayotte**

| Contribution | Base | Maximum yearly amount |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Maladie 2, daily benefit | EUR 240,300 | EUR 1,202 |
| Retraite complementaire | EUR 192,240 | EUR 17,494 |
| Invalidite-deces | EUR 48,060 | EUR 625 |

URSSAF's own maximum for the supplementary pension does not follow its own rate description. The rate rows say one rate up to one annual ceiling and a higher one on the part between one and four ceilings; the maximum printed above is the whole of four ceilings at the higher rate. The two cannot both be right. Print the page's maximum, do not compute one of your own, and take the figure a client must pay from the echeancier. A Cipav member has different rates and caps (Rule 4).

**Overseas departments except Mayotte: what is different**

| Item | Value | The page's own words |
| --- | --- | --- |
| Source | all figures below | https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html |
| Health rate up to EUR 144,180, fixed not progressive | 8.50% | "Revenus inférieurs à 144 180 € inclus 8,50 %" |
| Health rate on the part above EUR 144,180 | 6.50% | "Part des revenus supérieure 144 180 € (3 plafonds annuel de la Sécurité sociale - Pass) 6,50 %" |
| Allocations familiales, fixed on the whole income | 3.10% | "Allocations familiales en Outre-mer Base de calcul Taux Revenu d'activité 3,10 %" |
| Start-up exemption equal to the value of 110% of the ceiling, income band | EUR 52,866 to EUR 72,090 | "Exonération égale à une valeur de 110 % du Pass" |
| Start-up exemption tapers, income band | EUR 72,090 to EUR 120,150 | "Exonération dégressive", between 150% and 250% of the annual ceiling |
| No start-up exemption above | EUR 120,150 | "Revenu > 120 150 € (250 % du Pass) Pas d'exonération", that is 250% of the annual ceiling |
| Abatement in the third year of activity, income below EUR 72,090, capped at one annual ceiling | 75% | "vous pouvez bénéficier d'un abattement de 75 % du revenu, dans la limite du plafond annuel de la Sécurité sociale (Pass), pour calculer les cotisations" |
| Abatement from the fourth year, income below EUR 72,090 | 50% | "À partir de la 4 ème année 50 %" |

The overseas start-up exemption runs for 24 months from the creation of the business and covers maladie 1, maladie 2, retraite de base, invalidite-deces, allocations familiales and the combined CSG and CRDS. The supplementary pension stays due on the first-year flat base, and the training levy is a fixed amount. The third and fourth year abatements do not apply to the supplementary pension, to invalidite-deces or to the training levy. Both abatements are limited to one annual ceiling of income.

### Test suite

These tests check the method and the routing, not arithmetic you should be doing by hand.

**Test 1:** Commercant on the general self-employed scheme, mainland, not a first year, income in the band that runs from 60% to 110% of the ceiling. Expect: health from the progressive scale in Rule 2 in the band that runs to 110% of the ceiling; basic pension entirely in the capped band; supplementary pension entirely in band 1; family allowances at nil because income is below 110% of the ceiling; the combined CSG and CRDS; the training levy for a commercant. Do not report a single computed total: report the lines and take the total from the echeancier.

**Test 2:** Artisan, income between 140% and 200% of the ceiling. Expect: the uncapped pension rate to appear for the first time on the part above one ceiling; the supplementary pension to split across bands 1 and 2; family allowances at the full rate because income is above 140% of the ceiling; the artisan training levy, not the commercant one.

**Test 3:** Zero income, not a first year, mainland, not on the RSA. Expect the four minimum contributions in Rule 6, quoted as four separate amounts. Refuse a single total (R-FR-SC-6).

**Test 4:** Zero income, not a first year, client receives the prime d'activite. Expect no minimum contributions at all: URSSAF computes on real income unless the client asks otherwise.

**Test 5:** First year of activity in 2026, no Acre, general scheme, commercant. Expect the first-year table in Rule 9: EUR 3,473 excluding the training levy, plus EUR 120 for the levy, and a warning that a regularisation follows in 2027.

**Test 6:** Architect attached to Cipav, income just above 110% of the ceiling. Expect the Rule 2 health scale, the Cipav pension rates in Rule 4 including the band 2 supplementary rate, invalidite-deces at the Cipav rate up to 1.85 ceilings, and family allowances in the tapering band. Flag the disagreement between the two URSSAF pages on the family allowances scale for a regulated liberal profession.

**Test 7:** SARL with two co-managers whose holdings add up to more than half of the shares. Expect both to be treated as majority managers, both as travailleurs independants, and the cost to be built by Rule 11, not by a payroll calculation.

**Test 8:** SASU president. Expect a refusal and a route to `france-payroll`: an assimile salarie is on the payroll and none of these tables apply.

**Test 9:** Auto-entrepreneur asking what they owe. Expect R-FR-SC-3, then the micro-entrepreneur table in Rule 12, with the Acre column chosen by the date the activity started.

### Prohibitions

- NEVER compute without knowing the activity type, the caisse and the legal form.
- NEVER apply the Cipav rates to a profession that is not attached to Cipav.
- NEVER ignore the minimum contributions, and never apply them to a client on the RSA or the prime d'activite without asking.
- NEVER apply Acre without written confirmation, and never describe it as a half reduction.
- NEVER tell a client the CSG and CRDS is fully deductible, and never invent the deductible split for earned income.
- NEVER mix a figure from the pre-reform base with a figure from the reformed base in the same calculation.
- NEVER advise on a caisse whose rates are not on an URSSAF page.
- NEVER use the regime reel tables for a micro-entrepreneur.
- NEVER estimate a surcharge or a penalty without escalating.
- NEVER advise on international social security coordination.
- NEVER treat a majority manager as an employee, or an assimile salarie as a travailleur independant.

## The method, step by step

1. **Fix the status before anything else.** Decide whether the person is a travailleur independant at all, using the table in Rule 11 on [the URSSAF page on choosing a legal form](https://www.urssaf.fr/accueil/choisir-forme-juridique/creer-societe.html). A majority manager of a SARL, an EURL manager, an SNC member and a sole trader are in this skill. A minority or equal SARL manager and an SAS or SASU president are on the payroll and belong in `france-payroll`. A micro-entrepreneur pays on turnover and belongs in Rule 12.
2. **Fix the caisse.** Artisan, commercant and unregulated liberal profession use [the general self-employed rate page](https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html). A regulated liberal profession attached to Cipav uses [the Cipav rate page](https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-cipav.html). Any other regulated liberal profession uses [the non-Cipav rate page](https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-hors-cipav.html) for the common part and the profession's own caisse for the pension. Health professionals are refused under R-FR-SC-5.
3. **Build the single base.** Follow [the URSSAF page on the base reform](https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/reforme-cotisations-independants.html) and [the 2026 declaration notice](https://www.urssaf.fr/files/live/sites/urssaffr/files/outils-documentation/formulaires-modeles/independant-notice-revenus-2026.pdf): gross income without deducting contributions, plus for a company taxed to corporation tax the part of distributed income above the threshold, then the flat allowance. Record which year's base you are on, because the reformed base starts with the 2025 income declared in 2026.
4. **Apply the rates band by band** from Rule 1, Rule 2, Rule 3 and, for Cipav, Rule 4. Check the caps: the daily benefit contribution, the supplementary pension and invalidite-deces all stop at a multiple of the annual ceiling, and those multiples are not the same.
5. **Test against the floors and the ceilings.** Compare each contribution with the minimum in Rule 6 or Rule 6a and with the maximum in Section 10. Ask whether the client is on the RSA or the prime d'activite before applying a minimum.
6. **Apply the start-up rules if they bite.** A first or second year uses the flat base in Rule 9, and Acre, if granted, is the quarter exemption in Rule 7 for 12 months, subject to the income thresholds.
7. **Declare and pay on the official calendar.** The income is declared on impots.gouv.fr between April and June per [the URSSAF payment calendar](https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/calendrier-paiement-cotisations.html); contributions are paid monthly on the 5th or the 20th or quarterly on 5 February, 5 May, 5 August and 5 November; the training levy comes with the November instalment; the first payment in a new business falls no sooner than 90 days in; and on cessation the balance is due within 30 days of the avis d'appel.
8. **Reconcile to the echeancier, not to your spreadsheet.** Where your figure and the echeancier differ, the echeancier is the document the client must pay. Record the difference and its cause, and take the deductible CSG amount from the attestation URSSAF sends, per [the page on what a self-employed person's contributions are](https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/vos-cotisations.html).

## Ask the client first

- What is the legal form and, for a SARL, what percentage of the shares do ALL the managers hold together? That single answer decides whether this skill applies or whether the person is on the payroll.
- Is the business taxed to income tax or to corporation tax, and if to corporation tax, what are the capital, the share premiums and the average associate current account balance? Those build the dividend threshold in Rule 11.
- Which caisse, and if it is a regulated liberal profession, is it attached to Cipav or not? The pension and invalidity rates differ, and outside Cipav no URSSAF page carries them.
- When exactly did the activity start, and was Acre granted, and on what date? A first or second year uses a flat base, Acre runs for 12 months, and for a micro-entrepreneur the Acre rate column is chosen by the start date.
- Is the client on the RSA or the prime d'activite, or otherwise employed or retired? The first answer switches the minimum contributions off; the second does not.
- Is the business in mainland France, in an overseas department, or in Mayotte? The scales, the start-up exemptions and even the ceiling are different.
- Which document is the figure you have been given taken from: a provisional echeancier, a regularised echeancier, or an avis? In 2026 the two can sit on different bases and different scales.

## When to refuse or refer

- Refuse any computation where the activity type, the caisse or the legal form is unknown (R-FR-SC-1).
- Refer any regulated liberal profession whose pension caisse is not Cipav to that caisse for the pension and invalidity rates (R-FR-SC-2). No URSSAF page carries them.
- Refuse to apply the regime reel tables to a micro-entrepreneur (R-FR-SC-3); use Rule 12.
- Refer every cross-border question, posting, A1 certificate or bilateral agreement to a specialist (R-FR-SC-4).
- Refer praticiens et auxiliaires medicaux to their own URSSAF rate page and caisse (R-FR-SC-5).
- Refuse to state a single yearly minimum contribution total (R-FR-SC-6). URSSAF publishes the components only.
- Refer anyone who is an assimile salarie, including an SAS or SASU president and a minority or equal SARL manager, to `france-payroll`.
- Refer questions about the local business property tax to `fr-cfe`, income tax on the same profits to `fr-income-tax`, VAT to `france-vat-return`, and the choice of legal form itself to `france-formation`.
- Escalate any case of trading without registration, and any surcharge or penalty question, to an expert-comptable (T2-5).
- Stop and escalate where two URSSAF pages disagree and the answer changes the bill, as they do on the family allowances scale for a regulated liberal profession and on the base for the CSG and CRDS.

## Sources

- [URSSAF, taux de cotisations, artisan, commercant et profession liberale non reglementee](https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-ac-plnr.html)
- [URSSAF, taux de cotisations, profession liberale reglementee relevant de la Cipav](https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-cipav.html)
- [URSSAF, taux de cotisations, profession liberale reglementee hors Cipav](https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/taux-cotisations-plr-hors-cipav.html)
- [URSSAF, reforme de l'assiette sociale et du bareme des cotisations sociales](https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/reforme-cotisations-independants.html)
- [URSSAF, plafonds de la Securite sociale](https://www.urssaf.fr/accueil/outils-documentation/taux-baremes/plafonds-securite-sociale.html)
- [URSSAF, quelles sont vos cotisations en tant qu'independant](https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/vos-cotisations.html)
- [URSSAF, comprendre vos cotisations](https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/comprendre-vos-cotisations.html)
- [URSSAF, le calendrier de paiement des cotisations des travailleurs independants](https://www.urssaf.fr/accueil/independant/comprendre-payer-cotisations/calendrier-paiement-cotisations.html)
- [URSSAF, choisir votre statut juridique](https://www.urssaf.fr/accueil/choisir-forme-juridique/creer-societe.html)
- [URSSAF, declaration de revenus 2026 des independants, notice explicative](https://www.urssaf.fr/files/live/sites/urssaffr/files/outils-documentation/formulaires-modeles/independant-notice-revenus-2026.pdf)
- [URSSAF, l'essentiel du statut d'auto-entrepreneur](https://www.autoentrepreneur.urssaf.fr/portail/accueil/sinformer-sur-le-statut/lessentiel-du-statut.html)

## Disclaimer

This skill and its outputs are provided for informational and computational purposes only and do not constitute tax, legal, or financial advice. Open Accountants and its contributors accept no liability for any errors, omissions, or outcomes arising from the use of this skill. All outputs must be reviewed and signed off by a qualified professional (such as a CPA, EA, tax attorney, or equivalent licensed practitioner in your jurisdiction) before filing or acting upon.

The most up-to-date version of this skill is maintained at openaccountants.com. Log in to access the latest version, request a professional review from a licensed accountant, and track updates as tax law changes.

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

This file is an AI skill (tax rules your AI follows) from OpenAccountants, copied on 2026-10-19. Rates, thresholds and deadlines change. For the current version of this skill, its official sources and the named accountant (if any) who stands behind it, call `get_skill` with slug `fr-social-contributions` on the OpenAccountants connector (https://www.openaccountants.com/connect), or read https://www.openaccountants.com/skills/fr-social-contributions. If neither is available, confirm every figure against the official source pages cited above before relying on it.
