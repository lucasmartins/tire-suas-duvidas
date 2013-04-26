require 'omniauth_github'
require 'omniauth_facebook'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Destroyer
  field :name, type: String
  field :email, type: String
  field :gender, type: String
  field :image_url, type: String
  
  has_many :providers
  has_many :questions
  has_many :answers

  validates :email, :presence => true

  def emails
    all_emails = []
    Provider.where(:user_id=>self.id).each do |p|
      unless all_emails.include? p.email
        all_emails.push p.email
      end
    end
    return all_emails
  end

  def self.from_omniauth(auth)

    case auth['provider']
    when 'facebook'
      @oauth = OmniAuthFacebook.new(auth)  
    when 'github'
      @oauth = OmniAuthGithub.new(auth)
    end

    begin
      user = User.find_by(:email=>@oauth.email)
    rescue Exception => e
      user = User.new
    end

    user.name = @oauth.name
    user.gender = @oauth.gender
    user.image_url = @oauth.image
    if user.email==nil || user.email==''
      user.email = @oauth.email
    end
    
    if user.id!=nil
      begin
        provider = Provider.find_by(:user_id=>user.id,:name=>@oauth.provider)
      rescue Exception => e
        Rails.logger.error "Not able to find user provider for #{@oauth.provider}"
      end      
    end

    user.save!

    if provider == nil
      provider = Provider.new
      provider.user_id=user.id
    end

    provider.name = @oauth.provider
    provider.email = @oauth.email
    provider.uid = @oauth.uid
    provider.oauth_token = @oauth.oauth_token
    provider.oauth_expires_at = @oauth.oauth_expires_at
    
    provider.save!

    return user
  end


end
