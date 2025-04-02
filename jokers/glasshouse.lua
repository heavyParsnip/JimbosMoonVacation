SMODS.Joker{
    key = 'glasshouse',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 7,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.name == "Stone"
        end
    end
}