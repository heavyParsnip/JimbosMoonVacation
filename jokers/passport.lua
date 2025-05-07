SMODS.Joker{
    key = 'passport',
    atlas = 'jokers',
    pos = {x = 0, y = 1},
    cost = 7,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = { seal_tally = 0, xmult = 0.25 }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.xmult,
                1+(center.ability.extra.xmult*self.config.extra.seal_tally)
            }
        }
    end,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    update = function(self, card, dt)
        self.config.extra.seal_tally = 0
        if G.playing_cards then
            for k, v in pairs(G.playing_cards) do
                if v.seal then self.config.extra.seal_tally = self.config.extra.seal_tally + 1 end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.joker_main and self.config.extra.seal_tally > 0 then
            return {
                x_mult = 1 + (self.config.extra.seal_tally*card.ability.extra.xmult)
            }
        end
    end
}