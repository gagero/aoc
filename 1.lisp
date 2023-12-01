(defvar *lines* (uiop:read-file-lines "input"))
(let ((first 0) (last 0) (temp "") (temp-num 0))
	 (loop for i in *lines* do
	   (loop for c across i do
	     (if (parse-integer (string c) :junk-allowed t)
		 (setf temp (concatenate 'string temp (string c)))
		 (setf temp ""))
	     (if (string/= temp "")
		 (setf temp-num (parse-integer temp))
		 (progn
		   (when (not first)
		     (setf first temp-num))
		   (setf last temp-num))))
	       collecting (+ first last)))
