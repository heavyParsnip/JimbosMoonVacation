SMODS.Joker{
    key = 'doubletake',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 8,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if not (context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
                return {
                    mult = context.other_card.base.nominal,
                }
            end
        end
    end
}