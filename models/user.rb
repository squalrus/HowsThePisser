require 'shield'
# primary_key :id

# String :foursquare_id
# String :foursquare_access_token
# String :crypted_password

# String :first_name
# String :last_name

# DateTime :updated_on
# DateTime :created_on

class User < Sequel::Model(:users)
    # one_to_many :critters, :class=>:Critter, :key=>:user_id
    # one_to_many :pages, :class=>:Page, :key=>:user_id
    # one_to_many :page_sitters, :class=>:PageSitter, :key=>:page_id
    # one_to_many :registrations, :class=>:Registration, :key=>:user_id
    # one_to_many :relations, :class=>:Relation, :key=>:user_id
    # one_to_many :event_instructor, :class=>:Event, :key=>:instructor_id

    include Shield::Model
    def self.fetch(foursquare_id)
        filter(username: foursquare_id).first
    end

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
