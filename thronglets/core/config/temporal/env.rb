# frozen_string_literal: true

require "bundler"
Bundler.require(:default)
require_relative "db"

Temporal.configure do |config|
  config.host = "t-temporal"
  config.port = 7233
  config.namespace = "thronglets-demo"
  config.task_queue = "core"
end

begin
  Temporal.register_namespace("thronglets-demo")
rescue Temporal::NamespaceAlreadyExistsFailure
  nil # service was already registered
end
