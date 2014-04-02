require 'spec_helper'

describe Chargify::HooksController do
  before :each do
    Chargify::Loops.stub :shared_key => Digest::MD5.hexdigest(Time.now.to_s)
  end

  def post_with_signature(action, params = {})
    body      = params.to_query
    signature = Digest::MD5.hexdigest(Chargify::Loops.shared_key + body)

    request.headers['X-Chargify-Webhook-Signature'] = signature

    post action, params
  end

  describe '#create' do
    context 'invalid signature' do
      it "responds with a 403 Forbidden code" do
        post :create

        response.code.to_i.should == 403
      end
    end

    context 'valid signatures' do
      before :each do
        Chargify::Loops.stub :delegate_hook => true
      end

      it "responds with a 200 OK code" do
        post_with_signature :create, :payload => {:chargify => 'testing'},
          :event => 'test'

        response.code.to_i.should == 200
      end

      it "delegates the hook to the appropriate loops" do
        Chargify::Loops.should_receive(:delegate_hook).
          with(:test, {'chargify' => 'testing'})

        post_with_signature :create, :payload => {:chargify => 'testing'},
          :event => 'test'
      end
    end
  end
end
