xml.order_list(:for_product => @product.title) do
  @product.orders.each do |i|
    xml.order do
      xml.name(i.name)
      xml.email(i.email)
    end
  end
end
