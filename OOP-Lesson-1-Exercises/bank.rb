class Account
    attr_reader :name, :balance
    def initialize(name, balance = 100)
        @name = name
        @balance = balance
    end

    def display_balance(pin_number)
        puts pin_number == pin ? "Balance $#{@balance}" : pin_error
    end
    
    def deposit(pin_number, amount)
       if  pin_number == pin 
           @balance += amount
           puts "Deposited $#{amount}. New balance: $#{@balance}."
       else
           puts pin_error
       end
    end
    
    private
    
    def pin
        @pin = 1234
    end
    
    def pin_error
        "Access denied: incorrect PIN."
    end
    
    def overdraft
        "Permission denied: Insufficient funds."
    end
end

class CheckingAccount < Account
  @@Liberty =  1
     def withdraw(pin_number, amount)
       if  pin_number == pin 
           if amount < @balance
               @balance -= amount
               puts "Withdrew $#{amount}. New balance: $#{@balance}."
           else
               puts overdraft
           end
       else
          puts pin_error
       end
    end
end

class SavingsAccount < Account
  @@Liberty = 0
end



checking_account = SavingsAccount.new("Sissy", 100_000)

checking_account.deposit(1234, 30000)