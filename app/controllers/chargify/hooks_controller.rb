class Chargify::HooksController < ActionController::Base
  before_filter :verify_signature

  def create
    head :ok
  end

  private

  def generated_signature
    Digest::MD5.hexdigest(Chargify::Loops.shared_key + request.raw_post)
  end

  def provided_signature
    request.headers['X-Chargify-Webhook-Signature']
  end

  def verify_signature
    head :forbidden unless generated_signature == provided_signature
  end
end
