json.product_orders @productOrders do |po|
	json.product po.product
	json.order po.order
	json.quantity po.quantity
end