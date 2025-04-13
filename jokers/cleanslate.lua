SMODS.Joker{
    key = 'cleanslate',
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
        extra = {
            xchips = 2,
        }
    },
    
    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.xchips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card.ability.name == "Default Base" and not context.other_card.seal and not context.other_card.edition) then
            return {
                x_chips = card.ability.extra.xchips,
                colour = G.C.BLUE,
                card = card
            }
        end
    end
}