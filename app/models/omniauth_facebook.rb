class OmniAuthFacebook
  def initialize(auth_hash)
    @auth=auth_hash
  end

  def provider
    @auth['provider']
  end

  def name
    @auth['info']['name']
  end

  def email
    @auth['info']['email']
  end

  def gender
    @auth['info']['gender']
  end

  def uid
    @auth['uid']
  end

  def oauth_token
    @auth['credentials']['token']
  end

  def oauth_expires_at
    Time.at(@auth['credentials']['expires_at'])
  end

end