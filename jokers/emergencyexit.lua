SMODS.Joker{
    key = 'emergencyexit',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 3,
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    config = {
        extra = { bonus_discards = 5 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonus_discards
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    ease_discard(card.ability.extra.bonus_discards)
                    return true
                end)
            }))
        end
    end
}