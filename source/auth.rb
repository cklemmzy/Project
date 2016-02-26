require_relative 'firebase_util' 
 
 
class Authentication 
 
  def initialize 
    @firebasedb = FirebaseUtil.new 
  end 

 
  def secured_login(email, password) 
        
  end 
 
 
  def login
  end 
end 
 
 
  class Access  
 
    def self.admin? role 
      role == Config::ADMIN_ROLE 
    end  
 
    def self.user? role 
      role == Config::CUSTOMER_ROLE 
    end 
 
    def self.customer_care? role 
      role == Config::CUSTOMER__CARE_ROLE 
    end 
  end 

