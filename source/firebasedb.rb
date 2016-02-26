  class FirebaseUtil 
    URL = "https://cklemmzey.firebaseio.com" 
 
    def initialize url = '' 
     url = url.length > 1 ? url : URL 
       @firebasedb = Firebase::Client.new(url) 
    end 

 
    def get_root 
      @firebasedb
    end 
	
    def get path,id 
      @firebasedb.get("/#{path}/#{id}").body 
    end 

    def fetch path, params = '' 
      @firebasedb.get("/#{path}",params).body 
    end 

    def set path, data 
      @firebasedb.set("/#{path}", data) 
    end 

   def push path, data 
     @firebasedb.push("/#{path}", data) 
   end 
 
   def delete path 
     @firebasedb.delete("/#{path}") 
   end 
 end 
end 
