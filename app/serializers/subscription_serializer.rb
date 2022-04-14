class SubscriptionSerializer
    def self.subscription_details(data)
    {
      "data": {
        "type": "subscriptions",
        "id": data.id,
        "attributes":{
          "customer_id": data.customer_id,
          "tea_id": data.tea_id,
          "title": data.title,
          "price": data.price,
          "status": data.status,
          "frequency": data.frequency
        }
      }
    }
  end
end