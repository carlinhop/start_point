def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop,money_amount)
  return shop[:admin][:total_cash]+=money_amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop,pets_amount)
  shop[:admin][:pets_sold] = pets_sold(shop) + pets_amount
  return pets_sold(shop)
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
   pet_array=[]
   for pet in shop[:pets] 
     if pet[:breed]==breed
        pet_array<<pet
     end
   end
   return pet_array
end

def find_pet_by_name(shop,name)
  finding = nil
     for pet in shop[:pets]
        finding = pet if pet[:name] == name
     end
  return finding
end

def remove_pet_by_name(shop,name)
  pet = find_pet_by_name(shop,name)
  location = shop[:pets].index(pet)
  shop[:pets].delete_at(location)
  return pet
end


def add_pet_to_stock(shop,new_pet)
  shop[:pets] <<  new_pet
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer,pet)
  customer[:pets] << pet
end

##Optional

def customer_can_afford_pet(customer, pet)
  if pet
    return (customer[:cash] >= pet[:price])? true: false
  end
end


def sell_pet_to_customer(shop, pet, customer)

    if customer_can_afford_pet(customer,pet) && pet && shop && customer
       add_pet_to_customer(customer,pet)
       increase_pets_sold(shop,1)
       add_or_remove_cash(shop,pet[:price])

    end


end

