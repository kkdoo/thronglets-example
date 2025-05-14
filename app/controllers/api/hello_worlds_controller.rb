# frozen_string_literal: true

class Api::HelloWorldsController < ApplicationController
  def show
    result = start_workflow!("HelloWorkflow", service: "core", params: params.as_json)

    render json: result.as_json
  end

  private

    def start_workflow!(workflow, service:, params:)
      workflow_id = SecureRandom.uuid_v7

      run_id = Temporal.start_workflow(
        workflow,
        params,
        options: { task_queue: service, workflow_id: },
      )

      # you can skip run_id, it's not necessary
      Temporal.await_workflow_result(workflow, workflow_id:, run_id:)
    end
end
