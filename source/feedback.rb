  class TicketReply 
  
   def initialize 
     @firebasedb = FirebaseUtil.new 
   end 
   
   def create ticket_id,comment 
     record = { 
     'comment' => comment 
     } 
     if @firebasedb.push("ticket_reply/#{ticket_id}",record) 
       return true 
     end 
     false 
   end 

   def delete ticket_id,id 
    if @firebasedb.delete("ticket_reply/#{ticket_id}/#{id}") 
      return true 
    end 
      false 
   end 

   def get id 
     result = @firebasedb.get("ticket_reply",id) 
     result ? result : {} 
   end 

   def update id, data 
     record = get_data data 
     if @firebasedb.set("ticket_reply/#{id}",record) 
       return true 
     end 
   false 
 end 
 
   def self.list ticket_id 
     @firebasedb = FirebaseUtil.new 
     result = @fb.fetch("ticket_reply/#{ticket_id}") 
     result ? result : {} 
   end 
 end 
end 
