(defvar *lines* (uiop:read-file-lines "input"))
(reduce #'+ (loop for i in *lines* collect
		(parse-integer
			(concatenate 'string
				(first (cl-ppcre:all-matches-as-strings '(:GREEDY-REPETITION 1 1 :DIGIT-CLASS) i))
				(car (last (cl-ppcre:all-matches-as-strings '(:GREEDY-REPETITION 1 1 :DIGIT-CLASS) i)))))))
