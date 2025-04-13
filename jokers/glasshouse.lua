SMODS.Joker{
    key = 'glasshouse',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 6,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = { retriggers = 1 }
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card.ability.name == "Stone Card" or context.other_card.ability.name == "Glass Card" then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
    end
}