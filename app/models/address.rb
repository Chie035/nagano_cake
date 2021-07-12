class Address < ApplicationRecord
    belongs_to :costomer
   
   def full_address
      "〒" + self.postal_code + "　" + self.address + "　" + self.name
   end
   
   def address_only
       "〒" + self.postal_code + "　" + self.address
   end
   
end
