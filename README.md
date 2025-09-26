# README

karafka demo 
bundle exec rails s
docker-compose up
bundle exec karafka server
bundle exec rails c

message = {
  product_code: Product.first.code,
  inventory_count: 10
}.to_json

Karafka.producer.produce_async(topic: 'inventory_management_product_updates', payload: message)