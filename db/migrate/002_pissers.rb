Sequel.migration do
    up do
        create_table :pissers do
            primary_key :id

            String :venue_id
            String :name
            String :floor
            String :room_number

            foreign_key :user_id, :users

            DateTime :updated_on
            DateTime :created_on

        end

        create_table :pisser_ratings do
            primary_key :id

            String :venue_id
            String :name
            String :floor
            String :room_number

            String :comments
            Integer :rating

            foreign_key :pisser_id, :pissers
            foreign_key :user_id, :users

            DateTime :updated_on
            DateTime :created_on

        end
    end

    down do
        drop_table :pisser_ratings
        drop_table :pissers
    end

end