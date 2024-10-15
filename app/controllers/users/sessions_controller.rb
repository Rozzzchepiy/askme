# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # GET /users/sign_in
  def new
    super unless user_signed_in? # Дозволити доступ до сторінки входу, якщо вже залогінений
  end
end
