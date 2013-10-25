; Auto-generated. Do not edit!


(cl:in-package Vision-msg)


;//! \htmlinclude Results.msg.html

(cl:defclass <Results> (roslisp-msg-protocol:ros-message)
  ((ghostFound
    :reader ghostFound
    :initarg :ghostFound
    :type cl:boolean
    :initform cl:nil)
   (ghostPos
    :reader ghostPos
    :initarg :ghostPos
    :type cl:integer
    :initform 0)
   (ghostDistance
    :reader ghostDistance
    :initarg :ghostDistance
    :type cl:integer
    :initform 0)
   (ghostBlobHeight
    :reader ghostBlobHeight
    :initarg :ghostBlobHeight
    :type cl:integer
    :initform 0)
   (ghostBlobWidth
    :reader ghostBlobWidth
    :initarg :ghostBlobWidth
    :type cl:integer
    :initform 0))
)

(cl:defclass Results (<Results>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Results>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Results)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Vision-msg:<Results> is deprecated: use Vision-msg:Results instead.")))

(cl:ensure-generic-function 'ghostFound-val :lambda-list '(m))
(cl:defmethod ghostFound-val ((m <Results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Vision-msg:ghostFound-val is deprecated.  Use Vision-msg:ghostFound instead.")
  (ghostFound m))

(cl:ensure-generic-function 'ghostPos-val :lambda-list '(m))
(cl:defmethod ghostPos-val ((m <Results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Vision-msg:ghostPos-val is deprecated.  Use Vision-msg:ghostPos instead.")
  (ghostPos m))

(cl:ensure-generic-function 'ghostDistance-val :lambda-list '(m))
(cl:defmethod ghostDistance-val ((m <Results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Vision-msg:ghostDistance-val is deprecated.  Use Vision-msg:ghostDistance instead.")
  (ghostDistance m))

(cl:ensure-generic-function 'ghostBlobHeight-val :lambda-list '(m))
(cl:defmethod ghostBlobHeight-val ((m <Results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Vision-msg:ghostBlobHeight-val is deprecated.  Use Vision-msg:ghostBlobHeight instead.")
  (ghostBlobHeight m))

(cl:ensure-generic-function 'ghostBlobWidth-val :lambda-list '(m))
(cl:defmethod ghostBlobWidth-val ((m <Results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Vision-msg:ghostBlobWidth-val is deprecated.  Use Vision-msg:ghostBlobWidth instead.")
  (ghostBlobWidth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Results>) ostream)
  "Serializes a message object of type '<Results>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ghostFound) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'ghostPos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ghostDistance)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ghostBlobHeight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ghostBlobWidth)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Results>) istream)
  "Deserializes a message object of type '<Results>"
    (cl:setf (cl:slot-value msg 'ghostFound) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ghostPos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ghostDistance) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ghostBlobHeight) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ghostBlobWidth) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Results>)))
  "Returns string type for a message object of type '<Results>"
  "Vision/Results")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Results)))
  "Returns string type for a message object of type 'Results"
  "Vision/Results")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Results>)))
  "Returns md5sum for a message object of type '<Results>"
  "c2ae8e99c3de0ce82f713df20b464081")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Results)))
  "Returns md5sum for a message object of type 'Results"
  "c2ae8e99c3de0ce82f713df20b464081")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Results>)))
  "Returns full string definition for message of type '<Results>"
  (cl:format cl:nil "bool    ghostFound~%int32    ghostPos~%int32    ghostDistance~%int32    ghostBlobHeight~%int32    ghostBlobWidth~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Results)))
  "Returns full string definition for message of type 'Results"
  (cl:format cl:nil "bool    ghostFound~%int32    ghostPos~%int32    ghostDistance~%int32    ghostBlobHeight~%int32    ghostBlobWidth~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Results>))
  (cl:+ 0
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Results>))
  "Converts a ROS message object to a list"
  (cl:list 'Results
    (cl:cons ':ghostFound (ghostFound msg))
    (cl:cons ':ghostPos (ghostPos msg))
    (cl:cons ':ghostDistance (ghostDistance msg))
    (cl:cons ':ghostBlobHeight (ghostBlobHeight msg))
    (cl:cons ':ghostBlobWidth (ghostBlobWidth msg))
))
