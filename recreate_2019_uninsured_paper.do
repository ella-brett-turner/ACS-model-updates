*Recreate tables from 'Uninsurance Rose among Children and Parents in 2019'
 
 use "L:\HP\ACS\ACS data rerun\2019\output\CombinedData_2019.dta"
 
 *Table 1
 
 *Children
 *age
 tab hp_ui [iw=perwt] if age <= 5
 tab hp_ui [iw=perwt] if age <= 12 & age >= 6
 tab hp_ui [iw=perwt] if age <= 18 & age >= 13
 tab hp_ui [iw=perwt] if age <= 24 & age >= 19 & parent == 1
 tab hp_ui [iw=perwt] if age <= 34 & age >= 25 & parent == 1
 tab hp_ui [iw=perwt] if age <= 44 & age >= 35 & parent == 1
 tab hp_ui [iw=perwt] if age <= 64 & age >= 45 & parent == 1
 
*sex
*Male
tab hp_ui [iw=perwt] if sex == 1 & age < 19
*Female
tab hp_ui [iw=perwt] if sex == 2 & age < 19

*Race/Ethnicity
*American Indian/Alaska Native
tab hp_ui [iw=perwt] if racamind == 2 & age < 19
tab hp_ui [iw=perwt] if racasian == 2 & age < 19| racpacis == 2 & age < 19
tab hp_ui [iw=perwt] if racblk == 2 & age < 19
tab hp_ui [iw=perwt] if racother == 2 & age < 19
tab hp_ui [iw=perwt] if racwht == 2 & hispan == 0 & age < 19
tab hp_ui [iw=perwt] if hispan == 1 & age < 19| hispan == 2 & age < 19| hispan == 3 & age < 19| hispan == 4 & age < 19

*Family income
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU <= 1 & age < 19
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU > 1 & u_magi_inc_ratioTU < 1.38 & age < 19
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU >= 1.38 & age < 19

*Household SNAP
tab hp_ui [iw=perwt] if foodstmp == 1 & age < 19
tab hp_ui [iw=perwt] if foodstmp == 2 & age < 19

*Parents
*sex
*Male
tab hp_ui [iw=perwt] if sex == 1 & parent == 1
*Female
tab hp_ui [iw=perwt] if sex == 2 & parent == 1

*Race/Ethnicity
*American Indian/Alaska Native
tab hp_ui [iw=perwt] if racamind == 2 & parent == 1
tab hp_ui [iw=perwt] if racasian == 2 & parent == 1| racpacis == 2 & parent == 1
tab hp_ui [iw=perwt] if racblk == 2 & parent == 1
tab hp_ui [iw=perwt] if racother == 2 & parent == 1 & racamind != 1 & racasian !=1 & racblk != 1 & racwht != 1 
tab hp_ui [iw=perwt] if racwht == 2 & hispan == 0 & parent == 1
tab hp_ui [iw=perwt] if hispan == 1 & parent == 1| hispan == 2 & parent == 1| hispan == 3 & parent == 1| hispan == 4 & parent == 1

*Family income
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU <= 1 & parent == 1
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU > 1 & u_magi_inc_ratioTU < 1.38 & parent == 1
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU >= 1.38 & parent == 1

*Household SNAP
tab hp_ui [iw=perwt] if foodstmp == 1 & parent == 1
tab hp_ui [iw=perwt] if foodstmp == 2 & parent == 1

*Table 2
tab hp_ui[iw=perwt] if elig_aca_default == 4 & statefip == 48 & age < 19 | elig_aca_default == 5 & statefip == 48 & age < 19

*Table 3 (Draft)
tab statefip numerator [iw=perwt] if age<19 & denominator==1, row

*Table A.1 (same as A.3)
tab statefip hp_ui [iw=perwt] if age < 19, row

*Table A.2
tab statefip hp_ui [iw=perwt] if parent == 1, row

*Figure 8
*Uninsured chidren
tab hp_ui [iw=perwt] if age <=18

*Eligible uninsured children
tab hp_ui [iw=perwt] if age <=18 & elig_aca_default == 4| elig_aca_default == 5 & age <=18

*Eligible undocumented children (ineligible due to immigration requirements)
tab hp_ui [iw=perwt] if age < 1 & undoc ==1 & u_magi_inc_ratioTU < mcd_0_1

*Ineligible due to income requirements
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU >= mcd_0_1 & undoc == 0 & age < 1

*Ineligible due to income and immigration requirements
tab hp_ui [iw=perwt] if age < 1 & u_magi_inc_ratioTU >= mcd_0_1 & undoc ==1

*Ages 1-5
*Eligible undocumented children (ineligible due to immigration requirements)
tab hp_ui [iw=perwt] if age <=5 & age >= 1 & undoc ==1 & u_magi_inc_ratioTU < mcd_1_5

*Ineligible due to income requirements
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU >= mcd_1_5 & undoc == 0 & age <=5 & age >= 1

*Ineligible due to income and immigration requirements
tab hp_ui [iw=perwt] if age <=5 & age >= 1 & u_magi_inc_ratioTU >= mcd_1_5 & undoc ==1

*Ages 6-18
*Eligible undocumented children (ineligible due to immigration requirements)
tab hp_ui [iw=perwt] if age <=18 & age >=6  & undoc ==1 & u_magi_inc_ratioTU < mcd_6_18

*Ineligible due to income requirements
tab hp_ui [iw=perwt] if u_magi_inc_ratioTU >= mcd_6_18 & undoc == 0 & age <=18 & age >=6 

*Ineligible due to income and immigration requirements
tab hp_ui [iw=perwt] if age <=18 & age >=6  & u_magi_inc_ratioTU >= mcd_6_18 & undoc ==1

*Figure 9
*Medicaid eligible uninsured parents (couldn't get an exact match)
tab hp_ui [iw=perwt] if elig_aca_default == 2

*Medicaid-eligible uninsured parents with Medicaid/CHIP-enrolled children
*Create variable for medicaid eligible uninsured parents
gen parent_ui = 0
replace parent_ui = 1 if elig_aca_default == 2 & hp_ui == 1

gen mcd_child = 0 
replace mcd_child = 1 if hp_caid == 1 & age < 19
tab hp_ui [iw=perwt] if elig_aca_default == 2 & mcd_child == 1

tab parent_ui mcd_child [iw=perwt] 