clear
set more off
capture log close

*Set the working directory into Vo-Hoang-Nguyen-298-Replication folder

* Create a log file in Analysis folder 
log using "./Analysis/Analysis.log", replace

*Load the Names dataset
use "./Data/Names.dta"

* Detailed description of contents of variables in the dataset
codebook, compact

* Install needed packages
ssc install outreg2
ssc install aaplot

*** Replication
**TABLE 1 - MEAN CALLBACK RATES BY RACIAL SOUNDINGNESS OF NAMES
*All sent resumes
mean call_back if black == 0
outreg2 using "./Analysis/table1.xls", append

mean call_back if black == 1
outreg2 using "./Analysis/table1.xls", append

*Chicago
mean call_back if chicago == 1 & black == 0
outreg2 using "./Analysis/table1.xls", append

mean call_back if chicago == 1 & black == 1
outreg2 using "./Analysis/table1.xls", append

*Boston
mean call_back if chicago == 0 & black == 0
outreg2 using "./Analysis/table1.xls", append

mean call_back if chicago == 0 & black == 1
outreg2 using "./Analysis/table1.xls", append

*Females
mean call_back if female == 1 & black == 0
outreg2 using "./Analysis/table1.xls", append

mean call_back if female == 1 & black == 1
outreg2 using "./Analysis/table1.xls", append

*Males
mean call_back if female ==0 & black == 0
outreg2 using "./Analysis/table1.xls", append

mean call_back if female ==0 &  black == 1
outreg2 using "./Analysis/table1.xls", append


**TABLE 2 - RESUME CHARACTERISTICS - SUMMARY STATISTICS 

* Mean & standard deviation for the resume characteristics to all resumes
summarize college yearsexp volunteer military email empholes workinschool honors computerskills specialskills
outreg2 using  "./Analysis/table2.xls", sum(log) eqdrop(N max min) replace see

* Mean & standard deviation for the resume characteristics to resume with white name
summarize college yearsexp volunteer military email empholes workinschool honors computerskills specialskills if black == 0
outreg2 if black ==0 using  "./Analysis/table2.xls", sum(log) eqdrop(N max min) append see

* Mean & standard deviation for the resume characteristics to resume with African-American
summarize college yearsexp volunteer military email empholes workinschool honors computerskills specialskills if black == 1 
outreg2 if black ==1 using  "./Analysis/table2.xls", sum(log) eqdrop(N max min) append see

* Mean & standard deviation for the resume characteristics to resume with Higher quality
summarize college yearsexp volunteer military email empholes workinschool honors computerskills specialskills if high == 1
outreg2 if high ==1 using  "./Analysis/table2.xls", sum(log) eqdrop(N max min) append see

* Mean & standard deviation for the resume characteristics to resume with Lower quality
summarize college yearsexp volunteer military email empholes workinschool honors computerskills specialskills if high == 0 
outreg2 if high ==0 using  "./Analysis/table2.xls", sum(log) eqdrop(N max min) append see


** FIGURE 1: BAR CHART - Callback rates by Race and Resume Quality
label define racelabel 0 "White" 1 "Black"
label values black racelabel
graph bar call_back, over(black) by(high)

*** TABLE 3: RETURN TO CREDENTIALS BY RACE

* Generate yearsexp(*10)
gen new_years_var = yearsexp / 10
gen new_years_var2 = yearsexp / 100

*  Probit regression of callback dummy for all resume

reg call_back  c.new_years_var##c.new_years_var volunteer military email empholes workinschool honors computerskills specialskills, robust
outreg2 using "./Analysis/table3.xls", replace

* Probit regression of callback dummy for White names

reg call_back  c.new_years_var##c.new_years_var volunteer military email empholes workinschool honors computerskills specialskills if black == 0, robust
outreg2 using "./Analysis/table3.xls", append

*  Probit regression of callback dummy for African-American names

reg call_back  c.new_years_var##c.new_years_var volunteer military email empholes workinschool honors computerskills specialskills if black == 1, robust
outreg2 using "./Analysis/table3.xls", append

* Linear probability model (Binary: callback)

reg call_back i.specialskills##i.black, robust
margins, dydx(specialskills) over(black)

log close
exit

 