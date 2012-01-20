# Design By Contract pattern
class DBC 
  class PreconditionException < RuntimeError; end
  class AssertconditionException < RuntimeError; end
  class PostconditionException < RuntimeError; end
  class FailException < RuntimeError; end

  def self.require(condition, message = "")
    unless condition
      error(PreconditionException, message, caller)
    end
  end

  def self.require_not_blank(string, message = "")
    if string.nil? || string.strip.blank?
      error(PreconditionException, message, caller)
    end
  end

  def self.require_valid(model, context = nil)
    self.require model.valid?(*[context].compact), model.errors.full_messages.join(", ")
  end

  def self.assert(condition, message = "")
    unless condition
      error(AssertconditionException, message, caller)
    end
  end

  def self.ensure(condition, message = "")
    unless condition
      error(PostconditionException, message, caller)
    end
    condition
  end

  def self.ensure_persisted(model)
    self.ensure model.persisted?, model.errors.full_messages.join(", ")
  end
  
  def self.fail(message = "")
    error(FailException, message, caller)
  end

  private 
  
  def self.error(klass, message, caller)
    raise klass.new("#{klass.name}-condition failed: #{message}\nTrace was: #{caller.join("\n")}")
  end
end

