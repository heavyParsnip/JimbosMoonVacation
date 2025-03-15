
SMODS.current_mod.optional_features = {
    retrigger_joker = true  -- for Reverse Lovers
}


assert(SMODS.load_file("ReverseTarot.lua"))()
assert(SMODS.load_file("Lunar.lua"))()

MOONMOD = {vars = {}, funcs = {}, content = SMODS.current_mod}