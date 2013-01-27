# primary_key :id

# String :venue_id
# String :name
# String :floor
# String :room_number

# foreign_key :user_id, :users

# DateTime :updated_on
# DateTime :created_on

class Pisser < Sequel::Model(:pissers)
    many_to_one :user, :class=>:User, :key=>:user_id
    one_to_many :pisser_ratings, :class=>:PisserRating, :key=>:pisser_id

    plugin :validation_helpers
    def validate 
        super
    end

    def before_create
        self.created_on ||= Time.now.utc
        self.updated_on ||= Time.now.utc
        super
    end

    def before_save 
        self.updated_on = Time.now.utc
        super
    end

end
