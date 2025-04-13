SMODS.Joker{
    key = 'sagenpaprika',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 8,
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = { hand_size = 0, xmult = 0, hand_size_per_blind = 1, xmult_per_blind = 0.5 }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.hand_size_per_blind,
                center.ability.extra.xmult_per_blind,
                center.ability.extra.hand_size,
                1+center.ability.extra.xmult
            }
        }
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_size)
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.xmult > 0 then
            return {
                x_mult = 1+card.ability.extra.xmult
            }
        elseif context.setting_blind and not card.getting_sliced and not context.blueprint then
            card.ability.extra.hand_size = card.ability.extra.hand_size + card.ability.extra.hand_size_per_blind
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_per_blind
            G.hand:change_size(card.ability.extra.hand_size_per_blind)
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ORANGE,
                extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT}
            }
        elseif context.end_of_round and G.GAME.blind.boss and (card.ability.extra.hand_size > 0 or card.ability.extra.xmult > 0) and not context.blueprint then
            G.hand:change_size(-card.ability.extra.hand_size)
            card.ability.extra.hand_size = 0
            card.ability.extra.xmult = 0
            return {
                message = localize('k_reset'),
                colour = G.C.ORANGE
            }
        end
    end
}