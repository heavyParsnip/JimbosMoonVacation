
assert(SMODS.load_file("ReverseTarot.lua"))()
assert(SMODS.load_file("Lunar.lua"))()
assert(SMODS.load_file("Boosters.lua"))()
assert(SMODS.load_file("Vouchers.lua"))()
assert(SMODS.load_file("Tags.lua"))()

MOONMOD = {vars = {}, funcs = {}, content = SMODS.current_mod}

