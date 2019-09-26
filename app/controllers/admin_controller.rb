class AdminController < ApplicationController
  before_action :authenticate
  protect_from_forgery with: :null_session
  layout "admin"

  private
    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        md5_of_password = Digest::MD5.hexdigest(password)
        username == 'admin' && md5_of_password == '30dbbac4b7df5f8715ce0b6845bcd60a'
      end
    end
end
