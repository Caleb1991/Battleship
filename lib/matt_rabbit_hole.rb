# @target = nil
#
# if ship != nil && target != nil && ship.sunk? == true, then condition = sunk_ship
# elsif ship != nil && target != nil && ship.sunk? == false && ship.hit == true, then condition = hit_ship
# elsif ship != nil && target == nil, then condition = unhit_ship
# elsif ship != nil && target != nil, then condition = unhit_ship
# elsif ship == nil && target != nil, then condition = missed_shot
# else ship == nil && target == nil, then condition = open_water
#
# def condition class
#   {
#     open_water => ".",
#     unhit_ship => "S",
#     hit_ship => "H",
#     missed_shot => "M"
#     sunk_ship => "X"
#     }
# end
