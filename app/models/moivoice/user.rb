# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  type             :string(255)
#  name             :string(255)
#  profileimage_url :string(255)
#  token            :string(255)      not null
#  last_logined_at  :datetime         not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_last_logined_at  (last_logined_at)
#  index_users_on_token            (token) UNIQUE
#

class Moivoice::User < User
  has_many :live_straems, class_name: 'Moivoice::LiveStream', foreign_key: :user_id
end
