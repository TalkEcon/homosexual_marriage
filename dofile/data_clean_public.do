


clear all
cd "" // set the file path
use homo_combine_public.dta


// keep the observations who were born between 1950-1990
drop if birth_year<1950
drop if birth_year>1990

// drop the missing values
drop if homo==. 
drop if birth_year==.
drop if self_edu ==.
drop if religion ==.

gen homo_agree = 1 if (homo==1|homo==2|homo==3)
replace homo_agree = 0 if (homo>3)

label drop self_edu
label define self_edu 1"none" 2"self" 3"elementary" 4"junior" 5"senior" 6"college" ///
7"university" 8"teacher" 9"police_military" 10"senior_vocational"11"tech_university"
label values self_edu self_edu

gen edu_use_pre_70 = self_edu if (birth_year<=1970 & birth_year>=1950)
recode edu_use_pre_70 1/4=1 6 9 10 11=2 5 7=3 

label define edu_use_pre_70 1"junior" 2"vocational" 3"academic"
label values edu_use_pre_70 edu_use_pre_70

gen edu_use_post_70 = self_edu if (birth_year>1970)
recode edu_use_post_70 1/5 10=1 6 9 11=2 7=3 

label define edu_use_post_70 1"junior" 2"vocational" 3"academic"
label values edu_use_post_70 edu_use_post_70

gen edu_use = edu_use_pre_70 if (birth_year<=1970 & birth_year>=1950)
replace edu_use = edu_use_post_70 if (birth_year>1970)

gen edu_use_two = edu_use
replace edu_use_two = 2 if edu_use_two ==3

gen birth_cohort_big = 1 if birth_year<1970&birth_year>=1950
replace birth_cohort_big = 2 if birth_year>1970

gen religion_use = religion
recode religion_use 1=1 2=2 3=3 4 5=4 6 7 9 10 11=. 8=5

label define religion_use 1"buddism" 2"dao" 3"local" 4"ch_cath"5"no"
label values religion_use religion_use

save homo_use_public.dta,replace
