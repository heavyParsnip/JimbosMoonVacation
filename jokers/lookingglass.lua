SMODS.Joker{
    key = 'lookingglass',
    atlas = 'jokers',
    pos = {x = 9, y = 0},
    cost = 6,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = { xmult = 2 }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.xmult
            }
        }
    end,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.ability.name == "Glass Card" then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card,
                    }
                else
                    return {
                        x_mult = card.ability.extra.xmult,
                        card = card
                    }
                end 
            end
        end
    end
}