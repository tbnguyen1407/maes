
(deffacts 1k-mods
(module
	(code CG1103)
	(title "Data Structures and Algorithms I")
	(exam 2804AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CG1101) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CG1103)
	(group Group1)
	(time 2 9 11)
	(venue COM1/206)
)

(module
	(code CS1010)
	(title "Programming Methodology")
	(exam 2304AM)
	(faculty SOC)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1101) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1101C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1101S) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CS1010)
	(group Group1)
	(time 1 9 12)
	(venue COM1/B12)
)

(lecture-time
	(code CS1010)
	(group Group2)
	(time 2 9 12)
	(venue COM1/B12)
)

(module
	(code CS1010E)
	(title "Programming Methodology")
	(exam 2304PM)
	(faculty SOC)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1101) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1101C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1101S) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CS1010E)
	(group Group1)
	(time 2 16 18)
	(venue LT7A)
)

(module
	(code CS1020)
	(title "Data Structures and Algorithms I")
	(exam 2604AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1010) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CS1020)
	(group Group1)
	(time 3 14 16)
	(venue TBA)
)

(lecture-time
	(code CS1020)
	(group Group2)
	(time 2 10 12)
	(venue COM1/B09)
)

(module
	(code CS1020E)
	(title "Data Structures and Algorithms I")
	(exam 2504PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1010E) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CS1020E)
	(group Group1)
	(time 2 14 16)
	(venue LT15)
)

(module
	(code CS1102)
	(title "Data Structures and Algorithms")
	(MC 5)
	(exam 2504EVENING)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1101) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CS1102)
	(group Group1)
	(time 3 10 12)
	(venue COM1/202)
)

(module
	(code CS1102C)
	(title "Data Structures and Algorithms")
	(MC 5)
	(exam 0305EVENING)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1101C) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CS1102C)
	(group Group1)
	(time 1 14 16)
	(venue EA-0211)
)

(module
	(code CS1231)
	(title "Discrete Structures")
	(exam 0305AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code MA1301) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code MA1100) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code CS1231)
	(group Group1)
	(time 1 16 18)
	(venue LT15)
)

(lecture-time
	(code CS1231)
	(group Group2)
	(time 1 10 11)
	(venue LT15)
)

(module
	(code IS1103)
	(title "Computing and Society")
	(exam 2604EVENING)
	(faculty SOC)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS1105) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS1103)
	(group Group1)
	(time 5 10 12)
	(venue LT19)
)

(module
	(code IS1105)
	(title "Strategic IT Applications")
	(exam 2504PM)
	(faculty SOC)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS1105)
	(group Group1)
	(time 2 16 18)
	(venue LT15)
)

(module
	(code IS1112)
	(title "E-Business Essentials")
	(exam 3004AM)
	(faculty SOC)
)

(lecture-time
	(code IS1112)
	(group Group1)
	(time 2 9 11)
	(venue LT19)
)

(module
	(code MA1301)
	(title "Introductory Mathematics")
	(exam 2904AM)
	(faculty FOS)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code MA1101R) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1505) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1521) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code MA1301)
	(group SL1)
	(time 2 10 12)
	(venue LT24)
)

(module
	(code MA1521)
	(title "Calculus for Computing")
	(exam 2604EVENING)
	(faculty FOS)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code MA1301) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code MA1102R) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1312) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1505) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code MA1521)
	(group SL1)
	(time 2 14 16)
	(venue LT33)
)

(module
	(code MA1312)
	(title "Calculus with Applications")
	(exam 0405EVENING)
	(faculty FOS)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code MA1301) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code MA1102R) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1505) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1521) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code MA1312)
	(group SL1)
	(time 2 10 12)
	(venue LT26)
)

(module
	(code MA1101R)
	(title "Linear Algebra I")
	(exam 2304AM)
	(faculty FOS)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code MA1301) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code MA1101) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1506) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code MA1101R)
	(group SL1)
	(time 2 12 14)
	(venue LT27)
)

(lecture-time
	(code MA1101R)
	(group SL2)
	(time 1 16 18)
	(venue LT27)
)

(module
	(code MA1505)
	(title "Mathematics I")
	(exam 3004AM)
	(faculty FOS)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code MA1301) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code MA1102R) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1312) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1521) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code MA1505)
	(group SL1)
	(time 1 10 12)
	(venue LT32)
)

(module
	(code LSM1301)
	(title "General Biology")
	(exam 2904AM)
	(faculty FOS)
)

(lecture-time
	(code LSM1301)
	(group SL1)
	(time 2 14 16)
	(venue LT32)
)

(lecture-time
	(code LSM1301)
	(group SL2)
	(time 5 14 16)
	(venue LT32)
)

(module
	(code LSM1302)
	(title "Genes and Society")
	(exam 2804EVENING)
	(faculty FOS)
)

(lecture-time
	(code LSM1302)
	(group SL1)
	(time 1 14 16)
	(venue LT32)
)

(lecture-time
	(code LSM1302)
	(group SL2)
	(time 2 16 18)
	(venue LT32)
)

(module
	(code EC1301)
	(title "Principles of Economics")
	(exam 2504AM)
	(faculty FASS)
)

(lecture-time
	(code EC1301)
	(group Group1)
	(time 2 18 20)
	(venue LT27)
)

(lecture-time
	(code EC1301)
	(group Group2)
	(time 3 14 16)
	(venue LT27)
)

(module
	(code ACC1002X)
	(title "Financial Accounting")
	(exam 2804AM)
	(faculty NBS)
)

(lecture-time
	(code ACC1002X)
	(group B1)
	(time 1 16 18)
	(venue LT17)
)

(lecture-time
	(code ACC1002X)
	(group B2)
	(time 3 14 16)
	(venue LT17)
)
)