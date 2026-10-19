---
name: france-vat-return
description: Use this skill whenever asked to prepare, review, or classify transactions for a French VAT return (déclaration de TVA CA3) for a self-employed individual or small business under the régime réel normal in France. Trigger on phrases like "prepare CA3", "French VAT return", "TVA", "déclaration de TVA", "classify these transactions for French VAT", or any request involving France VAT filing. This skill covers France only, régime réel normal (monthly CA3) and régime réel simplifié (annual CA12 with two advance payments). Micro-entreprise (franchise en base de TVA), partial exemption, and margin schemes are in the refusal catalogue. MUST be loaded alongside BOTH vat-workflow-base v0.1 or later (for workflow architecture) AND eu-vat-directive v0.1 or later (for EU directive content). ALWAYS read this skill before touching any French VAT work.
version: 2.0
jurisdiction: FR
tax_year: 2026
last_updated: 2026-10-19
authored_by: Michael Cutajar and the OpenAccountants team
review_status: pending_review
trust_label: Built by Michael Cutajar and the OpenAccountants team
tier: 2
license: AGPL-3.0-or-later (code) / OpenAccountants Guide License v1.0 (content)
---

# France: the VAT return (déclaration de TVA, CA3 and CA12)

This skill prepares, reviews and classifies transactions for a French VAT return: the monthly or quarterly CA3 under the régime réel normal, and the annual CA12 under the régime réel simplifié. Figures are for tax year 2026. The rules stated are those in force on 19 October 2026, read on official pages between 19 September and 19 October 2026; each page's own date stamp is given where it matters. Two pages carry different numbers for the same rule and both are official: `entreprendre.service-public.gouv.fr` was checked on 21 February 2026 and gives the simplified regime turnover band for 2026, while the `impots.gouv.fr` page "Les régimes d'imposition à la TVA", modified 21 May 2026, still prints the band it labels as applying from 1 January 2025. Both are set out below and the disagreement is named where it falls.

## Section 1: Quick reference

**Quick reference fields**

| Field | Value |
| --- | --- |
| Country | France (République française) |
| Return form, régime réel normal | CA3, form number 3310-CA3-SD, monthly or quarterly |
| Return form, régime réel simplifié | CA12 or CA12E, form number 3517-S-SD, annual, with two instalments |
| Filing portal | https://www.impots.gouv.fr (espace professionnel, mode EFI) |
| Intra-EU recapitulative statement and the services return | pro.douane.gouv.fr |
| Authority | Direction Générale des Finances Publiques (DGFiP) |
| Currency | euro only |
| Rates | see the rate tables below; never assume a rate from the counterparty's name |
| Filing frequency | see the regime table below |
| Deadline, CA3 | no single date: see "Filing dates are a schedule, not a date" below |
| Deadline, CA12 | at the latest the second working day after 1 May; a business whose accounting year does not end on 31 December files within three months of its year end |
| Companion skill (workflow) | `vat-workflow-base`, load it alongside this one |
| Companion skill (EU directive) | `eu-vat-directive`, load it alongside this one |
| Refresh date | October 2026 |

**Read this whole section before classifying anything. The workflow runbook is in `vat-workflow-base` Section 1. Follow that runbook with this skill providing the country-specific content and `eu-vat-directive` providing the EU directive content.**

**VAT rates in mainland France**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5377.pdf |
| Standard rate, the rate whenever no other rate is provided (CGI art. 278), CA3 line 08 | 20% | "08 Taux normal 20 %" |
| Intermediate reduced rate (CGI art. 279), CA3 line 9B | 10% | "9B Taux réduit 10 %" |
| Reduced rate (CGI art. 278-0 bis), CA3 line 09 | 5.5% | "09 Taux réduit 5,5 %" |
| Particular rate in continental France (CGI art. 281 quater to 281 nonies), CA3 line T6 | 2.1% | "France continentale au taux de 2,1 %" |

Which supplies carry which rate is not settled by the form. As a working summary, and subject to the accountant's check: the intermediate rate covers television subscriptions, restaurant meals, passenger transport and most work on dwellings finished more than two years ago, and BOFiP states the television case in terms, "soumet au taux de 10 % de la TVA les abonnements souscrits par les usagers afin de recevoir les services de télévision" (https://bofip.impots.gouv.fr/bofip/1013-PGP.html); the reduced rate covers most food, books including digital books, and energy-efficiency work on dwellings; the particular rate covers reimbursable medicines and human blood products (https://bofip.impots.gouv.fr/bofip/1449-PGP.html). Press publications also carry the particular rate, under CGI art. 298 septies, which is not on either page above: confirm it before relying on it.

The special rate is narrow. Where the rate is unknown, the conservative default in the table of defaults below applies.

**VAT rates in the overseas departments**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/professionnel/questions/quels-sont-les-differents-taux-de-tva-applicables-dans-les-dom |
| Standard rate in Réunion, Guadeloupe and Martinique | 8.5% | "le taux normal : 8,5 %" |
| Reduced rate there, covering everything that carries the reduced or the intermediate rate in mainland France | 2.1% | "le taux réduit : 2,1 % pour tous les produits" |
| Particular rate on sales of live butchery and charcuterie animals to non-taxable persons | 1.75% | "1,75 % pour les ventes d'animaux vivants" |
| Particular rate on the first 140 performances of certain shows and on certain press publications | 1.05% | "1,05 % pour les 140 premières représentations" |

VAT is provisionally not applicable in Guyane and in Mayotte. The same page says so in terms: "la TVA n'est provisoirement pas applicable dans les départements de la Guyane et de Mayotte".

**CA3 lines, from the 2026 form**

This replaces the line list carried by earlier versions of this skill, which used line numbers that are not on the form. Read the line codes below off the 2026 CA3 and nowhere else.

| CA3 line | What goes on it | Rate or code |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5377.pdf |
| A1 | Ventes, prestations de services: taxable sales and services, net | code 0979 |
| A2 | Autres opérations imposables: other taxable operations that are not ordinary turnover, for example disposals of fixed assets | code 0981 |
| A3 | Achats de prestations de services réalisés auprès d'un assujetti non établi en France (CGI art. 283-2): services bought from a supplier not established in France, net | code 0044 |
| A4 | Importations other than petroleum products, net | code 0056 |
| A5 | Exits from a suspensive tax regime other than petroleum products | code 0051 |
| B1 | Mises à la consommation de produits pétroliers | code 0048 |
| B2 | Acquisitions intracommunautaires: intra-EU acquisitions of goods, net | code 0031 |
| B3 | Purchases of electricity, natural gas, heat or cold taxable in France | code 0030 |
| B4 | Goods or services bought from a taxable person not established in France (CGI art. 283-1) | code 0040 |
| B5 | Régularisations on the taxed side, for example credit notes to customers | code 0036 |
| E1 | Exportations hors UE: exports outside the European Union | code 0032 |
| E2 | Autres opérations non imposables. This is where services supplied to a customer established abroad go, "même si elles sont taxées chez ce dernier" | code 0033 |
| E3 | Distance sales taxable in another member state to non-taxable persons | code 0047 |
| E4 | Importations other than petroleum products, non-taxed side | code 0052 |
| F1 | Acquisitions intracommunautaires non taxées: intra-EU acquisitions that are not taxable in France. Not a counterpart of line B2 | code 0055 |
| F2 | Livraisons intracommunautaires à destination d'une personne assujettie: zero-rated intra-EU supplies of goods, business to business | code 0034 |
| F6 | Achats en franchise | code 0037 |
| F8 | Régularisations on the non-taxed side | code 0039 |
| 08 | Taxable base and tax, mainland, standard rate | 20% |
| 09 | Taxable base and tax, mainland, reduced rate | 5.5% |
| 9B | Taxable base and tax, mainland, intermediate rate | 10% |
| 10 | Taxable base and tax, overseas departments, standard rate | 8.5% |
| 11 | Taxable base and tax, overseas departments, reduced rate | 2.1% |
| 15 | TVA antérieurement déduite à reverser: previously deducted VAT to be paid back | code 0600 |
| 16 | Total de la TVA brute due, lines 08 to 5B | total |
| 17 | Dont TVA sur acquisitions intracommunautaires: memo line, of which VAT on intra-EU acquisitions | code 0035 |
| 18 | Dont TVA sur opérations à destination de Monaco: memo line, of which VAT on operations to Monaco | code 0038 |
| 19 | Biens constituant des immobilisations: deductible VAT on capital goods | code 0703 |
| 20 | Autres biens et services: deductible VAT on everything else | code 0702 |
| 21 | Autre TVA à déduire | code 0059 |
| 22 | Report du crédit apparaissant ligne 27 de la précédente déclaration | code 8001 |
| 23 | Total TVA déductible, lines 19 to 2C | total |
| 24 | Dont TVA déductible sur importations hors produits pétroliers | code 0710 |
| 2E | Dont TVA déductible sur les produits pétroliers | code 0711 |
| 25 | Crédit de TVA, line 23 less line 16 | code 0705 |
| TD | TVA due, line 16 less line 23 | code 8900 |
| 26 | Remboursement de crédit de TVA demandé sur formulaire n°3519 | code 8002 |
| 27 | Crédit de TVA à reporter, line 25 less line 26, carried to line 22 of the next return | code 8003 |
| 28 | TVA nette due | code 8901 |
| 29 | Taxes assimilées calculées sur l'annexe n° 3310 A | code 9979 |
| 32 | Total à payer | code 9992 |

Line 18 is a Monaco memo line. It is not the line for VAT self-assessed on services received from the European Union: that tax is computed from the base on line A3 and appears in the rate block at lines 08, 09 or 9B, with the matching deduction at line 20 or line 19.

**Rates that only appear in the special blocks of the CA3, including the import block**

| CA3 line | What it covers | Rate |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5377.pdf |
| T1 | Operations in the overseas departments at the particular rate | 1.75% |
| T2 | Operations in the overseas departments at the particular rate | 1.05% |
| TC | Operations in Corsica | 13% |
| T3 | Operations in Corsica | 10% |
| T4 | Operations in Corsica | 2.1% |
| T5 | Operations in Corsica | 0.9% |
| T6 | Operations in continental France at the particular rate | 2.1% |
| P1 | Petroleum products, standard rate | 20% |
| P2 | Petroleum products, reduced rate | 13% |
| I1 | Importations, standard rate: base and tax on imports other than petroleum products | 20% |
| I2 | Importations, intermediate rate | 10% |
| I3 | Importations, overseas standard rate | 8.5% |
| I4 | Importations, reduced rate | 5.5% |
| I5 | Importations, particular rate | 2.1% |
| I6 | Importations, overseas particular rate | 1.05% |

**CA12 lines, from the 2026 return**

The CA12 has its own numbering and it is not the CA3's. Frame A carries the operations, then: line 5A standard rate mainland, line 5B standard rate on petroleum products, line 06 reduced rate, line 6C intermediate rate, line 07 standard rate in the overseas departments. On the deduction side, line 20 carries deductions on invoices, line 21 the flat-rate deduction for general expenses, and line 22 is the total of lines 20 and 21 only. Line 23 is the VAT deductible on fixed assets, line 24 the credit carried in from the start of the year, and line 26 is the total deductible VAT, the sum of lines 22, 23, 24, 25 and AE. Line 19 is the total gross VAT due. Line 28 is the VAT due, line 19 less line 26; line 29 is the credit, line 26 less line 19; line 30 records the instalments paid and still owed. The base for next year's instalments is at line 57: line 16 less lines 11, 12 and 22, so it is struck before the VAT on fixed assets at line 23 and before any credit. The form and its completion notes are the authority for this: https://www.impots.gouv.fr/sites/default/files/formulaires/3517-s-sd/2026/3517-s-sd_5291.pdf and https://www.impots.gouv.fr/sites/default/files/formulaires/3517-s-sd/2026/3517-s-sd_5424.pdf

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/sites/default/files/formulaires/3517-s-sd/2026/3517-s-sd_5424.pdf |
| CA12: a refund of the overpaid instalments (line 34) and of the credit shown (line 29) may be asked for in frame VII where the amount is at least this | EUR 150 | "du crédit dégagé (ligne 29) s’il est supérieur ou égal à 150 euros" |

Below that amount the credit is refundable on the return only in the three cases frame VII of the form names, "uniquement en cas de cession", death, or entry into a VAT group, "entrée dans un groupe TVA". Otherwise it is carried to line 24 of the next return through line 51, which the form captions "Crédit à reporter", or set against the next instalment through line 52, "Crédit imputé sur les prochains acomptes"; the notes say you may "imputer sur votre prochain acompte".

**Conservative defaults, France-specific values**

| Ambiguity | Default |
| --- | --- |
| Unknown rate on a sale | The standard rate in the rate table above |
| Unknown VAT status of a purchase | Not deductible |
| Unknown counterparty country | Domestic France |
| Unknown business or consumer status for an EU customer | Consumer, charge French VAT at the applicable rate |
| Unknown business-use proportion (vehicle, phone, home office) | No recovery |
| Unknown SaaS billing entity | Self-assessment on a service bought from a supplier not established in France, line A3 |
| Unknown blocked-input status (accommodation for staff, personal use) | Blocked |
| Unknown whether a transaction is in scope | In scope |

**Red flags to raise with the reviewer**

No official page sets money trip points for a review. The numeric thresholds carried by earlier versions of this skill were house values with no source, and they have been removed. Raise these as flags and let the reviewing accountant set the amounts for the client:

| Flag | Trigger |
| --- | --- |
| HIGH single-transaction size | A transaction large against the period's turnover, or the largest few transactions of the period |
| HIGH tax delta on a single conservative default | A default that, if wrong, changes the VAT position materially |
| MEDIUM counterparty concentration | One counterparty dominating either the output or the input side |
| MEDIUM conservative-default count | Several defaults used across one return |
| LOW absolute net VAT position | A net position large enough that a repayment claim or a payment plan is in question |

## The method, step by step

1. **Settle the regime and the frequency before anything else.** Compare the previous year's turnover and the previous year's VAT due against the limits in the regime table below, taken from https://entreprendre.service-public.gouv.fr/vosdroits/F23566 . A business inside the franchise en base files no VAT return at all. A business in the régime réel simplifié files one CA12 a year plus two instalments. A business in the régime réel normal files a CA3 every month, or every quarter where the VAT payable each year is below the quarterly limit in that table.
2. **Find the filing date for this particular taxpayer.** There is no single national CA3 date. The DGFiP page https://www.impots.gouv.fr/le-regime-reel-normal-dates-limites-de-transmission-des-ca3 asks three questions in order: the department the business sits in (Paris, Hauts-de-Seine, Seine-Saint-Denis and Val-de-Marne on one side, all other departments on the other), the category of business (entreprise individuelle, any company other than a société anonyme, société anonyme, or other taxpayer such as a local authority or an association), and then, depending on that category, either the first letter of the operator's name or the range the SIREN number falls in. The taxpayer's own date is shown in their espace professionnel. The service-public page gives the outer window for the régime réel normal: "la déclaration doit être effectuée entre le 15 et le 24 du mois suivant le fait générateur" (https://entreprendre.service-public.gouv.fr/vosdroits/F23566).
3. **Classify every line of the period.** Run the supplier pattern library in Section 3 first, then the Tier 1 rules in Section 5, then the Tier 2 questions in Section 6. Map each classified transaction to a line of the 2026 CA3 using the line table above, which is read off https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5377.pdf . Purchases of services from a supplier not established in France go to line A3 under CGI art. 283-2; goods and services from a taxable person not established in France go to line B4 under CGI art. 283-1; intra-EU acquisitions of goods go to line B2.
4. **Check the deduction restrictions before claiming any input VAT.** Passenger vehicles (https://bofip.impots.gouv.fr/bofip/1192-PGP.html), fuel (https://bofip.impots.gouv.fr/bofip/1194-PGP.html), accommodation for directors and staff (https://bofip.impots.gouv.fr/bofip/1190-PGP.html) and goods given away (https://bofip.impots.gouv.fr/bofip/1196-PGP.html) each have their own rule, set out in Section 5.12.
5. **File the return and the companion statements.** The CA3 and the CA12 are filed online in the espace professionnel on https://www.impots.gouv.fr . Intra-EU supplies of goods also require an état récapitulatif des clients filed with the customs administration under CGI art. 289 B, and intra-EU services require a déclaration européenne de services under CGI art. 289 B-III, both "dans les dix jours ouvrables qui suivent le mois" in which the tax became due, through the customs portal (https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5426.pdf).
6. **Pay.** Under the régime réel normal, payment is made with the return, monthly or quarterly. Under the régime réel simplifié, the two instalments and the balance follow the percentages and dates in the regime table below (https://entreprendre.service-public.gouv.fr/vosdroits/F23566).

## Section 2: Required inputs and refusal catalogue

### Required inputs

**Minimum viable**: a bank statement for the period in CSV, PDF, or pasted text. It must cover the full period. Acceptable from any French or international business bank: BNP Paribas, Société Générale, Crédit Agricole, LCL, Banque Populaire, Caisse d'Épargne, La Banque Postale, CIC, Revolut Business, Wise Business, N26 Business, Qonto, or any other.

**Recommended**: sales invoices for the period (especially for intra-EU business-to-business services and zero-rated supplies), purchase invoices for input VAT claims, and the client's TVA number in writing (FR plus two check digits plus the nine-digit SIREN).

**Ideal**: a complete invoice register (compatible with the fichier des écritures comptables), the SIRET number, the prior period CA3, and a reconciliation of the credit carried forward at line 22.

**What an invoice must carry**

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://entreprendre.service-public.gouv.fr/vosdroits/F31808 |
| Total excluding VAT at or below this amount: the seller's VAT identification number is not a required particular | EUR 150 | "Sauf pour les factures d'un montant total HT inférieur ou égal à 150 €" |

Earlier versions of this skill described that limit as a general "facture simplifiée" relief. It is not. The page makes it an exception to one particular only, the VAT identification number. Every other mandatory particular still applies below that amount. The same page gives the wording a seller inside the franchise must use, "TVA non applicable, art. 293 B du code général des impôts", and the wording where the customer is the person liable for the tax, "Auto-liquidation".

**Refusal policy if the minimum is missing: SOFT WARN.** If no bank statement is available at all, hard stop. If a bank statement only, with no invoices, proceed but record in the reviewer brief: "This return was produced from a bank statement alone. The reviewer must verify, before approval, that input VAT claims are supported by compliant tax invoices (factures), that the exception for the VAT identification number on small invoices has not been read as a wider relief, and that all reverse-charge classifications match the supplier's invoice."

### France-specific refusal catalogue

These refusals apply on top of the EU-wide refusals in `eu-vat-directive` Section 13 (R-EU-1 through R-EU-12). If any trigger fires, stop, output the refusal message verbatim, end the conversation.

- **R-FR-1: Micro-entreprise and franchise en base de TVA.** Trigger: the client is under the franchise en base on the thresholds in the franchise table below and has not opted for VAT. Message: "A business inside the franchise en base de TVA does not charge VAT and does not deduct it. It files no CA3 and no CA12. This skill cannot prepare a return for a business inside the franchise. If you have opted for VAT (option pour la TVA), please confirm and provide your FR TVA number." _(R-FR-1)_
- **R-FR-2: Partial exemption (prorata de déduction).** Trigger: the client makes both taxable supplies and exempt-without-credit supplies (financial, medical, educational, insurance) and the exempt proportion is not de minimis. Message: "You make both taxable and exempt supplies. Your input VAT must be apportioned under the coefficient de déduction rules (Articles 206 to 214 of Annexe II to the CGI). Please use a qualified expert-comptable to determine the coefficient before input VAT is claimed." _(R-FR-2, Articles 206 to 214 of Annexe II to the CGI)_
- **R-FR-3: Margin scheme (régime de la marge).** Trigger: the client deals in second-hand goods, art, antiques, or collectables under the margin scheme. Message: "Margin scheme transactions (TVA sur la marge) require transaction-level margin computation. Out of scope for this skill." _(R-FR-3)_
- **R-FR-4: Real estate (TVA immobilière).** Trigger: the client deals in new construction, building land, or property transactions subject to TVA immobilière. Message: "Real estate VAT (TVA immobilière) is complex and fact-specific. Out of scope for this skill. Please consult an expert-comptable." _(R-FR-4)_
- **R-FR-5: VAT group (assujetti unique).** Trigger: the client is part of a VAT group under Article 256 C of the CGI. Message: "VAT groups require consolidation across the group, and internal operations between members go on their own CA3 line. Out of scope." _(R-FR-5, Article 256 C of the CGI)_
- **R-FR-6: Fiscal representative.** Trigger: a non-resident supplier or client with a fiscal representative in France. Message: "Non-resident registrations with fiscal representatives have specific obligations beyond this skill. Please use a qualified comptable." _(R-FR-6)_
- **R-FR-7: Overseas departments filing.** Trigger: the client is based in an overseas department or territory (Guadeloupe, Martinique, Réunion, Guyane, Mayotte). Message: "The overseas departments have their own rates, which are in the rate table in Section 1, and VAT is provisionally not applicable in Guyane and Mayotte. Classification, the local rate structure and the exchanges between the departments are outside this skill, which covers metropolitan France. Please use a local expert-comptable." _(R-FR-7)_
- **R-FR-8: Income tax instead of VAT.** Trigger: the user asks about annual income tax (impôt sur le revenu, impôt sur les sociétés, BNC, BIC) instead of TVA. Message: "This skill only handles French VAT returns. For income tax, use a dedicated French income tax skill such as `fr-income-tax` or `fr-personal-income-tax`." _(R-FR-8)_

## Ask the client first

- Which regime are you in, and what was last year's turnover and last year's VAT due? Both numbers decide the regime, and the VAT figure alone can move a business to the régime réel normal whatever its turnover.
- What is the exact filing date shown in your espace professionnel this month? The date depends on the department, the category of business and the SIREN or the operator's name, so it cannot be guessed.
- Do you sell to customers outside France? For each: business or consumer, goods or services, and which country. That decides lines E1, E2, E3 and F2, and whether an état récapitulatif or a déclaration européenne de services is due.
- Has the landlord of any property you rent exercised the option for VAT? Commercial rent carries VAT only if the option was made.
- For any vehicle: was it designed to carry people or to carry goods? The exclusion turns on how the vehicle was designed, not on how it is used.
- Do you have a credit de TVA from the prior period, and what was the figure at line 27 of the last return? It has to be brought forward at line 22.

## When to refuse or refer

- Refuse when any of R-FR-1 through R-FR-8 fires, or any of R-EU-1 through R-EU-12 in `eu-vat-directive`.
- Refer when the client makes exempt supplies that are not de minimis: the coefficient de déduction is an expert-comptable's job.
- Refer when the business is in the régime réel simplifié and its VAT due for the previous year crossed the VAT limit in the regime table: it must file monthly CA3 returns instead, and the changeover needs checking against the tax office's own record.
- Refer when a turnover ceiling was crossed during the year. Crossing a current-year ceiling throws the business into the régime réel normal retroactively from 1 January of the year of the overrun, and returns already filed have to be redone.
- Refer when the client deals in petroleum products, energy, greenhouse gas quotas, electronic communications services or construction subcontracting: each has its own domestic reverse charge and its own CA3 line.
- Do not answer a question about the overseas departments, about property VAT, about the margin scheme, or about a VAT group from this skill.
- Do not compute a penalty or an interest figure from this skill. It carries none.

**The franchise en base de TVA and its boundaries**

The franchise page below is stamped "Vérifié le 01 janvier 2026" and was read again on 19 October 2026 with no change to its rules. It says in terms: "Pour l’année 2026 , les seuils de franchise en base de TVA française applicables restent inchangés". Each threshold is a test on turnover excluding VAT, "inférieur ou égal" to the amount, and each activity has two: a basic threshold on the previous calendar year and a higher tolerance threshold on the current year.

| Threshold | Amount | What crossing it does |
| --- | --- | --- |
| Source | all figures below | https://entreprendre.service-public.gouv.fr/vosdroits/F21746 |
| Goods and accommodation, turnover of the previous calendar year | EUR 85,000 | Above it: "elle est soumise à la TVA dès le 1 er janvier de l'année suivante" |
| Goods and accommodation, turnover of the current year | EUR 93,500 | Above it: "elle est soumise à la TVA dès le 1 er jour de dépassement" |
| Services and liberal professions other than lawyers, previous calendar year | EUR 37,500 | Above it, VAT from 1 January of the following year |
| Services and liberal professions other than lawyers, current year | EUR 41,250 | Above it, VAT from the first day of the overrun |
| A lawyer's regulated work, and authors' and performers' works and copyright, previous year | EUR 50,000 | Above it, VAT from 1 January of the following year |
| The same activities, current year | EUR 55,000 | Above it, VAT from the first day of the overrun |
| Their other activities, previous year | EUR 35,000 | Above it, VAT from 1 January of the following year |
| Their other activities, current year | EUR 38,500 | Above it, VAT from the first day of the overrun |
| Annual turnover inside the European Union, France excluded | EUR 100,000 | Above it the franchise is lost for intra-EU trade and the tax office must be told within 15 days |
| Intra-EU acquisitions of goods by a business inside the franchise | EUR 10,000 | At or below it the seller may charge its own country's VAT. Above it the French buyer self-assesses French VAT at the French rate and must ask its tax office for an intra-EU VAT number |
| The single franchise threshold proposed by the 2025 finance law | EUR 25,000 | Abandoned: "La proposition issue de la loi de finances pour 2025 visant à instaurer un seuil unique de franchise en base de TVA de 25 000 € a été abandonnée" |

So the two thresholds bite differently, and the difference is the whole point. The basic threshold is tested on the previous calendar year and brings VAT from the first day of January of the following year. The tolerance threshold is tested on the current year and brings VAT from the first day of the overrun itself, which means invoices issued that same day already carry VAT. The sibling skill `france-bookkeeping` states the rule the same way, and the page above proves it in both directions. Any skill or note still printing a single French franchise threshold for 2026, at the abandoned amount in the last row of the table above, is wrong.

**The regimes, their limits and the instalments**

| Test | Value | Effect |
| --- | --- | --- |
| Source | all figures below | https://entreprendre.service-public.gouv.fr/vosdroits/F23566 |
| Régime réel simplifié, previous year turnover band for trade, catering and accommodation other than furnished lets: lower end | EUR 85,000 | "doit être compris entre : 85 000 € et 945 000 €" |
| The same band: upper end | EUR 945,000 | Above it the business is in the régime réel normal |
| Régime réel simplifié, previous year turnover band for other services including furnished lets: lower end | EUR 37,500 | "37 500 € et 286 000 €" |
| The same band: upper end | EUR 286,000 | Above it the business is in the régime réel normal |
| Current year ceiling for trade, catering and accommodation | EUR 1,040,000 | Crossing it puts the business in the régime réel normal retroactively from 1 January of the year of the overrun |
| Current year ceiling for other services | EUR 323,000 | Same retroactive effect |
| VAT due for the previous year, which must stay below this | EUR 15,000 | Crossing this alone moves the business to the régime réel normal from 1 January of the year after the overrun, whatever the turnover |
| Régime réel normal, VAT payable each year below this | EUR 4,000 | Return and payment every three months instead of every month. The declaration page says the return "doit être faite tous les 3 mois"; the impots.gouv.fr regimes page says the business "peuvent opter pour le dépôt d'une déclaration de TVA chaque trimestre": treat quarterly filing as something to confirm with the tax office, not as automatic |
| Régime réel simplifié, July instalment | 55% | "l'entreprise doit verser 55 % de la taxe due l'année précédente". The CA12 computes that base at line 57 as line 16 less lines 11, 12 and 22: the tax due less the tax on disposals of fixed assets and on self-supplies and less the deductions on other goods and services, before the VAT on fixed assets at line 23 |
| Régime réel simplifié, December instalment | 40% | "l'entreprise doit verser 40 % de la taxe due l'année précédente". The CA12 computes that base at line 57 as line 16 less lines 11, 12 and 22: the tax due less the tax on disposals of fixed assets and on self-supplies and less the deductions on other goods and services, before the VAT on fixed assets at line 23 |
| VAT paid in the previous year below this | EUR 1,000 | No instalments are due the following year, only the balance with the annual return |
| Instalment revision | 10% | A business may ask for an instalment to be changed where its actual VAT is more than 10% above or below it |

The VAT-owed limit in that table is the condition most often dropped from a summary of the French regimes, and it is a limit in its own right: a business can sit comfortably inside the turnover band and still be moved to the régime réel normal because the VAT it owed last year was too large. Where a business in the régime réel simplifié declares more than that amount of VAT, the same page says it must file monthly instead of annually.

Where the accounting year does not end on 31 December, the instalment dates follow the month in which the previous year's return was filed rather than a fixed calendar: a return filed between January and May of year N gives instalments in July and December of year N; a return filed between June and October of year N gives instalments in December of year N and July of year N plus one; a return filed in November or December of year N gives instalments in July and December of year N plus one.

**Where two official pages disagree**

| What impots.gouv.fr prints | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/professionnel/les-regimes-dimposition-la-tva |
| Franchise, previous year, goods and accommodation | EUR 85,000 | Agrees with the franchise table above |
| Franchise, previous year, services | EUR 37,500 | Agrees with the franchise table above |
| Franchise in the first year of activity, goods and accommodation | EUR 93,500 | "n’excède pas 93 500 € ou 41 250 €". The full sentence: "la franchise est de droit la première année d'activité dès lors que le chiffre d'affaires n’excède pas 93 500 € ou 41 250 €" |
| Franchise in the first year of activity, services | EUR 41,250 | Same sentence. The page adds: "Ces montants correspondent aux limites majorées de la franchise en base" |
| Régime réel simplifié, turnover band for goods and accommodation: upper end | EUR 840,000 | The page says of these limits "sont applicables à compter du 1er janvier 2025" |
| Régime réel simplifié, turnover band for services: upper end | EUR 254,000 | Same note |
| VAT due limit for the régime réel simplifié | EUR 15,000 | Agrees with the regime table above |
| Quarterly returns where net VAT due in the year is below this | EUR 4,000 | "Lorsque le montant de la TVA nette due est inférieur annuellement à 4 000 €, les entreprises peuvent opter pour le dépôt d'une déclaration de TVA chaque trimestre" |

The two official pages disagree on the upper ends of the simplified regime band. The service-public page, checked 21 February 2026, gives the figures it says are "valables pour l'année 2026". The impots.gouv.fr page, modified 21 May 2026, still prints the lower pair and labels them as applying from 1 January 2025. This skill works from the 2026 pair and prints the other pair here so that a reader who lands on the impots.gouv.fr page is not surprised. Where a client's turnover falls between the two pairs, the choice is not symmetric. If the lower pair is the live one, a business that stays on the annual CA12 has been in the régime réel normal since 1 January and has missed every monthly return since; if the higher pair is the live one, a business that files monthly CA3 returns has merely filed more often than it had to. So file on the régime réel normal footing and ask the tax office to confirm, rather than choosing the cheaper reading.

The same two pages also describe the franchise itself differently. The franchise page states it on turnover alone and uses "inférieur ou égal" against each threshold. The declaration page adds a second, cumulative condition, that the annual VAT the business owes is below the VAT limit in the regime table, and uses "inférieur à". Read both before telling a client they are inside the franchise.

**Filing dates are a schedule, not a date**

There is no single French VAT filing date and this skill must never state one. Under the régime réel normal the return is due between the fifteenth and the twenty-fourth of the month following the chargeable event, and the taxpayer's own date inside that window is shown in the espace professionnel. The DGFiP publishes the schedule as a three-step selector (https://www.impots.gouv.fr/le-regime-reel-normal-dates-limites-de-transmission-des-ca3): first the department, with Paris, Hauts-de-Seine, Seine-Saint-Denis and Val-de-Marne treated apart from all other departments; then the category, which is entreprise individuelle, any company other than a société anonyme, société anonyme, or other taxpayer such as a local authority or an association; then, inside that category, either the first letter of the operator's name (A to H, or I to Z) or the range of the SIREN number (beginning 00 to 68, 69 to 78, 79 to 99 for one category, and 00 to 74 or 75 to 99 for another). The page renders the resulting day only for the combination chosen, so do not reproduce a day here: send the client to their espace professionnel.

Under the régime réel simplifié the annual return is due at the latest on the second working day following 1 May, and where the accounting year does not end on 31 December it is due within three months of the year end.

**Electronic invoicing arrives in two steps**

| Date | Who | What begins |
| --- | --- | --- |
| Source | all rows below | https://www.impots.gouv.fr/professionnel/questions/partir-de-quand-suis-je-concerne-par-la-reforme-de-la-facturation |
| 1 September 2026 | Every business, whatever its size | It must be able to receive invoices in electronic form, where its supplier is obliged to issue them that way: "devront recevoir leurs factures sous forme électronique, dès lors que leur fournisseur a l’obligation de les émettre sous ce format" |
| 1 September 2026 | Large companies and entreprises de taille intermédiaire | They must issue electronic invoices and send transaction and payment data to the administration (e-reporting) |
| 1 September 2027 | Small and medium-sized companies and micro-enterprises | They must issue electronic invoices and send transaction and payment data: "sera obligatoire pour les petites et moyennes entreprises ainsi que pour les micro-entreprises" |

The page is marked "Publié le 15/11/2024, modifié le 16/01/2026" and was read again on 19 October 2026. So on 19 October 2026 the first step is in force: every business must already be able to receive electronic invoices, and large and intermediate-sized companies already issue them and report. A small or medium-sized business or a micro-enterprise is not obliged to issue electronic invoices or to e-report before 1 September 2027. Receiving and issuing are separate duties. The sibling skill `france-einvoice` carries the formats, the platform model, the e-reporting frequencies and the penalties. Use it for anything beyond these dates.

## Section 3: Supplier pattern library (the lookup table)

This is the deterministic pre-classifier. When a transaction's counterparty matches a pattern in this table, apply the treatment from the table directly. Do not second-guess. Do not consult Tier 1 rules: the table is authoritative for patterns it covers. Rates are not repeated here. Where a row says "standard rate" or "reduced rate", read the figure off the rate tables in Section 1.

**How to read this table.** Match by case-insensitive substring on the counterparty name as it appears in the bank statement. If several patterns match, use the most specific. If none match, fall through to the Tier 1 rules in Section 5.

### 3.1 French banks (fees exempt, exclude)

**French banks pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| BNP PARIBAS, BNP | EXCLUDE for bank charges and fees | Financial service, exempt |
| SOCIETE GENERALE, SOC GEN, SG | EXCLUDE for bank charges and fees | Same |
| CREDIT AGRICOLE, CA, CRCAM | EXCLUDE for bank charges and fees | Same |
| LCL, CREDIT LYONNAIS | EXCLUDE for bank charges and fees | Same |
| BANQUE POPULAIRE, BPCE | EXCLUDE for bank charges and fees | Same |
| CAISSE D'EPARGNE, CE | EXCLUDE for bank charges and fees | Same |
| LA BANQUE POSTALE | EXCLUDE for bank charges and fees | Same |
| CIC, CREDIT MUTUEL | EXCLUDE for bank charges and fees | Same |
| QONTO | EXCLUDE for bank charges and fees | Check for separate taxable subscription invoices |
| REVOLUT, WISE, N26 (fee lines) | EXCLUDE for transaction and maintenance fees | Check for separate taxable subscription invoices |
| INTERETS, INTEREST, AGIOS | EXCLUDE | Interest income or expense, out of scope |
| PRET, EMPRUNT, LOAN | EXCLUDE | Loan principal movement, out of scope |

### 3.2 French government, regulators, and statutory bodies (exclude entirely)

**Government bodies pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| DGFIP, IMPOTS.GOUV, TRESOR PUBLIC | EXCLUDE | Tax payment, not a supply |
| DIRECTION GENERALE DES FINANCES | EXCLUDE | Tax payment |
| URSSAF | EXCLUDE | Social charges (cotisations sociales), not a VATable supply |
| CPAM, ASSURANCE MALADIE | EXCLUDE | Social security, not a supply |
| RSI, SSI | EXCLUDE | Social security for the self-employed |
| GREFFE, TRIBUNAL DE COMMERCE | EXCLUDE | Court and registry fees, sovereign acts |
| CFE, COTISATION FONCIERE | EXCLUDE | Local business tax, not a supply |
| CVAE | EXCLUDE | Contribution on added value, not a supply |
| PREFECTURE, SOUS-PREFECTURE | EXCLUDE | Government administrative fees |
| INPI | EXCLUDE | Trademark and patent office, government fee |

### 3.3 French utilities

**Utilities pattern table**

| Pattern | Treatment | Line | Notes |
| --- | --- | --- | --- |
| EDF, ELECTRICITE DE FRANCE | Domestic, standard rate | 20 (input) | Electricity, standard rate overhead |
| ENGIE, GDF SUEZ | Domestic, check the invoice | 20 (input) | Gas: the subscription and the energy can carry different rates. Read the invoice |
| TOTAL ENERGIES, TOTALENERGIES | Domestic, standard rate | 20 (input) | Energy and fuel supplier. Fuel is also caught by the fuel rule in Section 5.12 |
| ORANGE, ORANGE BUSINESS | Domestic, standard rate | 20 (input) | Telecoms and broadband, overhead |
| FREE, FREE MOBILE, FREE SAS | Domestic, standard rate | 20 (input) | Telecoms and broadband, overhead |
| SFR, ALTICE | Domestic, standard rate | 20 (input) | Telecoms and broadband |
| BOUYGUES TELECOM | Domestic, standard rate | 20 (input) | Telecoms and broadband |
| OVH, OVH SAS, OVHCLOUD | Domestic, standard rate | 20 (input) | Hosting, French entity |
| VEOLIA, SUEZ EAU | Domestic, reduced rate | 20 (input) | Water supply at the reduced rate |

### 3.4 Insurance (exempt, exclude)

**Insurance pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| AXA, AXA FRANCE | EXCLUDE | Insurance, exempt |
| MAIF, MACIF, MATMUT, MAAF | EXCLUDE | Mutual insurance, exempt |
| GROUPAMA, GENERALI FRANCE | EXCLUDE | Insurance, exempt |
| AG2R, MALAKOFF HUMANIS | EXCLUDE | Complementary insurance and prévoyance, exempt |
| ASSURANCE, PRIME D'ASSURANCE | EXCLUDE | All insurance exempt |

### 3.5 Post and logistics

**Post and logistics pattern table**

| Pattern | Treatment | Line | Notes |
| --- | --- | --- | --- |
| LA POSTE (standard mail) | EXCLUDE for standard postage | | Universal postal service, exempt |
| LA POSTE (parcels, Colissimo) | Domestic, standard rate | 20 | Non-universal services are taxable |
| CHRONOPOST | Domestic, standard rate | 20 | Express courier, taxable |
| DHL EXPRESS FRANCE | Domestic, standard rate | 20 | Express courier, taxable |
| UPS FRANCE, TNT FRANCE, FEDEX | Domestic standard rate, or self-assessment if billed from outside France | 20, or A3 plus 20 | Check the billing entity |
| MONDIAL RELAY | Domestic, standard rate | 20 | Parcel delivery, French entity |

### 3.6 Transport (France domestic)

**Transport pattern table**

| Pattern | Treatment | Line | Notes |
| --- | --- | --- | --- |
| SNCF, OUIGO | Domestic, intermediate rate | 20 (input) | Passenger transport at the intermediate rate |
| RATP, METRO, BUS RATP | Domestic, intermediate rate | 20 (input) | Public transport, intermediate rate |
| UBER FR, UBER FRANCE | Intermediate rate on the ride, standard rate on delivery | 20 | Separate rides from food delivery |
| BOLT FR, HEETCH | Domestic, intermediate rate | 20 | Ride-hailing, passenger transport |
| AIR FRANCE (domestic) | Domestic, intermediate rate | 20 | Domestic flights at the intermediate rate |
| AIR FRANCE, RYANAIR, EASYJET (international) | EXCLUDE, exempt international transport | | International flights |
| TAXI, G7, TAXIS BLEUS | Domestic, intermediate rate | 20 | Local taxi, passenger transport |
| AUTOROUTE, VINCI AUTOROUTES, SANEF, APRR | Domestic, standard rate | 20 | Motorway tolls at the standard rate |

### 3.7 Food retail (blocked unless hospitality business)

**Food retail pattern table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| CARREFOUR, AUCHAN, LECLERC, INTERMARCHE | Default BLOCK input VAT | Personal provisioning. Deductible only for a hospitality or catering business |
| LIDL, MONOPRIX, FRANPRIX, CASINO | Default BLOCK | Same |
| PICARD, LEADER PRICE, SUPER U | Default BLOCK | Same |
| RESTAURANT, BRASSERIE, CAFE, BISTRO | Default BLOCK | See Section 5.12 for what France does and does not block |

### 3.8 SaaS: EU suppliers (reverse charge, autoliquidation lines A3 and 20)

These are billed from entities established in the European Union, typically Ireland or Luxembourg, and the French customer is the person liable for the tax under CGI art. 283-2. The base goes to line A3, the output tax into the rate block, and the deduction to line 20.

**SaaS EU suppliers table**

| Pattern | Billing entity | Lines | Notes |
| --- | --- | --- | --- |
| GOOGLE (Ads, Workspace, Cloud) | Google Ireland Ltd (IE) | A3 plus 20 | Self-assessment |
| MICROSOFT (365, Azure) | Microsoft Ireland Operations Ltd (IE) | A3 plus 20 | Self-assessment |
| ADOBE | Adobe Systems Software Ireland Ltd (IE) | A3 plus 20 | Self-assessment |
| META, FACEBOOK ADS | Meta Platforms Ireland Ltd (IE) | A3 plus 20 | Self-assessment |
| LINKEDIN (paid) | LinkedIn Ireland Unlimited (IE) | A3 plus 20 | Self-assessment |
| SPOTIFY TECHNOLOGY | Spotify AB (SE) | A3 plus 20 | Self-assessment |
| DROPBOX | Dropbox International Unlimited (IE) | A3 plus 20 | Self-assessment |
| SLACK | Slack Technologies Ireland Ltd (IE) | A3 plus 20 | Self-assessment |
| ATLASSIAN (Jira, Confluence) | Atlassian Network Services BV (NL) | A3 plus 20 | Self-assessment |
| ZOOM | Zoom Video Communications Ireland Ltd (IE) | A3 plus 20 | Self-assessment |
| STRIPE (subscription fees) | Stripe Technology Europe Ltd (IE) | A3 plus 20 | Transaction fees may be exempt, see 3.11 |

### 3.9 SaaS: non-EU suppliers (autoliquidation, line A3 and line 20)

The CA3 does not separate a service bought from an EU supplier from a service bought from a supplier outside the European Union. Both are purchases of services from a taxable person not established in France, the caption of line A3, and both go on line A3. Earlier versions of this skill sent non-EU services to a "line 05", which is not a line of the CA3.

**SaaS non-EU suppliers table**

| Pattern | Billing entity | Lines | Notes |
| --- | --- | --- | --- |
| AWS (standard) | AWS EMEA SARL (LU), check | A3 plus 20 | Luxembourg entity |
| NOTION | Notion Labs Inc (US) | A3 plus 20 | Service bought from a supplier not established in France |
| ANTHROPIC, CLAUDE | Anthropic PBC (US) | A3 plus 20 | Same |
| OPENAI, CHATGPT | OpenAI Inc (US) | A3 plus 20 | Same |
| GITHUB (standard plans) | GitHub Inc (US) | A3 plus 20 | Check whether billed by an Irish entity |
| FIGMA | Figma Inc (US) | A3 plus 20 | Same |
| CANVA | Canva Pty Ltd (AU) | A3 plus 20 | Same |
| HUBSPOT | HubSpot Inc (US) or HubSpot Ireland Ltd (IE), check the invoice | A3 plus 20 | Either way line A3 |
| TWILIO | Twilio Inc (US) | A3 plus 20 | Same |

### 3.10 SaaS: the exception (reverse charge still applies)

**SaaS exception table**

| Pattern | Treatment | Why |
| --- | --- | --- |
| AWS EMEA SARL | Line A3 plus line 20 (Luxembourg entity) | The customer is liable for the tax. If the invoice shows French TVA actually charged, treat it as a domestic purchase at the standard rate and deduct at line 20 |

### 3.11 Payment processors

**Payment processors table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| STRIPE (transaction fees) | EXCLUDE (exempt) | Payment processing fees are exempt financial services |
| PAYPAL (transaction fees) | EXCLUDE (exempt) | Same |
| STRIPE (monthly subscription) | Line A3 plus line 20 | Irish entity, separate line item from transaction fees |
| SUMUP, SQUARE, ZETTLE | Check the invoice | French entity: domestic standard rate. Entity elsewhere: line A3 plus line 20 |

### 3.12 Professional services (France)

**Professional services table**

| Pattern | Treatment | Line | Notes |
| --- | --- | --- | --- |
| EXPERT COMPTABLE, CABINET COMPTABLE | Domestic, standard rate | 20 | Deductible |
| AVOCAT, CABINET D'AVOCATS | Domestic, standard rate | 20 | Deductible if a business legal matter |
| NOTAIRE (business-related fees) | Domestic, standard rate | 20 | Notarial fees on business transactions |
| COMMISSAIRE AUX COMPTES, CAC | Domestic, standard rate | 20 | Audit fees, deductible |
| ARCHITECTE, GEOMETRE | Domestic, standard rate | 20 | Professional services |
| CHAMBRE DE COMMERCE, CCI | EXCLUDE | Registration and membership fees, government body |
| CHAMBRE DES METIERS, CMA | EXCLUDE | Same |

### 3.13 Payroll and social security (exclude entirely)

**Payroll and social security table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| URSSAF | EXCLUDE | Social contributions |
| POLE EMPLOI, FRANCE TRAVAIL | EXCLUDE | Employment agency, social contribution |
| RETRAITE, CIPAV, CNAV | EXCLUDE | Pension and retirement contributions |
| SALAIRE, PAIE, VIREMENT SALAIRE | EXCLUDE | Wages, outside the scope of VAT |
| MUTUELLE (employee complementary) | EXCLUDE | Social benefit, not a VATable supply |

### 3.14 Property and rent

**Property and rent table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| LOYER COMMERCIAL, BAIL COMMERCIAL | Domestic, standard rate | Only where the landlord opted to charge VAT (option à la TVA) |
| LOYER, BAIL (residential, no VAT) | EXCLUDE | Residential lease exempt |
| FONCIER, TAXE FONCIERE | EXCLUDE | Property tax, not a supply |
| SCI (with TVA invoiced) | Domestic, standard rate | Commercial property through an SCI that opted for VAT |

### 3.15 Internal transfers and exclusions

**Internal transfers table**

| Pattern | Treatment | Notes |
| --- | --- | --- |
| VIREMENT INTERNE, VIR INTERNE | EXCLUDE | Internal movement |
| VIREMENT ENTRE COMPTES | EXCLUDE | Own-account transfer |
| DIVIDENDE | EXCLUDE | Dividend payment, out of scope |
| REMBOURSEMENT PRET, ECHEANCE | EXCLUDE | Loan repayment, out of scope |
| RETRAIT DAB, RETRAIT ESPECES | TIER 2, ask | Default exclude, ask what the cash was spent on |
| APPORT, APPORT PERSONNEL | EXCLUDE | Owner injection |

## Section 4: Worked examples

These are six fully worked classifications drawn from a hypothetical bank statement of a France-based self-employed IT consultant inside the régime réel normal. They illustrate the trickiest cases. All amounts in this section are in euro and are illustrative only. Rates are not repeated: read them off the rate tables in Section 1.

### Example 1: Non-EU SaaS autoliquidation (Notion)

**Input line:**
`03.04.2026 ; NOTION LABS INC ; DEBIT ; Monthly subscription ; 14.68`

**Reasoning:**
Notion Labs Inc is a United States entity (Section 3.9). There is no VAT on the invoice. This is a service received from a supplier not established in France, so the French customer is the person liable for the tax under CGI art. 283-2. The net amount goes to line A3, the output tax into the standard-rate block at line 08, and the deduction to line 20. The net effect is nil for a fully taxable client.

**Output table**

| Date | Counterparty | Gross | Net | VAT | Rate | Line (input) | Line (output) | Default? | Question? | Excluded? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 03.04.2026 | NOTION LABS INC | 14.68 | 14.68 | 2.94 | standard | 20 | A3 and 08 | N | | |

### Example 2: EU service, autoliquidation (Google Ads)

**Input line:**
`10.04.2026 ; GOOGLE IRELAND LIMITED ; DEBIT ; Google Ads April 2026 ; 850.00`

**Reasoning:**
Google Ireland Limited is an Irish entity. Google Ads is a service. The base goes to line A3, the output tax into the standard-rate block at line 08, and the deduction to line 20. Both sides must appear on the return. The net effect is nil for a fully taxable client.

**Output table**

| Date | Counterparty | Gross | Net | VAT | Rate | Line (input) | Line (output) | Default? | Question? | Excluded? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 10.04.2026 | GOOGLE IRELAND LIMITED | 850.00 | 850.00 | 170.00 | standard | 20 | A3 and 08 | N | | |

### Example 3: Entertainment and restaurant costs in France

**Input line:**
`15.04.2026 ; BRASSERIE LIPP PARIS ; DEBIT ; Business dinner ; 220.00`

**Reasoning:**
A restaurant transaction. France does not exclude restaurant and catering costs from deduction in the way it excludes accommodation for staff: the exclusions in Annexe II to the CGI are listed and restaurant costs are not among them. What controls the deduction is the ordinary condition that the expense is incurred for the needs of the business, so the file must show the business purpose and who was present. Personal meals are not deductible. Default: block and flag for the reviewer. If the reviewer confirms the business purpose with documentation, deduct at line 20.

**Output table**

| Date | Counterparty | Gross | Net | VAT | Rate | Line | Default? | Question? | Excluded? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 15.04.2026 | BRASSERIE LIPP PARIS | 220.00 | 220.00 | 0 | | | Y | Q1 | "Restaurant: confirm business purpose and who was present" |

### Example 4: capital goods (immobilisation)

**Input line:**
`18.04.2026 ; DELL FRANCE SAS ; DEBIT ; Invoice DEL2026-0041 Laptop ; 1,595.00`

**Reasoning:**
The gross amount is 1,595.00 including VAT. Dividing by 1.20 gives 1,329.17 excluding VAT, and the tax is 265.83. The amount excluding VAT is above the small-equipment tolerance in the capital goods table in Section 5.11, so the item is an immobilisation and its input VAT goes to line 19, not line 20.

**Output table**

| Date | Counterparty | Gross | Net | VAT | Rate | Line | Default? | Question? | Excluded? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 18.04.2026 | DELL FRANCE SAS | 1,595.00 | 1,329.17 | 265.83 | standard | 19 | N | | |

### Example 5: EU B2B service sale (inbound receipt)

**Input line:**
`22.04.2026 ; STUDIO KREBS GMBH ; CREDIT ; Invoice FR-2026-018 IT consultancy March ; 3,500.00`

**Reasoning:**
An incoming 3,500.00 from a German company with a German IBAN. The client supplies IT consultancy. For services between taxable persons the place of supply is the customer's country under CGI art. 259-1, and the customer is liable for the tax. The client invoices without French VAT and states "Auto-liquidation", the wording the invoice page gives for that case. On the CA3 the receipt goes to line E2, which covers "prestations de services rendues à un preneur établi à l'étranger". There is no output VAT. A déclaration européenne de services is due through the customs portal. Confirm two things: that the customer is VAT registered, by checking the German number on VIES, and that the invoice carries the reverse-charge wording.

**Output table**

| Date | Counterparty | Gross | Net | VAT | Rate | Line | Default? | Question? | Excluded? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 22.04.2026 | STUDIO KREBS GMBH | 3,500.00 | 3,500.00 | 0 | none | E2 | Y | Q2 (HIGH) | "Verify the German VAT number on VIES" |

### Example 6: Motor vehicle, blocked for VP

**Input line:**
`28.04.2026 ; ARVAL FRANCE ; DEBIT ; Lease payment ; 650.00`

**Reasoning:**
A car lease payment. Under the 6° of the 2 of the IV of article 206 of Annexe II to the CGI, vehicles designed to carry people or for mixed use are excluded from the right to deduct. The test is how the vehicle was designed, not how it is used, and the administration says so in terms: "L'exclusion est déterminé sur la base d'un critère de conception, indépendamment de l'usage effectif du véhicule", assessed at the date of acquisition or of taking on lease, so a later conversion does not change it. For an IT consultant leasing a passenger car the VAT is blocked. It would not be blocked for a taxi operator, a driving school, a vehicle hire business or an undertaker's hearse: see the exceptions in Section 5.12. Fuel follows its own rule, in Section 5.12.

**Output table**

| Date | Counterparty | Gross | Net | VAT | Rate | Line | Default? | Question? | Excluded? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 28.04.2026 | ARVAL FRANCE | 650.00 | 650.00 | 0 | | | Y | Q3 | "Passenger vehicle: VAT blocked. Was this vehicle designed to carry goods?" |

## Section 5: Tier 1 classification rules (compressed)

Each rule states the legal source and the line mapping. Apply silently if the data is unambiguous. Rates are in the rate tables in Section 1.

### 5.1 Standard rate (Art. 278 CGI)

- **Standard rate**: the default for any taxable supply unless a reduced rate, an exemption or a self-assessment rule applies. Sales go to line A1 with the tax at line 08. Purchases go to line 20, or line 19 for capital goods. _(CGI art. 278)_

### 5.2 Reduced rate, intermediate (Art. 278 bis, 279 CGI)

- **Intermediate reduced rate**: restaurant meals, passenger transport, work on dwellings finished more than two years ago other than construction, reconstruction and enlargement, hotel and holiday accommodation, prepared food for immediate consumption, television subscriptions. Sales go to line A1 with the tax at line 9B. Purchases go to line 20. _(CGI art. 278 bis, 279)_

### 5.3 Reduced rate, the lower one (Art. 278-0 bis CGI)

- **Reduced rate**: food staples not prepared or consumed on the premises, books including digital books, live performances, energy-efficiency work on dwellings, water supply. Sales go to line A1 with the tax at line 09. Purchases go to line 20. _(CGI art. 278-0 bis)_

### 5.4 Super-reduced rate, the taux particulier (Art. 281 quater to 281 nonies CGI)

- **Special rate**: reimbursable medicines and human blood products, and press publications under a separate article that this skill does not source. It is the only special rate in mainland France. On the CA3 the base and the tax go to line T6 for continental France. It is narrow: default to the standard rate if uncertain. _(CGI art. 281 quater to 281 nonies)_

### 5.5 Zero rate and exempt with credit

- **Zero rate and exempt with credit**: exports outside the European Union go to line E1 and need export evidence. Intra-EU supplies of goods to a taxable person go to line F2 and need the customer's VAT number checked on VIES, transport proof and a compliant invoice. Services supplied to a customer established abroad go to line E2, even where they are taxed in the customer's country.

### 5.6 Exempt without credit (Art. 261 CGI)

- **Exempt without credit**: medical and paramedical services, education and training under conditions, insurance, financial services, residential rent, certain cultural and sporting activities. No output VAT and no deduction of input VAT on the related costs. If significant, the coefficient de déduction rules apply and **R-FR-2 refuses** where the exempt proportion is not de minimis. _(CGI art. 261)_

### 5.7 Local standard purchases

- **Local standard purchases**: input VAT on a compliant facture from a French supplier is deductible for purchases used in a taxable business activity, subject to the deduction restrictions in 5.12 and the capital goods rule in 5.11. Overhead maps to line 20 and capital goods to line 19.

### 5.8 Autoliquidation: EU services received (Art. 283-2 CGI)

- **Services received**: the CA3 makes no distinction between a service bought from an EU supplier and one bought from a supplier outside the European Union. Where the client receives a service from a supplier not established in France and the supplier invoices without VAT, the base goes to line A3, the output tax into the rate block, and the input VAT to line 20. The net effect is nil for a fully taxable client. This applies whether the supplier is in the European Union or outside it. If an EU supplier actually charged its own local VAT, that is not self-assessment: treat it as an expense carrying irrecoverable foreign VAT and consider a refund claim in that country. _(CGI art. 283-2)_

### 5.9 Autoliquidation: EU goods received (acquisitions intracommunautaires)

- **Intra-EU acquisitions**: physical goods from a supplier in another member state. The base goes to line B2, the output tax into the rate block, the same tax again as a memo at line 17, and the input VAT to line 20 or line 19. Line F1 is not a counterpart of line B2. It carries intra-EU acquisitions that are not taxed, and an acquisition already declared on line B2 must never also be put on line F1.

### 5.10 Autoliquidation: non-EU services and imports

- **Non-EU services and imports**: a service bought from a supplier established outside the European Union follows 5.8 above and goes to line A3, not to a separate line. For goods, import VAT is declared and deducted on the CA3. The net amount goes to line A4 for goods other than petroleum products, the tax into the import block at lines I1 to I6, and the deductible part is shown at line 24 as well as being included in line 20 or line 19. The CA3 return is pre-filled with the customs data available to the administration, so reconcile it against the client's own import records before filing.

### 5.11 Capital goods (immobilisations)

- **Capital goods**: input VAT on goods recorded as fixed assets goes to line 19 and everything else goes to line 20. What makes a small item a fixed asset rather than an expense is the tolerance below. Capital goods can be subject to a later adjustment of the deduction, over five years for movable property and twenty years for immovable property, if the use changes.

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/2109-PGP.html |
| Small equipment and tooling, unit value excluding VAT at or below this amount, may be taken straight to expense | EUR 500 | "des matériels et outillages d'une valeur unitaire hors taxes n'excédant pas 500 €" |

That tolerance is a business-profits rule, not a VAT rule: it decides whether the item is an asset in the accounts, and the CA3 line then follows the accounting treatment. Where several parts are bought separately but form one item, the page says the global price is what counts.

### 5.12 Blocked input VAT (Art. 206 Annexe II CGI and related)

- **Passenger vehicles.** Vehicles and engines of any kind designed to carry people or for mixed use, which are a fixed asset or are not intended to be resold new, are excluded from the right to deduct, and so are their component parts, spares and accessories. The test is design, judged at acquisition or at taking on lease, not actual use. Cycles and leisure quads are caught unless they have fittings that make them exclusively goods carriers, and a cargo bike built to carry bulky goods is given as the example of one that is not caught. Source: https://bofip.impots.gouv.fr/bofip/1192-PGP.html
- **When a passenger vehicle is nevertheless deductible.** The same page carries a section headed "II. Exceptions à la mesure d’exclusion". A vehicle bought to be resold new is outside the exclusion, so dealers deduct. Beyond that the page allows deduction for: racing sailboats; vehicles with more than eight seats besides the driver used to bring staff to work; vehicles of a public passenger transport undertaking used exclusively for that transport, a rule the page extends in terms to "transports publics particuliers de personnes" (taxis, voitures de transport avec chauffeur, two- and three-wheel vehicles); vehicles used exclusively for teaching driving, where the page lets the business deduct the VAT on vehicles "qui sont affectés de façon exclusive à l’enseignement de la conduite"; hearses, where "Les véhicules aménagés en corbillards, utilisés exclusivement à des transports funéraires par les entrepreneurs de pompes funèbres" open a right to deduct; all-terrain vehicles used exclusively by a ski-lift or ski-domain operator; aeroplanes and helicopters used to supply air services for consideration; and, from 1 January 2024, vehicles fitted to transport horses. Renting vehicles out is itself an activity that authorises deduction, the page listing alongside public passenger transport "la location de véhicules lorsque ces opérations de location sont soumises à la TVA". Each exception turns on exclusive use for the qualifying activity, so check the actual use before claiming. Source: https://bofip.impots.gouv.fr/bofip/1192-PGP.html
- **Fuel.** The limitation applies only where the product is used by the buyer as fuel to propel vehicles and engines, with an exception for petrol, diesel and superéthanol E85 used as fuel in tests carried out to manufacture engines. Shares are in the table below.

| Fuel and the vehicle it is used in | Deductible share | Note |
| --- | --- | --- |
| Source | all figures below | https://bofip.impots.gouv.fr/bofip/1194-PGP.html |
| Petrol, diesel and superéthanol E85 used in a vehicle or engine excluded from the right to deduct, from 1 January 2022 | 80% | "1 er janvier 2022 80 % 80 % 100 %": first column of the row dated 1 January 2022 in the page's own table, which is printed for essences |
| The same fuels in a vehicle taken on lease where the lessee cannot deduct the tax on the lease, from 1 January 2022 | 80% | Second column of the same row |
| The same fuels in any other vehicle or engine, from 1 January 2022 | 100% | Third column of the same row. That table is printed for essences; for gazoles and superéthanol E85 the same page reaches the same shares in words, "Les redevables peuvent porter en déduction 80 % du montant de la taxe grevant les dépenses de gazole utilisé comme carburant pour les véhicules exclus du droit à déduction" |
| Petroleum gases and other hydrocarbons in gaseous form other than natural gas, and lamp oil, used in a vehicle excluded from the right to deduct or in a lease the lessee cannot deduct | 50% | "Cette limite est fixée à 50 % du montant de la taxe pour les produits utilisés dans des véhicules ou engins exclus du droit à déduction" |

Where those gaseous products are liquefied, and for natural gas, the same page says ordinary law applies rather than that limit. Jet fuel used in aircraft that do not give a right to deduct is excluded outright.

- **Accommodation.** VAT is not deductible on goods or services incurred to house directors or staff free of charge, and that includes buying or renting the premises. Where the same spending houses both third parties, which does give a right to deduct, and directors or employees, which does not, the administration allows the coefficient to be set in proportion to the number of people in each group. Source: https://bofip.impots.gouv.fr/bofip/1190-PGP.html
- **Goods given away.** VAT is not deductible on goods handed over without payment or for a price far below the normal one, whatever the recipient's status and whatever the form of the distribution, except where the goods are of very low value. The exception is defined by reference to the amount fixed by article 28-00 A of Annexe IV to the CGI, assessed inclusive of all taxes, per object and per year for the same beneficiary, and revalued every five years. Earlier versions of this skill printed a figure for that limit. No page on an allowed host prints it, so it is not printed here: read the current amount off the article before advising. Until that amount is confirmed, block the deduction: the conservative default for an unknown blocked-input status in Section 1 applies. Source: https://bofip.impots.gouv.fr/bofip/1196-PGP.html
- **Personal use.** VAT on goods and services used privately by third parties, directors or staff is not deductible. The fuel page gives the example of diesel bought for a director's private journeys.
- **Restaurant costs** are not on the exclusion list. See Example 3.

### 5.13 Régime réel simplifié (CA12)

- **Régime réel simplifié**: the business files one annual CA12 or CA12E covering the previous calendar year, due at the latest on the second working day following 1 May, and pays two instalments in July and December at the percentages in the regime table above. Where its accounting year does not end on 31 December, the return is due within three months of the year end and the instalment dates follow the month the previous return was filed. Where the VAT declared for the previous year is above the VAT limit in that table, the business files monthly CA3 returns instead. This skill can prepare the CA12 data: accumulate the monthly or quarterly totals into annual figures.

### 5.14 Sales: local domestic (any rate)

- **Sales local domestic**: charge the rate that fits the supply from the rate tables in Section 1, put the net on line A1, and the base and tax in the matching rate line, 08, 09, 9B or T6.

### 5.15 Sales: cross-border B2C

- **Sales cross-border to consumers**: distance sales of goods to consumers in other member states, and cross-border digital services to consumers, are taxable in France while the annual total stays at or below the limit below, and taxable in the member state of destination above it or if the supplier opts. Above the limit, or on an option, **R-EU-5 (OSS refusal) from `eu-vat-directive` fires**. On the CA3, sales taxable in the destination state go on line E3. _(R-EU-5)_

| What | Value | Note |
| --- | --- | --- |
| Source | all figures below | https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5426.pdf |
| Annual total of distance sales from France to other member states, at or below which they stay taxable in France | EUR 10,000 | "ventes de la France vers d'autres États membres si leur montant global annuel est inférieur ou égal à 10 000 €" |

This is a different limit from the intra-EU acquisitions limit in the franchise table above, even though the amount is the same. One is about a franchised buyer's purchases of goods, the other about a seller's distance sales. Do not use one to prove the other.

## Section 6: Tier 2 catalogue (compressed)

### 6.1 Fuel and vehicle costs

- **Fuel and vehicle costs**: pattern TOTAL, SHELL, BP, ESSO, AVIA, fuel receipts. Why insufficient: the deductible share turns on whether the vehicle is excluded from the right to deduct. Default: no recovery. Question: "Was this vehicle designed to carry people, or to carry goods? And what fuel was it, petrol, diesel, superéthanol E85, or a petroleum gas?" Then apply the fuel table in Section 5.12. Charging an electric vehicle is not one of the products the fuel restriction names, so it falls under the ordinary deduction rules rather than the table, and the vehicle's own exclusion still has to be settled first.

### 6.2 Restaurants and entertainment

- **Restaurants and entertainment**: pattern any named restaurant, brasserie, café, traiteur. Why insufficient: France does not exclude restaurant costs by name, but the expense still has to be for the needs of the business and personal meals are blocked. Default: block. Question: "Was this a business meal with external guests? If yes, who was present and what was the business purpose?"

### 6.3 Ambiguous SaaS billing entities

- **Ambiguous SaaS billing entities**: pattern Google, Microsoft, Adobe, Meta, Slack, Zoom, LinkedIn, Apple, Amazon, Dropbox, Atlassian, Stripe, PayPal. Why insufficient: the same brand can bill from Ireland, from the United States, or from France. Default: line A3 plus line 20. Question: "Could you check the invoice? I need the legal entity name, its country, and whether any French TVA was charged."

### 6.4 Round-number incoming transfers from owner-named counterparties

- **Round-number incoming transfers**: pattern a large round credit from a name matching the client's name. Default: exclude as an owner injection (apport personnel). Question: "That transfer from this name, is it a customer payment, your own money going in, or a loan?"

### 6.5 Incoming transfers from individual names (not owner)

- **Incoming transfers from individual names**: pattern incoming from private-looking counterparties. Default: a domestic sale to a consumer at the standard rate, line A1 with the tax at line 08. Question: "For each: was it a sale? Business or consumer customer? Which country?"

### 6.6 Incoming transfers from foreign counterparties

- **Incoming transfers from foreign counterparties**: pattern a foreign IBAN or a foreign currency. Default: domestic at the standard rate. Question: "What was this: business with a VAT number, or a consumer? Goods or services, and which country?"

### 6.7 Large one-off purchases (potential immobilisations)

- **Large one-off purchases**: pattern a single invoice near the small-equipment tolerance in Section 5.11, or labelled laptop, equipment, machinery. Default: above the tolerance, line 19; at or below it, line 20. Question: "Could you confirm the total invoice amount and the amount excluding VAT?"

### 6.8 Mixed-use phone, internet, home office

- **Mixed-use phone, internet, home office**: pattern Orange, Free, SFR personal lines, home electricity. Default: no recovery where the use is mixed and no percentage is declared. Question: "Is this a dedicated business line or mixed use? What business percentage?"

### 6.9 Outgoing transfers to individuals

- **Outgoing transfers to individuals**: pattern outgoing to private-looking names. Default: exclude as drawings. Question: "Was this a contractor payment with an invoice, wages, a refund, or a personal transfer?"

### 6.10 Cash withdrawals

- **Cash withdrawals**: pattern DAB, retrait espèces, retrait guichet. Default: exclude as an owner drawing. Question: "What was the cash used for?"

### 6.11 Rent payments

- **Rent payments**: pattern loyer, bail, a monthly payment to a landlord-sounding counterparty. Default: no VAT, the residential default. Question: "Is this a commercial property where the landlord has exercised the option for TVA?"

### 6.12 Foreign hotel and accommodation

- **Foreign hotel and accommodation**: pattern a hotel or accommodation charged abroad. Default: exclude from input VAT on the CA3, because foreign VAT is not French input VAT. Question: "Was this a business trip?" A refund claim in the other country may be possible, and the cost is still an expense for income tax.

### 6.13 Airbnb income

- **Airbnb income**: pattern Airbnb payouts. Default: flag for the reviewer. Question: "Is this furnished letting? What duration, and is it classified tourist accommodation?" Furnished letting sits in the services band of the regime table, which the page marks out expressly.

### 6.14 Subcontractor reverse charge (construction)

- **Subcontractor reverse charge**: pattern payments to construction subcontractors. Why insufficient: construction work, including repair, cleaning, maintenance and demolition carried out in relation to immovable property, is subject to a domestic reverse charge under CGI art. 283-2 nonies. The subcontractor invoices without VAT and the main contractor accounts for it. The CA3 notes list those works among the operations to be shown at line E2 by the subcontractor. Default: flag for the reviewer. Question: "Is this a construction subcontractor inside the domestic reverse charge?" _(CGI art. 283-2 nonies)_

### 6.15 Platform sales (Amazon, eBay, Etsy)

- **Platform sales**: pattern incoming from Amazon Payments EU, Etsy Payments, PayPal, Stripe. Default: where the client sells to consumers across several member states above the distance-selling limit in Section 5.15, R-EU-5 fires. For France-only sales or sales below that limit, treat the gross as a domestic sale on line A1 at the applicable rate, and the platform fees as a service bought from a supplier not established in France on line A3. Question: "Do you sell to buyers outside France? What were your total cross-border sales to consumers for the year?" _(R-EU-5)_

## Section 7: Excel working paper template (France-specific)

The base specification is in `vat-workflow-base` Section 3. This section gives the France-specific overlay. The line codes below are the 2026 CA3 codes from Section 1.

### Sheet "Transactions"

Columns A to L per the base. Column H, the line code, accepts only valid CA3 line codes from Section 1 of this skill. Leave it blank for excluded transactions. For a transaction that is self-assessed, enter the base line and the deduction line separated by a slash in column H, for example A3/20.

### Sheet "Line Summary"

One row per line. Column A is the line code, column B is the description, column C is the value computed by formula. Mandatory rows:

~~~
Operations, cadre A, taxed and non-taxed sides:
| A1 | Taxable sales and services, net   | =SUMIFS(Transactions!E:E, Transactions!H:H, "A1")  |
| E1 | Exports outside the EU            | =SUMIFS(Transactions!E:E, Transactions!H:H, "E1")  |
| E2 | Other non-taxable operations      | =SUMIFS(Transactions!E:E, Transactions!H:H, "E2")  |
| E3 | Distance sales taxed elsewhere    | =SUMIFS(Transactions!E:E, Transactions!H:H, "E3")  |
| F2 | Intra-EU supplies of goods, B to B| =SUMIFS(Transactions!E:E, Transactions!H:H, "F2")  |

Self-assessed bases:
| A3 | Services from a supplier not established in France | =SUMIFS(Transactions!E:E, Transactions!H:H, "A3") |
| A4 | Imports, net                                       | =SUMIFS(Transactions!E:E, Transactions!H:H, "A4") |
| B2 | Intra-EU acquisitions of goods, net                | =SUMIFS(Transactions!E:E, Transactions!H:H, "B2") |
| B4 | Goods or services, supplier not established        | =SUMIFS(Transactions!E:E, Transactions!H:H, "B4") |

Gross tax block, base and tax:
| 08 | Standard rate       | base * standard rate     |
| 09 | Reduced rate        | base * reduced rate      |
| 9B | Intermediate rate   | base * intermediate rate |
| I1 to I6 | Import tax, one row per rate, base and tax | =SUMIFS(Transactions!E:E, Transactions!H:H, "I1") and so on |
| 16 | Total gross tax due, every gross-tax line from 08 to 5B | =SUM(08,09,9B,10,11,T1,T2,TC,T3,T4,T5,T6,T7,13,P1,P2,I1,I2,I3,I4,I5,I6,15,5B) |
| 17 | Memo: of which on intra-EU acquisitions | manual |

Deductible tax:
| 19 | Capital goods                     | =SUMIFS(Transactions!F:F, Transactions!H:H, "19") |
| 20 | Other goods and services          | =SUMIFS(Transactions!F:F, Transactions!H:H, "20") |
| 22 | Credit carried forward from line 27 of the previous return | manual |
| 23 | Total deductible tax, lines 19 to 2C | =SUM(19,20,21,22,2C)                          |
| 24 | Memo: of which on imports         | manual                                            |

Bottom of the return:
| 25 | Credit de TVA   | =MAX(0, C[23]-C[16]) |
| TD | TVA due         | =MAX(0, C[16]-C[23]) |
| 26 | Refund claimed on form 3519 | manual   |
| 27 | Credit carried forward      | =C[25]-C[26] |
| 28 | TVA nette due   | =C[TD]               |
| 32 | Total to pay    | =C[28]+C[29]         |
~~~

### Sheet "Return Form"

Final CA3-ready figures.

~~~
IF line 23 > line 16:
  Line 25 = credit de TVA
  Line TD = 0
  Line 27 = line 25 less line 26, carried to line 22 of the next return
ELSE:
  Line 25 = 0
  Line TD = line 16 less line 23
  Line 28 = line TD less any energy excise credit
  Line 32 = line 28 plus line 29 plus any energy excise due
~~~

A credit position at line 25 does not excuse paying the assimilated taxes at line 29 or the energy excise: the form says so on its face.

### Color and formatting conventions

Per the workbook conventions of the spreadsheet builder: blue for hardcoded values, black for formulas, green for cross-sheet references, yellow background for any row where Default? is "Y". (The recalculation helper named below is a tool convention of the workbook builder, not an official requirement.)

### Mandatory recalc step

After building the workbook, run:

~~~bash
python /mnt/skills/public/xlsx/scripts/recalc.py /mnt/user-data/outputs/france-vat-period-working-paper.xlsx
~~~

## Section 8: French bank statement reading guide

Follow the universal exclusion rules in `vat-workflow-base` Step 6, plus these France-specific patterns.

**CSV format conventions.** French banks typically export CSV with semicolon delimiters and DD/MM/YYYY dates. Common columns: Date, Libellé (description), Débit, Crédit, Solde. Qonto and Revolut use ISO dates. BNP and SG exports may include operation codes.

**French language variants.** Some descriptions appear in French: loyer (rent), salaire and paie (salary), intérêts (interest), virement (transfer), cotisations (contributions), facture (invoice), remboursement (refund). Treat as the English equivalent.

**Operation code prefixes.** VIR is a bank transfer, CB a card payment, PRLV a direct debit (prélèvement), CHQ a cheque, REM a cheque deposit, TIP an interbank payment title. The prefix helps classify: CB payments are typically purchases, and incoming VIR credits are typically sales.

**Internal transfers and exclusions.** Own-account transfers between the client's accounts, labelled "VIR INTERNE" or "virement entre comptes". Always exclude.

**Refunds and reversals.** Identify by remboursement, annulation, avoir, storno. Book as a negative on the same line as the original transaction. On the CA3 a credit note to a customer belongs in the régularisations at line B5, and a correction on the non-taxed side at line F8.

**URSSAF and social charges.** Monthly or quarterly URSSAF debits are social contributions, not a VATable supply. Always exclude. They can be large: do not confuse them with business purchases.

**Tax payments.** Payments appearing as DGFIP, TRESOR PUBLIC or IMPOTS.GOUV are tax settlements, not supplies. Always exclude.

**Foreign currency transactions.** Convert to euro at the transaction date rate. Use the rate shown on the bank statement, or the official reference rate the client's accounting policy names, and keep the evidence.

**IBAN country prefix.** FR is France. IE, LU, NL, DE and the other member state prefixes are in the European Union. US, GB, AU and CH are outside it. A French IBAN does not prove a French VAT registration: cross-check every time.

## Section 9: Onboarding fallback (only when inference fails)

### 9.1 Entity type and trading name

- **Entity type and trading name**: inference rule, a sole trader's name often matches the account holder, and company names end in SARL, SAS, EURL or SA. Fallback: "Are you a sole trader (entrepreneur individuel), EURL, SARL, SAS, or other?"

### 9.2 VAT regime

- **VAT regime**: inference rule, a client filing a CA3 is in the régime réel normal, and a mention of annual filing points to the régime réel simplifié. Fallback: "Are you in the régime réel normal with a monthly or quarterly CA3, or the régime réel simplifié with an annual CA12?"

### 9.3 TVA number

- **TVA number**: inference rule, an FR-format TVA number sometimes appears on invoices. Fallback: "What is your French TVA number? It is FR, two check digits, then the SIREN."

### 9.4 Filing period

- **Filing period**: inference rule, the first and last transaction dates. Fallback: "Which month or quarter does this return cover?"

### 9.5 Industry and sector

- **Industry and sector**: inference rule, the counterparty mix and the sales descriptions. Fallback: "In one sentence, what does the business do?"

### 9.6 Employees

- **Employees**: inference rule, URSSAF and payroll outgoings. Fallback: "Do you have employees?"

### 9.7 Exempt supplies

- **Exempt supplies**: inference rule, the presence of medical, financial, educational or residential rental income. Fallback: "Do you make any exempt sales?" If yes and not de minimis, R-FR-2 refuses.  _(R-FR-2)_

### 9.8 Credit carried forward

- **Credit carried forward**: inference rule, not inferable, always ask. Question: "Do you have a credit de TVA from the prior period? It is the figure at line 27 of the last return and it goes to line 22 of this one."

### 9.9 Cross-border customers

- **Cross-border customers**: inference rule, foreign IBANs on incoming payments. Fallback: "Do you have customers outside France? In the European Union or outside it? Business or consumer?"

### 9.10 Construction subcontracting

- **Construction subcontracting**: inference rule, construction-related counterparties in the payments. Conditional fallback: "Do you subcontract construction work? The domestic reverse charge may apply."

## Section 10: Reference material

### Validation status

This is the October 2026 refresh of the France VAT return skill, written by the OpenAccountants team. Every figure in it was read off a page on an official French host between 19 September and 19 October 2026, and each table names the page it came from. No accountant has attested it. The CA3 line map, the rates, the franchise thresholds, the regime limits, the instalment percentages and the fuel shares were all corrected in this pass: see the change log.

### Sources

**Forms and their completion notes**

1. Form 3310-CA3-SD, the 2026 CA3: https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5377.pdf
2. Notice 3310-NOT-CA3-SD, how to fill in the CA3 and its annexes: https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5426.pdf
3. Notice 3517-S-NOT-SD, how to fill in the CA12 and CA12E: https://www.impots.gouv.fr/sites/default/files/formulaires/3517-s-sd/2026/3517-s-sd_5424.pdf
3a. Form 3517-S-SD, the 2026 CA12 and CA12E: https://www.impots.gouv.fr/sites/default/files/formulaires/3517-s-sd/2026/3517-s-sd_5291.pdf
4. The form's own landing page, which carries every year's version: https://www.impots.gouv.fr/formulaire/3310-ca3-sd/tva-et-taxes-assimilees-regime-du-reel-normal-mini-reel

**Regimes, thresholds and dates**

5. Franchise en base de TVA: https://entreprendre.service-public.gouv.fr/vosdroits/F21746
6. Déclarer et payer la TVA: https://entreprendre.service-public.gouv.fr/vosdroits/F23566
7. Les régimes d'imposition à la TVA: https://www.impots.gouv.fr/professionnel/les-regimes-dimposition-la-tva
8. Le régime réel normal, dates limites de transmission des CA3: https://www.impots.gouv.fr/le-regime-reel-normal-dates-limites-de-transmission-des-ca3
9. Mentions obligatoires sur une facture: https://entreprendre.service-public.gouv.fr/vosdroits/F31808
10. À partir de quand suis-je concerné par la réforme de la facturation électronique: https://www.impots.gouv.fr/professionnel/questions/partir-de-quand-suis-je-concerne-par-la-reforme-de-la-facturation

**Rates**

11. Reduced and intermediate rates on services, for the television example only: https://bofip.impots.gouv.fr/bofip/1013-PGP.html
12. The special rate: https://bofip.impots.gouv.fr/bofip/1449-PGP.html
13. Rates in the overseas departments: https://www.impots.gouv.fr/professionnel/questions/quels-sont-les-differents-taux-de-tva-applicables-dans-les-dom

**Deduction restrictions**

14. Vehicles designed to carry people: https://bofip.impots.gouv.fr/bofip/1192-PGP.html
15. Petroleum products: https://bofip.impots.gouv.fr/bofip/1194-PGP.html
16. Accommodation: https://bofip.impots.gouv.fr/bofip/1190-PGP.html
17. Goods given away: https://bofip.impots.gouv.fr/bofip/1196-PGP.html
18. Small-value equipment taken to expense: https://bofip.impots.gouv.fr/bofip/2109-PGP.html

**Companion skills**

19. `vat-workflow-base` for the workflow architecture and `eu-vat-directive` for the EU directive content. `france-einvoice` for electronic invoicing, `france-bookkeeping` for the books behind the return, `fr-business-accounting` for the wider accounting picture, `fr-tax-audit` if the return is already under audit.

### Known gaps

1. The supplier pattern library covers common French and international counterparties but not every local business.
2. The overseas departments are refused by R-FR-7. Their rates are listed for recognition only, and VAT is provisionally not applicable in Guyane and Mayotte.
3. Construction subcontracting under CGI art. 283-2 nonies is flagged at Tier 2 only.
4. The limit for the very-low-value gift exception is set by article 28-00 A of Annexe IV to the CGI. No allowed official page prints the amount, so this skill states the rule without a figure.
5. The red-flag trip points are qualitative. No official page sets money limits for a review, and the previous numeric values had no source.
6. Two official pages disagree on the upper ends of the simplified regime turnover band. Both are printed above.
7. The exact CA3 filing day cannot be stated here. It depends on the department, the category of business and the SIREN or the operator's name, and is shown in the taxpayer's espace professionnel.
8. Corsica has its own rates, shown on the CA3 in their own lines. This skill lists the lines but does not carry the Corsican rate rules.
9. Penalties and late interest are not in this skill. Use `fr-tax-audit`.

### Change log

- **October 2026 refresh.** The CA3 line map was replaced with the 2026 form's own lines: the earlier map used line numbers such as 01, 02, 03, 04, 04B, 05, 06, 06A and 07 that do not exist on the form, described line 10 as the total output VAT when it is the overseas standard-rate line, and described line 18 as EU service self-assessment when it is the Monaco memo line. Franchise thresholds were corrected, the boundary rules were added, and the abandoned single threshold was recorded. The regime band, the current-year ceilings, the VAT-owed limit, the quarterly limit, the two instalment percentages and the instalment exemption were added from the official pages. The filing date was changed from one date to the published schedule. The fuel shares were corrected. The figure for the gift exception was removed as unprovable on an allowed host. The invoice figure was re-described as an exception to one particular. Electronic invoicing was added with its dates. The rate table is now read off the 2026 CA3 form. The intra-EU acquisition lines, the import block and the vehicle exceptions were corrected or restored. The CA12 refund floor was added.
- **v2.0 (April 2026):** rewrite to the ten-section structure with the supplier pattern library, six worked examples, Tier 1 and Tier 2 catalogues, the Excel template, the bank statement reading guide and the onboarding fallback.
- **v1.0:** initial version, a standalone monolithic document.

### Self-check (v2.0)

1. Quick reference at the top with the line table and the conservative defaults: yes (Section 1).
2. Supplier library as literal lookup tables: yes (Section 3, fifteen sub-tables).
3. Worked examples: yes (Section 4, six examples).
4. Tier 1 rules compressed: yes (Section 5, fifteen rules).
5. Tier 2 catalogue compressed: yes (Section 6, fifteen items).
6. Excel template specification: yes (Section 7).
7. Onboarding as fallback only: yes (Section 9, ten items).
8. All eight France-specific refusals present: yes (Section 2, R-FR-1 through R-FR-8).
9. Reference material at the bottom: yes (Section 10).
10. Restaurant costs treated as not excluded by name but still conditional: yes (Section 5.12 and Example 3).
11. Passenger vehicle exclusion stated on the design test: yes (Section 5.12 and Example 6).
12. Capital goods tolerance sourced: yes (Section 5.11 and Example 4).
13. Intra-EU business-to-business service sale on line E2 with the VIES check: yes (Example 5).
14. Services from a supplier not established in France on line A3: yes (Example 1 and Section 3.9).
15. Construction subcontracting reverse charge flagged: yes (Section 6.14).

## End of France VAT Return Skill v2.0

This skill is incomplete without both companion files loaded alongside it: `vat-workflow-base` for the workflow architecture and `eu-vat-directive` for the EU directive content. Do not attempt to produce a CA3 without all three loaded.

## Sources

- Form 3310-CA3-SD, 2026: https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5377.pdf
- Notice 3310-NOT-CA3-SD, 2026: https://www.impots.gouv.fr/sites/default/files/formulaires/3310-ca3-sd/2026/3310-ca3-sd_5426.pdf
- Notice 3517-S-NOT-SD, 2026: https://www.impots.gouv.fr/sites/default/files/formulaires/3517-s-sd/2026/3517-s-sd_5424.pdf
- Form 3517-S-SD, 2026: https://www.impots.gouv.fr/sites/default/files/formulaires/3517-s-sd/2026/3517-s-sd_5291.pdf
- Formulaire n°3310-CA3-SD landing page: https://www.impots.gouv.fr/formulaire/3310-ca3-sd/tva-et-taxes-assimilees-regime-du-reel-normal-mini-reel
- Franchise en base de TVA: https://entreprendre.service-public.gouv.fr/vosdroits/F21746
- Déclarer et payer la TVA: https://entreprendre.service-public.gouv.fr/vosdroits/F23566
- Les régimes d'imposition à la TVA: https://www.impots.gouv.fr/professionnel/les-regimes-dimposition-la-tva
- Dates limites de transmission des CA3: https://www.impots.gouv.fr/le-regime-reel-normal-dates-limites-de-transmission-des-ca3
- Mentions obligatoires sur une facture: https://entreprendre.service-public.gouv.fr/vosdroits/F31808
- Facturation électronique, start dates: https://www.impots.gouv.fr/professionnel/questions/partir-de-quand-suis-je-concerne-par-la-reforme-de-la-facturation
- VAT rates on services, reduced and intermediate: https://bofip.impots.gouv.fr/bofip/1013-PGP.html
- The special rate: https://bofip.impots.gouv.fr/bofip/1449-PGP.html
- Rates in the overseas departments: https://www.impots.gouv.fr/professionnel/questions/quels-sont-les-differents-taux-de-tva-applicables-dans-les-dom
- Exclusion for vehicles designed to carry people: https://bofip.impots.gouv.fr/bofip/1192-PGP.html
- Petroleum products and the deductible share: https://bofip.impots.gouv.fr/bofip/1194-PGP.html
- Accommodation for directors and staff: https://bofip.impots.gouv.fr/bofip/1190-PGP.html
- Goods given away: https://bofip.impots.gouv.fr/bofip/1196-PGP.html
- Small-value equipment taken to expense: https://bofip.impots.gouv.fr/bofip/2109-PGP.html

## Disclaimer

This skill and its outputs are provided for informational and computational purposes only and do not constitute tax, legal, or financial advice. Open Accountants and its contributors accept no liability for any errors, omissions, or outcomes arising from the use of this skill. All outputs must be reviewed and signed off by a qualified professional, such as an expert-comptable, a commissaire aux comptes, or an equivalent licensed practitioner in your jurisdiction, before filing or acting upon.

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
