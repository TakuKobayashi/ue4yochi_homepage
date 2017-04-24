# == Schema Information
#
# Table name: moivoice_live_stream_comments
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  twitcast_social_id :string(255)
#  live_stream_id     :integer          not null
#  duration           :integer          default("0"), not null
#  message            :text(65535)
#  twitter_status_id  :string(255)
#  voice_path         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_moivoice_live_stream_comments_on_duration           (duration)
#  index_moivoice_live_stream_comments_on_live_stream_id     (live_stream_id)
#  index_moivoice_live_stream_comments_on_twitter_status_id  (twitter_status_id)
#  index_moivoice_live_stream_comments_on_user_id            (user_id)
#

require 'test_helper'

class Moivoice::LiveStreamCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
