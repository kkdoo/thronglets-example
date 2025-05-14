# frozen_string_literal: true

class WorldActivity < BaseActivity
  input do
    required(:name).filled(:string)
    required(:format).filled(:string)
  end

  output do
    required(:message).filled(:string)
    required(:time).filled(:integer)
  end

  def call
    message = sprintf(params["format"], params["name"])
    {
      message:,
      time: Time.now.to_i,
    }
  end
end
