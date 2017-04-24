# == Schema Information
#
# Table name: moivoice_live_streams
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  movieid       :string(255)
#  live_url      :string(255)
#  live_title    :string(255)
#  thumbnail_url :string(255)
#  started_at    :datetime
#  finished_at   :datetime
#  state         :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_moivoice_live_streams_on_movieid  (movieid)
#  index_moivoice_live_streams_on_user_id  (user_id)
#  moi_voice_live_finished_at_index        (started_at,finished_at)
#

require 'test_helper'

class Moivoice::LiveStreamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
