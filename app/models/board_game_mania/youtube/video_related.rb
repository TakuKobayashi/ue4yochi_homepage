# == Schema Information
#
# Table name: board_game_mania_youtube_video_relateds
#
#  id                  :integer          not null, primary key
#  youtube_video_id    :integer          not null
#  to_youtube_video_id :integer          not null
#
# Indexes
#
#  youtube_video_related_from_id_index  (youtube_video_id)
#  youtube_video_related_to_id_index    (to_youtube_video_id)
#

class BoardGameMania::Youtube::VideoRelated < ApplicationRecord
end
