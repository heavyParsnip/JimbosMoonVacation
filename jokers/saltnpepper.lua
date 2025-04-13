SMODS.Joker{
    key = 'saltnpepper',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 5,
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = { chips = 0, mult = 0, chips_per_blind = 20, mult_per_blind = 5 }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.chips_per_blind,
                center.ability.extra.mult_per_blind,
                center.ability.extra.chips,
                center.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and (card.ability.extra.chips > 0 or card.ability.extra.mult > 0) then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        elseif context.setting_blind and not card.getting_sliced and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_per_blind
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_per_blind
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT}
            }
        elseif context.end_of_round and G.GAME.blind.boss and (card.ability.extra.chips > 0 or card.ability.extra.mult > 0) and not context.blueprint then
            card.ability.extra.chips = 0
            card.ability.extra.mult = 0
            return {
                message = localize('k_reset'),
                colour = G.C.ORANGE
            }
        end
    end
}