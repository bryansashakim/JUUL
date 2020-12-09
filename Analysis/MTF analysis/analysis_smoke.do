/// 8th GRADE
use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_810.dta",clear
keep if grade_2000_2011 == 2 | grade_2012_2019 == 8
* Ever smoke cigarettes
// 2000-2010
drop if V1177 == -9
gen evr_smk = 
tab YEAR V1177 [iweight=WEIGHT], column
foreach yr in 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2012 2013 2014 2015 2016 2017 2018 2019  {
	use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",clear
	
	if `yr' == 2000 | `yr' == 2004 | `yr' == 2005 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1177
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",replace
	}
	if `yr' == 2001  | `yr' == 2002 | `yr' == 2003 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1176
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",replace
	}
	if `yr' == 2006 | `yr' == 2007 | `yr' == 2008 | `yr' == 2009 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1190
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",replace
	}
	if `yr' == 2010 | `yr' == 2011 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1197
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",replace
	}
	
	if `yr' == 2012 | `yr' == 2013 | `yr' == 2014 | `yr' == 2015  | `yr' == 2016  | `yr' == 2017  | `yr' == 2018 | `yr' == 2019  {
	gen grade = V501
	tab grade
	keep if grade == 8
	gen evr_smk = V7101
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",replace
	}
}

foreach yr in 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019  {
	use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",clear
	gen evr = inlist(evr_smk,2,3,4,5)
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",replace
	tab V1 evr [iweight=V5],cell nofreq
}



/// 10th GRADE
use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_810.dta",clear
keep if grade_2000_2011 == 2 | grade_2012_2019 == 8
* Ever smoke cigarettes
// 2000-2010
drop if V1177 == -9
gen evr_smk = 
tab YEAR V1177 [iweight=WEIGHT], column
foreach yr in 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019  {
	use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",clear
	
	if `yr' == 2000 | `yr' == 2004 | `yr' == 2005 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1177
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",replace
	}
	if `yr' == 2001  | `yr' == 2002 | `yr' == 2003 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1176
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",replace
	}
	if `yr' == 2006 | `yr' == 2007 | `yr' == 2008 | `yr' == 2009 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1190
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",replace
	}
	if `yr' == 2010 | `yr' == 2011 {
	gen grade = V1101
	tab grade
	drop if grade == -9
	gen evr_smk = V1197
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",replace
	}
	
	if `yr' == 2012 | `yr' == 2013 | `yr' == 2014 | `yr' == 2015  | `yr' == 2016  | `yr' == 2017  | `yr' == 2018 | `yr' == 2019  {
	gen grade = V501
	tab grade
	keep if grade == 10
	gen evr_smk = V7101
	drop if evr_smk==-9
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",replace
	}
}

foreach yr in 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019  {
	use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",clear
	gen evr = inlist(evr_smk,2,3,4,5)
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta",replace
	tab V1 evr [iweight=V5],cell nofreq
}

