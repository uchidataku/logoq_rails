# frozen_string_literal: true

# AccountMailer
class AccountMailer < ApplicationMailer
  def register_email(email, metadata)
    @metadata = metadata
    mail(to: email, subject: '【LogoQ】本登録のお願い')
  end

  def send_email_verification(account_id)
    account = Account.find(account_id)
    account.update!(email_verification_status: Account::EmailVerificationStatus::REQUESTED)
    @token = account.jwt
    @payload = email_verification_payload(account.email)
    mail(to: account.email, subject: "[Coadmap#{Rails.env.development? ? '::テスト環境' : ''}] メールアドレス確認のお願い")
  end
end
