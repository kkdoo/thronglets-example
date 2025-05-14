# frozen_string_literal: true

require "temporal"

Temporal.configure do |config|
  config.host = "t-temporal"
  config.port = 7233
  config.namespace = "thronglets-demo"
  config.task_queue = "mono"
  config.credentials = :this_channel_is_insecure
end

begin
  Temporal.register_namespace("thronglets-demo", "Our namespace for services")
rescue Temporal::NamespaceAlreadyExistsFailure
  nil # service was already registered
end
