(setf *random-state* (make-random-state t))

(defvar data nil)

(setf data (loop repeat 1000 collect (random 10)))

(defvar series_length)
(defvar result)

(setf result nil)
(setf series_length 10)
;(setf data '(5  0  8  7  9  5  3  7  4  2  9  3  5  6  7  0  2  4  9  2  8  7  9  1  3  6  2  8  6  1  3  5  9  4  2  8  8  6  7  0  4  8  7  1  2  6  8  6  4  5  7  7  1  5  8  4  2  7  1  9  2  0  6  6  9  1  4  8  0  8  6  0  6  4  1  2  4  5  6  6  9  3  9  5  9  3  8  6  0  9  1  2  2  2  2  7  0  7  4  5  4  2  6  0  4  8  0  5  0  1  9  1  9  3  0  0  7  9  9  5  7  0  5  4  8  2  2  1  4  9  7  3  1  6  8  7  0  7  8  8  5  3  6  5  9  6  0  2  5  2  3  7  9  6  6  2  3  5  7  2  7  9  0  4  8  8  9  4  1  5  6  4  9  1  0  4  2  5  9  8  1  9  7  1  5  4  3  5  1  9  2  7  6  6  2  0  9  7  6  6  6  5  9  2  4  8  8  3  3  0  7  7  8  8  5  3  5  2  9  8  4  5  0  5  6  2  1  6  9  2  3  9  8  7  7  1  1  8  2  1  8  5  4  0  4  4  7  6  0  9  4  7  2  9  1  0  0  4  8  1  2  5  5  2  3  1  4  7  6  3  2  1  6  9  0  8  7  1  9  0  8  0  2  8  1  5  5  9  9  2  9  4  9  7  5  1  3  8  1  4  9  1  8  5  9  0  4  5  6  0  3  6  3  1  8  8  6  5  5  7  2  6  2  8  6  8  9  5  2  3  9  5  8  4  6  3  4  8  2  8  2  7  3  2  9  8  3  9  8  1  0  1  5  1  9  6  4  3  2  5  9  2  0  7  6  9  9  6  5  4  3  7  4  8  3  0  3  6  2  1  2  7  5  2  8  7  3  6  8  1  7  6  2  4  0  7  3  7  4  1  7  0  9  9  7  9  3  4  2  5  5  6  8  5  5  9  3  0  6  4  1  7  0  1  6  5  2  6  4  7  4  6  1  4  2  6  1  9  4  0  6  5  3  2  2  3  4  2  2  7  5  3  5  1  5  6  0  6  8  4  5  1  4  2  5  3  1  9  6  2  0  6  9  6  8  2  4  9  2  7  0  1  8  0  0  8  5  1  2  5  8  3  0  8  0  4  8  9  4  5  0  4  0  3  0  3  2  9  3  7  8  4  7  1  3  5  8  2  4  9  3  5  0  6  2  9  1  6  7  4  6  7  7  7  1  7  6  0  5  2  1  3  3  2  1  5  1  5  1  3  6  3  1  2  3  3  0  6  0  6  1  2  5  1  7  6  6  4  1  5  1  6  7  6  0  4  1  2  6  3  6  2  0  1  2  2  8  1  0  2  9  0  1  1  6  3  4  4  1  7  3  7  3  3  6  1  8  2  4  0  2  9  4  4  2  3  5  8  0  7  4  7  3  9  0  3  4  5  0  0  3  9  5  1  1  8  4  0  8  8  7  2  3  9  8  2  0  5  3  6  7  6  0  5  9  7  3  5  7  3  3  1  6  9  3  5  8  5  6  7  9  1  6  4  1  5  4  9  5  4  9  5  9  7  0  9  2  7  5  0  2  5  4  8  6  8  5  5  5  4  8  1  6  4  5  3  1  6  0  9  5  1  0  1  6  1  7  6  0  1  7  5  0  2  5  5  7  6  9  3  3  5  5  3  0  6  5  6  1  2  0  8  3  1  5  0  3  0  4  8  3  0  9  7  9  7  6  5  1  0  8  8  1  5  6  7  3  6  7  8  9  7  7  6  8  6  8  4  4  8  0  1  4  3  3  3  7  8  1  9  6  0  8  3  7  7  8  4  6  5  7  8  5  1  1  3  5  9  3  5  0  0  1  2  6  9  5  3  5  5  2  8  1  2  0  2  7  8  7  4  1  0  8  6  1  0  9  5  0  8  4  2  3  3  9  1  1  1  5  9  0  1  4  6  8  8  5  0  9  3  3  4  7  0  4  6  5  3  7  1  4  7  2  9  0  9  4  3  0  4  7  6  9  7  1  1  9  1  0  4  6  7  2  3  5  3  7  0  8  8  2  8  2  8  1  3  4  0  7  7  2  3  1  8  6  4  8  8  6  5  5  6  8  5  1  7  6  9  6  3  5  4  1  3  3  1  7  1  4  6  9  5  8  7  6  0  7  2  0  9  6  5  9  8  6  5  4  9  1  8  2  8  1  0  4  7  5  6  7  3  6  7  6  0  1  4  4  1  6  0  4  0  7  6  9  0  0  7  9  6  1  5  6  8  3  5  9  0  9  9))

(defun scan_recursive (pattern_index data_index scan_length)
    (if (eq scan_length 0)
        t
        (if (or (>= pattern_index (length data)) (>= data_index (length data)))
            nil
            (if (eq pattern_index data_index)
                nil
                (if (not(eq (nth pattern_index data) (nth data_index data)))
                    nil
                    (scan_recursive (+ pattern_index 1) (+ data_index 1) (- scan_length 1))
                )
            )
        )
    )
)

(defun is_loop ()
    (loop for i from 0 to (- (length data) 1) do
        (loop for j from 0 to (- (length data) 1) do
            (if (scan_recursive i j series_length) 
                (setf result t)
            )
        )
    )
)

(is_loop)
(if result
    (format t "Zeitschleife!!!")
    (format t "Keine Zeitschleife :(")
)