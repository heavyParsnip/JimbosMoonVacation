SMODS.Joker{
    key = 'glasshouse',
    atlas = 'jokers',
    pos = {x = 6, y = 0},
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

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    calculate = function(self, card, context)
        if context.repetition then
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