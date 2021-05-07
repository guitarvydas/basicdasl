; [main] < (in) > (out)

(defclass main (CompositeComponent)
  ((:inputs '(in))
   (:outputs '(out))
   (:children '((1 subcomponent) (2 subcomponent))
   (:connections '(((self in) ((child 1) A))
		   (((child 1) *#) ((self out)))
		   (((child 2) *#) ((self out)))
		   ))))

(defmethod first-time ((self main))
  (call-next-method))

(defmethod react ((self main) e)
  (input-case
   (A) (send-inward/by-index self 1 'A e)))

(defmethod busy-p ((self main))
  (some-children-busy-p self))



; [subcomponent] < (in) > (out)

(defclass subcomponent (CompositeComponent)
  ((:inputs '(A))
   (:outputs '(*#))
   (:children '(component_X))
   (:connections '(((self A) ((component_X c)))
		   ((component_X #) ((self *#)))))))

(defmethod first-time ((self subcomponent))
  (call-next-method))

(defmethod react ((self subcomponent) e)
  (input-case
   (A) (send-inward self 1 'c e)))

(defmethod busy-p ((self subcomponent))
  (some-children-busy-p self))




; [component X] < (A) > (#)

(defclass component_X (LeafComponent)
  ((:inputs '(c))
   (:outputs '(#))
   (:foreign 'act)))

(defmethod first-time ((self component_X))
  (call-next-method))

(defmethod react ((self component_X) e)
  (react-foreign self e))

(defmethod busy-p ((self component_X))
  (some-children-busy-p self))

(defmethod act ((self component_X) e)
  (format *standard-output* "act ~a gets ~a~%" (component-name self) e)
  (send self '# (component-name self)))

