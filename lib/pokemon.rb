require 'pry'

class Pokemon

    attr_accessor :name, :type, :db
    attr_accessor :id

def initialize (id:, name:, type:, db:)
    @name = name 
    @type = type
    @id = id 
    @db = db
end

def self.save(name,type,db)

    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)

end

def self.find(id,db)

result = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
Pokemon.new(id: result[0], name:result[1], type: result[2], db: db)
# binding.pry
end



end
