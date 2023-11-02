class ErrorSerializer
  def self.serialize(errors)
    errors_hash = errors.is_a?(String) ? [{detail: errors}] : errors

    {
      errors: errors_hash.map { |error| { detail: error[:detail] } }
    }
  end
end