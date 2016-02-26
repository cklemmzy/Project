
  class Department 
 
    def initialize 
      @firebasedb = FirebaseUtil.new 
      @fields = [ 'name', 'description',] 
      end 
    def create data 
      record = get_data data 
      record['created_at'] = Time.new 
      if @firebasedb.push('department',record) 
      return true 
    end 
    false 
  end 

 
    def delete id 
      if @firebasedb.delete("department/#{id}") 
        return true 
    end 
    false 
  end 
 
    def self.list 
      @firebasedb = FirebaseUtil.new 
        result = @firebasedb.fetch('department') 
        result ? result : {} 
      end 
 
    def self.list_data 
      result = self.list 
      data = {} 
      result.each{|id,records| 
      data[records['name']] = records['name'] 
      } 
      data 
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

