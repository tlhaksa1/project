// STATA II Project HW 6
// Tenzin Lhaksmapa 

//data
//global MORT_1999_2000 "https://ftp.cdc.gov/pub/HEALTH_STATISTICS/NCHS/datalinkage/linked_mortality/NHANES_1999_2000_MORT_2019_PUBLIC.dat"

//code
do "https://raw.githubusercontent.com/tlhaksa1/project/main/followup.do" 

// Use your own username/project repo instead of the repo below
global repo "https://raw.githubusercontent.com/tlhaksa1/project/main/"
cls
do ${repo}followup.do
save followup, replace


// Import mortality data 
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.XPT", clear
merge 1:1 seqn using followup
lookfor follow
lookfor mortstat permth_int eligstat 
keep if eligstat==1
capture g years=permth_int/12
codebook mortstat // view details
stset years, fail(mortstat) // survival analysis data 
sts graph, fail // visualize data 
save demo_mortality, replace 


//Import self-reported health data (Hospital Utilization & Access to Care (HUQ))
import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/HUQ.XPT", clear 
merge 1:1 seqn using demo_mortality, nogen
sts graph, by(huq010) fail
stcox i.huq010 

import sasxport5 "https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/HUQ.XPT", clear 
desc huq010
codebook huq010