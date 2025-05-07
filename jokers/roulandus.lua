SMODS.Joker{
    key = 'roulandus',
    atlas = 'jokers',
    pos = {x = 1, y = 1},
    soul_pos = {x = 1, y = 2},
    cost = 20,
    rarity = 4,
    unlocked = false,
    unlock_condition = {hidden = true},

    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            chips = 0,
            mult = 0,
            xmult = 1,
            chip_growth = 12,
            mult_growth = 12,
            xmult_growth = 0.2,
            scored = 0,
            trigger = 12
        }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.chip_growth,
                center.ability.extra.mult_growth,
                center.ability.extra.xmult_growth,
                center.ability.extra.trigger,
                center.ability.extra.trigger-center.ability.extra.scored,
                center.ability.extra.chips,
                center.ability.extra.mult,
                center.ability.extra.xmult
            }
        }
    end,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.scored = card.ability.extra.scored + 1
            if card.ability.extra.scored >= card.ability.extra.trigger then
                card.ability.extra.scored = 0
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_growth
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_growth
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_growth
                return {
                    focus = card,
                    message = localize('k_upgrade_ex'),
                    colour = G.C.DARK_EDITION,
                }
            end
        end

        if context.joker_main and (card.ability.extra.chips > 0 or card.ability.extra.mult > 0 or card.ability.extra.xmult > 1) then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                x_mult = card.ability.extra.xmult
            }
        end
    end
}