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
            if not context.other_card.base.value == 'Jack' and not context.other_card.base.value == 'Queen' and not context.other_card.base.value == 'King' then
                return {
                    message = localize{type='variable',key='a_mult',vars={context.other_card.base.nominal}},
                    mult_mod = context.other_card.base.nominal,
                } 
            end
        end
    end
}