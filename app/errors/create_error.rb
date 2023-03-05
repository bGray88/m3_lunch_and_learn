class CreateError < StandardError
  attr_reader :exception_type,
              :details,
              :status

  def initialize(message: 'Invalid create', details: 'Create has missing or invalid content', status: 400)
    @details = details
    @status = status
    @exception_type = 'Create'
    super(message)
  end
end
