require 'spec_helper'

describe Processor do
  let!(:request_reader) { double(:pending_requests => []) }
  let!(:default_command) { double(:execute => nil) }
  let!(:default_commands) { [default_command] }
  let!(:command_builder) { double() }
  subject { Processor.new(request_reader, command_builder) }

  describe '#process' do
    it 'converts requests into commands' do
      allow(request_reader).to receive(:pending_requests).and_return(['foo'])
      expect(command_builder).to receive(:build).with(['foo']).and_return(default_commands)
      subject.process
    end
    it 'executes the commands' do
      allow(command_builder).to receive(:build).and_return(default_commands)
      expect(default_command).to receive(:execute)
      subject.process
    end
  end
end
