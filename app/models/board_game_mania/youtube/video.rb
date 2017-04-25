# == Schema Information
#
# Table name: board_game_mania_youtube_videos
#
#  id                  :integer          not null, primary key
#  video_id            :string(255)      default(""), not null
#  youtube_channel_id  :integer
#  youtube_category_id :integer
#  title               :string(255)      default(""), not null
#  description         :text(65535)
#  thumnail_image_url  :string(255)      default(""), not null
#  published_at        :datetime
#  comment_count       :integer          default("0"), not null
#  dislike_count       :integer          default("0"), not null
#  like_count          :integer          default("0"), not null
#  favorite_count      :integer          default("0"), not null
#  view_count          :integer          default("0"), not null
#
# Indexes
#
#  youtube_channel_id_index    (youtube_channel_id)
#  youtube_published_at_index  (published_at)
#  youtube_video_id_index      (video_id) UNIQUE
#

class BoardGameMania::Youtube::Video < ApplicationRecord
end
