class Pokemon

    attr_reader :name, :type, :db, :id

    def initialize(name:, type:, db:, id:)
        @id = id
        @name = name
        @type = type
        @db = db
    end





    def self.save(name, type, db)
        if @id
            #update
        else
            sql = <<-SQL 
            INSERT INTO pokemon (name, type) VALUES (?, ?)
            SQL
            params = [name, type]
            db.execute(sql, params)
        end
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL
        hit = db.execute(sql, id)[0]
        Pokemon.new(name: hit[1], type: hit[2], id: id, db: db)
    end
end
