# frozen_string_literal: true

require "yaml"
require "active_record"

filename = File.join(Dir.pwd, "config", "database.yml")
db_config_file = File.open(filename)
db_config_full = YAML.load(db_config_file, aliases: true)
env_name = ENV.fetch("THRONGLETS_ENV", "development")

ActiveRecord::Base.configurations = db_config_full[env_name].map do |db_name, db_config|
  ActiveRecord::DatabaseConfigurations::HashConfig.new(env_name, db_name, db_config)
end
