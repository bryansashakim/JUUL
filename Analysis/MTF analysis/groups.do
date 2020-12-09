/// 8th GRADE
local `yr' 2013
foreach yr in 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019  {
	use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_8th.dta",clear
	append using "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_10th.dta"
	
	
	if `yr' == 2013 | `yr' == 2014 | `yr' == 2015  | `yr' == 2016  | `yr' == 2017  | `yr' == 2018   {
	* future outlook
	gen future_hopeless = V8509
	gen future_life = V8536
	gen life_not_useful = V8513
	gen hw_lkly_go_clg = V7225
	gen hw_lkly_grd_clg = V7226
	** future_hopeless future_life life_not_useful hw_lkly_go_clg hw_lkly_grd_clg
	
	* social media savvy
	gen hr_internet = V7551
	gen hr_social_net = V7589
	gen hr_text = V7562
	gen hr_call = V7563
	gen hw_video_chat = V7590
	** hr_internet hr_social_net  hr_text hr_call hw_video_chat
	
	* parental background
	gen meduc = V7216
	gen feduc = V7215
	** meduc feduc
	
	// higher number is worse
	replace hw_lkly_go_clg = 5 if hw_lkly_go_clg == 1
	replace hw_lkly_go_clg = 6 if hw_lkly_go_clg == 2
	replace hw_lkly_go_clg = 7 if hw_lkly_go_clg == 3
	replace hw_lkly_go_clg = 8 if hw_lkly_go_clg == 4
	replace hw_lkly_go_clg = 4 if hw_lkly_go_clg == 5
	replace hw_lkly_go_clg = 3 if hw_lkly_go_clg == 6
	replace hw_lkly_go_clg = 2 if hw_lkly_go_clg == 7
	replace hw_lkly_go_clg = 1 if hw_lkly_go_clg == 8
	replace hw_lkly_grd_clg = 5 if hw_lkly_grd_clg == 1
	replace hw_lkly_grd_clg = 6 if hw_lkly_grd_clg == 2
	replace hw_lkly_grd_clg = 7 if hw_lkly_grd_clg == 3
	replace hw_lkly_grd_clg = 8 if hw_lkly_grd_clg == 4
	replace hw_lkly_grd_clg = 4 if hw_lkly_grd_clg == 5
	replace hw_lkly_grd_clg = 3 if hw_lkly_grd_clg == 6
	replace hw_lkly_grd_clg = 2 if hw_lkly_grd_clg == 7
	replace hw_lkly_grd_clg = 1 if hw_lkly_grd_clg == 8
	
	replace meduc = 8 if meduc == 1
	replace meduc = 9 if meduc == 2
	replace meduc = 10 if meduc == 3
	replace meduc = 11 if meduc == 4
	replace meduc = 12 if meduc == 5
	replace meduc = 13 if meduc == 6
	replace meduc = 14 if meduc == 7
	replace meduc = 7 if meduc == 8
	replace meduc = 6 if meduc == 9
	replace meduc = 5 if meduc == 10
	replace meduc = 4 if meduc == 11
	replace meduc = 3 if meduc == 12
	replace meduc = 2 if meduc == 13
	replace meduc = 1 if meduc == 14
	replace feduc = 8 if feduc == 1
	replace feduc = 9 if feduc == 2
	replace feduc = 10 if feduc == 3
	replace feduc = 11 if feduc == 4
	replace feduc = 12 if feduc == 5
	replace feduc = 13 if feduc == 6
	replace feduc = 14 if feduc == 7
	replace feduc = 7 if feduc == 8
	replace feduc = 6 if feduc == 9
	replace feduc = 5 if feduc == 10
	replace feduc = 4 if feduc == 11
	replace feduc = 3 if feduc == 12
	replace feduc = 2 if feduc == 13
	replace feduc = 1 if feduc == 14
	
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_810th_w_groups.dta",replace
	}
	if `yr' == 2019 {
		
	}
}


//12th grade

foreach yr in 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019  {
	use "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_12th.dta",clear
	if `yr' == 2013 | `yr' == 2014 | `yr' == 2015  | `yr' == 2016  | `yr' == 2017  | `yr' == 2018   {
	gen future_hopeless = V6362 
	gen future_life = V4211 
	gen life_not_useful = V6366 
	*gen hw_lkly_go_clg = V7225
	gen hw_lkly_grd_clg = V6183 
	
	gen hr_internet = V3518 
	gen hr_social_net = V3527 
	gen hr_text = V3523 
	gen hr_call = V3524
	gen hw_video_chat = V3528 
	
	gen meduc = V2164 
	gen feduc = V2163 
	
	// higher number is worse
	replace hw_lkly_grd_clg = 5 if hw_lkly_grd_clg == 1
	replace hw_lkly_grd_clg = 6 if hw_lkly_grd_clg == 2
	replace hw_lkly_grd_clg = 7 if hw_lkly_grd_clg == 3
	replace hw_lkly_grd_clg = 8 if hw_lkly_grd_clg == 4
	replace hw_lkly_grd_clg = 4 if hw_lkly_grd_clg == 5
	replace hw_lkly_grd_clg = 3 if hw_lkly_grd_clg == 6
	replace hw_lkly_grd_clg = 2 if hw_lkly_grd_clg == 7
	replace hw_lkly_grd_clg = 1 if hw_lkly_grd_clg == 8
	
	replace meduc = 8 if meduc == 1
	replace meduc = 9 if meduc == 2
	replace meduc = 10 if meduc == 3
	replace meduc = 11 if meduc == 4
	replace meduc = 12 if meduc == 5
	replace meduc = 13 if meduc == 6
	replace meduc = 14 if meduc == 7
	replace meduc = 7 if meduc == 8
	replace meduc = 6 if meduc == 9
	replace meduc = 5 if meduc == 10
	replace meduc = 4 if meduc == 11
	replace meduc = 3 if meduc == 12
	replace meduc = 2 if meduc == 13
	replace meduc = 1 if meduc == 14
	replace feduc = 8 if feduc == 1
	replace feduc = 9 if feduc == 2
	replace feduc = 10 if feduc == 3
	replace feduc = 11 if feduc == 4
	replace feduc = 12 if feduc == 5
	replace feduc = 13 if feduc == 6
	replace feduc = 14 if feduc == 7
	replace feduc = 7 if feduc == 8
	replace feduc = 6 if feduc == 9
	replace feduc = 5 if feduc == 10
	replace feduc = 4 if feduc == 11
	replace feduc = 3 if feduc == 12
	replace feduc = 2 if feduc == 13
	replace feduc = 1 if feduc == 14
	
	save "/homes/nber/kimcwa/Documents/E-cigarettes/MTF_Data/Process/Data/MTF_`yr'_12th_w_groups.dta",replace
	}
	
	
}
