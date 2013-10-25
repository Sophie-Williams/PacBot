; Auto-generated. Do not edit!


(cl:in-package Echoes-srv)


;//! \htmlinclude FixedLed-request.msg.html

(cl:defclass <FixedLed-request> (roslisp-msg-protocol:ros-message)
  ((numOn
    :reader numOn
    :initarg :numOn
    :type cl:fixnum
    :initform 0))
)

(cl:defclass FixedLed-request (<FixedLed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FixedLed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FixedLed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Echoes-srv:<FixedLed-request> is deprecated: use Echoes-srv:FixedLed-request instead.")))

(cl:ensure-generic-function 'numOn-val :lambda-list '(m))
(cl:defmethod numOn-val ((m <FixedLed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-srv:numOn-val is deprecated.  Use Echoes-srv:numOn instead.")
  (numOn m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FixedLed-request>) ostream)
  "Serializes a message object of type '<FixedLed-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'numOn)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FixedLed-request>) istream)
  "Deserializes a message object of type '<FixedLed-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'numOn)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FixedLed-request>)))
  "Returns string type for a service object of type '<FixedLed-request>"
  "Echoes/FixedLedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FixedLed-request)))
  "Returns string type for a service object of type 'FixedLed-request"
  "Echoes/FixedLedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FixedLed-request>)))
  "Returns md5sum for a message object of type '<FixedLed-request>"
  "11f70e05a6919339d1ae396aecd2f3c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FixedLed-request)))
  "Returns md5sum for a message object of type 'FixedLed-request"
  "11f70e05a6919339d1ae396aecd2f3c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FixedLed-request>)))
  "Returns full string definition for message of type '<FixedLed-request>"
  (cl:format cl:nil "uint8 numOn~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FixedLed-request)))
  "Returns full string definition for message of type 'FixedLed-request"
  (cl:format cl:nil "uint8 numOn~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FixedLed-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FixedLed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FixedLed-request
    (cl:cons ':numOn (numOn msg))
))
;//! \htmlinclude FixedLed-response.msg.html

(cl:defclass <FixedLed-response> (roslisp-msg-protocol:ros-message)
  ((requestSuccessful
    :reader requestSuccessful
    :initarg :requestSuccessful
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass FixedLed-response (<FixedLed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FixedLed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FixedLed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Echoes-srv:<FixedLed-response> is deprecated: use Echoes-srv:FixedLed-response instead.")))

(cl:ensure-generic-function 'requestSuccessful-val :lambda-list '(m))
(cl:defmethod requestSuccessful-val ((m <FixedLed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-srv:requestSuccessful-val is deprecated.  Use Echoes-srv:requestSuccessful instead.")
  (requestSuccessful m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FixedLed-response>) ostream)
  "Serializes a message object of type '<FixedLed-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'requestSuccessful) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FixedLed-response>) istream)
  "Deserializes a message object of type '<FixedLed-response>"
    (cl:setf (cl:slot-value msg 'requestSuccessful) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FixedLed-response>)))
  "Returns string type for a service object of type '<FixedLed-response>"
  "Echoes/FixedLedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FixedLed-response)))
  "Returns string type for a service object of type 'FixedLed-response"
  "Echoes/FixedLedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FixedLed-response>)))
  "Returns md5sum for a message object of type '<FixedLed-response>"
  "11f70e05a6919339d1ae396aecd2f3c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FixedLed-response)))
  "Returns md5sum for a message object of type 'FixedLed-response"
  "11f70e05a6919339d1ae396aecd2f3c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FixedLed-response>)))
  "Returns full string definition for message of type '<FixedLed-response>"
  (cl:format cl:nil "bool requestSuccessful~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FixedLed-response)))
  "Returns full string definition for message of type 'FixedLed-response"
  (cl:format cl:nil "bool requestSuccessful~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FixedLed-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FixedLed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FixedLed-response
    (cl:cons ':requestSuccessful (requestSuccessful msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FixedLed)))
  'FixedLed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FixedLed)))
  'FixedLed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FixedLed)))
  "Returns string type for a service object of type '<FixedLed>"
  "Echoes/FixedLed")