module ErrorRender
  def errors?(object)
    errors = []
    object.errors.full_messages.each do |m|
      errors << m
    end
    errors
  end
end