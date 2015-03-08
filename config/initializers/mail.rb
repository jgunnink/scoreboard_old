ActionMailer::Base.smtp_settings = {
  address: "smtp.mandrillapp.com",
  port: 587,
  authentication: "login",
  enable_starttls_auto: true,
  user_name: ENV["M_USERNAME"],
  password: ENV["M_PASSWORD"]
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"