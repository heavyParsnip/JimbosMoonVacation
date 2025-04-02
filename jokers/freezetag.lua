SMODS.Joker{
    key = 'freezetag',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.skip_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    add_tag(get_next_tag_key())
                    return true
                end
            }))
        end
    end
}