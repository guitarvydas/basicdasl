; (:composite [main] (:in) (:out))

(defclass kind-main (CompositeComponent)
  ((:inputs '(in))
   (:outputs '(out))
   (:children (list subcomponent))))
   
   

(defmethod first-time ((self kind-main))
  (call-next-method))

(defmethod react ((self kind-main) e)

(defmethod busy-p ((self kind-main)) (call-next-method))

(defmethod clone ((self kind-main)) (call-next-method))


