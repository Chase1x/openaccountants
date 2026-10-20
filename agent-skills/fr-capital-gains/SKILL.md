---
name: fr-capital-gains
description: "French capital gains, investment income, and equity compensation tax rules. Trigger on phrases like \"plus-values mobilières\", \"PFU\", \"flat tax\", \"prélèvement forfaitaire unique\", \"dividendes France\", \"intérêts\", \"revenus de capitaux mobiliers\", \"RCM\", \"PEA\", \"plan d'épargne en actions\", \"assurance-vie\", \"rachat assurance-vie\", \"abattement 40% dividendes\", \"option barème\", \"prélèvements sociaux\", \"RSU France\", \"actions gratuites\", \"AGA\", \"BSPCE\", \"stock-options\", \"PEE\", \"PERCO\", \"épargne salariale\", \"abondement employeur\", \"gain d'acquisition\", \"equity salarial\", \"PER sortie capital\", \"PV mobilières\", \"cession de titres\", \"compte-titres ordinaire\", \"CTO\". Covers PFU vs barème arbitrage, dividends, interest, capital gains on securities, PEA, assurance-vie rachats, RSU/BSPCE/stock-options, PEE/PERCO, and the differentiated PS rates under LFSS 2026. For crypto see fr-crypto-tax."
license: "AGPL-3.0-or-later (code) / OpenAccountants Guide License v1.0 (content)"
metadata:
  source: openaccountants
  openaccountants_url: "https://www.openaccountants.com/skills/fr-capital-gains"
  jurisdiction: "FR"
  tax_year: "2026"
  last_updated: "2026-10-19"
  authored_by: "Michael Cutajar and the OpenAccountants team"
  trust_label: "Built by Michael Cutajar and the OpenAccountants team"
  review_status: "pending_review"
---

# France: capital gains, investment income and employee shares

This skill covers how a French tax resident individual is taxed on dividends, interest, gains on securities, the PEA, life insurance (assurance-vie) withdrawals, free shares and RSUs, BSPCE, stock options, employee savings, and gains on property. Figures are for tax year 2026. The return filed in 2026 covers income received and disposals made in 2025, and the figures in force during 2026 govern income received and disposals made in 2026, which are declared in 2027; where the two differ, the tables give both and name the year. The social levies stated are those in force on 19 October 2026, with their start dates. Crypto gains are in `fr-crypto-tax`, rental income in `fr-rental-income`, the progressive scale and the household computation in `fr-personal-income-tax`, and the exit tax on leaving France in `leaving-france-exit-tax`.

## Section 1: Quick reference

**Quick reference**

| Field | Value |
| --- | --- |
| Country | France |
| Taxes covered | Flat tax (prélèvement forfaitaire unique, PFU), social levies (prélèvements sociaux), the option for the progressive scale, the tax on property gains |
| Currency | EUR only |
| Tax year | Calendar year; income of one year is declared the next spring |
| Key forms | 2042, 2042 C, 2074 (gains on securities), 2074-DIR (retiring SME director), 2048-IMM-SD (property gain, filed by the notary) |
| Primary legislation | CGI art. 200 A (PFU), art. 158 (dividend allowance), art. 150-0 A to 150-0 D ter (gains on securities), art. 150 U and following (property gains) |
| Who is out of scope | Non-residents, companies, traders who deal in securities as a profession |

## Section 2: Social levies, which rate for which income

The social levies are charged on top of income tax. The rate depends on the TYPE of income and, for investment income, on the YEAR it was received. Never state a social levy rate without naming the income it applies to.

**Social levies on income from wealth and investment income (service-public.gouv.fr, Vérifié le 30 juin 2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F2329 |
| Income from wealth (revenus du patrimoine), general case: total | 18.6% | "Cas général"; total row "18,6 %". The page lists "Plus-values de cession de valeurs mobilières" under revenus du patrimoine |
| CSG on income from wealth, general case | 10.6% | "Contribution sociale généralisée (CSG) 10,6 %" |
| CRDS | 0.5% | "Contribution au remboursement de la dette sociale (CRDS) 0,5 %" |
| Solidarity levy | 7.5% | "Prélèvement de solidarité 7,5 %". The only levy due by a French resident who works in another EEA state or Switzerland and is covered by that state's compulsory social security |
| Rental income (revenus fonciers): total | 17.2% | "Revenus fonciers"; total row "17,2 %" |
| Property capital gains: total | 17.2% | "Plus-values immobilières"; total row "17,2 %" |
| CSG on rental income and property gains | 9.2% | "Contribution sociale généralisée (CSG) 9,2 %" |
| Investment income (revenus de placements) received in 2025: total | 17.2% | "Revenus de 2025"; total row "17,2 %" |
| Investment income received in 2026, general case: total | 18.6% | "Revenus de 2026", "Cas général"; total row "18,6 %"; special CSG rules may apply to some PEA, PEE or PEI gains or payments dating from before 2018 |
| Life insurance, PEL, CEL, PEP: total | 17.2% | "Assurance vie"; total row "17,2 %"; the same 17,2 % is printed for "Plan épargne logement", "Compte épargne logement" and "Plan d’épargne populaire". Exception: contracts of rente-survie and épargne handicap bear the higher total (F22414) |
| Deductible part of the CSG, only if the progressive scale is elected | 6.8% | "Cette part déductible est de 6,8 %"; no deductible CSG under the PFU |

**When the CSG rise started (impots.gouv.fr, Brochure pratique 2026, Nouveautés)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/nouveautes.pdf |
| CSG on income from wealth and on investment income, old rate | 9.2% | "Le taux de la CSG est porté de 9,2 % à 10,6 % sur les revenus du patrimoine et les produits de placement" |
| CSG on income from wealth and on investment income, new rate | 10.6% | Same sentence; "Les revenus fonciers, les plus-values immobilières, l’assurance-vie, l’épargne logement restent soumis au taux de 9,2 %" |
| Deductible CSG | 6.8% | "Le taux de CSG déductible reste à 6,8 %" |

The brochure dates the rise. It is printed in two columns, so the sentence reads in three pieces: "La hausse de la CSG s’applique à compter des revenus 2025", "déclarés en 2026 pour les revenus du patrimoine et à compter du", "1.1.2026 pour les produits de placement" (LFSS for 2026, art. 12; CSS art. L136-8). So:

- Gains on securities (shares, fund units, company shares) are income from wealth. The higher total in the F2329 table applies to disposals made in 2025 and declared in 2026, and to disposals made in 2026. The impots.gouv.fr page in the next table says the same thing for the flat tax on securities gains.
- Dividends and interest are investment income. Those received in 2025 bear the 2025 total in the F2329 table; those received from 1 January 2026 bear the 2026 total.
- Rental income, property gains, life insurance and home savings plans (PEL, CEL) were left at the lower total, whatever the year (except rente-survie and épargne handicap contracts: Section 6).

**Flat tax on gains on securities (impots.gouv.fr, modifié le 03/09/2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/particulier/questions/dirigeant-de-pme-partant-la-retraite-comment-sera-imposee-la-plus-value-que-je |
| Income tax part of the PFU on gains on securities | 12.8% | "soit 12,8 % d’impôt sur le revenu" |
| Social levies on gains on securities, disposals from 1 January 2025 | 18.6% | "18,6 % de prélèvements sociaux pour les cessions réalisées depuis le 1er janvier 2025" |
| Social levies on gains on securities, earlier disposals | 17.2% | "contre 17,2 % pour les cessions antérieures" |
| Fixed allowance, SME director retiring | EUR 500,000 | "L’ abattement fixe de 500 000 €"; held at least one year; disposals from 1 January 2018 to 31 December 2031; claimed on form 2074-DIR |
| Fixed allowance, transfer of a farm to a young farmer | EUR 600,000 | "Cet abattement est porté à 600 000 €"; disposals from 1 January 2025 |

## Section 3: The flat tax (PFU) or the progressive scale

**Investment income and the PFU (service-public.gouv.fr, Vérifié le 15 avril 2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F2613 |
| Income tax part of the PFU | 12.8% | "Le prélèvement forfaitaire unique est constitué de l'impôt sur le revenu ( 12,8 % ) et des prélèvements sociaux" |
| Allowance on dividends, only under the progressive scale | 40% | "Abattement de 40 % sur les dividendes" |
| Marginal rate at which the scale is better than the PFU rate | 11% | "Si vous êtes non imposable ou imposé à 11 % , ce taux est plus favorable que le taux du PFU à 12,8 %" |
| Marginal rate from which the PFU rate is better | 30% | "Si vous êtes imposé à 30 % ou plus, le taux du PFU à 12,8 % est plus favorable" |
| Reference income below which a single person may ask to be excused the advance payment on DIVIDENDS | EUR 50,000 | "50 000 € si vous êtes célibataire"; reference income of the year before last (for income received in 2025, the reference income of 2023) |
| Same limit for a married or PACS couple taxed jointly, dividends | EUR 75,000 | "75 000 € pour un couple marié ou pacsé soumis à imposition commune"; the request reaches the paying bank by 30 November of the year before payment |
| Reference income below which a single person may ask to be excused the advance payment on INTEREST and other fixed-income products | EUR 25,000 | "25 000 € si vous êtes célibataire"; for income received in 2026, the reference income of 2024 |
| Same limit for a couple taxed jointly, interest | EUR 50,000 | "50 000 € pour un couple marié ou pacsé soumis à imposition commune" (fixed-income section) |
| Unlisted shares held in a PEA: yearly cap on the exempt income | 10% | "l'exonération des revenus des titres non cotés détenus dans un PEA est limitée chaque année à 10 % du montant de ces titres" |

- **Default.** Dividends, interest and gains on securities are taxed under the PFU unless the taxpayer elects the progressive scale ("Si vous ne spécifiez pas votre choix, vos revenus sont soumis au PFU"). The income tax part is in the F2613 table above; the social levies are added at the rate Section 2 gives for that income and that year.
- **The election is global, express and irrevocable for the year.** It covers ALL investment income and ALL gains on securities of the household for that year ("L'option s'applique à l'ensemble de vos revenus mobiliers et de vos plus-values de cessions de valeurs mobilières"). It is made by ticking box 2OP on the return. The election for crypto gains is a separate one (box 3CN): see `fr-crypto-tax`. For income of 2026, declared in 2027, and later years, F2613 says the option can be withdrawn within the claim period or during an audit if it turns out worse ("vous pourrez renoncer à votre option pour le barème progressif (dans le délai de réclamation ou en cours de contrôle)"). For income of 2025 it stays irrevocable.
- **What the election brings.** Under the progressive scale only: the dividend allowance in the F2613 table, the deductible part of the CSG in the F2329 table (deducted from income of the year the CSG is paid), and the deduction of fees and charges. Under the PFU, none of these.
- **The rule of thumb on the page.** The F2613 table gives the page's own guidance by marginal rate (TMI). It compares rates only. With dividends in the third band or above the PFU is usually still better, but the dividend allowance and the deductible CSG move the answer, so compute both before electing.
- **The advance payment.** When dividends and interest are paid, the bank withholds the income tax part of the PFU as an advance (prélèvement forfaitaire non libératoire), credited against the final tax on the return. A household whose reference income of the year before last is under the limit in the F2613 table for that income type (one pair of limits for dividends, a lower pair for interest) may ask the bank to be excused by 30 November of the year before payment.

**Band rates of the progressive scale, income of 2025 taxed in 2026 (service-public.gouv.fr)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F1419 |
| First band, measured per family-quotient share | 0% | "Jusqu'à 11 600 €", rate "0 %" |
| Second band | 11% | "De 11 601 € à 29 579 €", rate "11 %" |
| Third band | 30% | "De 29 580 € à 84 577 €", rate "30 %" |
| Fourth band | 41% | "De 84 578 € à 181 917 €", rate "41 %" |
| Top band | 45% | "Plus de 181 917 €", rate "45 %" |

**Quick guidance by marginal rate (TMI)**

| Marginal band (F1419 table) | Recommendation | Reason |
| --- | --- | --- |
| First or second band | Consider the scale | F2613: at these rates the scale rate is lower than the PFU income tax rate; check the whole household's income first |
| Third band | Compute both | F2613 says the PFU rate is better; for dividends the allowance and the deductible CSG can narrow the gap |
| Fourth or top band | PFU | F2613: the PFU rate is better |

The band limits move each year and the bands are applied per family-quotient share: run the household computation in `fr-personal-income-tax`.

- **Critical rule on the scale option.** The option is global and irrevocable for income of 2025; see Section 3 for 2026. Never recommend it without the full list of the household's investment income and gains.

## Section 4: Types of capital income

### Dividends (box 2DC)

- Dividends from companies subject to corporation tax: PFU by default, or the progressive scale on election with the dividend allowance in the F2613 table. Box 2DC of the 2042 carries dividends eligible for the allowance (brochure, revenus des capitaux mobiliers: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/08-RCM_121a136.pdf). Social levies: investment income, rate by year received (Section 2).
- Foreign dividends may have suffered withholding tax in the source state. Whether, and how much, French tax credit is due depends on the treaty: see When to refuse or refer.

### Interest (box 2TR)

- Bonds, term deposits, taxable bank savings accounts, Treasury bills, crowdfunding loans and similar fixed-income products are taxable (F2613 lists "Obligations et emprunts d'État", "Comptes de dépôt et comptes à terme", "Livrets bancaires fiscalisés"). PFU by default or the scale on election. There is no allowance on interest. Box 2TR of the 2042 ("Intérêts et autres produits de placement à revenu fixe").
- Livret A, livret jeune, LEP and LDD(S) interest is exempt from income tax AND from the social levies (F2613: "Ces revenus sont exonérés des prélèvements sociaux").

### Gains on securities (box 3VG, form 2074)

- The net gain on selling shares, company shares (parts sociales) and fund units is taxed under the PFU or, on election, the scale. Social levies: income from wealth (Section 2). Declared on the 2042 C, box 3VG, with form 2074 where the bank has not computed every gain or an allowance is claimed.
- **Allowances for length of holding** apply ONLY if BOTH conditions are met: the shares were bought or subscribed before 1 January 2018, AND the taxpayer elects the progressive scale (impots.gouv.fr: "ne s’appliquent que si : les titres vendus ont été achetés ou souscrits avant le 1er janvier 2018, et le contribuable a choisi d’imposer la plus‑value au barème"). The allowance reduces only the income tax base, never the social levy base or the reference income.

**Allowances for length of holding (impots.gouv.fr)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/particulier/questions/jai-realise-des-plus-values-ai-je-droit-un-abattement-pour-duree-de-detention |
| Ordinary allowance, held at least 2 years and under 8 years | 50% | "Au moins 2 ans et moins de 8 ans 50 %" |
| Ordinary allowance, held at least 8 years | 65% | "Au moins 8 ans 65 %" |
| Enhanced allowance (SME shares bought within ten years of the company's creation, head office in the EEA), held more than 1 year and under 4 years | 50% | "Plus d'un an et moins de 4 ans 50 %" |
| Enhanced allowance, held more than 4 years and under 8 years | 65% | "Plus de 4 ans et moins de 8 ans 65 %" |
| Enhanced allowance, held at least 8 years | 85% | "Au moins 8 ans 85 %" |

- **Retiring SME director.** The fixed allowance in the impots.gouv.fr table in Section 2 applies under the PFU or the scale, on shares held at least one year, for disposals from 1 January 2018 to 31 December 2031. It cannot be combined with the ordinary or enhanced allowance. Each spouse or PACS partner taxed jointly gets a separate allowance on their own shares; an unused balance cannot pass to the other. The social levies are due on the gain BEFORE the allowance. Other conditions apply (CGI art. 150-0 D ter): see When to refuse or refer.

## Section 5: PEA (plan d'épargne en actions)

**PEA ceilings (service-public.gouv.fr, Vérifié le 22 mai 2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F2385 |
| Classic PEA, payment ceiling | EUR 150,000 | "Le plafond de versement est de 150 000 €" |
| Classic PEA plus PEA PME-ETI held by the same person, combined ceiling | EUR 225,000 | "la somme totale versée sur ces 2 plans par un même titulaire ne peut pas dépasser 225 000 €" |
| PEA of an adult still attached to the parents' tax household | EUR 20,000 | "Les versements en numéraire ... sur ce PEA ne peuvent pas dépasser 20 000 € tant que dure le rattachement" |

- **Ceilings apply to payments in, not to the plan's value.** A plan can grow above its ceiling through gains.
- **Who may open one.** An adult who is tax domiciled in France. One classic PEA per person.
- **Withdrawal before the end of the 5th year.** In principle any withdrawal closes the plan, with listed exceptions (F2385). The net gain since opening is taxed under the PFU or the scale, and the social levies are due. Early withdrawals for the death of the holder, or to fund creating or taking over a business under conditions, are exempt from income tax but not from the social levies (F2613).
- **After the 5th year.** Gains are exempt from income tax; the social levies are due on the gain at each withdrawal ("Quelle que soit la date des retraits, les gains réalisés sont soumis aux prélèvements sociaux"). A PEA gain is investment income (F2329 lists "Gain réalisé ... en cas de retrait ou de clôture d'un PEA" under revenus de placements), so a withdrawal in 2026 bears the 2026 rate in the F2329 table, except where special CSG rules for gains or payments from before 2018 apply. Ask the bank for the breakdown on the IFU form; do not apply one rate to the whole gain without it.
- **Eligible holdings.** Only the securities the law lists may sit in a PEA (F2385: "La liste des titres qui peuvent être inscrits dans le PEA est fixée par la loi"), broadly shares of companies with their head office in the EU or the EEA and funds that invest the required share of their assets in such shares. Check each line before buying.

## Section 6: Life insurance (assurance-vie): taxation of withdrawals

**Life insurance withdrawals, premiums paid since 27 September 2017 (service-public.gouv.fr, Vérifié le 15 avril 2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F22414 |
| Contract under 8 years: advance payment and flat rate | 12.8% | "un prélèvement forfaitaire non libératoire ... de 12,8 %"; then the flat rate or, on the global option, the scale |
| Contract of 8 years or more: advance payment | 7.5% | "soumis lors de leur versement à un prélèvement forfaitaire non libératoire ... de 7,5 %" |
| Yearly allowance, single person, contract of 8 years or more | EUR 4,600 | "4 600 € pour un célibataire"; for all the taxpayer's contracts together |
| Yearly allowance, couple | EUR 9,200 | "9 200 € pour un couple" |
| Premium threshold for the lower rate after 8 years | EUR 150,000 | "apprécié au regard du seuil de 150 000 €"; premiums not repaid, across all the taxpayer's contracts |
| Rate on the part of the gain that does not qualify for the lower rate | 12.8% | "La fraction des gains qui ne bénéficie pas du taux de 7,5 % est imposée à 12,8 %" |

**Premiums paid before 27 September 2017, contracts taken out since 1 January 1990 (impots.gouv.fr, Brochure pratique 2026, revenus des capitaux mobiliers)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/08-RCM_121a136.pdf |
| Optional final withholding, contract under 4 years | 35% | "moins de 4 ans 35 %" |
| Optional final withholding, contract 4 to 8 years | 15% | "4 à 8 ans 15 %" |
| Optional final withholding, contract 8 years and more | 7.5% | "8 ans et plus 7,5 %" |

- **Premiums paid before 27 September 2017.** The rates in the brochure table are a final withholding that applies only if the taxpayer elects it when the gain is paid; otherwise the gain goes to the progressive scale (F22414: "Soit, au moment de leur versement, au prélèvement forfaitaire libératoire de 15 %, si vous choisissez cette option globale au moment du versement Soit, au moment du traitement de votre déclaration de revenus, au barème progressif"). After 8 years the yearly allowance in the F22414 table applies to these gains too.
- **Exempt withdrawals.** The gain is exempt from income tax, not from the social levies, where the withdrawal follows the taxpayer's or spouse's dismissal, retirement, invalidity or judicial liquidation of a non-salaried activity (F22414: "exonérés d'impôt sur le revenu si le rachat résulte (pour vous ou votre conjoint marié ou pacsé) de l'une des raisons suivantes : Licenciement Mise à la retraite Invalidité Liquidation judiciaire").

- **Any withdrawal is taxable**, total or partial (F22414: "vous êtes imposé si vous effectuez un rachat (qu'il soit total ou partiel)"). Only the gain inside the amount withdrawn is taxed, not the premiums paid back.
- **The gain in each withdrawal.** The insurer computes the taxable gain contained in each withdrawal and reports it on the IFU form. Use that figure, and ask the insurer how it split the withdrawal between premiums and gains; do not treat a partial withdrawal as premiums only.
- **Contract age, not premium age.** The 8-year test runs from the date the contract was opened. The yearly allowance is renewed each calendar year and is applied on the return, once, across all the taxpayer's contracts.
- **The lower rate after 8 years.** Under the F22414 rule the lower rate applies only up to the premium threshold in that table; the part of the gain linked to premiums above it is taxed at the higher rate in the same table. The advance withheld is credited and any excess refunded.
- **Social levies.** Life insurance stays at the lower total in the F2329 table; the 2026 rise did not reach it, except contracts of rente-survie and épargne handicap, which bear the higher total (F22414: "pour les contrats de rente-survie et d'épargne handicap, le taux des prélèvements sociaux est de 18,6 %").
- **Spreading withdrawals.** After 8 years, spreading withdrawals across calendar years so that each year's taxable gain stays within the yearly allowance can reduce income tax. The social levies are due on the gain whatever the allowance.

## Section 7: Free shares (AGA) and RSUs

Two taxable amounts arise, both when the shares are SOLD (not at vesting): the acquisition gain (gain d'acquisition), equal to the value of the shares on the day they vest definitively, and the capital gain from that value to the sale price, taxed as a gain on securities (Section 4).

**Free shares: acquisition gain (impots.gouv.fr, modifié le 17/07/2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/particulier/questions/mon-entreprise-ma-attribue-des-actions-gratuites-comment-sera-impose-le-gain |
| Annual limit splitting the acquisition gain, shareholder decision from 1 January 2018 | EUR 300,000 | "Gain ≤ 300 000 € : barème progressif avec un abattement unique de 50 % (pas de condition de durée)" |
| Allowance on the gain up to that limit | 50% | Same row; scale of income tax, no holding condition |
| Social levies on the gain up to that limit | 18.6% | "Gain ≤ 300 000 € : 18,6 %" |
| Social levies on the part of the gain above that limit | 9.7% | "Part du gain > 300 000 € : 9,7 %"; the part above is taxed under the salary rules, with no allowance |
| Employee contribution on the part above that limit | 10% | "Contribution salariale de 10 %"; decisions from 1 January 2018: "uniquement sur la partie du gain supérieure à 300 000 €" |
| Plans decided before 28 September 2012: flat income tax rate | 30% | "Taux forfaitaire de 30 % (ou option pour le barème" |

- **The date that sets the regime is the date of the shareholders' meeting (AGE) that authorised the plan**, not the vesting date. The page has five regimes; the table gives the current one and the oldest. Plans from 28 September 2012 to 7 August 2015 are taxed as salary with the employee contribution; plans from 8 August 2015 to 31 December 2017 have their own rules on the same page. Read the plan document.
- **The limit is yearly.** If shares from several plans decided from 31 December 2016 are sold in the same year, the limit applies to the total acquisition gain; an unused part cannot be carried forward (brochure, traitements et salaires).
- **The French regime covers only plans granted under the French Commercial Code** (arts L 225-197-1 and following, brochure: "est limité aux options sur titres et aux actions gratuites attribuées conformément aux articles"). An RSU plan of a foreign parent is a qualifying plan only if it meets those conditions. If it does not, the gain is not taxed under this table: see When to refuse or refer.
- **Classic trap.** Treating the whole sale price above zero as an ordinary capital gain. The acquisition gain is taxed first under the table above; only the rise after vesting is a gain on securities.
- **Selling below the vesting value.** The loss is set against the total acquisition gain of those shares, before the allowances (brochure, traitements et salaires).

## Section 8: BSPCE (bons de souscription de parts de créateur d'entreprise)

The regime depends on when the BSPCE were granted, when the shares were subscribed, and how long the holder has worked in the company at the date of SALE.

**BSPCE (impots.gouv.fr, modifié le 17/07/2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/particulier/questions/jai-vendu-des-bons-de-souscription-de-parts-de-createurs-dentreprise-ou-bspce |
| Shares subscribed from 1 January 2025: exercise gain, holder in the company 3 years or more | 12.8% | "Imposition : taux forfaitaire 12,8 % ou, sur option du bénéficiaire, le barème progressif des traitements et salaires" |
| Shares subscribed from 1 January 2025: exercise gain, holder in the company under 3 years at sale | 30% | "le taux passe à 30 % (sans possibilité d'option pour une imposition au barème progressif" |
| Social levies on the exercise gain and on the sale gain | 18.6% | "Prélèvements sociaux : 18,6 %" |
| Shares subscribed from 1 January 2025: sale gain, any length of service | 12.8% | "Imposition : PFU de 12,8 % , quel que soit le temps passé dans l’entreprise" |
| Before 1 January 2025, BSPCE granted until 31 December 2017, 3 years or more in the company | 19% | "taux forfaitaire 19 %" |
| Before 1 January 2025, any grant date, under 3 years in the company | 30% | "Si vous travaillez dans la société depuis moins de 3 ans : taux 30 %" |
| Fixed allowance for a retiring SME director, where the page allows it | EUR 500,000 | "l’ abattement fixe de 500 000 €" |

- **Shares subscribed from 1 January 2025.** Two gains. The exercise gain (value of the share on the day of exercise minus the price fixed at grant) is taxed at the flat rate in the table, or on option under the salary scale if the holder has 3 years or more; under 3 years the higher rate applies with no option. The sale gain (sale price minus value at exercise) is taxed under the PFU whatever the length of service, or under the scale on the global option, and the retiring director's allowance can apply.
- **Shares subscribed before 1 January 2025.** One gain on sale, taxed as a gain on securities: BSPCE granted from 1 January 2018 with 3 years or more of service go under the PFU or the scale; under 3 years, the higher rate in the table with no option and no fixed allowance; BSPCE granted until 31 December 2017 use the two rates the table gives by length of service, with no holding allowance and no fixed allowance.
- **Early departure.** Selling with under 3 years of service raises the income tax rate and removes the scale option. Factor this into departure decisions.
- **The issuing company must meet the BSPCE conditions** of CGI art. 163 bis G (legal form, age, listing, ownership). If it does not, the gain is not taxed under this table: see When to refuse or refer.

## Section 9: Stock options

**Stock options: gain on exercise (impots.gouv.fr, modifié le 17/07/2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/particulier/questions/jai-des-stock-options-comment-est-impose-le-gain-levee-doptions |
| Social levies, options granted from 28 September 2012 | 9.7% | "9,7 % (9,2 % de CSG + 0,5 % de CRDS) pour les options attribuées depuis le 28 /09 /2012" |
| Social levies, options granted before 28 September 2012 | 18.6% | "18,6 % pour les options attribuées avant le 28 /09 /2012" |
| Employee contribution, options granted since 16 October 2007 | 10% | "sont également soumis à la contribution salariale de 10 %" |
| Options granted 27 April 2000 to 28 September 2012, 4-year lock-up kept: rate on the gain up to the limit | 30% | "30 % sur la partie du gain inférieure à 152 500 €" |
| Same period: limit | EUR 152,500 | Same sentence |
| Same period: rate on the gain above the limit | 41% | "41 % sur la partie supérieure" |
| Same period, lock-up and 2-year holding period both kept: rate up to the limit | 18% | "18 % pour la partie inférieure à 152 500 €" |

**Stock option regime by grant date**

| Grant date (shareholders' meeting) | Regime |
| --- | --- |
| From 28 September 2012 | Gain on exercise taxed under the progressive scale as salary, with the social levies and the employee contribution in the table above |
| 27 April 2000 to 28 September 2012 | Salary if the lock-up was broken; flat rates in the table above if it was kept, or salary on option |
| 20 September 1995 to 26 April 2000 | Gain taxed as a gain on securities at a flat rate, or as salary on option; see the impots.gouv.fr page |
| Before 20 September 1995 | Gain taxed as a gain on securities if form and lock-up conditions were met |

- **The gain on exercise is taxed when the shares are sold**, and declared on the 2042 C in every case. Any rise after exercise is a separate gain on securities (Section 4).
- **Excess discount (rabais excédentaire).** On options granted since 1 January 1990, the part of the discount that exceeds 5% of the share value at grant is taxed as salary in the year of exercise, boxes 1TP or 1UP (brochure: "déclarez la fraction du rabais qui dépasse 5 % de la valeur"; https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/06-traitements_salaires_85a114.pdf). Always read the plan to set the regime.

## Section 10: Employee savings (PEE, PERCO and company PER)

- **Employer payments under an employee savings plan are exempt from income tax** (F2613: "Les sommes versées par votre employeur en application d'un plan d'épargne salariale sont exonérées d'impôt sur le revenu"). The income of employee savings is subject to the social levies, save exceptions (F2329 lists "Revenus de l'épargne salariale" under revenus de placements).
- **Caps on the employer match** are set by reference to the annual social security ceiling and change every year. This skill does not print them: take them from the plan rules or URSSAF for the year concerned (see When to refuse or refer).
- **Lock-up and early release.** Check the plan rules for the lock-up period and the early-release events before advising a withdrawal.

**Priority order for employee savings envelopes**

| Priority | Envelope | Why |
| --- | --- | --- |
| 1st | PEE plus employer match | The match is money the employee would not otherwise receive |
| 2nd | PERCO or company PER plus employer match | Same logic, locked until retirement |
| 3rd | Individual PER | Only the deduction of payments, no match |

- **Golden rule on the employer match.** Use the employer match on the PEE and the company retirement plan before paying into an individual PER, where the plan rules allow it.

## Section 11: PER: exit in capital

- How a PER exit is taxed depends on the type of plan (individual PER, PERE, PERECO, PERO, older PERP and PERCO), on whether the exit is an annuity or a lump sum, on whether it happens at retirement or early, and on whether the payments in were deducted from income (F2613: "L'imposition dépend aussi des éléments suivants"). Ask the plan provider for the split between payments in and gains, and whether the payments were deducted, before computing anything.
- Spreading a lump sum exit over several years can lower the marginal rate on it. Model it with the household's other income before advising: see `fr-personal-income-tax`.

## Section 12: Gains on property (plus-values immobilières)

**Property gains of individuals (service-public.gouv.fr, Vérifié le 15 avril 2026)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.service-public.gouv.fr/particuliers/vosdroits/F10864 |
| Income tax rate, on the gain after the holding allowance | 19% | "imposée à l'impôt sur le revenu au taux de 19 %" |
| Holding allowance per year, 6th to 21st year, income tax base | 6% | "De la 6 e à la 21 e année 6 % 1,65 %" |
| Holding allowance per year, 6th to 21st year, social levy base | 1.65% | Same row, second column |
| Completed 22nd year, income tax base | 4% | "22 e année révolue 4 % 1,6 %" |
| Completed 22nd year, social levy base | 1.6% | Same row, second column |
| Each year beyond the 22nd, social levy base | 9% | "Au-delà de la 22 e année Exonération 9 %"; exempt from income tax beyond the 22nd year, from the social levies beyond the 30th |
| Sale exempt where the PRICE does not exceed | EUR 15,000 | "Bien dont le prix de vente ne dépasse pas 15 000 €" |
| Exempt gain cap, EU or EEA national formerly resident, sale of a French dwelling | EUR 150,000 | "dans la limite d'une plus-value de 150 000 €" |
| Surtax on large gains, lowest rate | 2% | "Le taux varie de 2 % à 6 % selon le montant de la plus-value réalisée" |
| Surtax on large gains, highest rate | 6% | Same sentence |

**Surtax threshold (bofip.impots.gouv.fr, BOI-RFPI-TPVIE-20)**

| Item | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/8597-PGP.html |
| Taxable gain above which the surtax is due | EUR 50,000 | "La taxe est due par le cédant dès lors que le montant de la plus-value imposable réalisée est supérieur à 50 000 €"; measured after the holding allowance |

- **Main home.** The gain on selling the main home (residence principale) and its outbuildings is fully exempt (F10864). It is the home occupied for most of the year, and it must still be the main home at the time of the sale (F10864: "Le logement doit être votre résidence principale au moment de la vente").
- **Two different allowances.** The holding allowance runs on two scales: one for income tax and a slower one for the social levies. The income tax rate in the table applies to the gain after the income tax allowance; the social levies (the lower total in the F2329 table, unchanged in 2026) apply to the gain after the social levy allowance.
- **The surtax** is due where the taxable gain, after the holding allowance, is MORE than the threshold in the BOFiP table. Its rate runs between the two ends in the F10864 table, from the table on form 2048-IMM-SD, and the notary computes it. It does not apply to exempt sales or to sales of building land.
- **The notary files and pays.** The notary computes the taxable gain and the tax, files the return and pays the tax at the sale (F10864: "Calcul de la plus-value imposable et du montant de l'impôt à payer"); the seller then indicates on the income tax return the gain the notary declared (F10864: "Montant de la plus-value déclarée par le notaire").

## Section 13: Conservative defaults

**Conservative default assumptions**

| Ambiguity | Default |
| --- | --- |
| PFU or scale unclear | Apply the PFU (no global commitment) and show the scale as an alternative |
| Income type unclear for the social levies | Ask; never pick a rate without naming the income (Section 2) |
| Year of a dividend or interest payment unclear | Ask for the IFU form; the rate depends on the year received |
| Free shares or RSU regime unclear | Ask for the plan's AGE date and whether the plan is French-qualifying; until then treat the acquisition gain under the salary rules |
| BSPCE length of service unclear | Assume under 3 years (higher rate, no option) |
| PEA age unclear | Assume under 5 years (taxable, plan closes) |
| Life insurance allowance eligibility unclear | No allowance |
| Property: main home status unclear | No exemption until occupation for most of the year is evidenced |

## Section 14: Key legal references

**Key legal references**

| Rule | Article |
| --- | --- |
| PFU | CGI art. 200 A |
| Option for the scale | CGI art. 200 A, 2 |
| Dividend allowance | CGI art. 158, 3-2° |
| Gains on securities | CGI art. 150-0 A to 150-0 D |
| Retiring SME director's fixed allowance | CGI art. 150-0 D ter |
| Social levies | CSS art. L136-6, L136-7, L136-8 |
| The 2026 CSG rise | LFSS for 2026 (loi n° 2025-1403), art. 12 |
| Free shares | CGI art. 80 quaterdecies |
| BSPCE | CGI art. 163 bis G |
| Stock options | CGI art. 80 bis |
| PEA | CGI art. 163 quinquies D; Code monétaire et financier art. L221-30 |
| Life insurance withdrawals | CGI art. 125-0 A |
| Property gains | CGI art. 150 U to 150 VH; surtax art. 1609 nonies G |
| PEE | Code du travail art. L3332-1 and following |

## The method, step by step

1. **Sort every item by type and year.** List each dividend, interest payment, disposal of securities, PEA or life insurance withdrawal, employee share sale and property sale, with the date received or sold. Take the figures from the IFU form the bank sends and from the 2074 workings. The type and the year set the social levy rate (Section 2; https://www.service-public.gouv.fr/particuliers/vosdroits/F2329).
2. **Apply the social levies.** For each item use the F2329 table and the timing rule from the brochure (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/nouveautes.pdf): gains on securities at the income-from-wealth total for disposals from 1 January 2025; dividends and interest by year received; property gains, rental income, life insurance and PEL or CEL at the lower total (rente-survie and épargne handicap contracts at the higher total: Section 6).
3. **Compute income tax under the PFU.** Apply the income tax part of the PFU to dividends, interest and net gains on securities (CGI art. 200 A; https://www.service-public.gouv.fr/particuliers/vosdroits/F2613). Net the year's losses on securities against the year's gains first.
4. **Compute income tax under the scale and compare.** Rebuild the tax with the progressive scale, the dividend allowance, the holding allowances only for shares bought before 1 January 2018, and the deductible CSG (https://www.impots.gouv.fr/particulier/questions/jai-realise-des-plus-values-ai-je-droit-un-abattement-pour-duree-de-detention). Run the household computation in `fr-personal-income-tax`. Elect the scale (box 2OP) only if it wins for ALL investment income and gains taken together.
5. **Handle the special envelopes.** PEA by plan age (https://www.service-public.gouv.fr/particuliers/vosdroits/F2385); life insurance by premium date, contract age, the yearly allowance and the premium threshold (https://www.service-public.gouv.fr/particuliers/vosdroits/F22414).
6. **Handle employee shares at sale.** Free shares by AGE date (https://www.impots.gouv.fr/particulier/questions/mon-entreprise-ma-attribue-des-actions-gratuites-comment-sera-impose-le-gain), BSPCE by subscription date and length of service (https://www.impots.gouv.fr/particulier/questions/jai-vendu-des-bons-de-souscription-de-parts-de-createurs-dentreprise-ou-bspce), stock options by grant date (https://www.impots.gouv.fr/particulier/questions/jai-des-stock-options-comment-est-impose-le-gain-levee-doptions). Split the acquisition or exercise gain from the later gain on securities.
7. **Check property sales.** Confirm the notary's 2048-IMM-SD figures, the main home exemption, both holding allowances and the surtax threshold (https://www.service-public.gouv.fr/particuliers/vosdroits/F10864 and https://bofip.impots.gouv.fr/bofip/8597-PGP.html).
8. **Fill the return.** 2042 boxes 2DC and 2TR, 2042 C box 3VG and the employee share boxes, form 2074 where needed, 2074-DIR for a retiring director (https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/09-plus_values_137a156.pdf). Credit the advance payments already withheld.

## Ask the client first

- For each dividend and interest payment: in which year was it received, 2025 or 2026? (It changes the social levy rate.)
- Do you want to elect the progressive scale, and what is the household's full taxable income and marginal rate? (The election covers all investment income and gains for the year.)
- For shares sold: when were they bought or subscribed, before or after 1 January 2018? (Holding allowances exist only for shares bought before that date and only under the scale.)
- For free shares, RSUs, BSPCE or stock options: what is the date of the shareholders' meeting that authorised the plan, is it a French-qualifying plan, when were the shares subscribed, and how long had you worked in the company at the date of sale?
- For a PEA or a life insurance contract: when was it opened, when were the premiums paid (before or after 27 September 2017), and what are the total premiums across all your contracts?
- For a property sale: was it your main home, how long did you hold it, and what does the notary's 2048-IMM-SD show?

## When to refuse or refer

- **Non-residents** (withholding on French-source income, the property gain levy for non-residents, treaty relief) and taxpayers leaving France (exit tax: see `leaving-france-exit-tax`). Refer.
- **Foreign-source dividends and interest** where a treaty credit must be computed. Refer to an accountant with the treaty.
- **Free shares, RSUs or stock options from a plan that is not French-qualifying**, or granted to an employee who moved into or out of France during the vesting period. The split by period of French activity needs a specialist. Refer.
- **BSPCE where the issuing company's eligibility is in doubt**, and management packages (gains taxed as salary above a limit since 15 February 2025, brochure line 1MP). Refer.
- **The retiring SME director's allowance**: the conditions (functions held, share of capital, retirement within the time allowed) are not all set out here. Refer.
- **Employer match caps on PEE and PERCO, and PER exits**: this skill does not print the caps or the exit computation. Refer, or take the figures from the plan rules for the year.
- **Gains taxed at a historic rate (report d'imposition), carried interest, profits on futures, professional traders.** Refer.
- **Property sold by a company, a property dealer, or land for building.** Refer.

## Sources

- Social levies on income from wealth and investment income, service-public.gouv.fr F2329 (Vérifié le 30 juin 2026): https://www.service-public.gouv.fr/particuliers/vosdroits/F2329
- Brochure pratique 2026, Nouveautés: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/nouveautes.pdf
- Investment income and the PFU, service-public.gouv.fr F2613 (Vérifié le 15 avril 2026): https://www.service-public.gouv.fr/particuliers/vosdroits/F2613
- Income tax scale, service-public.gouv.fr F1419: https://www.service-public.gouv.fr/particuliers/vosdroits/F1419
- Retiring SME director, impots.gouv.fr (modifié le 03/09/2026): https://www.impots.gouv.fr/particulier/questions/dirigeant-de-pme-partant-la-retraite-comment-sera-imposee-la-plus-value-que-je
- Holding allowances on gains on securities, impots.gouv.fr: https://www.impots.gouv.fr/particulier/questions/jai-realise-des-plus-values-ai-je-droit-un-abattement-pour-duree-de-detention
- PEA, service-public.gouv.fr F2385 (Vérifié le 22 mai 2026): https://www.service-public.gouv.fr/particuliers/vosdroits/F2385
- Life insurance income, service-public.gouv.fr F22414 (Vérifié le 15 avril 2026): https://www.service-public.gouv.fr/particuliers/vosdroits/F22414
- Brochure pratique 2026, revenus des capitaux mobiliers: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/08-RCM_121a136.pdf
- Brochure pratique 2026, traitements et salaires: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/06-traitements_salaires_85a114.pdf
- Brochure pratique 2026, plus-values et gains divers: https://www.impots.gouv.fr/www2/fichiers/documentation/brochure/ir_2026/pdf_som/09-plus_values_137a156.pdf
- Free shares, impots.gouv.fr (modifié le 17/07/2026): https://www.impots.gouv.fr/particulier/questions/mon-entreprise-ma-attribue-des-actions-gratuites-comment-sera-impose-le-gain
- BSPCE, impots.gouv.fr (modifié le 17/07/2026): https://www.impots.gouv.fr/particulier/questions/jai-vendu-des-bons-de-souscription-de-parts-de-createurs-dentreprise-ou-bspce
- Stock options, impots.gouv.fr (modifié le 17/07/2026): https://www.impots.gouv.fr/particulier/questions/jai-des-stock-options-comment-est-impose-le-gain-levee-doptions
- Property gains, service-public.gouv.fr F10864 (Vérifié le 15 avril 2026): https://www.service-public.gouv.fr/particuliers/vosdroits/F10864
- Surtax on large property gains, BOFiP BOI-RFPI-TPVIE-20: https://bofip.impots.gouv.fr/bofip/8597-PGP.html

## Footer disclaimers

*This skill is for informational purposes only and does not constitute tax advice. All positions must be reviewed and signed off by a qualified expert-comptable or avocat fiscaliste before filing.*
*OpenAccountants: open-source accounting skills for AI. This output must be reviewed by a qualified professional before filing or acting upon.*
*Latest skills: **openaccountants.com** | Report errors: **github.com/openaccountants/openaccountants***

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

This file is an AI skill (tax rules your AI follows) from OpenAccountants, copied on 2026-10-19. Rates, thresholds and deadlines change. For the current version of this skill, its official sources and the named accountant (if any) who stands behind it, call `get_skill` with slug `fr-capital-gains` on the OpenAccountants connector (https://www.openaccountants.com/connect), or read https://www.openaccountants.com/skills/fr-capital-gains. If neither is available, confirm every figure against the official source pages cited above before relying on it.
