; Auto-generated. Do not edit!


(cl:in-package Echoes-srv)


;//! \htmlinclude BlinkingLed-request.msg.html

(cl:defclass <BlinkingLed-request> (roslisp-msg-protocol:ros-message)
  ((on
    :reader on
    :initarg :on
    :type cl:boolean
    :initform cl:nil)
   (blinks
    :reader blinks
    :initarg :blinks
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BlinkingLed-request (<BlinkingLed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BlinkingLed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BlinkingLed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Echoes-srv:<BlinkingLed-request> is deprecated: use Echoes-srv:BlinkingLed-request instead.")))

(cl:ensure-generic-function 'on-val :lambda-list '(m))
(cl:defmethod on-val ((m <BlinkingLed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-srv:on-val is deprecated.  Use Echoes-srv:on instead.")
  (on m))

(cl:ensure-generic-function 'blinks-val :lambda-list '(m))
(cl:defmethod blinks-val ((m <BlinkingLed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-srv:blinks-val is deprecated.  Use Echoes-srv:blinks instead.")
  (blinks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BlinkingLed-request>) ostream)
  "Serializes a message object of type '<BlinkingLed-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blinks) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BlinkingLed-request>) istream)
  "Deserializes a message object of type '<BlinkingLed-request>"
    (cl:setf (cl:slot-value msg 'on) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blinks) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BlinkingLed-request>)))
  "Returns string type for a service object of type '<BlinkingLed-request>"
  "Echoes/BlinkingLedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BlinkingLed-request)))
  "Returns string type for a service object of type 'BlinkingLed-request"
  "Echoes/BlinkingLedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BlinkingLed-request>)))
  "Returns md5sum for a message object of type '<BlinkingLed-request>"
  "3fbdacaab452e57ecfde1d88f4f7b065")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BlinkingLed-request)))
  "Returns md5sum for a message object of type 'BlinkingLed-request"
  "3fbdacaab452e57ecfde1d88f4f7b065")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BlinkingLed-request>)))
  "Returns full string definition for message of type '<BlinkingLed-request>"
  (cl:format cl:nil "bool on~%bool blinks~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BlinkingLed-request)))
  "Returns full string definition for message of type 'BlinkingLed-request"
  (cl:format cl:nil "bool on~%bool blinks~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BlinkingLed-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BlinkingLed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BlinkingLed-request
    (cl:cons ':on (on msg))
    (cl:cons ':blinks (blinks msg))
))
;//! \htmlinclude BlinkingLed-response.msg.html

(cl:defclass <BlinkingLed-response> (roslisp-msg-protocol:ros-message)
  ((requestSuccessful
    :reader requestSuccessful
    :initarg :requestSuccessful
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BlinkingLed-response (<BlinkingLed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BlinkingLed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BlinkingLed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Echoes-srv:<BlinkingLed-response> is deprecated: use Echoes-srv:BlinkingLed-response instead.")))

(cl:ensure-generic-function 'requestSuccessful-val :lambda-list '(m))
(cl:defmethod requestSuccessful-val ((m <BlinkingLed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-srv:requestSuccessful-val is deprecated.  Use Echoes-srv:requestSuccessful instead.")
  (requestSuccessful m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BlinkingLed-response>) ostream)
  "Serializes a message object of type '<BlinkingLed-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'requestSuccessful) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BlinkingLed-response>) istream)
  "Deserializes a message object of type '<BlinkingLed-response>"
    (cl:setf (cl:slot-value msg 'requestSuccessful) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BlinkingLed-response>)))
  "Returns string type for a service object of type '<BlinkingLed-response>"
  "Echoes/BlinkingLedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BlinkingLed-response)))
  "Returns string type for a service object of type 'BlinkingLed-response"
  "Echoes/BlinkingLedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BlinkingLed-response>)))
  "Returns md5sum for a message object of type '<BlinkingLed-response>"
  "3fbdacaab452e57ecfde1d88f4f7b065")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BlinkingLed-response)))
  "Returns md5sum for a message object of type 'BlinkingLed-response"
  "3fbdacaab452e57ecfde1d88f4f7b065")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BlinkingLed-response>)))
  "Returns full string definition for message of type '<BlinkingLed-response>"
  (cl:format cl:nil "bool requestSuccessful~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BlinkingLed-response)))
  "Returns full string definition for message of type 'BlinkingLed-response"
  (cl:format cl:nil "bool requestSuccessful~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BlinkingLed-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BlinkingLed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BlinkingLed-response
    (cl:cons ':requestSuccessful (requestSuccessful msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BlinkingLed)))
  'BlinkingLed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BlinkingLed)))
  'BlinkingLed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BlinkingLed)))
  "Returns string type for a service object of type '<BlinkingLed>"
  "Echoes/BlinkingLed")