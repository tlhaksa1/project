// STATA II Project
// Tenzin Lhaksmapa 

//use your own username/project repo instead of the class repo below
global repo "https://github.com/tlhaksa1/project/raw/main/"
cls
do ${repo}followup.do
save followup, replace 
import sasxport5 

// Import mortality data 
"https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear
merge 1:1 seqn using followup
lookfor follow
lookfor mortstat permth_int eligstat 
keep if eligstat==1
capture g years=permth_int/12
codebook mortstat
stset years, fail(mortstat) // survival analysis data 
sts graph, fail // visualize data 
save demo_mortality, replace 

//Import self-reported health data (Hospital Utilization & Access to Care (HUQ))
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/HUQ.XPT", clear 
merge 1:1 seqn using demo_mortality, nogen
sts graph, by(huq010) fail
stcox i.huq010 