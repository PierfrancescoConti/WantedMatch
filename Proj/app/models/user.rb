class User < ApplicationRecord
  has_secure_password
  has_many :friends

  validates :password, :presence => true, :on => :update,
 :if => lambda{ !password.nil? }

 validates :password,
  :confirmation => true,
  :length => { :minimum => 8},
  :if => lambda{ new_record? || !password.nil? }

  validate :password_complexity

  def password_complexity
    if password.present?
       if !password.match(/^(?=.*[a-zA-Z])(?=.*[0-9])/)
         errors.add :password, "Password complexity requirement not met"
       end
    end
  end

  validates :email, :presence => true, :on => :update,
 :if => lambda{ !email.nil? }

 validate :email_complexity

 def email_complexity
   if email.present?
      if !email.match(/^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/)
        errors.add :email, "Email complexity requirement not met"
      end
   end
 end

end
