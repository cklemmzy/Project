  class User 

    def initialize 
      @firebasedb = FirebaseUtil.new 
        @fields = [ 
        'name', 
        'location', 
        'department', 
        'role', 
        'email', 
        ] 
    end 
    def self.list 
      @firebasedb = FirebaseUtil.new 
        result = @firebasedb.fetch('users') 
        result ? result : {} 
    end 

    def self.search(key,value) 
      users = User.list 
      users.select{|id,record| record[key] == value} 
    end 

    def create data 
      record = get_data data 
      record['created_at'] = Time.new 
    if @firebasedb.push('users',record) 
      return true 
    end 
      false 
    end 

    def update id, data 
      record = get_data data 
      if @firebasedb.set("users/#{id}",record) 
      return true 
    end 
      false 
    end 
  
    def get id 
      result = @firebasedb.get("users",id) 
      result ? result : {} 
    end 
  
    def delete id 
      if @firebasedb.delete("users/#{id}") 
        return true 
      end 
        false 
      end
	
    private
   
    def get_data data 
      record = {} 
      record['department'] = 'none' 
      @fields.each{|key| 
      if (key == 'department') && 
	  Access.customer?(data['role']) 
        next 
      end 
        record[key] = data[key] 
        } 
        record['modified_at'] = Time.new 
        record 
      end 
    end 
  end 
