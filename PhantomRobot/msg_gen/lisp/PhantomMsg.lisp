; Auto-generated. Do not edit!


(cl:in-package PhantomRobot-msg)


;//! \htmlinclude PhantomMsg.msg.html

(cl:defclass <PhantomMsg> (roslisp-msg-protocol:ros-message)
  ((contact
    :reader contact
    :initarg :contact
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PhantomMsg (<PhantomMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PhantomMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PhantomMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name PhantomRobot-msg:<PhantomMsg> is deprecated: use PhantomRobot-msg:PhantomMsg instead.")))

(cl:ensure-generic-function 'contact-val :lambda-list '(m))
(cl:defmethod contact-val ((m <PhantomMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader PhantomRobot-msg:contact-val is deprecated.  Use PhantomRobot-msg:contact instead.")
  (contact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PhantomMsg>) ostream)
  "Serializes a message object of type '<PhantomMsg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'contact) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PhantomMsg>) istream)
  "Deserializes a message object of type '<PhantomMsg>"
    (cl:setf (cl:slot-value msg 'contact) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PhantomMsg>)))
  "Returns string type for a message object of type '<PhantomMsg>"
  "PhantomRobot/PhantomMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PhantomMsg)))
  "Returns string type for a message object of type 'PhantomMsg"
  "PhantomRobot/PhantomMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PhantomMsg>)))
  "Returns md5sum for a message object of type '<PhantomMsg>"
  "b2954458cad3c3e08d68421c874a562a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PhantomMsg)))
  "Returns md5sum for a message object of type 'PhantomMsg"
  "b2954458cad3c3e08d68421c874a562a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PhantomMsg>)))
  "Returns full string definition for message of type '<PhantomMsg>"
  (cl:format cl:nil "bool contact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PhantomMsg)))
  "Returns full string definition for message of type 'PhantomMsg"
  (cl:format cl:nil "bool contact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PhantomMsg>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PhantomMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'PhantomMsg
    (cl:cons ':contact (contact msg))
))
