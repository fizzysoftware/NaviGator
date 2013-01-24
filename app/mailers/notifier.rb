class Notifier < ActionMailer::Base
  default from: "from@bollywoodscores.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.welcome.subject
  #
  def welcome(user)
    @greeting = "Hi"

    mail to: user.email, subject: "Bollywood Scores"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.weekly.subject
  #
  def weekly
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
