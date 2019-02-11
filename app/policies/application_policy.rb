# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  class Scope
    attr_reader :user, :records

    def initialize(user, records)
      @user = user
      @records = records
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def always_allowed
    true
  end

  def admin_always_allowed
    @user.admin?
  end
end
