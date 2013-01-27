Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect(ENV['DATABASE_URL'], :loggers => [logger])
  when :production  then Sequel.connect(ENV['DATABASE_URL'],  :loggers => [logger])
  when :test        then Sequel.connect("postgres://localhost/hows_the_pisser_test",        :loggers => [logger])
end
