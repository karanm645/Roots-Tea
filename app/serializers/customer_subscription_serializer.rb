class CustomerSubscriptionSerializer
  def self.subscription_details(data)
    data.map do |attribute|
      {
        "data": {
          "type": "subscriptions",
          "id": attribute.id,
          "attributes":{
            "customer_id": attribute.customer_id,
            "tea_id": attribute.tea_id,
            "title": attribute.title,
            "price": attribute.price,
            "status": attribute.status,
            "frequency": attribute.frequency,
          }
        }
      }
    end
  end
end