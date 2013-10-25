
(cl:in-package :asdf)

(defsystem "PhantomRobot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PhantomMsg" :depends-on ("_package_PhantomMsg"))
    (:file "_package_PhantomMsg" :depends-on ("_package"))
  ))