class ProductInventoryConsumer < ApplicationConsumer
  def consume
    messages.each do |message|
      Rails.logger.info(
        "ProductInventoryConsumer consuming Topic: #{topic.name},
        Message: #{message.payload},\
        Offset: #{message.offset}"
      )
      binding.pry
      payload = message.payload
      puts "Product code = #{payload['product_code']}"
      puts "Inventory count = #{payload['inventory_count']}"
      return if payload["product_code"].blank?
      product = Product.find_by(code: payload["product_code"])
      product.update!(inventory: payload["inventory_count"])
    end
  end
end
