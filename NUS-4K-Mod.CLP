
(deffacts 4k-mods

(module
	(code CS4215)
	(title "Programming Language Implementation")
	(exam 2904AM)
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS2104) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS4215)
	(group Group1)
	(time 1 16 18)
	(venue COM1/212)
)

(module
	(code CS4216)
	(title "Constraint Logic Programming")
	(exam 2604EVENING)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS3234) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS4216)
	(group Group1)
	(time 1 1830 2030)
	(venue COM1/212)
)

(module
	(code CS4217)
	(title "Software Development Technologies")
	(exam 0505PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS3213) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS4217)
	(group Group1)
	(time 5 10 12)
	(venue COM1/206)
)

(module
	(code CS4220)
	(title "Knowledge Discovery Methods in Bioinformatics")
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS2220) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code LSM2104) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS4220)
	(group Group1)
	(time 4 14 17)
	(venue COM1/216)
)

(module
	(code CS4222)
	(title "Wireless Computing and Sensor Networks")
	(exam 2704PM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS3103) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS4222)
	(group Group1)
	(time 5 14 17)
	(venue COM1/204)
)

(module
	(code CS4231)
	(title "Parallel and Distributed Algorithms")
	(exam 3004AM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS3230) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS3210) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS4231)
	(group Group1)
	(time 5 16 19)
	(venue COM1/202)
)

(module
	(code CS4236)
	(title "Cryptography Theory and Practice")
	(exam 3004PM)
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS3235) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS4236)
	(group Group1)
	(time 5 10 12)
	(venue COM1/202)
)

(module
	(code CS4244)
	(title "Knowledge-Based Systems")
	(exam 0305AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS3243) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS4244)
	(group Group1)
	(time 1 1830 2030)
	(venue COM1/204)
)

(module
	(code CS4247)
	(title "Graphics Rendering Techniques")
	(exam 2804AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code CS3241) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code CS4247)
	(group Group1)
	(time 2 11 14)
	(venue LT19)
)

(module
	(code CS4271)
	(title "Critical Systems and Their Verification")
	(exam 2904AM)
	(faculty SOC)
	(prereqs
		"(and
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1104) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS2100) (eq ?module:taken yes)))
			)
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS1231) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1100) (eq ?module:taken yes)))
			)
		)"
	)
)

(lecture-time
	(code CS4271)
	(group Group1)
	(time 3 12 15)
	(venue COM1/212)
)

(module
	(code CS4340)
	(title "Digital Special Effects")
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS3343) (eq ?module:taken yes)))
			(or
				(any-factp ((?module module)) (and (eq ?module:code CS4243) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS4247) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code CS4342) (eq ?module:taken yes)))
			)
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS5245) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code CS4340)
	(group Group1)
	(time 2 14 17)
	(venue AS6/421)
)

(module
	(code CS4343)
	(title "Game Development Project")
	(MC 8)
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS4213) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code CS2103) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code CS4343)
	(group Group1)
	(time 5 9 12)
	(venue COm1/204)
)

(module
	(code CS4347)
	(title "Sound and Music Computing")
	(exam 2804PM)
	(faculty SOC)
	(prereqs
		"(and
			(any-factp ((?module module)) (and (eq ?module:code CS1102) (eq ?module:taken yes)))
			(or
				(any-factp ((?module module)) (and (eq ?module:code MA1505) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1521) (eq ?module:taken yes)))
			)
			(or
				(any-factp ((?module module)) (and (eq ?module:code MA1506) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code MA1101R) (eq ?module:taken yes)))
			)
		)"
	)
)

(lecture-time
	(code CS4347)
	(group Group1)
	(time 4 16 18)
	(venue COM2/105)
)

(module
	(code CS4880)
	(title "Digital Entrepreneurship")
	(faculty SOC)
	(prereqs
		"(any-factp ((?student student)) (>= ?student:MC 80))"
	)
)

(lecture-time
	(code CS4880)
	(group Group1)
	(time 1 1830 2130)
	(venue COM2/108)
)

(module
	(code IS4100)
	(title "IT Project Management")
	(exam 2504PM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))
			(and
				(any-factp ((?module module)) (and (eq ?module:code IS1103) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code IS1105) (eq ?module:taken yes)))
			)
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS4254) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS4100)
	(group Group1)
	(time 4 12 14)
	(venue COM1/204)
)

(module
	(code IS4150)
	(title "Mobile and Ubiquitous Commerce")
	(exam 0305AM)
	(faculty SOC)
	(prereqs
		"(any-factp ((?module module)) (and (eq ?module:code IS2150) (eq ?module:taken yes)))"
	)
)

(lecture-time
	(code IS4150)
	(group Group1)
	(time 2 9 11)
	(venue COM1/212)
)

(module
	(code IS4203)
	(title "IT Adoption and Change Management")
	(exam 0405AM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS3253) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code IS3101) (eq ?module:taken yes)))
		)"
	)
)

(lecture-time
	(code IS4203)
	(group Group1)
	(time 3 9 12)
	(venue LT15)
)

(module
	(code IS4224)
	(title "Service Systems")
	(exam 3004AM)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS3361) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code IS3220) (eq ?module:taken yes)))
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS4361) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS4224)
	(group Group1)
	(time 2 16 18)
	(venue COM1/212)
)

(module
	(code IS4226)
	(title "IT Outsourcing and Offshoring Management")
	(exam 2504EVENING)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))
			(and
				(any-factp ((?module module)) (and (eq ?module:code IS1103) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code IS1105) (eq ?module:taken yes)))
			)
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS4255) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS4226)
	(group Group1)
	(time 3 1830 2030)
	(venue LT15)
)

(module
	(code IS4227)
	(title "Enterprise Service-Oriented Architecture")
	(exam 2604EVENING)
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS3361) (eq ?module:taken yes)))
			(any-factp ((?module module)) (and (eq ?module:code IS3220) (eq ?module:taken yes)))
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS4258) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS4227)
	(group Group1)
	(time 4 1830 2030)
	(venue LT15)
)

(module
	(code IS4243)
	(title "Information Systems Consulting")
	(faculty SOC)
	(prereqs
		"(or
			(any-factp ((?module module)) (and (eq ?module:code CS2250) (eq ?module:taken yes)))
			(and
				(any-factp ((?module module)) (and (eq ?module:code IS1103) (eq ?module:taken yes)))
				(any-factp ((?module module)) (and (eq ?module:code IS1105) (eq ?module:taken yes)))
			)
		)"
	)
	(preclus
		"(not
			(any-factp ((?module module)) (and (eq ?module:code CS4253) (eq ?module:taken yes)))
		)"		
	)
)

(lecture-time
	(code IS4243)
	(group Group1)
	(time 5 12 14)
	(venue COM1/206)
)
)
