
(deffacts 2k-mods

(module
	(code CS2020)
	(title "Data Structures and Algorithms Accelerated")
	(MC 6)
	(exam 2504PM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS1010) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS1101S) (eq ?module:taken yes)))
		)"
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
	(code CS2020)
	(group Group1)
	(time 1 10 12)
	(venue COM1/204)
)

(module
	(code CS2100)
	(title "Computer Organisation")
	(exam 2304PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1101) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS1104) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code CS2100)
	(group Group1)
	(time 3 12 14)
	(venue LT19)
)

(module
	(code CS2102)
	(title "Database Systems")
	(exam 3004PM)
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1231) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1100) (eq ?module:taken yes)))
			)
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS2102S) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code CS2102)
	(group Group1)
	(time 2 10 12)
	(venue LT15)
)

(module
	(code CS2103)
	(title "Software Engineering")
	(exam 0405PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS2103)
	(group Group1)
	(time 2 16 18)
	(venue LT15)
)

(lecture-time
	(code CS2103)
	(group Group2)
	(time 5 16 18)
	(venue LT15)
)

(module
	(code CS2105)
	(title "Introduction to Computer Networks")
	(exam 2604PM)
	(faculty SOC)
	(prereqs
		"(and
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1104) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS2100) (eq ?module:taken yes)))
			)
		)"
	)
)

(lecture-time
	(code CS2105)
	(group Group1)
	(time 5 12 14)
	(venue LT19)
)

(module
	(code CS2106)
	(title "Introduction to Operating Systems")
	(exam 0305AM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS1104) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS2100) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS2106)
	(group Group1)
	(time 5 14 16)
	(venue LT15)
)

(module
	(code CS2271)
	(title "Embedded Systems")
	(exam 0605PM)
	(faculty SOC)
	(prereqs
		"(and
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1104) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS2100) (eq ?module:taken yes)))
			)
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CG2271) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code CS2271)
	(group Group1)
	(time 1 14 16)
	(venue COM1/206)
)

(module
	(code CS2281)
	(title "Programming in UNIX")
	(MC 3)
	(exam 2504PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1101) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1101C) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
			)
		)"		
	)
)

(lecture-time
	(code CS2281)
	(group Group1)
	(time 2 12 14)
	(venue COM1/206)
)

(module
	(code IS2103)
	(title "Enterprise Systems Development Concepts")
	(exam 2704AM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS1102C) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS2261) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS2103)
	(group Group1)
	(time 3 12 14)
	(venue LT19)
)

(module
	(code IS2104)
	(title "Software Team Dynamics")
	(exam 2904AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?student student)) (>= ?student:MC 40))"
	)
)

(lecture-time
	(code IS2104)
	(group Group1)
	(time 4 12 15)
	(venue LT19)
)
)
