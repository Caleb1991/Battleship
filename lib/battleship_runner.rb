require './lib/board'
require './lib/cell'
require './lib/computer'
require './lib/game'
require './lib/player'
require './lib/ship'

board = Board.new

puts board.render

crusier = Ship.new("Crusier", 3)

board.place(crusier, ["C2", "C3", "C4"])

puts board.render(true)

puts board.render

board.cells["A1"].fire_upon

puts board.render

board.cells["C2"].fire_upon
board.cells["C3"].fire_upon

puts board.render
puts board.render(true)

board.cells["C4"].fire_upon

puts board.render
