# == Schema Information
#
# Table name: oauth_accounts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  type         :string(255)      not null
#  uid          :string(255)      not null
#  screen_uid   :string(255)
#  token        :text(65535)
#  token_secret :text(65535)
#  expired_at   :datetime         not null
#  extra_info   :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_oauth_accounts_on_expired_at    (expired_at)
#  index_oauth_accounts_on_screen_uid    (screen_uid)
#  index_oauth_accounts_on_uid_and_type  (uid,type) UNIQUE
#  index_oauth_accounts_on_user_id       (user_id)
#

require 'test_helper'

class OauthAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
