# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_promotion_tax'
  s.version     = '0.0.2'
  s.summary     = 'Local tax calculation for Spree Commerce'
  s.description = 'Calculate tax after deducting amount of promotion'
                  
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Jerrold thompson'
  s.email     = 'jet@whidbey.com'
  s.homepage  = 'https://github.com/bluehandtalking/spree_promotion_tax'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core' 

  # this is for the local tax reports
  # you can rip out the reporting and safely remove this dependency in a fork
  # s.add_dependency 'spree_advanced_reporting'

  s.add_development_dependency 'rspec-rails', '~> 2.9'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'ffaker'
end
