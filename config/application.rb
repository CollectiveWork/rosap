require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Rosap
    GITHUB_CLIENT_ID = "b415d2e0619f8688cbf3"
    GITHUB_CLIENT_SECRET = "294097a8e10d47e42158f67677af9b5ba4144e62"

  class Application < Rails::Application
    load 'lib/githubapi/GithubCredentials.rb'

    @github_current_user = {}

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    def set_github_current_user github_current_user
        @github_current_user = github_current_user
    end

    def get_github_current_user
        @github_current_user
    end
    def get_github_current_user_name
        return @github_current_user['login'] if @github_current_user['name'].blank? 
        @github_current_user['name']
    end
  end
end
