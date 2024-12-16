@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET Search_Path=%1

FOR /F "tokens=1,2,3,4,5,6,7,8,9* delims=," %%a IN ('TYPE %Search_Path%') DO (
	::Module
	ECHO (module
	IF NOT %%a==- (ECHO 	(code %%a^))
	IF NOT %%b==- (ECHO 	(title "%%b"^))
	IF NOT %%c==4 (ECHO 	(MC %%c^))
	IF NOT %%d==- (ECHO 	(exam %%d^))
	IF NOT %%e==- (ECHO 	(faculty %%e^))
	::prereqs
	IF NOT %%h==- (
		ECHO 	(prereqs
		FOR /F "tokens=1,2,3,4,5,6,7,8,9*" %%i IN ("%%h") DO (
			IF NOT [%%j]==[] (
				ECHO 		"(and
				FOR %%s IN (%%i %%j %%k %%l %%m %%n) DO (
					IF NOT [%%s]==[] (
						::Handle OR
						ECHO %%s | FIND "/" > NUL
						IF !ERRORLEVEL!==0 (
							ECHO 			(or
							FOR /F "tokens=1,2,3,4,5,6,7,8,9* delims=/" %%t IN ("%%s") DO (
								FOR %%O IN (%%t %%u %%v %%w %%x %%y %%z) DO (
									IF NOT [%%O]==[] (
										ECHO 				(any-factp ((?module module^)^) (and (eq ?module:code %%O^) (eq ?module:taken yes^)^)^)
									)
								)
							)
							ECHO 			^)
						) ELSE (
							ECHO 			(any-factp ((?module module^)^) (and (eq ?module:code %%s^) (eq ?module:taken yes^)^)^)
						)
					)
				)
				ECHO 		^)"
			) ELSE (
				::Handle OR
				ECHO %%i | FIND "/" > NUL
				IF !ERRORLEVEL!==0 (
					ECHO 		"(or
					FOR /F "tokens=1,2,3,4,5,6,7,8,9* delims=/" %%t IN ("%%i") DO (
						FOR %%O IN (%%t %%u %%v %%w %%x %%y %%z) DO (
							IF NOT [%%O]==[] (
								ECHO 			(any-factp ((?module module^)^) (and (eq ?module:code %%O^) (eq ?module:taken yes^)^)^)
							)
						)
					)
					ECHO 		^)"
				) ELSE (
					ECHO 		"(any-factp ((?module module)) (and (eq ?module:code %%i) (eq ?module:taken yes)))"
				)
			)
		)
		ECHO 	^)
	)
	::preclus
	IF NOT %%i==- (
		ECHO 	(preclus
		ECHO 		"(not
		FOR /F "tokens=1,2,3,4,5,6,7,8,9* delims=/" %%i IN ("%%i") DO (
			IF NOT [%%j]==[] (
				ECHO 			(or
				FOR %%s IN (%%i %%j %%k %%l %%m %%n %%o %%p %%r) DO (
					IF NOT [%%s]==[] (
						ECHO 				(any-factp ((?module module^)^) (and (eq ?module:code %%s^) (eq ?module:taken yes^)^)^)
					)
				)
				ECHO 			^)
			) ELSE (
				ECHO 			(any-factp ((?module module^)^) (and (eq ?module:code %%i^) (eq ?module:taken yes^)^)^)
			)
		)
		ECHO 		^)"		
		ECHO 	^)
	)
		
	ECHO ^)
	ECHO.

	:: Lecture
	ECHO "%%g" | FIND "/" > NUL
	
	IF !ERRORLEVEL! == 0 (
		FOR /F "tokens=1,2,3,4,5,6,7,8,9* delims=/" %%i IN ("%%g") DO (
			FOR %%t IN ("%%i" "%%j") DO	(
				IF NOT [%%t]==[] (
					ECHO (lecture-time
					ECHO 	(code %%a^)
					FOR /F "tokens=1*" %%A IN (%%t) DO (
						ECHO 	(group %%A^)
						ECHO 	(time %%B^)
						ECHO 	(venue %%f^)
					)
					ECHO ^)
					ECHO.
				)
			)
		)
	) ELSE (
		ECHO (lecture-time
		ECHO 	(code %%a^)
		FOR /F "tokens=1*" %%A IN ("%%g") DO (
			ECHO 	(group %%A^)
			ECHO 	(time %%B^)
			ECHO 	(venue %%f^)
		)
		ECHO ^)
		ECHO.
	)
)

ENDLOCAL
EXIT /b
