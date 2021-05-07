(defclass Basic-Kind ()
  ((name :accessor name)
   (inputs :accessor inputs)
   (outputs :accessor outputs)))

(defgeneric first-time (kind))
(defgeneric react (kind event))
   
(defclass Composite-Component (Basic-Kind)
  )

(defclass Leaf-Component (Basic-Kind)
  )


(defclass Basic-Instance ()
  ((input-queue nil)
   (output-queue nil)))

(defgeneric busy-p (instance))


(defmethod first-time ((self Composite-Component))
  (map #'(lambda (k)
	  (let ((index (position k (self connections) :test 'equal)))
	    (if (member k (self connections))
		
	    )
       (self connections)))
