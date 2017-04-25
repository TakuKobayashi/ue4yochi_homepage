# == Schema Information
#
# Table name: board_game_mania_events
#
#  id          :integer          not null, primary key
#  event_id    :string(255)      not null
#  type        :string(255)      not null
#  keyword     :string(255)      not null
#  title       :string(255)      not null
#  url         :string(255)      not null
#  description :string(255)      not null
#  started_at  :datetime         not null
#  ended_at    :datetime         not null
#  limit       :integer          default("0"), not null
#  address     :string(255)      not null
#  place       :string(255)      not null
#  lat         :float(24)
#  lon         :float(24)
#  owner_id    :string(255)      not null
#  owner_name  :string(255)
#
# Indexes
#
#  board_gameevent_keyword_index          (keyword)
#  board_gameevent_published_range_index  (started_at,ended_at)
#  board_gameevent_type_event_id_index    (event_id,type) UNIQUE
#

class BoardGameMania::Event < ApplicationRecord
end
