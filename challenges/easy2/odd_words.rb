def swap(w)
  w.split(' ').map.with_index { |n,i| i.even? ? n : n.reverse }.join(' ')
end

p swap("whats the matter with kansas.")