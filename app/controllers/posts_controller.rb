# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = current_user.posts.all.sorted
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def username
    username = current_user.email.split('@')[0]
    "@#{username}"
  end

  def calculate_datetime(post)
    posted = post.created_at
    today = DateTime.current
    value = ((today.to_datetime - posted.to_datetime) * 24 * 60).to_i
    if value < 60
      "#{value}min"
    elsif value < 1440
      hours = value / 60
      "#{hours}h"
    else
      "#{posted.day} #{posted.strftime('%b').downcase}."
    end
  end

  helper_method :username, :calculate_datetime

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
