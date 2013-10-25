; Auto-generated. Do not edit!


(cl:in-package Echoes-srv)


;//! \htmlinclude ResetLed-request.msg.html

(cl:defclass <ResetLed-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetLed-request (<ResetLed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetLed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetLed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Echoes-srv:<ResetLed-request> is deprecated: use Echoes-srv:ResetLed-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetLed-request>) ostream)
  "Serializes a message object of type '<ResetLed-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetLed-request>) istream)
  "Deserializes a message object of type '<ResetLed-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetLed-request>)))
  "Returns string type for a service object of type '<ResetLed-request>"
  "Echoes/ResetLedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetLed-request)))
  "Returns string type for a service object of type 'ResetLed-request"
  "Echoes/ResetLedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetLed-request>)))
  "Returns md5sum for a message object of type '<ResetLed-request>"
  "6b6d4c3b5d9d236dae096b76debe50d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetLed-request)))
  "Returns md5sum for a message object of type 'ResetLed-request"
  "6b6d4c3b5d9d236dae096b76debe50d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetLed-request>)))
  "Returns full string definition for message of type '<ResetLed-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetLed-request)))
  "Returns full string definition for message of type 'ResetLed-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetLed-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetLed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetLed-request
))
;//! \htmlinclude ResetLed-response.msg.html

(cl:defclass <ResetLed-response> (roslisp-msg-protocol:ros-message)
  ((requestSuccessful
    :reader requestSuccessful
    :initarg :requestSuccessful
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ResetLed-response (<ResetLed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetLed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetLed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Echoes-srv:<ResetLed-response> is deprecated: use Echoes-srv:ResetLed-response instead.")))

(cl:ensure-generic-function 'requestSuccessful-val :lambda-list '(m))
(cl:defmethod requestSuccessful-val ((m <ResetLed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-srv:requestSuccessful-val is deprecated.  Use Echoes-srv:requestSuccessful instead.")
  (requestSuccessful m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetLed-response>) ostream)
  "Serializes a message object of type '<ResetLed-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'requestSuccessful) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetLed-response>) istream)
  "Deserializes a message object of type '<ResetLed-response>"
    (cl:setf (cl:slot-value msg 'requestSuccessful) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetLed-response>)))
  "Returns string type for a service object of type '<ResetLed-response>"
  "Echoes/ResetLedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetLed-response)))
  "Returns string type for a service object of type 'ResetLed-response"
  "Echoes/ResetLedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetLed-response>)))
  "Returns md5sum for a message object of type '<ResetLed-response>"
  "6b6d4c3b5d9d236dae096b76debe50d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetLed-response)))
  "Returns md5sum for a message object of type 'ResetLed-response"
  "6b6d4c3b5d9d236dae096b76debe50d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetLed-response>)))
  "Returns full string definition for message of type '<ResetLed-response>"
  (cl:format cl:nil "bool requestSuccessful~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetLed-response)))
  "Returns full string definition for message of type 'ResetLed-response"
  (cl:format cl:nil "bool requestSuccessful~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetLed-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetLed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetLed-response
    (cl:cons ':requestSuccessful (requestSuccessful msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetLed)))
  'ResetLed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetLed)))
  'ResetLed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetLed)))
  "Returns string type for a service object of type '<ResetLed>"
  "Echoes/ResetLed")