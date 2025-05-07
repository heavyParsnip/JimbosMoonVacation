SMODS.Joker{
    key = 'cleanslate',
    atlas = 'jokers',
    pos = {x = 2, y = 0},
    cost = 8,
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            xchips = 1.5,
        }
    },
    
    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.xchips
            }
        }
    end,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card.ability.name == "Default Base") then
            return {
                x_chips = card.ability.extra.xchips,
                colour = G.C.BLUE,
                card = card
            }
        end
    end
}