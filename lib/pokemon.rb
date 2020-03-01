require 'pry'
class Pokemon
    attr_accessor :name, :type, :db, :id 
    
    def initialize(name: name, type: type, db: db, id: id)
         @name = name
         @id = id
         @db = db
         @type = type
     end 


     def self.save(name, type, db)
        sql =<<-SQL 
            insert into pokemon (name, type )
            values (?, ?)
        SQL
        db.execute(sql, name, type)
    end 


    def self.find(id, db)
        sql = "select * from pokemon where id = ? " 
        array = db.execute(sql, id).flatten
        pokemon = Pokemon.new(id: array[0], name: array[1], type: array[2], db: db)
        # binding.pry



    end

end



