

****************************
// graph 1 and 2
****************************


set more off

clear all
cd "" // set the file path
use homo_use_public.dta

drop birth_cohort_big
gen birth_cohort_big = 0 
sort survey_year birth_cohort_big
by survey_year birth_cohort_big: gen cohort_size =_N

local direction_1 "homo_agree"

forvalues i = 1(1)1{
preserve
collapse (mean) `direction_`i'' cohort_size , by(survey_year birth_cohort_big)
save `direction_`i''_survey_big_cohort_0_public.dta,replace
restore
}


clear all
cd "" // set the file path
use homo_agree_survey_big_cohort_0_public.dta
save homo_cohort_0_public.dta,replace

**
clear all
cd "" // set the file path
use homo_use_public.dta

drop if birth_year<1950

sort survey_year birth_cohort_big

local direction_1 "homo_agree"

forvalues i = 1(1)1{
preserve
by survey_year birth_cohort_big: gen cohort_size = _N
collapse (mean) `direction_`i'' cohort_size, by(survey_year birth_cohort_big)
save `direction_`i''_survey_big_cohort_public.dta,replace
restore
}

clear all
cd "" // set the file path
use homo_agree_survey_big_cohort_public.dta
save homo_cohort_1_2_public.dta,replace

append using homo_cohort_0_public.dta

gen agree_weigh_avg = homo_agree*cohort_size

save homo_cohort_0_1_2_public.dta,replace
outsheet using homo_cohort_0_1_2_public.csv,comma replace


***
clear all
cd "" // set the file path
use homo_cohort_0_1_2_public.dta

set scheme s2color
graph bar homo_agree if birth_cohort_big==0, over(survey_year) ///
legend(off) ///
blabel(bar, position(inside) format(%9.2fc) color(white)) ///
ytitle("支持比例")  ///
graphr(color(white))

cd "" // set the file path
graph export graph_1_agree_total_change.png,replace

graph bar homo_agree , over(birth_cohort_big) over(survey_year) ///
blabel(bar, position(inside) format(%9.2fc) color(white))
cd "" // set the file path
graph export graph_2_agree_sub_change.png,replace


****************************
// graph 3
****************************

set more off
clear all
cd "" // set the file path
use homo_use_public.dta
drop if survey_year==1991
drop if birth_year>1990
drop if birth_year<1950

collapse (mean) homo_agree, by(birth_year survey_year)

set scheme s2color
graph twoway ///
(scatter homo_agree birth_year if survey_year ==2009, connect(l) legend(label(1 "2009"))) ///
(scatter homo_agree birth_year if survey_year ==2012, connect(l) legend(label(2 "2012"))) ///
(scatter homo_agree birth_year if survey_year ==2015, connect(l) legend(label(3 "2015"))) 
cd "" // set the file path
graph export graph_3_birth_survey.png,replace





****************************
// graph 4 - 1 high and low education, pre 1970
****************************

set more off
clear all
cd "" // set the file path
use homo_use_public.dta
drop if survey_year==1991
drop if birth_year>1990
drop if birth_year<1950 
keep if birth_year ==2015

collapse (mean) gay_agree, by(edu_use_two birth_year)

rename gay_agree homo_agree

reg homo_agree birth_year if (edu_use_two ==1) & (birth_year<=1970) 
predict pre_low_2015, xb

reg homo_agree birth_year  if (edu_use_two ==2) & (birth_year<=1970)
predict pre_high_2015, xb

reg homo_agree birth_year if (edu_use_two ==1) & (birth_year>1970) 
predict post_low_2015, xb

reg homo_agree birth_year  if (edu_use_two ==2) & (birth_year>1970) 
predict post_high_2015, xb

set scheme s2color
graph twoway ///
(scatter homo_agree birth_year if edu_use_two ==1 & birth_year <=1970 & survey_year ==2015, legend(label(1 "Lower"))) ///
(scatter homo_agree birth_year if edu_use_two ==2 & birth_year <=1970 & survey_year ==2015, legend(label(2 "Higher"))) ///
(line pre_low_2015 birth_year if  birth_year <=1970,  legend(label(3 "Lower"))) ///
(line pre_high_2015 birth_year if  birth_year <=1970,  legend(label(4 "Higher"))) 
cd "" // set the file path
graph export graph_4_1_edu_two_layer_pre.png,replace

****************************
// graph 4 - 2 high and low education, post 1970
****************************

set scheme s2color
graph twoway ///
(scatter homo_agree birth_year if edu_use_two ==1 & birth_year >1970 & survey_year ==2015, legend(label(1 "Lower"))) ///
(scatter homo_agree birth_year if edu_use_two ==2 & birth_year >1970 & survey_year ==2015, legend(label(2 "Higher"))) ///
(line post_low_2015 birth_year if  birth_year >1970,  legend(label(3 "Lower"))) ///
(line post_high_2015 birth_year if  birth_year >1970,  legend(label(4 "Higher"))) 
cd "" // set the file path
graph export graph_4_2_edu_two_layer_post.png,replace
