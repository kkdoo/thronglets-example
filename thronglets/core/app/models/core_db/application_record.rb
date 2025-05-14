# frozen_string_literal: true

class CoreDb::ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.implicit_order_column = "created_at"

  connects_to database: { writing: :core, reading: :core }
end
