# primary_key :id

# String :venue_id
# String :name
# String :floor
# String :room_number

# String :comments
# Integer :rating

# foreign_key :pisser_id, :pissers
# foreign_key :user_id, :users

# DateTime :updated_on
# DateTime :created_on

class PisserRating < Sequel::Model(:pisser_ratings)
    many_to_one :pisser, :class=>:Pisser, :key=>:pisser_id
    many_to_one :user, :class=>:User, :key=>:user_id

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
