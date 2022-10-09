class PostImagesController < ApplicationController

  def destroy
    @post_image = 削除するPostImageレコードを取得
    @post_image.削除
    redirect_to PostImageの一覧ページへのパス
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

end
