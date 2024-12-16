;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Module Advisor System for SoC students
;; Developed By Project Group 07 (Part 2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Query Rules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; following rules that start with the
;; word 'ask' are query rules which are
;; used to obtain data from the user

;; the first rule to be fired when user
;; run the Module-Advisor-System
(defrule print-welcome-message
 =>
  (printout t crlf "Welcome to NUS Module Advisor System. I will ask for" crlf)
  (printout t "information about you and help you to generate a module" crlf)
  (printout t "timetable. You can quit anytime by entering 'Q' or 'q'." crlf)
  (bind ?ans (ask-user "Shall we begin?" yes-no))
  (if (eq ?ans "Y") then (assert (phase start))))

(defrule startup
  (phase start)
 =>
  (bind ?name (ask-user "What is your name?" text))
  (assert (student (name ?name)))
  (if (neq ?name "q") then (printout t crlf "Hello " (string-to-field ?name) "!" crlf)))

(defrule ask-matric-yr
  (phase start|modify-matric-yr)
  ?stud <- (student (name ?n) (matric-yr ?yr&0))
=>
  (bind ?yr (chk-range "In what year did you matriculate at NUS? (2007~09)" 2006 2010))
  (if (neq ?yr q) then
    (printout t crlf "You have entered [" ?yr "]." crlf) 
    (modify ?stud (matric-yr ?yr)))
)

(defrule ask-major
  (phase start|modify-major)
  ?stud <- (student (name ?n) (major ?m&nil))
=>
  (bind ?qn (str-cat "What is your major?" ?*crlf*))
  (bind ?qn (str-cat ?qn "1. Computer Science" ?*crlf*))
  (bind ?qn (str-cat ?qn "2. Information Systems" ?*crlf*))
  (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
  (bind ?ch (chk-range ?qn 0 3))
  (if (eq ?ch 1) then (modify ?stud (major CS)))
  (if (eq ?ch 2) then (modify ?stud (major IS)))
  (if (neq ?ch q) then 
	(printout t crlf "You have entered [" ?ch "]." crlf))
)

(defrule ask-fav-cs-subject
  (phase start|modify-fav-sub)
  ?stud <- (student (name ?n) (fav-sub ?f&nil) (major CS))
=>
  (bind ?*subject-p* FALSE)
  (bind ?qn (str-cat "Which computing subject do you like most?" ?*crlf*))
  (bind ?qn (str-cat ?qn "1. Programming Languages" ?*crlf*))
  (bind ?qn (str-cat ?qn "2. Software Engineering" ?*crlf*))
  (bind ?qn (str-cat ?qn "3. Computer Systems" ?*crlf*))
  (bind ?qn (str-cat ?qn "4. Artificial Intelligent" ?*crlf*))
  (bind ?qn (str-cat ?qn "5. Media & Games Development" ?*crlf*))
  (bind ?qn (str-cat ?qn "6. Algorithm & Theory" ?*crlf*))
  (bind ?qn (str-cat ?qn "7. None" ?*crlf*))
  (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
  (bind ?ch (chk-range ?qn 0 8))
  (bind ?sub "")
  (switch ?ch
  	(case 1 then (bind ?sub PL))
	(case 2 then (bind ?sub SE))
	(case 3 then (bind ?sub CS))
	(case 4 then (bind ?sub AI))
	(case 5 then (bind ?sub VC))
	(case 6 then (bind ?sub AL))
	(default (bind ?sub None)))
  (if (neq ?ch 7) then 
	(bind ?*subject-p* TRUE))
  (if (neq ?ch q) then 
	(printout t crlf "You have entered [" ?ch "]." crlf))
  (modify ?stud (fav-sub ?sub)))

(defrule ask-fav-is-subject
  (phase start|modify-fav-sub)
  ?stud <- (student (name ?n) (fav-sub ?f&nil) (major IS))
=>
  (bind ?*subject-p* FALSE)
  (bind ?qn (str-cat "Which computing subject do you like most?" ?*crlf*))
  (bind ?qn (str-cat ?qn "1. Management of Information Systems" ?*crlf*))
  (bind ?qn (str-cat ?qn "2. Business & Technology" ?*crlf*))
  (bind ?qn (str-cat ?qn "3. Software Engineering" ?*crlf*))
  (bind ?qn (str-cat ?qn "4. Information Security" ?*crlf*))
  (bind ?qn (str-cat ?qn "5. None" ?*crlf*))
  (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
  (bind ?ch (chk-range ?qn 0 6))
  (bind ?sub "")
  (switch ?ch
  	(case 1 then (bind ?sub MA))
	(case 2 then (bind ?sub BT))
	(case 3 then (bind ?sub SE))
	(case 4 then (bind ?sub IS))
	(default (bind ?sub None)))
  (if (neq ?ch 5) then 
	(bind ?*subject-p* TRUE))
  (if (neq ?ch q) then 
	(printout t crlf "You have entered [" ?ch "]." crlf))
  (modify ?stud (fav-sub ?sub)))

(defrule ask-mod-num
  (phase start|modify-mod-num)
  ?stud <- (student (name ?n) (mod-num ?m&0))
=>
  (bind ?num (chk-range "How many modules do you plan to take? (1~6)" 0 7))
  (if (neq ?num q) then
  (printout t crlf "You have entered [" ?num "]." crlf) 
  (modify ?stud (mod-num ?num)))
)

(defrule ask-free-day
  (phase start|modify-free-day)
  ?stud <- (student (name ?n) (free-day ?fd&0))
=>
  (bind ?*free-day* FALSE)
  (bind ?ans (ask-user "Do you want to keep a particular day free?" yes-no))
  (if (eq ?ans "Y") then
    (bind ?qn (str-cat "Which day?" ?*crlf*))
    (bind ?qn (str-cat ?qn "1. Monday" ?*crlf*))
    (bind ?qn (str-cat ?qn "2. Tuesday" ?*crlf*))
    (bind ?qn (str-cat ?qn "3. Wednesday" ?*crlf*))
    (bind ?qn (str-cat ?qn "4. Thursday" ?*crlf*))
    (bind ?qn (str-cat ?qn "5. Friday" ?*crlf*))
    (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
    (bind ?ch (chk-range ?qn 0 6))
    (bind ?*free-day* TRUE)
    (if (neq ?ch q) then 
	(printout t crlf "You have entered [" ?ch "]." crlf))
    (modify ?stud (free-day ?ch)))
  (if (eq ?ans "N") then 
	(printout t crlf "You have entered [NO]." crlf)
	(modify ?stud (free-day -1)))
)

(defrule ask-exam-preference
  (phase start|modify-no-exam)
  ?stud <- (student (name ?n) (no-exam ?no&nil))
=>
  (bind ?*exam-p* FALSE)
  (bind ?ans (ask-user "Do you prefer modules with no EXAM?" yes-no))
  (if (eq ?ans "Y") then (bind ?*exam-p* TRUE)
	(printout t crlf "You have entered [YES]." crlf)
	(modify ?stud (no-exam yes)))
  (if (eq ?ans "N") then
	(printout t crlf "You have entered [NO]." crlf) 
	(modify ?stud (no-exam no)))
)

(defrule ask-modules-taken
  (phase getmodules|modify-mc)
  ?stud <- (student (name ?n) (major ?maj) (MC ?m&-1))
 =>
  (bind ?qn (str-cat "What are the modules you have taken?" ?*crlf*))
  (bind ?qn (str-cat ?qn "1. Read from file" ?*crlf*))
  (bind ?qn (str-cat ?qn "2. None" ?*crlf*))
  (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
  (bind ?ch (chk-range ?qn 0 3))
  (if (eq ?ch 1) then  
    (bind ?file "") 
    (while (eq (open ?file input "r") FALSE)
      (if (neq ?file "") then (printout t crlf "Failed to open file." crlf))
      (bind ?file (ask-user "Enter file name: " text))
      (if (eq ?file "q") then (break)))
    (if (neq ?file "q") then
    (bind ?modCode (read input))
    (bind ?total 0)
    (bind ?modList (create$))
    (while (neq ?modCode EOF)
      (bind ?mc (read input))
      (bind ?total (+ ?total ?mc))
      (bind ?modList (insert$ ?modList 1 ?modCode))
      (do-for-fact ((?module module)) (eq ?module:code ?modCode) 
		    (modify ?module (taken yes)))
      (if (not (any-factp ((?module module)) (eq ?module:code ?modCode))) then
	(assert (module (code ?modCode) (taken yes))))
      (bind ?modCode (read input)))
  (close input)
  (printout t crlf "File read successfully." crlf)
  (modify ?stud (MC ?total) (modules-taken ?modList))))
  (if (eq ?ch 2) then
	(printout t crlf "You have entered [" ?ch "]." crlf)
	(modify ?stud (MC 28) (modules-taken (set-default-modules ?maj))))
)

(defrule ask-SU-credit
 (phase su-module)
 ?student <- (student (SU ?su&:(= ?su 13)))
=>
 (bind ?ans (chk-range "How many S/U credits have you used? (0~12)" -1 13))
 (if (neq ?ans q) then
   (printout t crlf "You have entered [" ?ans "]." crlf)
   (modify ?student (SU (- 13 1 ?ans)))
 )
) 

(defrule ask-grade
  (phase su-module)
=>
  (bind ?*grade* 0)
  (bind ?qn (str-cat "What is the grade of the module to S/U?" ?*crlf*))
  (bind ?qn (str-cat ?qn "1. A+/A" ?*crlf*))
  (bind ?qn (str-cat ?qn "2. A-" ?*crlf*))
  (bind ?qn (str-cat ?qn "3. B+" ?*crlf*))
  (bind ?qn (str-cat ?qn "4. B" ?*crlf*))
  (bind ?qn (str-cat ?qn "5. B-" ?*crlf*))
  (bind ?qn (str-cat ?qn "6. C+" ?*crlf*))
  (bind ?qn (str-cat ?qn "7. C" ?*crlf*))
  (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
  (bind ?ch (chk-range ?qn 0 8))
  (switch ?ch
  	(case 1 then (bind ?*grade* 5.0))
	(case 2 then (bind ?*grade* 4.5))
	(case 3 then (bind ?*grade* 4.0))
	(case 4 then (bind ?*grade* 3.5))
 	(case 5 then (bind ?*grade* 3.0))
	(case 6 then (bind ?*grade* 2.5))
	(default (bind ?*grade* 2.0)))
  (if (neq ?ch q) then 
	(printout t crlf "You have entered [" ?ch "]." crlf))
)

(defrule ask-mc
  (phase su-module)
=>
  (bind ?*mod-mc* 0)
  (bind ?ans (chk-range "What is the MC of the module to S/U? (2~8)" 1 9))
  (if (neq ?ans q) then 
	(printout t crlf "You have entered [" ?ans "]." crlf)
	(bind ?*mod-mc* ?ans))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Processing Rules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set the core modules for students
;; majoring in CS to type 'core'
(defrule cs-core-modules 
  (student(major CS))
  ?mod <- (module 
	  (code CS1101|CS1102|CS1105|CS2100|CS2102|
		CS2105|CS1231|CS2103|CS2106|CS3230|
		CS3212|CS3215|CS2301|MA1301|MA1521|
		MA1101R|ST2334|CS1101S|CS1102S)
	  (mod-type ?mod-type&~core))
 =>
  (modify ?mod (mod-type core)))

;; set the core modules for students
;; majoring in IS to type 'core'
(defrule is-core-modules 
  (student(major IS))
  ?mod <- (module 
	  (code CS1101|CS1102|CS1105|CS2100|CS2102|
		CS2105|CS1231|CS2261|CS2106|CS2250|
		CS3253|CS3214|CS2301|MA1301|ST2334|
		EC1301|ACC1002X|CS1101S|CS1102S)
	  (mod-type ?mod-type&~core))
 =>
  (modify ?mod (mod-type core)))

(defrule ma-modules "Management of Information Systems"
  (student(major IS))
  ?mod <- (module 
	  (code IS3243|IS4231|IS4225|IS4243|IS4100|
		IS4226|IS4240|IS4227|IS4203)
	  (mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area MA) (mod-type elective)))

(defrule bt-modules "Business & Technology"
  (student(major IS))
  ?mod <- (module 
	  (code IS3105|IS3221|IS3240|IS3241|IS4260|
		IS3222|IS3223|IS4224|IS3220)
	  (mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area BT) (mod-type elective)))

(defrule sm-modules "Software Engineering"
  (student(major IS))
  ?mod <- (module 
	  (code IS2102|IS2104|CS3215|IS3242|
		IS4202|IS4102|CS2103)
	  (mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area SE) (mod-type elective)))

(defrule is-modules "Information Security"
  (student(major IS))
  ?mod <- (module 
	  (code IS4231|IS4232|IS3230|CS3235|
		IS4232|CS4252|CS4259)
	  (mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area IS) (mod-type elective)))

(defrule ai-modules "artificial intelligence"
  (student(major CS))
  ?mod <- (module 
	  (code CS3243|CS3244|CS3245|CS4241|CS4243|
		CS4244|CS4246|CS4248|CS4347)
  	  (mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area AI) (mod-type elective)))

(defrule se-modules "software engineering"
  (student(major CS))
  ?mod <- (module 
	  (code CS3213|CS3201|CS3202|CS3216|CS3281|
		CS3282|CS4211|CS4217|CS4213|IS2103|
		IS2102|IS2104|CS4101|IS3102)
	(mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area SE) (mod-type elective)))

(defrule pl-modules "programming languages"
  (student(major CS))
  ?mod <- (module
	 (code CS2104|CS3210|CS3211|CS3212|CS4212| 
		CS2281|CS4214|CS4215|CS4216)
	(mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area PL) (mod-type elective)))

(defrule db-modules "computer systems"
  (student(major CS))
  ?mod <- (module
	 (code CS2220|CS3103|CS3103L|CS3220| 
		CS3221|CS3223|CS3225|CS4220|
		CS4221|CS4222|CS4223)
	(mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area CS) (mod-type elective))) 

(defrule algo-modules "algorithms & theory"
  (student(major CS))
  ?mod <- (module
	  (code CS3231|CS3233|CS3234|CS3235|
		CS4231|CS4235|CS4236|CS4237|
		MA3219|MA4207)
	(mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area AL) (mod-type elective))) 

(defrule vc-modules "visual computing"
  (student(major CS))
  ?mod <- (module 
	  (code CS3240|CS3241|CS3246|CS3248|CS3249| 
		CS3343|CS4201|CS4202|CS4203|CS4204| 
		CS4240|CS4245|CS4247|CS4249|CS4340| 
		CS4342|CS4343|CS4344|CS4345|CS4346|
		CS4348|CS4349 )
	(mod-type ?mod-type&~elective))
 =>
  (modify ?mod (focus-area VC) (mod-type elective)))

;; stop the application when user enters
;; 'q' or 'Q' at any prompt 
(defrule quit-system
 (declare (salience 2))
 (quit-sys)
=>
 (reset)
 (printout t crlf "Good bye!" crlf crlf)
 (halt))

;; set the allowed status of the modules
;; to 'yes' if their prerequisites and
;; preclusions are met
(defrule allow-modules
  (phase updatemodules)
  ?module <- (module (code ?c) (prereqs ?pq) (preclus ?pc) (allowed no))
=>
  (if (and (eval ?pq) (eval ?pc)) then
  (modify ?module (allowed yes))))

;; selects a set of modules for the user to take. 
;; Module to be selected must be allowed, and
;; 1) No exam clash with current module selection
;; 2) No timetable clash with current module selection
;; 3) Hard and soft constraints must be met
(defrule select-modules
  (phase ?mod-type)
  ?student <- (student (fav-sub ?fs) (free-day ?fd) (mod-num ?mn) 
			(mod-counter ?mc&:(< ?mc ?mn)))
  ?module <- (module (code ?code) (focus-area ?fa) (mod-type ?mod-type) 
			(exam ?exam) (taken no) (allowed yes))
  (not (exists (timetable (exam ?exam))))
  ?lecture-time <-(lecture-time (code ?code) (group ?group) 
				(time ?day ?start ?end) (venue ?venue))
  (not (exists 
	(timetable
	   (lecture ?day ?tbstart ?tbend&:(not (or (> ?start ?tbend) (< ?end ?tbstart))))
	)))
=>
 (bind ?r1 TRUE)
 (if (neq ?*free-day* FALSE) then (bind ?r1 (neq ?day ?fd)))
 (if (and (not (subsetp (create$ ?code) ?*blacklist*)) (eq ?r1 TRUE)) then
  (bind ?r2 (eq ?exam nil))
  (bind ?r3 (eq ?fs ?fa))
  (if (are-constraints-met ?r2 ?r3) then
    (assert (timetable (code ?code) (group ?group) (venue ?venue) (exam ?exam) 
		       (lecture ?day ?start ?end)))
    (modify ?student (mod-counter (+ ?mc 1)))
   else
     ; try the alternatives that fail the soft constraints earlier
     (if (eq ?*fail-soft-con* TRUE) then 
	(assert (timetable (code ?code) (group ?group) (venue ?venue) (exam ?exam) 
			   (lecture ?day ?start ?end)))
	(modify ?student (mod-counter (+ ?mc 1))))
  ))
)

;; Provide feedback to user on current module selection
(defrule print-timetable-info
  ?phase <- (phase print-timetable-info)
  (student (name ?name) (fav-sub ?fs) 
	(mod-num ?num) (mod-counter ?count))
=>
  (retract ?phase)
  (bind ?list1 (create$))
  (bind ?list2 (create$))
  (bind ?m1 (str-cat ?*crlf* "Sorry, " (string-to-field ?name)))  
  (bind ?m1 (str-cat ?m1 ". I'm only able to get you " ?count " module(s) at the moment." ?*crlf*))
  (bind ?m2 (str-cat ?*crlf* "Module(s) with no examination: "))
  (bind ?m3 (str-cat ?*crlf* "Module(s) that match your subject preference: "))
  (do-for-all-facts ((?tb timetable)) TRUE
     (do-for-fact ((?mod module)) (eq ?mod:code ?tb:code) 
	 (if (eq ?mod:exam nil) then (bind ?list1 (insert$ ?list1 1 ?tb:code)))
	 (if (eq ?mod:focus-area ?fs) then (bind ?list2 (insert$ ?list2 1 ?tb:code)))
      ) 
   )
  (if (< ?count ?num) then (printout t ?m1))
  (if (and (eq ?*exam-p* TRUE) (> (length$ ?list1) 0)) then 
	(printout t ?m2 (implode$ ?list1) ?*crlf*))
  (if (and (eq ?*subject-p* TRUE) (> (length$ ?list2) 0)) then 
  	(printout t ?m3 (implode$ ?list2) ?*crlf*))
  (assert (phase clear-timetable))
)

(defrule advise-su
 (phase advise-su)
 ?student <- (student (SU ?su) (MC ?mc))
=>
 (if (< ?su ?*mod-mc*) then 
  (printout t ?*crlf* "You do not have sufficient credits to S/U the module." ?*crlf*)
  else
   (bind ?sem (div (- 160 ?mc) 20))
   (if (eq ?sem 1) then
     (printout t ?*crlf* "You should S/U the module as this is your final semester." ?*crlf*)
     (return))
  else
   (if (eq ?*grade* 5.0) then
     (printout t ?*crlf* "You should not S/U the module as you have attained the maximum grade for it." ?*crlf*)
     (return))
  else
    (bind ?incr (/ (* (- 5 ?*grade*) ?*mod-mc*) ?mc))
    (if (>= ?incr 0.05) then
      (printout t ?*crlf* "You should S/U the module as it will increase your CAP by at least 0.05." ?*crlf*)
     else
      (printout t ?*crlf* "You should not S/U the module as it does not improve your CAP much." ?*crlf*))
 )
   
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; timetable construction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule clear-timetable-pieces
	(phase clear-timetable)
	?timetable-piece <- (timetable-piece)
	=>
	(retract ?timetable-piece))

;; Initialize timetable skeleton
(defrule initialize-timetable-pieces
	(phase init-timetable)
	=>
	(loop-for-count (?day-index 1 6) do
		(loop-for-count (?hour-index 8 20) do
			(assert (timetable-piece (coord ?day-index ?hour-index)))
		)	
	)
)

;; Populate timetable with lecture data
(defrule construct-timetable-pieces
	(phase construct-timetable)
	(timetable (code ?code) (lecture ?day ?start ?end) (venue ?venue))
	=>
	;; type 1 -- proper-time start
	(bind ?duration (- ?end ?start))
	(do-for-fact
		((?pie1 timetable-piece))
		(subsetp (create$ ?day ?start) ?pie1:coord)
		(modify ?pie1 (code ?code) (venue ?venue) (ptype 1))
	)

	;; type 2 -- proper-time body
	(loop-for-count (?row-index (+ ?start 1) (- ?end 1))
		(do-for-fact
			((?pie2 timetable-piece))
			(subsetp (create$ ?day ?row-index) ?pie2:coord)
			(modify ?pie2 (code ?code) (venue ?venue) (ptype 2))
		)
	)
	
	(bind ?ipstart (div (- ?start 30) 100))
	(bind ?ipend (div (- ?end 30) 100))
	;; type 4 -- improper-time start
	(do-for-fact
		((?pie4 timetable-piece))
		(subsetp (create$ ?day ?ipstart) ?pie4:coord)
		(modify ?pie4 (code ?code) (venue ?venue) (ptype 4))
	)
	
	;; type 5 -- improper-time body
	(loop-for-count (?row-index1 (+ ?ipstart 1) (- ?ipend 1))
		(do-for-fact
			((?pie5 timetable-piece))
			(subsetp (create$ ?day ?row-index1) ?pie5:coord)
			(modify ?pie5 (code ?code) (venue ?venue) (ptype 5))
		)
	)
	
	;; type 6 -- improper-time end
	(do-for-fact
		((?pie6 timetable-piece))
		(subsetp (create$ ?day ?ipend) ?pie6:coord)
		(modify ?pie6 (code ?code) (venue ?venue) (ptype 6))
	)
)

;; print the constructed timetable
(defrule print-timetable
   (phase print-timetable)
 =>
   (printout t "" crlf)
   ;; Header
   (printout t "|-------|------------|------------|------------|------------|------------|------------|" crlf)
   (printout t "|       |     MON    |     TUE    |     WED    |     THU    |     FRI    |     SAT    |" crlf)
   (printout t "|-------|------------|------------|------------|------------|------------|------------|" crlf)
	
   ;; Body
   (loop-for-count (?row-index 8 20) do
	(loop-for-count (?row-sub-index 1 3) do
	;; draw first column
	(switch ?row-sub-index
		(case 1 then
			(if (< ?row-index 10)
				then (printout t "| 0"?row-index ":00 |")
				else (printout t "| " ?row-index ":00 |")
			)
		)
		(default
			(printout t "|       |")
		)
	)

	;; draw timetable content
    (loop-for-count (?day-index 1 6) do
	(do-for-fact
		((?pie timetable-piece))
		(subsetp (create$ ?day-index ?row-index) ?pie:coord)
		
		;; create left/right spaces
		(bind ?code-rspace-length (- 9 (str-length ?pie:code)))
		(bind ?venue-lspace-length (- 9 (str-length ?pie:venue)))
		
		(bind ?code-rspace "")
		(loop-for-count (?idx 1 ?code-rspace-length) do
			(bind ?code-rspace (str-cat ?code-rspace " "))
		)
		
		(bind ?venue-lspace "")
		(loop-for-count (?idx1 1 ?venue-lspace-length) do
			(bind ?venue-lspace (str-cat ?venue-lspace " "))
		)
		
		;; draw depending on type			
		(switch ?pie:ptype
			(case 1 then
				(switch ?row-sub-index
					(case 1 then (printout t "------------"))
					(case 2 then (printout t " "?pie:code"-L"?code-rspace))
					(case 3 then (printout t ?venue-lspace"("?pie:venue") "))
				)
			)
			(case 2 then
				(switch ?row-sub-index
					(case 1 then (printout t "            "))
					(case 2 then (printout t " "?pie:code"-L"?code-rspace))
					(case 3 then (printout t ?venue-lspace"("?pie:venue") "))
				)
			)
			(case 4 then
				(switch ?row-sub-index
					(case 1 then (printout t "            "))
					(case 2 then (printout t "------------"))
					(case 3 then (printout t " "?pie:code"-L"?code-rspace))
				)
			)
			(case 5 then
				(switch ?row-sub-index
					(case 1 then (printout t ?venue-lspace"("?pie:venue") "))
					(case 2 then (printout t "            "))
					(case 3 then (printout t " "?pie:code"-L"?code-rspace))
				)
			)
			(case 6 then
				(switch ?row-sub-index
					(case 1 then (printout t ?venue-lspace"("?pie:venue") "))
					(case 2 then (printout t "------------"))
					(case 3 then (printout t "            "))
				)
			)
			(default 
				(switch ?row-sub-index
					(case 1 then (printout t "------------"))
					(case 2 then (printout t "            "))
					(case 3 then (printout t "            "))
				)
			)
		)
	)
	(printout t "|")
    )
    (printout t "" crlf)
  )
)
   ;; Footer
   (printout t "|-------|------------|------------|------------|------------|------------|------------|" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flow Control Rules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Transition from getting user information 
;; to retrieving user's past modules
(defrule start-getmodules
  (declare (salience -10))
  ?phase <- (phase start)
=>
  (retract ?phase)
  (assert (phase getmodules)))

;; Update modules based on pre-requisite 
;; and pre-clusion checks
(defrule getmodules-updatemodules
  (declare (salience -10))
  ?phase <- (phase getmodules)
=>
  (retract ?phase)
  (assert (phase updatemodules)))

;; Select core modules with soft constraints
(defrule updatemodules-selectcoreWcons
  (declare (salience -10))
  ?phase <- (phase updatemodules)
=>
  (retract ?phase)
  (assert (phase core)))

;; Select electives with soft constraints
(defrule selectcoreWcons-selectelectiveWcons
  (declare (salience -10))
  ?phase <- (phase core)
  (test (eq ?*fail-soft-con* FALSE))
=>
  (retract ?phase)
  (assert (phase elective)))

;; Select breadth with soft constraints
(defrule selectelectiveWcons-selectbreadthWcons
  (declare (salience -10))
  ?phase <- (phase elective)
  (test (eq ?*fail-soft-con* FALSE))
=>
  (retract ?phase)
  (assert (phase breadth)))

;; If the user does not specify any soft constraints, 
;; then module selection is done and transition to 
;; main menu. Otherwise go through module selection again
;; without soft constraints.
(defrule selectbreadthWcons-selectcore
  (declare (salience -10))
  ?phase <- (phase breadth)
  (student (name ?name))
  (test (eq ?*fail-soft-con* FALSE))
=>
  (retract ?phase)
  (if (or (neq ?*exam-p* FALSE) (neq ?*subject-p* FALSE)) then
    (bind ?*fail-soft-con* TRUE)
    (assert (phase core))
   else
     (if (eq ?*first-run* TRUE) then
	(bind ?*first-run* FALSE)
	(printout t ?*crlf* "Hi " (string-to-field ?name) 
		", I've constructed the following timetable for you:" ?*crlf*)
	(assert (phase print-timetable-info))
      else
	(assert (phase print-main-menu))
      )
  ))

(defrule selectcore-selectelective
  (declare (salience -10))
  ?phase <- (phase core)
  (test (eq ?*fail-soft-con* TRUE))
=>
  (retract ?phase)
  (assert (phase elective)))

(defrule selectelective-selectbreadth
  (declare (salience -10))
  ?phase <- (phase elective)
  (test (eq ?*fail-soft-con* TRUE))
=>
  (retract ?phase)
  (assert (phase breadth)))

;; After module selection, print timetable for user
(defrule selectbreadth-printmenu
  (declare (salience -10))
  ?phase <- (phase breadth)
  (student (name ?name))
  (test (eq ?*fail-soft-con* TRUE))
=>
  (retract ?phase)
  (bind ?*fail-soft-con* FALSE)
  (if (eq ?*first-run* TRUE) then
    (bind ?*first-run* FALSE)
    (printout t ?*crlf* "Hi " (string-to-field ?name) 
	", I've constructed the following timetable for you:" ?*crlf*)
    (assert (phase print-timetable-info))
   else
    (assert (phase print-main-menu))
  )
)

;; Control rule to transition to the edit profile phase, 
;; whenever a 'modify' phase has been asserted
(defrule modify-profile-control
  (declare (salience -10))
  ?phase <- (phase modify-fav-sub|modify-no-exam|
		modify-free-day|modify-mc|modify-mod-num)
  =>
  (retract ?phase)
  (assert (phase edit-profile))
)

;; Initialize timetable after it has been cleared
(defrule clear-timetable-init-timetable
  (declare (salience -10))
  ?phase <- (phase clear-timetable)
  =>
  (retract ?phase)
  (assert (phase init-timetable)))

;; Construct timetable layout
(defrule init-timetable-construct-timetable
  (declare (salience -10))
  ?phase <- (phase init-timetable)
  =>
  (retract ?phase)
  (assert (phase construct-timetable)))

;; Print timetable
(defrule construct-timetable-print-timetable
  (declare (salience -10))
  ?phase <- (phase construct-timetable)
  =>
  (retract ?phase)
  (assert (phase print-timetable)))

;; Transition back to main menu after printing timetable
(defrule print-timetable-print-main-menu
  (declare (salience -10))
  ?phase <- (phase print-timetable)
  =>
  (retract ?phase)
  (assert (phase print-main-menu)))

(defrule su-mod-advise-su
  (declare (salience -10))
  ?phase <- (phase su-module)
  =>
  (retract ?phase)
  (assert (phase advise-su)))

(defrule advise-su-print-main-menu
  (declare (salience -10))
  ?phase <- (phase advise-su)
  =>
  (retract ?phase)
  (assert (phase print-main-menu)))

;; Handles the display of the main menu to the user.  
;; Will assert the appropriate phase based on user input
(defrule print-menu
  ?phase <- (phase print-main-menu)
 =>
  (retract ?phase)
  (bind ?qn (str-cat "********************************" ?*crlf*))
  (bind ?qn (str-cat ?qn "Module-Advisor-System Main Menu" ?*crlf* ?*crlf*))
  (bind ?qn (str-cat ?qn " 1. Edit your profile" ?*crlf*))
  (bind ?qn (str-cat ?qn " 2. Review timetable" ?*crlf*))
  (bind ?qn (str-cat ?qn " 3. To S/U or not to S/U?" ?*crlf*))
  (bind ?qn (str-cat ?qn " 4. Run advisement again" ?*crlf*))
  (bind ?qn (str-cat ?qn " 5. Exit" ?*crlf* ?*crlf*))
  (bind ?qn (str-cat ?qn "********************************" ?*crlf*))
  (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
  (bind ?ch (chk-range ?qn 0 6))
  (switch ?ch
	(case 1 then (assert (phase edit-profile)))
	(case 2 then (assert (phase print-timetable-info)))
	(case 3 then
		(do-for-fact ((?stud student)) TRUE (modify ?stud (SU 13))) 
		(assert (phase su-module)))
	(case 4 then (reset))
	(case 5 then (assert (quit-sys))))
)

;; prints out a sub-menu that allows the users to 
;; edit the information he had entered previously
(defrule edit-profile
  ?phase <- (phase edit-profile)
  ?student <- (student (fav-sub ?fs) (free-day ?fd) (mod-num ?mn) 
	      (no-exam ?ne) (modules-taken $?mts) 
	     (mod-counter ?moc) (major ?maj))
=>
 (retract ?phase)
 (bind ?out "")
 (bind ?qn (str-cat "1. Edit number of modules to take [" ?mn "]" ?*crlf*))
 (do-for-fact ((?tb timetable)) TRUE (bind ?out ?tb:code))
 (if (> ?mn 1) then (bind ?out (str-cat ?out " ...")))
 (bind ?qn (str-cat ?qn "2. Edit modules to take [" ?out "]" ?*crlf*))
 (if (> (length$ ?mts) 0) then (bind ?out (str-cat (nth$ 1 $?mts) " ...")) 
		else (bind ?out None))
 (bind ?qn (str-cat ?qn "3. Edit modules taken [" ?out "]" ?*crlf*))
 (bind ?out ?fs)
 (if (eq ?maj CS) then
   (switch ?fs
	(case PL then (bind ?out "Programming Languages"))
	(case SE then (bind ?out "Software Engineering"))
	(case CS then (bind ?out "Computer Systems"))
	(case AI then (bind ?out "Artificial Intelligent"))
	(case VC then (bind ?out "Media & Games Development"))
	(case AL then (bind ?out "Algorithm & Theory")))
  else
    (switch ?fs
	(case MA then (bind ?out "Management of Information Systems"))
	(case BT then (bind ?out "Business & Technology"))
	(case SE then (bind ?out "Software Engineering"))
	(case IS then (bind ?out "Information Security"))))
 (bind ?qn (str-cat ?qn "4. Edit subject preference [" ?out "]" ?*crlf*))
 (bind ?qn (str-cat ?qn "5. Edit exam preference [" (upcase ?ne) "]" ?*crlf*))
 (switch ?fd
	(case 1 then (bind ?out Monday))
	(case 2 then (bind ?out Tuesday))
	(case 3 then (bind ?out Wednesday))
	(case 4 then (bind ?out Thursday))
	(case 5 then (bind ?out Friday))
	(default (bind ?out None)))
 (bind ?qn (str-cat ?qn "6. Edit day to keep free [" ?out "]" ?*crlf*))
 (if (> (length$ ?*blacklist*) 0) then (bind ?out (str-cat (nth$ 1 ?*blacklist*) " ...")) 
		else (bind ?out None))
 (bind ?qn (str-cat ?qn "7. Clear removed modules [" ?out "]" ?*crlf*))
 (bind ?qn (str-cat ?qn "8. Back to Main Menu" ?*crlf*))
 (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
 (bind ?ch (chk-range ?qn 0 9))
 (switch ?ch
	(case 1 then (modify ?student (mod-num 0))
		(assert (phase modify-mod-num)))
	(case 2 then (assert (phase edit-modules)))
	(case 3 then (modify ?student (MC -1) (modules-taken))
		(do-for-all-facts ((?mod module)) 
				(or (eq ?mod:taken yes) (eq ?mod:allowed yes)) 
				(modify ?mod (taken no) (allowed no)))
		(assert (phase modify-mc))) 
	(case 4 then (modify ?student (fav-sub nil))
		(assert (phase modify-fav-sub)))
	(case 5 then (modify ?student (no-exam nil))
		(assert (phase modify-no-exam)))
	(case 6 then (modify ?student (free-day 0))
		(assert (phase modify-free-day)))
	(case 7 then 
		(bind ?*blacklist* (create$))
		(printout t crlf "Removed modules cleared." crlf)
		(assert (phase edit-profile)))
	(case 8 then 
		(do-for-all-facts ((?tb timetable)) TRUE (retract ?tb))
		(modify ?student (mod-counter 0))
		(assert (phase updatemodules))))
) 

;; Allows the user to remove the modules which the 
;; advisor has already chosen. Removed modules will 
;; be placed into a 'blacklist' and will not be considered
;; in future selection unless removed by the user.
(defrule edit-modules
 ?phase <- (phase edit-modules)
 ?student <- (student (mod-counter ?num))
=>
 (retract ?phase)
 (bind ?count 1)
 (bind ?list (create$))
 (bind ?title "")
 (bind ?qn (str-cat "Remove which module?" ?*crlf*))
 (do-for-all-facts ((?tb timetable)) TRUE
   (do-for-fact ((?mod module)) (eq ?mod:code ?tb:code) (bind ?title ?mod:title)) 
   (bind ?qn (str-cat ?qn ?count ". " ?tb:code ": " ?title ?*crlf*))
   (bind ?list (insert$ ?list ?count ?tb))
   (bind ?count (+ ?count 1))	
 )
 (bind ?qn (str-cat ?qn ?count ". Back to Main Menu" ?*crlf*))
 (bind ?count (+ ?count 1))
 (bind ?qn (str-cat ?qn ?*crlf* "Enter choice: "))
 (bind ?ch (chk-range ?qn 0 ?count))
 (if (eq ?ch (- ?count 1))
 then
 (do-for-all-facts ((?tb timetable)) TRUE (retract ?tb))
 (modify ?student (mod-counter 0))
 (assert (phase updatemodules))
 else
 (if (neq ?ch q) then
 (bind ?remove (nth$ ?ch ?list))
 ; insert the module into the blacklist
 (bind ?*blacklist* (insert$ ?*blacklist* 1 (fact-slot-value ?remove code)))
 (retract ?remove)
 (modify ?student (mod-counter (- ?num 1)))
 (assert (phase edit-modules))))
)
