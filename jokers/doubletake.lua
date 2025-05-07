SMODS.Joker{
    key = 'doubletake',
    atlas = 'jokers',
    pos = {x = 3, y = 0},
    cost = 8,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if not context.other_card:is_face() then
                return {
                    mult = context.other_card.base.nominal,
                }
            end
        end
    end
}