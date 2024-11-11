# frozen_string_literal: true

class LikesController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: -> { render file: 'public/404.html', status: :not_found }

  def create
    post.likes.create(user: current_user)
    redirect_to posts_path
  end

  def destroy
    post.likes.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end
end
