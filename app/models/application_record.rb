# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.enum_string_hash(*values)
    values.each.with_object({}) { |v, h| h[v.to_s] = v.to_s }
  end
end
