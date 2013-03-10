# Side Effects
Item = Struct.new(:name,:price)
i = Item.new("Apple", 2)

puts i.name
def not_f(i)
  i.name = "Orange"
end
not_f(i)
puts i.name




