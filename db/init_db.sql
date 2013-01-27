-- psql -f setup.sql -U username postgres
CREATE USER howsthepisser WITH PASSWORD 'howsthepisser';
CREATE DATABASE howsthepisser;
GRANT ALL PRIVILEGES ON DATABASE howsthepisser to howsthepisser;
