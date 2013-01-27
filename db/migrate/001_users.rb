Sequel.migration do
    up do
        create_table :users do
            primary_key :id

            String :foursquare_id
            String :foursquare_access_token
            String :crypted_password

            String :first_name
            String :last_name

            DateTime :updated_on
            DateTime :created_on

        end
    end

    down do
        drop_table :users
    end
end