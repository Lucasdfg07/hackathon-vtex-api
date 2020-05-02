json.orders @orders do |order|
	json.id order.id
	json.buyer_type order.buyer_type
	json.buyer_id order.buyer_id
	json.status order.status
	json.total order.total
	json.created_at order.created_at
	
	json.product order.products
end