; Auto-generated. Do not edit!


(cl:in-package Echoes-msg)


;//! \htmlinclude IR.msg.html

(cl:defclass <IR> (roslisp-msg-protocol:ros-message)
  ((northRight
    :reader northRight
    :initarg :northRight
    :type cl:integer
    :initform 0)
   (northLeft
    :reader northLeft
    :initarg :northLeft
    :type cl:integer
    :initform 0)
   (east
    :reader east
    :initarg :east
    :type cl:integer
    :initform 0)
   (west
    :reader west
    :initarg :west
    :type cl:integer
    :initform 0))
)

(cl:defclass IR (<IR>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IR>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IR)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Echoes-msg:<IR> is deprecated: use Echoes-msg:IR instead.")))

(cl:ensure-generic-function 'northRight-val :lambda-list '(m))
(cl:defmethod northRight-val ((m <IR>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-msg:northRight-val is deprecated.  Use Echoes-msg:northRight instead.")
  (northRight m))

(cl:ensure-generic-function 'northLeft-val :lambda-list '(m))
(cl:defmethod northLeft-val ((m <IR>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-msg:northLeft-val is deprecated.  Use Echoes-msg:northLeft instead.")
  (northLeft m))

(cl:ensure-generic-function 'east-val :lambda-list '(m))
(cl:defmethod east-val ((m <IR>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-msg:east-val is deprecated.  Use Echoes-msg:east instead.")
  (east m))

(cl:ensure-generic-function 'west-val :lambda-list '(m))
(cl:defmethod west-val ((m <IR>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Echoes-msg:west-val is deprecated.  Use Echoes-msg:west instead.")
  (west m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IR>) ostream)
  "Serializes a message object of type '<IR>"
  (cl:let* ((signed (cl:slot-value msg 'northRight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'northLeft)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'east)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'west)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IR>) istream)
  "Deserializes a message object of type '<IR>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'northRight) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'northLeft) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'east) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'west) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IR>)))
  "Returns string type for a message object of type '<IR>"
  "Echoes/IR")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IR)))
  "Returns string type for a message object of type 'IR"
  "Echoes/IR")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IR>)))
  "Returns md5sum for a message object of type '<IR>"
  "f3ada26730aaa06af637acfbc085e722")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IR)))
  "Returns md5sum for a message object of type 'IR"
  "f3ada26730aaa06af637acfbc085e722")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IR>)))
  "Returns full string definition for message of type '<IR>"
  (cl:format cl:nil "int32 northRight~%int32 northLeft~%int32 east~%int32 west~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IR)))
  "Returns full string definition for message of type 'IR"
  (cl:format cl:nil "int32 northRight~%int32 northLeft~%int32 east~%int32 west~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IR>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IR>))
  "Converts a ROS message object to a list"
  (cl:list 'IR
    (cl:cons ':northRight (northRight msg))
    (cl:cons ':northLeft (northLeft msg))
    (cl:cons ':east (east msg))
    (cl:cons ':west (west msg))
))
