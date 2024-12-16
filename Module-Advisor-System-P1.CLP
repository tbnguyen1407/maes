;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Module Advisor System for SoC students
;; Developed By Project Group 07 (Part 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Module MAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defglobal ?*crlf* ="
")

(defglobal ?*subject-p* = FALSE) ;; subject preference, soft constraint
(defglobal ?*exam-p* = FALSE) ;; exam preference, soft constraint
(defglobal ?*free-day* = FALSE) ;; keep a particular day free, hard constraint
(defglobal ?*fail-soft-con* = FALSE) ;; fail soft constraints

(defglobal ?*blacklist* = (create$)) ;; to keep track a list of removed modules

(defglobal ?*first-run* = TRUE) ; for first time displaying the timetable

(defglobal ?*grade* = 0) ; grade of the module to be SU
(defglobal ?*mod-mc* = 0) ; mc of the module to be SU

(deftemplate student
  (slot name (type STRING))
  (slot matric-yr (type INTEGER))
  (slot major (type SYMBOL) 
	(allowed-values CS IS nil)
	(default nil))
  (slot fav-sub (type SYMBOL))
  (slot SU (type INTEGER) (default 13))
  (slot mod-num (type INTEGER))
  (slot MC (type INTEGER) (default -1))
  (slot no-exam (type SYMBOL))
  (slot free-day (type INTEGER))
  (multislot modules-taken (type SYMBOL)) 
  (slot mod-counter (type INTEGER) (default 0)))

(deftemplate module
  (slot code (type SYMBOL))
  (slot title (type STRING))
  (slot MC (type INTEGER) (default 4))
  (slot exam (type SYMBOL)) 
  (slot faculty (type SYMBOL))
  (slot prereqs (type STRING) (default "TRUE"))
  (slot preclus (type STRING) (default "TRUE"))
  (slot mod-type (type SYMBOL)(default breadth)) ;; core, elective, breadth
  (slot focus-area (type SYMBOL)) ;; for SOC modules 
  (slot allowed (allowed-values yes no) (default no))
  (slot taken (type SYMBOL) (default no))) 

(deftemplate lecture-time
 (slot code (type SYMBOL))
 (slot group (type SYMBOL))
 (slot venue (type SYMBOL) (default TBA))
 (multislot time (type INTEGER)))

(deftemplate timetable
  (slot code (type SYMBOL) (default NIL))
  (slot group (type SYMBOL) (default NIL))
  (multislot title (type SYMBOL) (default NIL))
  (slot exam (type SYMBOL) (default NIL))
  (multislot lecture (type INTEGER))
  (slot venue (type SYMBOL) (default NIL)))

;; One hour period per day
(deftemplate timetable-piece
	(slot code (type SYMBOL))
	(slot venue (type SYMBOL))
	(slot ptype (type INTEGER))
	(multislot coord (type INTEGER))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; check the type of input provided by the
;; user, return true if the input type matches
;; the expected type of the input
(deffunction is-of-type (?ans ?type)
  (if (eq ?type yes-no) then
    (return (or (eq ?ans "Y") (eq ?ans "N") (eq ?ans "Q")))
    else (if (eq ?type integer) then
         (return (integerp (string-to-field ?ans))))
    else (return (> (str-length ?ans) 0))))

;; displays the question to the user
;; and check the type of the input provided
;; the user
(deffunction ask-user (?qn ?type)
  (bind ?ans "")
  (while (not (is-of-type ?ans ?type))
   (printout t crlf ?qn " ")
   (if (eq ?type yes-no) then
 	(printout t "(Y or N) "))
   (bind ?ans (upcase (readline)))
   (if (eq ?ans "Q") then (assert (quit-sys)) (return "q")))
  (return ?ans))

;; check if the numeric input falls within
;; the valid range specify by start and end
;; indexes
(deffunction chk-range (?qn ?start ?end)
  (bind ?in (- ?start 1))
  (while (not (and (> ?in ?start) (< ?in ?end)))
    (bind ?in (ask-user ?qn integer))
    (bind ?in (string-to-field ?in))
    (if (eq ?in q) then (break)))
  (return ?in))

;; check if the exam and subject preferences 
;; are met 
(deffunction are-constraints-met (?exam ?fav)

  (bind ?r2 (eq ?*exam-p* FALSE)) ;; for exam preference constraint
  (if (eq ?*exam-p* TRUE) then
     (bind ?r2 ?exam)) 
  (bind ?r3 (eq ?*subject-p* FALSE)) ;; for subject preference constraint
  (if (eq ?*subject-p* TRUE) then
     (bind ?r3 ?fav)) 
  
  (if (and (neq ?*subject-p* FALSE) (neq ?*exam-p* FALSE)) then
  	(bind ?r2 (or ?r2 ?r3))
   else (bind ?r2 (and ?r2 ?r3)))

  (return ?r2)
)
;; add a list of default modules for
;; the user if he selects 'none' when 
;; he is asked to provide a list of 
;; modules taken
(deffunction set-default-modules (?major)
  (bind ?modList 
	(create$ CS1101 CS1105 MA1301 CS1102 CS1231 CS2100 CS2103))
  (if (eq ?major IS) then
    (bind ?modList 
	(create$ CS1101 CS1105 MA1301 CS1102 CS1231 CS2250 CS2261)))
  (bind ?mod-taken ?modList)
  (while (> (length$ ?modList) 0)
    (bind ?modCode (nth$ 1 ?modList))
    (do-for-fact ((?module module)) (eq ?module:code ?modCode) 
		(modify ?module (taken yes)))
    (if (not (any-factp ((?module module)) (eq ?module:code ?modCode))) then
     	(assert (module (code ?modCode) (taken yes))))
    (bind ?modList (delete$ ?modList 1 1)))
  (return ?mod-taken)
)