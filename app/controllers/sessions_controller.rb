class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :page_requires_login, :pdf]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && params[:password] == @user.password
      session[:user_id] = @user.id
      redirect_to '/authorized'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil

    redirect_to '/welcome'
  end

  def welcome
  end

  def login
  end

  def page_requires_login
    @datapasien = User.all
  end

  def content_pdf
  end

  def pdf
    @datapasien = User.all

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",   # Excluding ".pdf" extension.
        template: "sessions/content_pdf.html.erb",
        layout: 'pdf.html'
      end
    end
  end
end
