class SubscriptionSerializer
    def self.subscription_details(data)
    {
      "data": {
        "type": "subscriptions",
        "id": data.id,
        "attributes":{
          "title": data.title,
          "status": data.status,
          "frequency": data.frequency,
          "tea_id": data.tea_id,
          "price": data.price,
          "customer_id": data.customer_id
        }
      }
    }
  end
end