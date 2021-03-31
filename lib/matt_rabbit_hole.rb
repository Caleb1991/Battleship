
#to be added the Cell class

require './lib/ship'
require './lib/cell'
require 'pry'

cell_condition = {
  :open_water => ".",
  :missed_shot => "M",
  :unhit_ship => "S",
  :hit_ship => "H",
  :sunk_ship => "X"
  }

binding.pry

def render
  if ship != nil
    if has_been_hit == true
      if ship.sunk? == true
        p cell_condition[:sunk_ship]
      else ship.hit == true
        p cell_condition[:hit_ship]
      end
    else
      p cell_condition[:unhit_ship]
    end
  else
    if ship == nil
      if has_been_hit == true
        p cell_condition[:missed_shot]
      else
        p cell_condition[:open_water]
      end
    end
end

binding.pry

end
