class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  def self.create_from_provider_data provider_data
    account = Account.find_or_create_by email: provider_data.info.email,
      provider: provider_data.provider

    params = {
      provider: provider_data.provider,
      uid: provider_data.uid,
      name: provider_data.info.name,
      avatar: provider_data.info.image,
      token: provider_data.credentials.token,
      password: Devise.friendly_token[0, 20],
      expires_at: provider_data.credentials.expires_at
    }
    account.update params
    account
  end
end
