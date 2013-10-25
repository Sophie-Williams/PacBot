
(cl:in-package :asdf)

(defsystem "Echoes-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "FixedLed" :depends-on ("_package_FixedLed"))
    (:file "_package_FixedLed" :depends-on ("_package"))
    (:file "ResetLed" :depends-on ("_package_ResetLed"))
    (:file "_package_ResetLed" :depends-on ("_package"))
    (:file "BlinkingLed" :depends-on ("_package_BlinkingLed"))
    (:file "_package_BlinkingLed" :depends-on ("_package"))
  ))