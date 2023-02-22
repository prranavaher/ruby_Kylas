load "main.rb"

descibe "cal_gst"
  context "calculate GST on gross_amount" do
    
    before do
      s_gst = 8
      c_gst = 8
    end
    
    it "return GST amount on gross_amount" 
      true_amount = (gross_amount / 100) * (c_gst + s_gst)
      gst_amount = cal_gst(amount)
      expect(gst_amount).to eq(true_amount)
    end

  end  
end   

descibe "cal_discount"
  context "calculate discount amount on gross_amount" do
    it "return discount amount on gross_amount" 
      true_amount = amount > 300 ? amount * 0.3 : amount > 200 ? amount * 0.2 : amount > 100 ? amount * 0.1 : amount * 0.05
      discount_amount = cal_gst(amount)
      expect(discount_amount).to eq(true_amount)
    end
  end  
end  

descibe "cal_gross_bill"
  context "calculate gross_amount" do
    before do
      cart = { 1 => { name: 'bb', price: 30, quantity: 10 }, 2 => { name: 'cc', price: 40, quantity: 7 }} 
    end 
    
    it "return  total gross_amount"       
      expect(cal_gross_bill(cart)).to eq(580)
    end
  end  
end  

descibe "make_bill"
  context "calculate gross_amount" do
    before do
      cart = { 1 => { name: 'bb', price: 30, quantity: 10 }, 2 => { name: 'cc', price: 40, quantity: 7 }} 
    end 
    
    it "return  total gross_amount"       
      expect(make_bill(cart)).to eq(498.79999999999995)
    end
  end  
end  

descibe "add_to_menu"
  context "adding item to menu" do
    before do
      menu = { 1 => { name: 'aa', price: 10, quantity: 10 }, 2 => { name: 'bb', price: 30, quantity: 10 }, 3 => { name: 'cc', price: 40, quantity: 7 }} 
    end 
    
    it "item gets added successfully, in menu key for that item id should return true"       
      expect_any_instance_of(Kernel).to receive(:gets).and_return("apple")
      expect_any_instance_of(Kernel).to receive(:gets).and_return(60)
      expect_any_instance_of(Kernel).to receive(:gets).and_return(15)
      # add_to_menu("apple", menu, 60, 15)
      # expect(add_to_menu("apple", menu, 60, 15)).to eq({4 => { name: 'apple', price: 60, quantity: 15 }})
      # expect(menu.size).to eq(4)
      expect(menu.key?(4)).to eq(true)
    end
  end  
end 

descibe "add_to_cart"
  context "adding item to cart" do
    before do
      cart = { 1 => { name: 'bb', price: 30, quantity: 10 }, 2 => { name: 'cc', price: 40, quantity: 7 } }
      menu = { 1 => { name: 'aa', price: 10, quantity: 10 }, 2 => { name: 'bb', price: 30, quantity: 10 }, 3 => { name: 'cc', price: 40, quantity: 7 }, 4 => { name: 'dd', price: 70, quantity: 10 }, 5 => { name: 'ee', price: 90, quantity: 10 } }
    end 
    
    it "item gets added successfully, quantity for that item in cart should increase"       
      expect_any_instance_of(Kernel).to receive(:gets).and_return(3)
      expect_any_instance_of(Kernel).to receive(:gets).and_return(6)
      add_to_cart(3,6, menu, cart)
      expect(cart[3][:quantity]).to eq(6)
    end
    
    it "item gets added successfully quantity for that item in menu should decrease"       
      expect_any_instance_of(Kernel).to receive(:gets).and_return(3)
      expect_any_instance_of(Kernel).to receive(:gets).and_return(6)
      add_to_cart(3,6, menu, cart)
      expect(menu[3][:quantity]).to eq(1)
    end
    
    it "menu does not have sufficient quantity cart size should remain as before"       
      expect_any_instance_of(Kernel).to receive(:gets).and_return(3)
      expect_any_instance_of(Kernel).to receive(:gets).and_return(8)
      add_to_cart(3,8, menu, cart)
      expect(cart.size).to eq(2)
    end
    
    it "menu does not have sufficient quantity, menu should retain quantity of that product"       
      expect_any_instance_of(Kernel).to receive(:gets).and_return(3)
      expect_any_instance_of(Kernel).to receive(:gets).and_return(8)
      add_to_cart(3,8, menu, cart)
      expect(menu[3][:quantity]).to eq(7)
    end
    
    it "item does not exists, in menu key for that item id should return false"       
      expect_any_instance_of(Kernel).to receive(:gets).and_return(6)
      expect_any_instance_of(Kernel).to receive(:gets).and_return(8)
      add_to_cart(6,8, menu, cart)
      expect(menu.key?(6)).to eq(false)
    end
  end  
end 

descibe "remove_item_from_cart"
  context "removing item from cart" do
    before do
      cart = { 1 => { name: 'bb', price: 30, quantity: 10 }, 2 => { name: 'cc', price: 40, quantity: 7 } }
    end 
    
    it "item gets removed successfully, in cart key for that item id should return false"       
      expect_any_instance_of(Kernel).to receive(:gets).and_return(2)
      remove_item_from_cart(2, cart)
      expect(cart.key?(2)).to eq(false)
    end
  end  
end 



 


