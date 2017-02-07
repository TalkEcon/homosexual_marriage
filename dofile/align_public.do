


****************************
// arrange the data of 1991
****************************

clear all
cd "" // set the file path
use  // file name here

gen survey_year = year

gen gender = v1
label define gender 1"male" 2"female"
label values gender gender

gen birth_year = 1911+v2y
gen birth_month = v2m
replace birth_month = . if birth_month>12

gen self_edu = v6a
recode self_edu 1=1 2 3=2 4=3 5=4 6=5 11 12 13 14 15 16 17 18 19 23=6 ///
24 25=7 9 10=8 7 8 20 21 22=9 26 96=.

label define self_edu 1"none" 2"self" 3"elementary" 4"junior" 5"senior" 6"college" ///
7"university" 8"teacher" 9"police_military"
label values self_edu self_edu

gen homo= v27e
recode homo 1=1 2=2 3=7 4=5 5=6 94=9 96=.
label define homo 1"extreme_agree" 2"quite_agree" 3"bit_agree" 4"bit_disagree" ///
5"quite_disagree" 6"extreme_disagree"7"no_opinion" 8"not_understand" 9"do_not_know" 
label values homo homo

gen religion = v14
recode religion 1=1 2=2 3=3 4 5 =9 6=4 7=6 8=5 9=8 10=7 96=.
label define religion 1"buddism" 2"dao" 3"local" 4"catho" 5"chris" 6"islam" 7"other" 8"no" 9"one_dao"
label values religion religion

keep zip survey_year gender birth_year birth_month ///
self_edu homo religion

save 1991_mod_public.dta,replace


****************************
// arrange the data of 2009
****************************

clear all
cd "" // set the file path
use  // file name here

gen survey_year = year

gen gender = v1
label define gender 1"male" 2"female"
label values gender gender

gen birth_year = 1911+v2y
gen birth_month = v2m
replace birth_month = . if birth_month>12

gen self_edu = v9
recode self_edu 1=1 2=2 3=3 4 5=4 6=5 7 8=10 10 11 12 15=6 ///
16 19 20 21=7 18=11 9 13 14 17=9 22 96 97 98=.

label define self_edu 1"none" 2"self" 3"elementary" 4"junior" 5"senior" 6"college" ///
7"university" 8"teacher" 9"police_military" 10"senior_vocational"11"tech_university"
label values self_edu self_edu

gen homo= v73  // 同性成年人之間性行為
// 1 絕對不對
recode homo 1=6 2=5 3=3 4=1 94=9 95=8 96/98=.
label define homo 1"extreme_agree" 2"quite_agree" 3"bit_agree" 4"bit_disagree" ///
5"quite_disagree" 6"extreme_disagree"7"no_opinion" 8"not_understand" 9"do_not_know" 
label values homo homo

gen religion = v15
recode religion 10=8 21/24=3 30/39=1 40=2 50=4 60=5 70/78=9 81/85=10 91=6 92/95=11 101/110=7 996/998=.
label define religion 1"buddism" 2"dao" 3"local" 4"catho" 5"chris" 6"islam" 7"other" 8"no" 9"one_dao" 10"japan"11"other_foreign"
label values religion religion

keep zip survey_year gender birth_year birth_month ///
self_edu homo religion

save 2009_mod_public.dta,replace

****************************
// arrange the data of 2012
****************************

clear all
cd "" // set the file path
use  // file name here

gen survey_year = year

gen gender = a1
label define gender 1"male" 2"female"
label values gender gender

gen birth_year = 1911+a2y
gen birth_month = a2m
replace birth_month = . if birth_month>12

gen self_edu = b1
recode self_edu 1=1 2=2 3=3 4 5=4 6=5 7 8=10 10 11 12 15=6 ///
16 19 20 21=7 18=11 9 13 14 17=9 22 97 98=.

label define self_edu 1"none" 2"self" 3"elementary" 4"junior" 5"senior" 6"college" ///
7"university" 8"teacher" 9"police_military" 10"senior_vocational"11"tech_university"
label values self_edu self_edu

gen homo= j7g
recode homo 1=1 2=2 3=7 4=5 5=6 97=9 98=.
label define homo 1"extreme_agree" 2"quite_agree" 3"bit_agree" 4"bit_disagree" ///
5"quite_disagree" 6"extreme_disagree"7"no_opinion" 8"not_understand" 9"do_not_know" 
label values homo homo

gen religion = a5
recode religion 1=1 2=2 3=3 4=9 5=6 6=4 7=5 8=8 9=7 97 98=.
label define religion 1"buddism" 2"dao" 3"local" 4"catho" 5"chris" 6"islam" 7"other" 8"no" 9"one_dao"
label values religion religion

keep zip survey_year gender birth_year birth_month ///
self_edu homo religion

save 2012_mod_public.dta,replace



****************************
// arrange the data of 2015
****************************

clear all
cd "" // set the file path
use  // file name here

gen survey_year = year

gen gender = v1
label define gender 1"male" 2"female"
label values gender gender

gen birth_year = 1911+v2y
gen birth_month = v2m
replace birth_month = . if birth_month>12

gen self_edu = v6a
recode self_edu 1=1 2=2 3=3 4 5=4 6 7=5  8=10 10 11 12 15=6 ///
16 19 20 21=7 18=11  9 13 14 17=9 22 96 97 98 99=.

label define self_edu 1"none" 2"self" 3"elementary" 4"junior" 5"senior" 6"college" ///
7"university" 8"teacher" 9"police_military" 10"senior_vocational"11"tech_university"
label values self_edu self_edu

gen homo= v63
recode homo 1=1 2=2 3=5 4=6 93=7 97=9 96 98 99=.
label define homo 1"extreme_agree" 2"quite_agree" 3"bit_agree" 4"bit_disagree" ///
5"quite_disagree" 6"extreme_disagree"7"no_opinion" 8"not_understand" 9"do_not_know" 
label values homo homo

gen religion = v11
recode religion 1=1 2=2 3=3 4 5=9 6=6 7=4 8=5 9 11=7 10=8 96 97 98 99=.
label define religion 1"buddism" 2"dao" 3"local" 4"catho" 5"chris" 6"islam" 7"other" 8"no" 9"one_dao"
label values religion religion

keep zip survey_year gender birth_year birth_month ///
self_edu homo religion

save 2015_mod_public.dta,replace

****************************
// combine the data 
****************************

clear all
cd "" // set the file path
use 1991_mod_public.dta
append using 2009_mod_public.dta
append using 2012_mod_public.dta
append using 2015_mod_public.dta

save homo_combine_public.dta,replace


