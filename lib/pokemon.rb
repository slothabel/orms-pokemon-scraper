class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(name:, type:, db:, id:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

    end 
    
    def self.find(id, db)
        row = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        row.map do |pokemon| 
            obj_id = pokemon[0]
            obj_name = pokemon[1]
            obj_type = pokemon[2]
            new_obj = Pokemon.new(name: obj_name, type: obj_type, db: db, id: obj_id)
            new_obj 
            # binding.pry
        end.first #map ender
    end






end
