# frozen_string_literal: true

class HelloWorkflow < BaseWorkflow
  input do
    required(:name).filled(:string)
  end

  # only this information will be in output
  output do
    required(:message).filled(:string)
  end

  def call
    # our WorldActivity return "message" and "time",
    # but "time" will be dropped due to workflow output filter
    WorldActivity.execute!({
      name: params["name"],
      format: "Hello, %s!",
    })
  end
end
