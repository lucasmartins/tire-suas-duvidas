Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  ProviderConfig.all.to_a.each do |p|
    puts "Seeting up #{p.name} as OmniAuth provider..."
    provider :"#{p.name}", p.key, p.secret
  end
end

