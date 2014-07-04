module Beats
  extend self

  def authorize
    "https://partner.api.beatsmusic.com/v1/oauth2/authorize?state=xyz
    &response_type=token
    &redirect_uri=https://www.localhost:300/create
    &client_id=m6989a2p835te2f4c9szp66r"
  end

end
