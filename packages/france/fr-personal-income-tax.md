---
name: fr-personal-income-tax
description: "Comprehensive French personal income tax (impôt sur le revenu / IR) guide for all individuals. Trigger on phrases like \"impôt sur le revenu\", \"IR France\", \"barème progressif\", \"quotient familial\", \"décote\", \"prélèvement à la source\", \"PAS\", \"CEHR\", \"contribution exceptionnelle hauts revenus\", \"CDHR\", \"déclaration 2042\", \"revenus exceptionnels\", \"quotient pour revenus exceptionnels\", \"TMI\", \"taux marginal d'imposition\", \"tranches d'imposition France\", \"parts fiscales\", \"parent isolé case T\", \"pension alimentaire déduction\", \"réductions d'impôt\", \"crédits d'impôt\", \"emploi à domicile\", \"dons associations\", \"plafonnement niches fiscales\", \"non-résident fiscal France\", \"exit tax\", \"impatriation\", \"PUMA cotisation subsidiaire\", \"calcul IR France\", \"simulation impôt sur le revenu\", \"avis d'imposition\". Covers the full IR computation sequence: progressive brackets, quotient familial with plafonnement, décote, CEHR, CDHR, prélèvement à la source, deductions/reductions/credits, non-residents, and special cases. For capital gains see fr-capital-gains, for rental income see fr-rental-income, for crypto see fr-crypto-tax."
version: 1.0
jurisdiction: FR
tax_year: 2026
last_updated: 2026-10-19
authored_by: Michael Cutajar and the OpenAccountants team
review_status: pending_review
trust_label: Built by Michael Cutajar and the OpenAccountants team
category: international
tier: 2
license: AGPL-3.0-or-later (code) / OpenAccountants Guide License v1.0 (content)
---

# France: personal income tax for a household (impôt sur le revenu)

This skill computes French personal income tax (impôt sur le revenu, IR) for a household resident in France: the scale, the family quotient and its caps, the décote, the deductions, reductions and credits, the two high-income contributions (CEHR and CDHR), and withholding at source. Figures are for tax year 2026. France taxes the previous year's income, so the scale, the family-quotient caps, the décote, the allowances and the deduction limits below are those that govern the income of 2025, declared in spring 2026; the scale for the income of 2026 has not been published yet, and where a figure that governs income of 2026 is already printed (the micro turnover limits, the retirement-savings ceiling, the social levies on investment income), its row says so. Withholding at source and the social levies are stated as in force on 19 October 2026. Self-employed income in depth is in `fr-income-tax`; investment income and gains on securities in `fr-capital-gains`; rental income in `fr-rental-income`; crypto-assets in `fr-crypto-tax`; leaving France and the exit tax in `leaving-france-exit-tax`; an audit or a reassessment in `fr-tax-audit`.

## Section 1: Quick reference

**Quick reference fields**

| Field | Value |
| --- | --- |
| Country | France (République française) |
| Tax | Impôt sur le revenu (IR), with the CEHR and the CDHR on high incomes; social levies on investment and rental income are a separate charge |
| Currency | EUR only |
| Income year | Calendar year (1 January to 31 December) |
| Primary legislation | Code général des impôts (CGI), art. 197 for the scale |
| Tax authority | Direction générale des Finances publiques (DGFiP) |
| Filing portal | impots.gouv.fr (espace particulier) |
| Main forms | 2042, 2042 C, 2042 C PRO, 2042 RICI, 2047 (foreign income), 2044 (rental income under the real regime) |

**Online filing deadlines in 2026 for the income of 2025**

| What | Deadline | Note |
| --- | --- | --- |
| Source | all rows below | https://www.impots.gouv.fr/les-modalites-de-la-declaration-de-revenus-en-2026 |
| Online, départements 01 to 19 and non-residents | Thursday 21 May 2026, 23:59 | "jeudi 21 mai au plus tard (23h59) pour les départements n° 01 à 19 et les non-résidents" |
| Online, départements 20 to 54 | Thursday 28 May 2026, 23:59 | "jeudi 28 mai au plus tard (23h59) pour les départements n° 20 à 54" |
| Online, départements 55 to 974 and 976 | Thursday 4 June 2026, 23:59 | "jeudi 4 juin au plus tard (23h59) pour les départements n° 55 à 974 et 976" |
| Paper return, residents abroad included | Tuesday 19 May 2026, midnight | "La déclaration papier doit, quant à elle, être déposée au plus tard le mardi 19 mai 2026 à minuit" |

## The method, step by step

1. **Fix the household and the year.** Work on one foyer fiscal and one income year. For the return filed in 2026, that is the income of 2025, on form 2042 and its annexes, filed online by the date for the household's département in the deadline table above (https://www.impots.gouv.fr/les-modalites-de-la-declaration-de-revenus-en-2026). Marital status is taken at 31 December and dependants at 1 January or, if they increased during the year, at 31 December (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/05-situation_foyer_75a84.pdf).
2. **Put each income in its category and apply the category allowance.** Salaries take the 10% deduction or actual expenses; unemployment benefit (lines 1AP to 1DP) is taxed under the salary rules and takes the same deduction; pensions take their own allowance, capped per household; micro-entrepreneurs and furnished lets take the flat allowance of their regime. The allowances are in the tables in Section 4 (https://bofip.impots.gouv.fr/bofip/10855-PGP.html/identifiant=BOI-BAREME-000035-20260217 and https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf and https://entreprendre.service-public.gouv.fr/vosdroits/F23267).
3. **Add the net category incomes and take off the deductions from global income** (retirement savings, maintenance payments, deductible CSG, earlier global deficits) to reach net taxable income, using the tables in Section 10 (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/12-charges_ded_rev_225a236.pdf).
4. **Count the shares (parts) of family quotient** under CGI art. 194 and 195, using Section 5 (https://www.service-public.gouv.fr/particuliers/vosdroits/F2705).
5. **Apply the scale to one share and multiply by the number of shares**, using the scale table in Section 3 (https://www.service-public.gouv.fr/particuliers/vosdroits/F1419). Income taxed under the quotient system for exceptional income is added at this step (Section 11, https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/17-divers_321a336.pdf).
6. **Cap the family-quotient advantage.** Work out the tax again with the base shares only (1 or 2), subtract the cap for each extra half share, and keep the higher of the two results (https://bofip.impots.gouv.fr/bofip/2494-PGP.html/identifiant=BOI-IR-LIQ-20-20-20-20260407).
7. **Apply the décote** if the gross tax after the cap is below the décote threshold for the household (https://bofip.impots.gouv.fr/bofip/2495-PGP.html/identifiant=BOI-IR-LIQ-20-20-30-20260407).
8. **Take off the tax reductions** (they cannot go below zero), then the tax credits (any excess is refunded), and check the overall cap on tax advantages (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/plafonnement.pdf).
9. **Add the flat-rate taxes** on income taxed outside the scale (for example the income tax part of the flat tax on investment income, https://www.service-public.gouv.fr/particuliers/vosdroits/F2613), **then the CEHR and the CDHR** where the reference income passes their thresholds (https://bofip.impots.gouv.fr/bofip/7804-PGP.html/identifiant=BOI-IR-CHR-20170711 and https://bofip.impots.gouv.fr/bofip/15095-PGP.html/identifiant=BOI-IR-CDHR-10-20260630).
10. **Reconcile with withholding at source.** Subtract what was withheld or paid in instalments during the income year, and the January advance of credits, to find the balance due or the refund (https://www.service-public.gouv.fr/particuliers/vosdroits/F34009).

## Ask the client first

- Were you resident in France for tax purposes for the whole of 2025? A non-resident is taxed only on French-source income and at a minimum rate (Section 11), and this skill does not cover a part-year resident.
- What was your situation on 31 December 2025, and did you marry, enter a Pacs, divorce, separate or lose a spouse during 2025? Each changes the number of returns and the number of shares.
- Who lived with you and depended on you on 1 January 2025 and on 31 December 2025, and is any child in alternating residence? Shares and the caps differ for a child in alternating residence.
- Do you live alone with your children (case T), or live alone having raised a child for at least 5 years (case L)? Both give an extra half share with its own cap.
- Did you receive dividends, interest or gains on securities, and did you tick the option for the scale? The option decides whether the 40% dividend allowance and the deductible CSG apply.
- Did you receive a one-off sum (severance pay, a bonus for exceptional services, arrears of salary)? It may be taxed under the quotient system if you ask for it on the return.

## When to refuse or refer

- Refer a part-year resident, a person with two possible tax homes, or anyone who needs a tax treaty to settle residence or the right to tax: this skill computes the French return only.
- Refer anyone leaving France with shareholdings to `leaving-france-exit-tax`.
- Refer a household whose reference income is near or above the CDHR thresholds to an expert-comptable or avocat fiscaliste: the reference income, the adjustments to the tax and the advance payment need a full working paper (Section 8).
- Refer the self-employed under the real regime (BIC or BNC réel) to `fr-income-tax`, and any computation of social contributions to `fr-social-contributions`.
- Do not compute the IFI (real estate wealth tax), succession or gift duties, or the cotisation subsidiaire maladie (PUMa) from this skill. It carries none of their figures.
- Do not state a 2026 scale figure for the income of 2026. None has been published on an allowed page.

## Section 2: The full computation sequence

**Never skip a step. Each intermediate must be computed.**

~~~
1. Gross income by category
   minus the category allowance (salaries, pensions, micro regimes, dividends under the scale option)
2. Net category incomes
   summed
3. Revenu brut global (RBG)
   minus deductions from global income (retirement savings, maintenance, deductible CSG, earlier deficits)
4. Revenu net imposable (RNI)
   divided by the number of shares
5. Quotient (income per share)
   apply the scale
6. Tax per share
   multiplied by the number of shares
7. Gross tax (impôt brut)
   family-quotient cap
8. Tax after the cap
   décote, if the tax is below the threshold
9. Tax after the décote
   minus tax reductions (floor at zero)
10. Tax after reductions
    minus tax credits (refundable)
11. Net income tax
    plus flat-rate taxes outside the scale
    plus CEHR (reference income above the thresholds)
    plus CDHR (reference income above the thresholds and average rate below the minimum)
    = total income tax for the year
    Social levies on investment and rental income are charged on top and are not part of IR.
~~~

## Section 3: The progressive scale

The scale is applied to the income of one share, and the result is multiplied by the number of shares. Each rate applies only to the part of the income per share that falls inside its band. The page is stamped "Vérifié le 15 avril 2026".

**Income tax scale applied in 2026 to the income of 2025, per family-quotient share (CGI art. 197)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F1419 |
| First band, up to and including | EUR 11,600 | "Jusqu'à 11 600 €" |
| Rate of the first band | 0% | "Jusqu'à 11 600 € 0 %" |
| Second band, from | EUR 11,601 | "De 11 601 € à 29 579 € 11 %" |
| Second band, to | EUR 29,579 | "De 11 601 € à 29 579 € 11 %" |
| Rate of the second band | 11% | "De 11 601 € à 29 579 € 11 %" |
| Third band, from | EUR 29,580 | "De 29 580 € à 84 577 € 30 %" |
| Third band, to | EUR 84,577 | "De 29 580 € à 84 577 € 30 %" |
| Rate of the third band | 30% | "De 29 580 € à 84 577 € 30 %" |
| Fourth band, from | EUR 84,578 | "De 84 578 € à 181 917 € 41 %" |
| Fourth band, to | EUR 181,917 | "De 84 578 € à 181 917 € 41 %" |
| Rate of the fourth band | 41% | "De 84 578 € à 181 917 € 41 %" |
| Rate on the part of each share above the top of the fourth band | 45% | "Plus de 181 917 € 45 %" |

**Uprating of the scale for the income of 2025 (loi n° 2026-103 du 19 février 2026, art. 4)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/14954-PGP.html/ACTU-2026-00022 |
| Uprating of the band limits and of the thresholds tied to them, from the tax due in 2026 on the income of 2025 | 0.9% | "l’indexation, au taux de 0,9 %" |

### Worked example (hypothetical): single person, 1 share, net taxable income 40,000 euros

~~~
First band:  11,600 x 0                      =     0.00
Second band: (29,579 - 11,600) = 17,979 x 0.11 = 1,977.69
Third band:  (40,000 - 29,579) = 10,421 x 0.30 = 3,126.30
Tax for one share                             = 5,103.99
x 1 share                                     = 5,103.99
Gross tax is above the single-person décote threshold, so no décote.
~~~

## Section 4: Allowances by category of income

**Salaries: the 10% deduction for professional expenses, income of 2025**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/10855-PGP.html/identifiant=BOI-BAREME-000035-20260217 |
| Flat deduction on salaries, unless actual expenses are claimed instead | 10% | "Déduction forfaitaire de 10 % pour frais professionnels" |
| Minimum deduction, income of 2025 (the second column) | EUR 509 | "Minimum 504 € 509 €" |
| Maximum deduction, income of 2025 (the second column) | EUR 14,555 | "Plafond 14 426 € 14 555 €" |

The 10% deduction is worked out automatically for each member of the household on the total of the sums that person declares in the category of salaries (traitements et salaires); actual expenses can be claimed instead where they are higher (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/06-traitements_salaires_85a114.pdf). Unemployment benefit, including the ARE, belongs to that category: it is declared on lines 1AP to 1DP, not on lines 1AJ to 1DJ, and the deduction is computed on it with the salaries (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/06-traitements_salaires_85a114.pdf). Pensions do not take this deduction; they take their own allowance below.

**Pensions: the 10% allowance, income of 2025 (the last column of the aide-mémoire)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf |
| Allowance on pensions | 10% | "Montant de l‘abattement de 10 % sur les pensions" |
| Minimum allowance, income of 2025 (last figure in the row) | EUR 454 | "> minimum 422 442 450 454" |
| Maximum allowance, income of 2025 (last figure in the row) | EUR 4,439 | "> maximum 4 123 4 321 4 399 4 439" |

**Pensions: the maximum is per household**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/07-pensions_115a120.pdf |
| The pension allowance cannot exceed this amount for the whole household | EUR 4,439 | "dépasser 4 439€ par foyer" |

**Micro regimes for the self-employed: allowances and turnover limits**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://entreprendre.service-public.gouv.fr/vosdroits/F23267 |
| Micro-BNC allowance (professions libérales) | 34% | "Le taux d'abattement est de 34 %" |
| Micro-BIC allowance, services | 50% | "Le taux d'abattement est de 50 %" |
| Micro-BIC allowance, sales of goods | 71% | "Le taux d'abattement est de 71 %" |
| Minimum allowance | EUR 305 | "Le montant de l’abattement ne peut pas être inférieur à 305 €" |
| Services limit that governs the income of 2025 | EUR 77,700 | "ne doit pas avoir dépassé 77 700 €" |
| Sales limit that governs the income of 2025 | EUR 188,700 | "ne doit pas avoir dépassé 188 700 €" |
| Services limit that governs income received in 2026 | EUR 83,600 | "n’a pas dépassé 83 600 €" |
| Sales limit that governs income received in 2026 | EUR 203,100 | "n’a pas dépassé 203 100 €" |

The micro limits are tested on turnover, not on income, and the allowance is applied by the administration to the turnover declared. The limits for the income of 2025 and for income received in 2026 differ; the regime and its two-year test are in `fr-income-tax`.

**Unfurnished lettings: the micro-foncier regime**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/3973-PGP.html |
| Gross yearly rent at or below which micro-foncier applies | EUR 15,000 | "revenu brut foncier annuel n’excède pas 15 000 €" |
| Flat allowance under micro-foncier | 30% | "l’application d’un abattement de 30 %" |

**Furnished lettings under the micro-BIC regime, income of 2025 declared in 2026**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/particulier/location-meublee |
| Receipts limit: chambres d'hôtes, classified tourist lets and long-term furnished lets | EUR 77,700 | "77 700 € pour les locations de chambres d'hôtes et de meublés de tourisme classés" |
| Receipts limit: unclassified furnished tourist lets | EUR 15,000 | "15 000 € pour les locations de meublés de tourisme non classés" |
| Allowance on chambres d'hôtes and classified tourist lets (lines 5NG, 5OG, 5PG) | 50% | "Un abattement forfaitaire de 50 % (avec un minimum de 305 €)" |
| Allowance on unclassified tourist lets (lines 5NH, 5OH, 5PH) | 30% | "Un abattement forfaitaire de 30 % (avec un minimum de 305 €)" |
| Allowance on other furnished lets, long-term furnished lets included (lines 5NI, 5OI, 5PI) | 50% | "aux lignes 5NI, 5OI ou 5PI les recettes de vos autres locations meublées. Un abattement forfaitaire de 50 %" |
| Minimum allowance in both cases | EUR 305 | "minimum de 305 €" |

Rental income in depth, including the real regime and deficits, is in `fr-rental-income`.

**Investment income: the flat tax and the option for the scale**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F2613 |
| Income tax part of the prélèvement forfaitaire unique | 12.8% | "l'impôt sur le revenu ( 12,8 % )" |
| Allowance on dividends, only where the household opts for the scale | 40% | "Abattement de 40 % sur les dividendes" |

**Social levies (prélèvements sociaux): the total depends on the income and the year**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F2329 |
| Investment income (revenus de placement) of 2025 | 17.2% | "Revenus de 2025 ... TOTAL 17,2 %" |
| Investment income of 2026, general case | 18.6% | "Revenus de 2026 ... Cas général ... TOTAL 18,6 %" |
| Rental income (revenus fonciers) | 17.2% | "Revenus fonciers ... TOTAL 17,2 %" |

Never quote one social-levy rate without naming the income and the year: the table above shows that the same page prints a different total for investment income of 2025, for investment income of 2026 and for rental income. The flat tax on investment income is the income tax part in the flat-tax table plus the social levies on that income; this skill does not add them into one rate. Dividends, interest and gains on securities are in `fr-capital-gains`.

**Salary terminology trap**

| Term | Where found | Value |
| --- | --- | --- |
| Salaire brut | Payslip, top | Before contributions |
| Salaire net | Payslip, amount paid | After contributions and after the non-deductible CSG |
| Salaire net imposable (line 1AJ) | Payslip, dedicated line | The amount declared on line 1AJ |
| Net taxable salary after the deduction | Avis d'impôt | Line 1AJ less the 10% deduction in the salary table, within its minimum and maximum |

## Section 5: Family quotient (quotient familial)

### Base shares

| Situation | Base shares |
| --- | --- |
| Single, divorced or separated | 1 |
| Married or in a Pacs, taxed jointly | 2 |
| Widowed, no dependant | 1 |
| Widowed with a dependent child | 2, plus the shares for the children |

### Extra shares for children

A couple taxed jointly has 2 shares, plus one half share for each of the first two dependent children and one full share from the third child, whether the child is a minor or an unmarried adult who is attached to the household (https://www.service-public.gouv.fr/particuliers/vosdroits/F2705). A child in alternating residence gives one quarter share for each of the first two such children and one half share from the third.

| Couple taxed jointly, children mainly or wholly dependent | Total shares |
| --- | --- |
| 0 children | 2 |
| 1 child | 2.5 |
| 2 children | 3 |
| 3 children | 4 |
| 4 children | 5 |
| Each further child | plus 1 |

**Special cases:**
- A person who lives alone and mainly or wholly supports their children (case T) gets one full share for the first child instead of a half share (https://bofip.impots.gouv.fr/bofip/2494-PGP.html/identifiant=BOI-IR-LIQ-20-20-20-20260407).
- A person who is single, widowed or divorced, lives alone, has no dependant and raised a child for at least 5 years while living alone (case L) is taxed on one and a half shares (https://bofip.impots.gouv.fr/bofip/2494-PGP.html/identifiant=BOI-IR-LIQ-20-20-20-20260407 and https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf).
- Extra half shares exist for invalidity of the taxpayer or of a dependant, and for veterans and war widows; their caps work as a complementary tax reduction, shown in the invalidity row of the cap table (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf).

### The family-quotient cap (plafonnement)

The advantage that each extra share gives is capped. Work out (a) the tax with all the household's shares and (b) the tax with the base shares only (1 for a single person, 2 for a couple), less the cap for each extra half share. If (a) is lower than (b), the cap applies and the tax is (b) (https://www.service-public.gouv.fr/particuliers/vosdroits/F2705). The caps are in the two tables below; the service-public page rounds the quarter-share cap.

**Family quotient: the caps as the service-public page states them**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F2705 |
| Maximum advantage for each extra half share | EUR 1,807 | "limité à 1 807 €" |
| Maximum advantage for each extra quarter share (child in alternating residence) | EUR 904 | "limité à 904 €" |

**Family quotient caps, income of 2025 (BOFiP, version in force from 7 April 2026)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/2494-PGP.html/identifiant=BOI-IR-LIQ-20-20-20-20260407 |
| Each extra half share above 1 share (single) or 2 shares (couple) | EUR 1,807 | "Son montant est fixé à 1 807 € par demi-part supplémentaire" |
| The full share for the first child of a parent living alone (case T) | EUR 4,262 | "Son montant est fixé à 4 262 € à compter de l’imposition des revenus de l’année 2025" |
| Each of those half shares where the first child is in alternating residence | EUR 2,131 | "soit 2 131 € (4 262 € / 2)" |
| The half share of a person living alone, with no dependant, who raised a child (case L) | EUR 1,079 | "est fixé à 1 079 € au titre de l’imposition des revenus de l’année 2025" |
| Extra tax reduction where the half share for invalidity, veterans or war widows is capped | EUR 1,801 | "Son montant est fixé à 1 801 € à compter de l’imposition des revenus de l’année 2025" |
| Extra tax reduction for a widowed person with a dependant whose extra share is capped | EUR 2,011 | "soit 2 011 € , pour la part supplémentaire s’ajoutant à une" |

### Worked example (hypothetical): couple, 2 children, 3 shares, net taxable income 80,000 euros

~~~
(a) With 3 shares: 80,000 / 3 = 26,666.67 per share
    (26,666.67 - 11,600) x 0.11 = 1,657.33 per share x 3 = 4,972.00
(b) With 2 base shares: 80,000 / 2 = 40,000 per share
    1,977.69 + (40,000 - 29,579) x 0.30 = 5,103.99 per share x 2 = 10,207.98
    2 extra half shares x 1,807 = 3,614.00
    10,207.98 - 3,614.00 = 6,593.98
(a) is lower than (b), so the cap applies: gross tax = 6,593.98
Above the couple décote threshold, so no décote.
~~~

## Section 6: Décote (relief for low tax bills)

The décote applies to every household, whatever its situation, when its gross tax is below the threshold for its situation in the table below. It is worked out on the tax given by the scale, including tax on income taxed under the quotient system, after the family-quotient cap and before the tax reductions (https://bofip.impots.gouv.fr/bofip/2495-PGP.html/identifiant=BOI-IR-LIQ-20-20-30-20260407). The décote equals the fixed amount for the household less 45.25% of the gross tax, and it is deducted from the gross tax.

**Décote, income of 2025 (CGI art. 197, I-4)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/2495-PGP.html/identifiant=BOI-IR-LIQ-20-20-30-20260407 |
| Gross tax below which a single, divorced or widowed person gets the décote | EUR 1,982 | "inférieure à 1 982 € pour les contribuables célibataires, divorcés ou veufs" |
| Gross tax below which a couple taxed jointly gets the décote | EUR 3,277 | "et à 3 277 € pour les contribuables soumis à imposition commune" |
| Fixed amount in the formula, single person | EUR 897 | "897 € pour les contribuables célibataires, divorcés ou veufs" |
| Fixed amount in the formula, couple | EUR 1,483 | "1 483 € pour les contribuables soumis à imposition commune pour l’imposition des revenus de 2025" |
| Share of the gross tax deducted from the fixed amount | 45.25% | "45,25 % pour l’imposition des revenus de 2025" |

### Worked example (hypothetical): single person, net taxable income 20,000 euros

~~~
(20,000 - 11,600) x 0.11 = 924.00 gross tax, below the single-person threshold
Décote = 897 - (924.00 x 0.4525) = 897 - 418.11 = 478.89
Tax after décote = 924.00 - 478.89 = 445.11
~~~

## Section 7: CEHR (contribution exceptionnelle sur les hauts revenus)

The CEHR is charged on the household's revenu fiscal de référence (reference income), not on net taxable income, and is added to the income tax (https://bofip.impots.gouv.fr/bofip/7804-PGP.html/identifiant=BOI-IR-CHR-20170711). It is charged by bracket: the lower rate on the part of reference income inside the first bracket, the higher rate on the part above it. For the income of 2025, income taxed under the quotient system counts at its amount before division by the quotient, and a smoothing calculation applies where the reference income of 2025 is at least one and a half times the average of the reference income of 2023 and 2024 and other conditions are all met (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/17-divers_321a336.pdf).

**CEHR: contribution exceptionnelle sur les hauts revenus (CGI art. 223 sexies)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/7804-PGP.html/identifiant=BOI-IR-CHR-20170711 |
| Rate on the band of reference income in the first bracket | 3% | "3 % à la fraction de revenu fiscal de référence supérieure à 250 000 €" |
| Single, widowed, separated or divorced: first bracket, above | EUR 250,000 | "supérieure à 250 000 € et inférieure ou égale à 500 000 €" |
| Single person: first bracket ends, second bracket above | EUR 500,000 | "supérieure à 500 000 € pour les contribuables célibataires, veufs, séparés ou divorcés" |
| Couple taxed jointly: first bracket, above | EUR 500,000 | "supérieure à 500 000 € et inférieure ou égale à 1 000 000 € pour les contribuables soumis à imposition commune" |
| Couple taxed jointly: second bracket, above | EUR 1,000,000 | "supérieure à 1 000 000 € pour les contribuables soumis à imposition commune" |
| Rate on reference income in the second bracket | 4% | "4 % à la fraction de revenu fiscal de référence supérieure à 500 000 €" |

## Section 8: CDHR (contribution différentielle sur les hauts revenus)

The CDHR ensures that households with a high reference income pay a minimum average rate of income tax. It was created by the 2025 finance law (loi n° 2025-127, art. 10) for the income of 2025 and is charged again on the income of 2026 under the 2026 finance law (loi n° 2026-103, art. 2), as the BOFiP page in force from 30 June 2026 records (https://bofip.impots.gouv.fr/bofip/15095-PGP.html/identifiant=BOI-IR-CDHR-10-20260630). It applies to taxpayers domiciled in France for tax purposes whose reference income for the CDHR passes the threshold for their situation.

The contribution is the positive difference between (1) the minimum rate applied to the CDHR reference income, less a décote where that income is at or below the décote limit, and (2) the income tax, the CEHR and certain final withholding taxes, plus a fixed amount per dependant and a fixed amount for a couple. For a single person the décote is the minimum rate applied to the reference income less the décote factor applied to the excess of the reference income over the single-person liability threshold, if the result is positive; for a couple the excess is measured over the couple threshold (https://bofip.impots.gouv.fr/bofip/15095-PGP.html/identifiant=BOI-IR-CDHR-10-20260630). The CDHR reference income is not the ordinary revenu fiscal de référence: it is that figure reduced by certain allowances and adjusted as the BOFiP page sets out (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/17-divers_321a336.pdf). All amounts are in the tables below.

**CDHR: contribution différentielle sur les hauts revenus (CGI art. 224)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/15095-PGP.html/identifiant=BOI-IR-CDHR-10-20260630 |
| Minimum rate applied to the reference income | 20% | "l’application d’un taux de 20 % au revenu de référence" |
| Reference income above which a single, widowed, separated or divorced person is liable | EUR 250,000 | "supérieur à 250 000 € pour les contribuables célibataires, veufs, séparés ou divorcés" |
| Reference income above which a couple taxed jointly is liable | EUR 500,000 | "à 500 000 € pour les contribuables soumis à une imposition commune" |
| A décote applies where reference income is at or below this, single person | EUR 330,000 | "inférieur ou égal à 330 000 € pour les contribuables célibataires" |
| A décote applies where reference income is at or below this, couple | EUR 660,000 | "à 660 000 € pour les contribuables soumis à une imposition commune" |
| Factor applied to the excess of reference income over the liability threshold, in the décote | 82.5% | "82,5 % de la différence entre ce revenu et 250 000 €" |
| Added to the taxes already paid, per dependant (MAJPAC) | EUR 1,500 | "majoré de 1 500 € par personne à charge" |
| Added to the taxes already paid, couple taxed jointly (MAJCOUPLE) | EUR 12,500 | "et de 12 500 € pour les contribuables soumis à une imposition commune" |

**CDHR advance payment for the income of 2025**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/actualite/contribution-differentielle-sur-les-hauts-revenus-cdhr |
| Advance paid between 1 and 15 December 2025, as a share of the contribution the household estimated | 95% | "Cet acompte est égal à 95 % du montant de la contribution estimée" |

For the income of 2025, a household liable to the CDHR had to pay an advance between 1 and 15 December 2025, based on income received to 1 December 2025 plus an estimate for the rest of December, and the advance is set against the contribution due (https://www.impots.gouv.fr/actualite/contribution-differentielle-sur-les-hauts-revenus-cdhr). This skill does not state the advance rule for the income of 2026: check the administration's page in the autumn.

## Section 9: Withholding at source (prélèvement à la source, PAS)

### Two mechanisms

| Mechanism | Income | Collected by |
| --- | --- | --- |
| Retenue à la source (withholding) | Salaries, pensions, unemployment benefit, sick pay | The employer, the pension fund, France Travail, health insurance |
| Acompte (instalment) | Self-employed profits, rental income and other income with no payer to withhold | DGFiP, by direct debit from the bank account |

### Rates

| Rate | What it is |
| --- | --- |
| Rate of the household | Worked out by the DGFiP from the last return |
| Individualised rate | Married or Pacs couples taxed jointly get it automatically; each partner's rate applies only to their own income, and common income such as rental income stays at the household rate. Either partner may opt for the household rate instead (https://www.service-public.gouv.fr/particuliers/vosdroits/F34009) |

### Changes during the year

- A change of family situation (marriage, Pacs, birth or adoption, death of a spouse or partner, divorce or end of a Pacs) must be reported to the tax administration within 60 days (https://www.service-public.gouv.fr/particuliers/vosdroits/F34009).
- The taxpayer may ask to raise the rate at any time, and to lower it under conditions; this skill does not state the conditions for lowering or the penalty for an excessive cut, because no saved allowed page prints them. Check the espace particulier before advising a cut.

### Settling the year

Withholding is an advance on the tax, not the final tax. After the spring return, the DGFiP works out the final tax on the income of the previous year and compares it with what was withheld. A balance due is taken from the bank account as the table below sets out (https://www.service-public.gouv.fr/particuliers/vosdroits/F34009). Bank details must be updated before 1 July for the balance or refund to be paid correctly.

**Withholding at source (prélèvement à la source): the balance after the return**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F34009 |
| Balance due up to this amount: taken in one payment in September | EUR 300 | "Jusqu'à 300 € : en 1 fois en septembre" |
| Balance due above this amount: taken in four payments, September to December | EUR 300 | "Plus de 300 € : en 4 fois de septembre à décembre" |

### January advance of reductions and credits

The credit for help at home is paid in part in advance in January, on the basis of the credit received the previous year, and the balance is paid in the summer on the actual expenses; an advance that turns out too high must be repaid (https://www.service-public.gouv.fr/particuliers/vosdroits/F12).

**January advance of tax credits**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F12 |
| Advance paid in January 2026, worked out from the credit received in 2025 | 60% | "Un acompte de 60 % vous est versé en janvier 2026" |

## Section 10: Deductions, reductions and credits

### Fundamental distinction

| Mechanism | Acts on | Refunded if larger than the tax? | Calculation step |
| --- | --- | --- | --- |
| Déduction | Taxable income | Not applicable | Step 3 |
| Réduction d'impôt | Tax due | No, the tax stops at zero | Step 9 |
| Crédit d'impôt | Tax due | Yes, the excess is refunded | Step 10 |

### Deductions from global income

**Retirement savings (PER and similar): deduction ceiling per person**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/12-charges_ded_rev_225a236.pdf |
| Ceiling, as a share of net professional income of the previous year | 10% | "10 % des revenus d’activité nets de frais professionnels de l’an-" |
| Maximum, contributions paid in 2025 (income of 2025) | EUR 37,094 | "37 094 €) ou 10 % du plafond annuel" |
| Minimum ("plancher"), contributions paid in 2025 | EUR 4,637 | "(montant minimum : 4 637 €)" |
| Maximum, contributions paid in 2026 (income of 2026) | EUR 37,680 | "(montant maximum : 37 680 €)" |
| Minimum, contributions paid in 2026 | EUR 4,710 | "(montant minimum : 4 710 €)" |
| Maintenance paid to an adult child: deduction limit per child per year | EUR 6,855 | "dans la limite de 6 855 € par enfant" |
| Limit doubled where the adult child is married or has a family and the payer alone supports the household | EUR 13,710 | "La limite de déduction peut être doublée (soit 13 710 €)" |

The retirement-savings ceiling is per person, carried forward for 3 years if unused, and a married or Pacs couple taxed jointly may pool their ceilings by ticking box 6QR (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/12-charges_ded_rev_225a236.pdf). The ceiling printed on the 2025 return was calculated at the 2024 assessment. Deductible CSG on investment income is deducted from the income of the year in which the CSG is paid, only for income taxed under the scale, not under the flat tax:

**Deductible CSG on income from capital**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/12-charges_ded_rev_225a236.pdf |
| CSG deductible from the income of the year it is paid, on income taxed at the scale | 6.8% | "Le montant de CSG déductible est égal à 6,8 % des revenus déclarés" |

### Tax reductions (no refund of any excess)

**Tax reductions for gifts, income of 2025 (last column of the aide-mémoire)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf |
| Gifts to bodies of general interest, political parties and candidates | 66% | "Taux 66 %" |
| Base limited to this share of taxable income; the excess is carried to the next 5 years | 20% | "Limite de la base de calcul 20 %" |
| Gifts to bodies giving free meals, care or housing to people in difficulty | 75% | "Taux 75 %" |
| Base limit for those gifts made from 1 January to 13 October 2025 | EUR 1,000 | "Plafond à 1 000 € pour les dons versés du 1.1 au 13.10.2025" |
| Base limit for the year where gifts were made from 14 October to 31 December 2025, earlier gifts included | EUR 2,000 | "plafond à 2 000 € (y compris dons du 1.1. au 13.10.2025)" |

The excess of gifts over the base limit is carried forward over the next 5 years. Investment schemes such as Pinel and Denormandie are reductions too: the Pinel reduction covers new homes bought or built from 1 September 2014 to 31 December 2024, so 2025 brings no new Pinel investment, only the continuing instalments of earlier ones (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/14-RICI_2042C_257a296.pdf).

### Tax credits (refunded if larger than the tax)

**Tax credit for employing someone at home (CGI art. 199 sexdecies)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F12 |
| Credit rate on expenses borne in the year | 50% | "Le crédit d'impôt s'élève à 50 % des dépenses" |
| General ceiling on expenses per year | EUR 12,000 | "dans la limite de 12 000 € par an" |
| Maximum credit under the general ceiling | EUR 6,000 | "avantage maximal de 6 000 €" |
| Increase per dependent child, per household member over 65, per ascendant over 65 | EUR 1,500 | "Ce plafond est majoré de 1 500 € (sans pouvoir dépasser au total 15 000 €" |
| General ceiling including increases, never above | EUR 15,000 | "sans pouvoir dépasser au total 15 000 €" |
| Increase for a child in alternating residence | EUR 750 | "( 750 € en cas de garde alternée)" |
| First year of employing someone directly: expenses ceiling | EUR 15,000 | "dans la limite de 15 000 € (soit un avantage maximal de 7 500 €" |
| First year: maximum credit before increases | EUR 7,500 | "avantage maximal de 7 500 €" |
| First year: ceiling including increases, never above | EUR 18,000 | "sans pouvoir dépasser au total 18 000 €" |

**Tax credit for childcare outside the home, child under 6 on 1 January (CGI art. 200 quater B)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F8 |
| Credit rate on the sums paid | 50% | "Le crédit d'impôt est égal à 50 % des sommes versées" |
| Expenses ceiling per child | EUR 3,500 | "Frais de garde à déclarer 3 500 € maximum" |
| Expenses ceiling per child in alternating residence, and maximum credit per child | EUR 1,750 | "Frais de garde à déclarer 3 500 € maximum 1 750 € maximum Crédit d'impôt 1 750 € maximum" |
| Maximum credit per child in alternating residence | EUR 875 | "1 750 € maximum 875 € maximum" |

**Tax credits: union dues and the higher home-help ceiling, income of 2025**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf |
| Union dues paid by employees and pensioners: credit rate | 66% | "Taux 66 %" |
| Union dues: base limited to this share of salaries and pensions | 1% | "en % des salaires et pensions 1% 1% 1% 1%" |
| Home help: raised ceiling where a household member holds an invalidity card of at least 80% or a 3rd-category invalidity pension, or a child gives right to the AEEH complement | EUR 20,000 | "majorée 49 20 000 20 000" |

### The overall cap on tax advantages (plafonnement global)

The total of the advantages that fall under the cap is compared with the cap; any excess is added to the tax due. The advantages linked to the taxpayer's personal situation, and those for an aim of general interest without anything in return (gifts, patronage), are outside the cap. The credits for employing someone at home and for childcare outside the home are inside the cap, as are the reductions for investment in SMEs, FCPI and FIP, Pinel and Denormandie (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/plafonnement.pdf).

**Overall cap on tax advantages (plafonnement global des niches fiscales, CGI art. 200-0 A)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/plafonnement.pdf |
| Overall cap on the advantages listed on the page | EUR 10,000 | "10 000 €, majorée de 8 000 €" |
| Increase for reductions for overseas investment and SOFICA subscriptions | EUR 8,000 | "majorée de 8 000 € pour les réductions" |
| The second cap those advantages are compared with | EUR 18,000 | "comparée à ce montant de 18 000 €" |

## Section 11: Special cases

### Exceptional income: the quotient system (CGI art. 163-0 A)

Income that by its nature is not received every year can, on the taxpayer's request on line 0XX of form 2042 C, be taxed under the quotient system: one quarter of the net exceptional income is added to the ordinary net global income, and the extra tax due on that quarter is multiplied by four. The coefficient is always four. The income must be higher than the average of the net taxable income of the three previous years (for income received in 2025, the average of 2022, 2023 and 2024), except for income with no amount condition, among them the taxable part of severance pay on voluntary departure, retirement, early retirement or dismissal. Income taxed at a proportional rate is excluded (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/17-divers_321a336.pdf).

Deferred income (arrears of salary, pensions or rent received in one year for earlier years) can also be taxed under the quotient system whatever its amount; its coefficient is the number of years of normal payment plus one (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/17-divers_321a336.pdf).

The quotient system gives nothing to a household already taxed at the top rate of the scale on its ordinary income alone, because the extra quarter falls in the same band.

### Non-residents

A non-resident is taxed only on French-source income. The tax from the scale cannot be lower than the minimum rates in the table below; a non-resident whose average rate on worldwide income is lower may ask, on line 8TM, to be taxed at that average rate instead (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/04-declaration_revenus_64a73.pdf). The minimum rate applies up to the top of the second band of the scale table in Section 3. The brochure page prints that limit for the income of 2025 as a figure that differs by five euros from the scale page; this skill relies on the band itself, not on the brochure figure. The household position of a non-resident (shares, décote, reductions) and treaty relief are outside this skill: refer.

**Non-residents: the minimum rate (CGI art. 197 A)**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/04-declaration_revenus_64a73.pdf |
| Minimum rate on taxable income up to the top of the second band of the scale | 20% | "être inférieur à 20 % de la fraction du revenu imposable inférieure" |
| Minimum rate on the fraction above that limit | 30% | "et à 30 %" |
| Minimum rate on the first fraction for income received in the overseas departments | 14.4% | "fixés à 14,4 % et 20 % pour les revenus perçus dans les DOM" |
| Minimum rate on the fraction above, income received in the overseas departments | 20% | "14,4 % et 20 % pour les revenus perçus dans les DOM" |

### Residents of the overseas departments

The tax from the scale, after the family-quotient cap and before the décote and the reductions, is reduced by an abatement fixed by the address on 31 December of the income year (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/21-calcul_impot_369a382.pdf).

**Residents of the overseas departments: abatement on the tax from the scale**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/21-calcul_impot_369a382.pdf |
| Guadeloupe, Martinique and La Réunion | 30% | "30 % pour la Guadeloupe, la Martinique et la Réunion" |
| Limit for Guadeloupe, Martinique and La Réunion | EUR 2,450 | "(limité à 2 450 €)" |
| Guyane and Mayotte | 40% | "40 % pour la Guyane et Mayotte" |
| Limit for Guyane and Mayotte | EUR 4,050 | "(limité à 4 050 €)" |

### Year of marriage or Pacs

A couple who marry or enter a Pacs during the year file one joint return for the whole year, with all the income each of them had over the whole year. They may instead opt, irrevocably and only for that year, for two separate returns, each partner then being treated as single for the whole year. A couple in a Pacs before 2025 who marry in 2025 stay taxed jointly and cannot opt (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/05-situation_foyer_75a84.pdf).

### Year of divorce, separation or end of a Pacs

The former partners file two separate returns for the year of the divorce, separation or end of the Pacs. For the case T or case L half share, the condition of living alone is judged on 31 December, so each former partner may claim it if the other conditions are met (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/05-situation_foyer_75a84.pdf).

### Year a spouse or partner dies

The couple are taxed jointly from 1 January to the date of death, and the survivor is taxed separately for the rest of the year (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/05-situation_foyer_75a84.pdf).

### Time limit for reassessment (droit de reprise)

In 2026 the administration may reassess the income of 2023, 2024 and 2025 (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf). Longer periods apply in some cases, for example undeclared activity: see `fr-tax-audit`.

## Section 12: Conservative defaults

| Ambiguity | Default |
| --- | --- |
| Filing status unknown | Single, 1 share |
| Number of children unknown | 0 |
| Investment income regime unknown | Flat tax, no option for the scale |
| Credit eligibility unclear | No credit applied |
| Withholding rate unknown | The household rate shown on the last avis d'impôt |
| Unemployment benefit or salary unclear | Either way it takes the 10% salary deduction; declare it on the line the payer's statement names |

## Section 13: Key legal references

| Rule | Article |
| --- | --- |
| Progressive scale | CGI art. 197 |
| Family quotient | CGI art. 194 and 195 |
| Family-quotient cap and décote | CGI art. 197, I-2 and I-4 |
| 10% salary deduction | CGI art. 83, 3° |
| Pension allowance | CGI art. 158, 5-a |
| Minimum rate for non-residents | CGI art. 197 A |
| CEHR | CGI art. 223 sexies |
| CDHR | CGI art. 224 |
| Exceptional and deferred income | CGI art. 163-0 A |
| Retirement-savings deduction | CGI art. 163 quatervicies |
| Gifts | CGI art. 200 |
| Help at home | CGI art. 199 sexdecies |
| Childcare outside the home | CGI art. 200 quater B |
| Overall cap on advantages | CGI art. 200-0 A |
| Tax residence | CGI art. 4 B |

## Sources

- Barème de l'impôt sur le revenu (service-public): https://www.service-public.gouv.fr/particuliers/vosdroits/F1419
- Quotient familial d'un couple marié ou pacsé (service-public): https://www.service-public.gouv.fr/particuliers/vosdroits/F2705
- Prélèvement à la source (service-public): https://www.service-public.gouv.fr/particuliers/vosdroits/F34009
- Crédit d'impôt pour l'emploi d'un salarié à domicile (service-public): https://www.service-public.gouv.fr/particuliers/vosdroits/F12
- Frais de garde d'enfant hors du domicile (service-public): https://www.service-public.gouv.fr/particuliers/vosdroits/F8
- Flat tax on investment income (service-public): https://www.service-public.gouv.fr/particuliers/vosdroits/F2613
- Prélèvements sociaux (service-public): https://www.service-public.gouv.fr/particuliers/vosdroits/F2329
- Micro regimes (entreprendre.service-public): https://entreprendre.service-public.gouv.fr/vosdroits/F23267
- Les modalités de la déclaration de revenus en 2026 (impots.gouv.fr): https://www.impots.gouv.fr/les-modalites-de-la-declaration-de-revenus-en-2026
- Location meublée (impots.gouv.fr): https://www.impots.gouv.fr/particulier/location-meublee
- CDHR advance (impots.gouv.fr): https://www.impots.gouv.fr/actualite/contribution-differentielle-sur-les-hauts-revenus-cdhr
- Brochure pratique 2026, aide-mémoire: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/aide_memoire.pdf
- Brochure pratique 2026, situation et charges de famille: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/05-situation_foyer_75a84.pdf
- Brochure pratique 2026, pensions: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/07-pensions_115a120.pdf
- Brochure pratique 2026, charges à déduire du revenu: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/12-charges_ded_rev_225a236.pdf
- Brochure pratique 2026, réductions et crédits d'impôt (2042 C): https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/14-RICI_2042C_257a296.pdf
- Brochure pratique 2026, plafonnement des avantages fiscaux: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/plafonnement.pdf
- Brochure pratique 2026, déclaration des revenus (non-residents): https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/04-declaration_revenus_64a73.pdf
- Brochure pratique 2026, divers (CEHR, CDHR, quotient system): https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/17-divers_321a336.pdf
- Brochure pratique 2026, calcul de l'impôt: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/21-calcul_impot_369a382.pdf
- BOFiP, indexation of the scale for the income of 2025: https://bofip.impots.gouv.fr/bofip/14954-PGP.html/ACTU-2026-00022
- Brochure pratique 2026, traitements et salaires: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/06-traitements_salaires_85a114.pdf
- BOFiP, 10% deduction, amounts: https://bofip.impots.gouv.fr/bofip/10855-PGP.html/identifiant=BOI-BAREME-000035-20260217
- BOFiP, family-quotient cap: https://bofip.impots.gouv.fr/bofip/2494-PGP.html/identifiant=BOI-IR-LIQ-20-20-20-20260407
- BOFiP, décote: https://bofip.impots.gouv.fr/bofip/2495-PGP.html/identifiant=BOI-IR-LIQ-20-20-30-20260407
- BOFiP, CEHR: https://bofip.impots.gouv.fr/bofip/7804-PGP.html/identifiant=BOI-IR-CHR-20170711
- BOFiP, CDHR: https://bofip.impots.gouv.fr/bofip/15095-PGP.html/identifiant=BOI-IR-CDHR-10-20260630
- BOFiP, micro-foncier: https://bofip.impots.gouv.fr/bofip/3973-PGP.html

## Disclaimer

This skill is for informational purposes only and does not constitute tax advice. All positions must be reviewed and signed off by a qualified expert-comptable or avocat fiscaliste before filing. Get this reviewed at openaccountants.com.

*OpenAccountants: open-source accounting skills for AI. This output must be reviewed by a qualified professional before filing or acting upon. Report errors: github.com/openaccountants/openaccountants*

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
