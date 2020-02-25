class Flows::Filter
  def self.call(resources, options)
    new(flows, options).filter
  end

  private

  attr_reader :resources, :options

  def initialize(resources, options)
    @resources = resources
    @options   = options
  end

  def filter
    if options[:user_id]
      @resources = resources.where(user_id: options[:user_id])
    end

    resources
  end
end
