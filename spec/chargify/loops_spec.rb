require 'spec_helper'

describe Chargify::Loops do
  before :each do
    Chargify::Loops.loops.clear
  end

  describe '.delegate_hook' do
    let(:alpha_hook) { double('hook') }
    let(:beta_hook)  { double('hook') }

    it "calls every registered loop for the given event with the payload" do
      Chargify::Loops.loops[:alpha] = [alpha_hook]
      Chargify::Loops.loops[:beta]  = [beta_hook]

      alpha_hook.should_receive(:call).with(:foo)
      beta_hook.should_not_receive(:call)

      Chargify::Loops.delegate_hook :alpha, :foo
    end

    it "does not complain if there's no loops for a given hook" do
      Chargify::Loops.delegate_hook :alpha, :foo
    end
  end

  describe '.loop!' do
    it "appends a loop for the given event" do
      Chargify::Loops.loop! :test do |payload|
        #
      end

      Chargify::Loops.loops[:test].length.should == 1
    end
  end
end
