class Processor
  def initialize request_reader, command_builder
    @request_reader = request_reader
    @command_builder = command_builder
  end

  def process
    requests = @request_reader.pending_requests
    commands = @command_builder.build(requests)
    commands.each(&:execute)
  end
end
