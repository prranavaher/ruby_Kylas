class Cart
    def initialize
      @menu = { 1 => { name: 'aa', price: 10, quantity: 10 }, 2 => { name: 'bb', price: 30, quantity: 10 }, 3 => { name: 'cc', price: 40, quantity: 7 }, 4 => { name: 'dd', price: 70, quantity: 10 }, 5 => { name: 'ee', price: 90, quantity: 10 } }
  
      @cart = { 1 => { name: 'bb', price: 30, quantity: 10 }, 2 => { name: 'cc', price: 40, quantity: 7 } }
  
      @counter = @menu.size
      @cart_counter = @cart.size
    end
  
    def cal_gst(amount)
      gst_amount = 0.0
      s_gst = 8
      c_gst = 8
      gst_amount = (amount / 100) * (c_gst + s_gst)
      puts "Your GST amount is #{gst_amount}"
      gst_amount
    end
  
    def cal_discount(amount)
      puts 'We have 10%, 20% and 30% discount based on your bill'
      if amount > 300
        return (amount * 0.3)
      elsif amount > 200
        return (amount * 0.2)
      elsif amount > 100
        return (amount * 0.1)
      end
  
      (amount * 0.05)
    end
  
    def cal_gross_bill
      gross_amount = 0.0
      @cart.each do |_key, value|
        gross_amount += (value[:price] * value[:quantity]).to_i
      end
      puts "Your gross amount is #{gross_amount}"
      gross_amount
    end
  
    def make_bill
      gross_amount = cal_gross_bill
      gst_amount = cal_gst(gross_amount)
      discount_amount = cal_discount(gross_amount)
      puts "Your discount amount is: #{discount_amount}"
      total_amount = gross_amount + gst_amount - discount_amount
      puts "Your total amount is: #{total_amount}"
    end
  
    def add_to_menu(item_name, item_price, item_quantity)
      @counter += 1
      @menu[@counter] = { name: item_name, price: item_price, quantity: item_quantity }
      puts "#{item_name} added to menu: "
      puts
    end
  
    def print_store(store)
      if store == @menu
        puts "\n\n--------Our Menu--------"
      else
        puts "\n\n--------Your Cart--------"
      end
      puts 'ID | Name | Price | Quantity'
      store.each do |key, value|
        print "#{key}: "
        value.each do |_key1, value1|
          print "   #{value1}    "
        end
        puts
      end
    end
  
    def add_to_cart(item_number, item_quantity)
      if !@menu.key?(item_number)
        puts 'We dont have any such item'
        nil
      elsif item_quantity <= @menu[item_number][:quantity]
        @cart_counter += 1
        @cart[@cart_counter] = {
          name: @menu[item_number][:name],
          price: @menu[item_number][:price],
          quantity: item_quantity
        }
  
        @menu[item_number][:quantity] -= item_quantity
        puts "#{@menu[item_number][:name]} added to cart: "
      else
        puts "We have only #{@menu[item_number][:quantity]} items available. Please select quantity again."
      end
    end
  
    def remove_item_from_cart(item_number)
      if !@cart.key?(item_number)
        puts 'You dont have any such item'
        nil
      else
        puts "#{@cart[item_number][:name]} removed from cart: "
        @cart.delete(item_number)
        @cart_counter -= 1
      end
    end
  
    def show_commands
      puts
      puts '--------Welcome to shopping cart--------'
      puts
      puts 'Press -1 to exit'
      puts '1. Add item in menu'
      puts '2. Print menu'
      puts '3. Add item to your cart'
      puts '4. Print your cart'
      puts '5. Remove item from cart'
      puts '6. Make bill'
      puts
    end
  
    def driver
      choice = 0
  
      loop do
        show_commands
  
        print 'Enter choice: '
        choice = gets.chomp.to_i
  
        case choice
        when -1
          break
        when 1
          puts 'Type -1 to return to Command screen'
          puts
          loop do
            print 'Enter item name to add to menu: '
            item_name = gets.chomp
  
            break if item_name == '-1'
  
            print 'Enter price: '
            item_price = gets.chomp.to_i
            break if item_price == -1
  
            print 'Enter quantity: '
            item_quantity = gets.chomp.to_i
            break if item_quantity == -1
  
            add_to_menu(item_name, item_price, item_quantity)
  
            break if item_name == '-1'
          end
  
        when 2
          print_store(@menu)
  
        when 3
          puts 'Type -1 to return to Command screen'
          print 'Enter item number: '
  
          item_number = gets.chomp.to_i
          break if item_number == -1
  
          print 'Enter qunatity: '
          item_quantity = gets.chomp.to_i
          break if item_quantity == -1
  
          item_number = item_number.to_i
          add_to_cart(item_number, item_quantity)
  
        when 4
          print_store(@cart)
  
        when 5
          puts 'Type -1 to return to Command screen'
          print 'Enter item number to be removed from cart: '
  
          item_number = gets.chomp.to_i
          break if item_number == -1
  
          remove_item_from_cart(item_number)
  
        when 6
          puts make_bill
        end
  
        break if choice == -1
      end
    end
  end
  
  cart1 = Cart.new
  cart1.driver
  