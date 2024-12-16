
(deffacts 3k-mods
(module
	(code CP3201)
	(title "Industry Seminar")
	(MC 2)
	(faculty SOC)
	(prereqs
		"(any-factp ((?student student)) (>= ?student:MC 70))"
	)
)

(lecture-time
	(code CP3201)
	(group Group1)
	(time 4 14 16)
	(venue COM1/212)
)

(module
	(code CS3211)
	(title "Parallel and Concurrent Programming")
	(exam 1704PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2106) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3211)
	(group Group1)
	(time 4 14 16)
	(venue LT15)
)

(module
	(code CS3215)
	(title "Software Engineering Project")
	(MC 8)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2103) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3215)
	(group Group1)
	(time 1 12 14)
	(venue COM1/206)
)

(module
	(code CS3217)
	(title "Software Engineering on Modern Application Platforms")
	(MC 5)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2103) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3217)
	(group Group1)
	(time 2 16 17)
	(venue LT19)
)

(module
	(code CS3223)
	(title "Database Systems Implementation")
	(exam 2504PM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS2102) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS2102S) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS3223)
	(group Group1)
	(time 4 14 16)
	(venue COM1/204)
)

(module
	(code CS3225)
	(title "Combinatorial Methods in Bioinformatics")
	(exam 2704EVENING)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS2220) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code LSM2104) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS3225)
	(group Group1)
	(time 4 12 14)
	(venue COM1/202)
)

(module
	(code CS3230)
	(title "Design and Analysis of Algorithms")
	(exam 2604PM)
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS1231) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS3230)
	(group Group1)
	(time 4 10 12)
	(venue LT19)
)

(module
	(code CS3233)
	(title "Competitive Programming")
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3233)
	(group Group1)
	(time 3 18 22)
	(venue COM1/120)
)

(module
	(code CS3235)
	(title "Introduction to Computer Security")
	(exam 2304PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2105) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3235)
	(group Group1)
	(time 1 14 16)
	(venue LT19)
)

(module
	(code CS3240)
	(title "Human-Computer Interaction")
	(exam 0405PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1101) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3240)
	(group Group1)
	(time 3 12 14)
	(venue COM1/204)
)

(module
	(code CS3241)
	(title "Computer Graphics")
	(exam 0605AM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS3241)
	(group Group1)
	(time 1 10 12)
	(venue COM1/206)
)

(module
	(code CS3243)
	(title "Introduction to Artificial Intelligence")
	(exam 2504AM)
	(faculty SOC)
	(prereqs
		"(and
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1102S) (eq ?module:taken yes)))
			)
			(any-factp ((?module module)) (and (eq ?module:code CS1231) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS3243)
	(group Group1)
	(time 1 16 18)
	(venue LT19)
)

(module
	(code CS3245)
	(title "Information Retrieval")
	(exam 2704AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3245)
	(group Group1)
	(time 4 14 16)
	(venue COM1/202)
)

(module
	(code CS3248)
	(title "Design of Interactive Systems")
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS3249) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS3240) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS3248)
	(group Group1)
	(time 4 16 18)
	(venue COM1/204)
)

(module
	(code CS3271)
	(title "Software Engineering for Reactive Systems")
	(exam 2604AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2271) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3271)
	(group Group1)
	(time 3 14 16)
	(venue COM1/204)
)

(module
	(code CS3343)
	(title "Digital Media Production")
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS3343)
	(group Group1)
	(time 3 14 16)
	(venue LT19)
)

(module
	(code CS3882)
	(title "Breakthrough Ideas for Digital Markets")
	(faculty SOC)
	(prereqs
		"(any-factp ((?student student)) (>= ?student:MC 80))"
	)
)

(lecture-time
	(code CS3882)
	(group Group1)
	(time 3 9 11)
	(venue LT19)
)

(module
	(code IS3101)
	(title "Management of Information Systems")
	(exam 2304PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code IS3101)
	(group Group1)
	(time 5 16 18)
	(venue LT19)
)

(module
	(code IS3221)
	(title "Enterprise Resource Planning Systems")
	(exam 2704PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS3264) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS3221)
	(group Group1)
	(time 4 16 18)
	(venue LT15)
)

(module
	(code IS3230)
	(title "Principles of Information Security")
	(exam 2804AM)
	(faculty SOC)
	(prereqs
		"(or
			(and
				(any-factp ((?module module)) (and (eq ?module:code CS2105) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS1105) (eq ?module:taken yes)))
			)
			(any-factp ((?module module)) (and (eq ?module:code IS1112) (eq ?module:taken yes)))
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS3254) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS3230)
	(group Group1)
	(time 4 14 16)
	(venue I3/Aud)
)

(module
	(code IS3240)
	(title "Economics of E-Business")
	(exam 2904PM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code EC1101) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code EC1310) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code EC1311) (eq ?module:taken yes)))
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS3265) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS3240)
	(group Group1)
	(time 5 14 16)
	(venue COM1/206)
)

(module
	(code IS3241)
	(title "Enterprise Social Systems")
	(exam 2804EVENING)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code IS3241)
	(group Group1)
	(time 1 12 14)
	(venue LT19)
)

(module
	(code IS3242)
	(title "Software Quality Management")
	(exam 2704EVENING)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code IS1105) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code IS3242)
	(group Group1)
	(time 4 10 12)
	(venue COM1/204)
)
)
