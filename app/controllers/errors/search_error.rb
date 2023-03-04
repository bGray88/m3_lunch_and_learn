class SearchError < StandardError
  attr_reader :exception_type,
              :details,
              :status

  def initialize(message: 'Invalid search', details: 'Search Yielded Unexpected Results', status: 400)
    @details = details
    @status = status
    @exception_type = 'Search'
    super(message)
  end
end
