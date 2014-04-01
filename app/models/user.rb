class User < ActiveRecord::Base

  has_many :comments_left, :class_name => "Comment", foreign_key: "commenter_id"
  has_many :comments_received, :class_name => "Comment", foreign_key: "commented_id"
	#attr_accessor :password
	#needed this for password 
	#password is not a field we have in our db, we have a pw field in the form 

	#this is where validations and belongs, etc, has_many foes 
 email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

 # validates :name, :presence 	=> true,
  #					:length 	=> { :maximum => 50 }
 # validates :email,	:presence 	=> true,
  #					:format 	=> { :with => email_regex, message: "Incorrect email format."},
 #          	:uniqueness => { :case_sensitive => false }

  #validates :password, :presence => true,
  #	   				:confirmation => true,
  #						:length	=> { :within => 6..40 }

  validates :name,            :presence         => true,
                                    :length           => { :maximum => 50 }
  
  validates :email,                 :presence         => true,
                                    :format           => { :with => email_regex, message: "Incorrect email format."},
                                    :uniqueness       => { :case_sensitive => false }
  validates :password,              :length           => { :within => 6..40 }

  before_save { self.email = email.downcase }
  has_secure_password


end
