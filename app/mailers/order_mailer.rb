class OrderMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    # @greeting = "Hi"

    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
    # mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
