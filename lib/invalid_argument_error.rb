class InvalidArgumentError < StandardError
  def initialize(msg = 'Your argument is invalid')
    super
  end
end
