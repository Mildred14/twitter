# frozen_string_literal: true

class SavedController < ApplicationController
  def create
    post.saves.create(user: current_user)
    redirect_to posts_path
  end

  def destroy
    post.saves.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end
end
