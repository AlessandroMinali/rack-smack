require 'digest/sha2'

IO.foreach('./ban_list.txt') do |row|
  items = row.split(',')
  items[0] = Digest::SHA2.hexdigest(items[0])[0...16]
  IO.write('./ban_list_new.txt', items.join(','), mode: 'a')
end