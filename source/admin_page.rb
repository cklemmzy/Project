class Issue 
 
  def initialize 
    @firebasedb = FirebaseUtil.new 
    @fields = Ticket.list_fields 
  end 

  def self.list_fields 
      [ 
       'issue ID', 
       'title', 
       'assigned to', 
       'status', 
       'priority', 
       ] 
  end 

 
  def create user, data 
    data['status'] = Config::STATUS_PENDING 
      record = get_data data 
      record['created_at'] = Time.new 
      record['uid'] = user[:uid] 
      record['user'] = user[:user] 
    if @firebasedb.push('ticket',record) 
      return true 
    end 
    false 
  end 
 
  def delete id 
    if @firebasedb.delete("ticket/#{id}") 
      return true 
    end 
    false 
  end 

  def get id 
    result = @firebasedb.get("ticket",id) 
    result ? result : {} 
  end 
 
  def update id, data 
    record = get_data data 
    if @firebasedb.set("ticket/#{id}",record) 
      return true 
    end 
      false 
    end 
  def self.list 
    @firebasedb = FirebaseUtil.new 
    result = @firebasedb.fetch('ticket') 
    result ? result : {} 
  end 

  def self.search key, value 
    result = Ticket.list 
    result.select{|id,record| record[key] == value} 
  end 
  
   private 
   def get_data data 
     record = {} 
     @fields.each{|key| 
     record[key] = data[key] 
     } 
     record 
   end 
 end 
end 
