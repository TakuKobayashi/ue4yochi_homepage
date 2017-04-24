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

class Moivoice::TwitcastingAccount < OauthAccount
  TWITCAS_API_URL_ROOT = "https://apiv2.twitcasting.tv"

  def self.get_oauth_url
    apiconfig = YAML.load(File.open(Rails.root.to_s + "/config/apiconfig.yml"))
    return TWITCAS_API_URL_ROOT + "/oauth2/authorize?client_id=" + apiconfig["moivoice"]["twitcas"]["client_id"] + "&response_type=code"
  end

  def self.oauth!(code, redirect_url)
    apiconfig = YAML.load(File.open(Rails.root.to_s + "/config/apiconfig.yml"))
    http_client = HTTPClient.new
    request_params = apiconfig["moivoice"]["twitcas"].merge({
      code: code,
      grant_type: "authorization_code",
      redirect_uri: redirect_url
    })
    url = TWITCAS_API_URL_ROOT + "/oauth2/access_token"

    response_oauth = http_client.post(url, request_params)
    hash = JSON.parse(response_oauth.body)
    request_user_header = {
      'Content-Type' => 'application/json;charset=UTF-8',
      'Authorization' => 'Bearer ' + hash["access_token"]
    }
    response_user = http_client.get(TWITCAS_API_URL_ROOT + "/verify_credentials", {}, request_user_header)
    user_hash = JSON.parse(response_user.body)
    user = TwitcasUser.find_or_initialize_by(twitcas_user_id: user_hash["user"]["id"])
    user.update!(twitcast_uesr_screen_id: user_hash["user"]["screen_id"], access_token: user_hash["access_token"], name: user_hash["user"]["name"], last_logined_at: Time.now, expires_in: hash["expires_in"])
    return user
  end
end
