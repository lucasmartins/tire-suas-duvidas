class OmniAuthGithub
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
    begin
      gender = @auth['info']['gender']
    rescue Exception => e
      gender = nil
    end
    return gender
  end

  def uid
    @auth['uid']
  end

  def oauth_token
    @auth['credentials']['token']
  end

  def oauth_expires_at
    begin
      time = Time.at(@auth['credentials']['expires'])
    rescue Exception => e
      time = nil
    end
    return time
  end

  def hireable
    begin
      hireable = @auth['extra']['hireable']
    rescue Exception => e
      hireable = nil
    end
    return hireable
  end

end
