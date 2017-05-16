if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_SeGpt36QVqasokdSVUFi4t7r',
    :secret_key => 'sk_test_3msAnIgFDHFKP8MHBxtJznoq
'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]