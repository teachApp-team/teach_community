class YoutubeController < ApplicationController
  GOOGLE_API_KEY = "AIzaSyB53cmvUV96iEue4QheFinxSjpjd6vYcUQ"

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 5,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, opt)
  end

  def index
    @youtube_data = find_videos('ヒカキン')
  end
  
  def get_videos
    @youtube_data = find_videos(params[:youtube][:keyword])
    render :index
  end
  
  def school
    require 'httpclient'
    require 'json'
    require "uri"
    uri = 'http://webservice.recruit.co.jp/shingaku/school/v2?'
    if params[:school].present?
      keyword = params[:school][:keyword]
    else
      keyword = '東京'
    end
    params = {
      keyword: keyword,
      key: "26e260d3d18d50fa",
      count: 10
    }
    client = HTTPClient.new
    request =  client.get(uri,params)
    # response = JSON.parse(request.body)
    response = Hash.from_xml(request.body)
    @response = response["results"]["school"]
  end
  
  def favorite
    fav = Favorite.new(teacher_id: params[:youtube][:teacher_id], video_id: params[:youtube][:video_id])
    if fav.save
        flash[:notice] = '動画をお気に入りに登録しました'
        redirect_to youtube_path
    else
        flash[:notice] = '登録できませんでした。'
        redirect_to youtube_path
    end
  end
end
