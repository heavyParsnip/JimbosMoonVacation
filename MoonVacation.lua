assert(SMODS.load_file("ReverseTarot.lua"))()
assert(SMODS.load_file("Lunar.lua"))()
assert(SMODS.load_file("Boosters.lua"))()
assert(SMODS.load_file("Tags.lua"))()
assert(SMODS.load_file("Vouchers.lua"))()
assert(SMODS.load_file("Jokers.lua"))()
assert(SMODS.load_file("Seals.lua"))()

-- JOKER TIME BABY
local sub = "jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path..sub)
for k, v in pairs(jokers) do
    assert(SMODS.load_file(sub.."/"..v))()
end

MOONMOD = {vars = {}, funcs = {}, content = SMODS.current_mod}

