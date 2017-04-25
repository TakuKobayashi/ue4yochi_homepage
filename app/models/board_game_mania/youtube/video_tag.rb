# == Schema Information
#
# Table name: board_game_mania_youtube_video_tags
#
#  id               :integer          not null, primary key
#  youtube_video_id :integer          not null
#  tag              :string(255)      not null
#
# Indexes
#
#  index_board_game_mania_youtube_video_tags_on_tag  (tag)
#  youtube_video_id_tag_index                        (youtube_video_id,tag) UNIQUE
#

class BoardGameMania::Youtube::VideoTag < ApplicationRecord
end
