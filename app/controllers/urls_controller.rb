class UrlsController < ApplicationController
  def index
    # @urls = Url.all
    @urls = policy_scope(Url).order(created_at: :asc)
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.short_url = @url.generate_short_url
    @url.long_url = @url.sanitize
    @url.user = current_user
    authorize @url

    if @url.save
      redirect_to urls_path
    else
      flash[:error] = @url.errors.full_messages
      redirect_to root_path
    end
  end

  def go
    @url = Url.find_by(short_url: params[:short_url])
    authorize @url

    if !@url.nil?
      @url.update_attribute(:click, @url.click + 1)
      redirect_to @url.long_url
    else
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end

  def destroy
    @url = Url.find(params[:id])
    authorize @url
    @url.destroy
    redirect_to root_path
  end

  private

  def url_params
    params.require(:url).permit(:long_url, :short_url)
  end
end
