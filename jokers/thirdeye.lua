SMODS.Joker{
    key = 'thirdeye',
    atlas = 'jokers',
    pos = {x = 4, y = 1},
    cost = 5,
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = { chance = 3 }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.probabilities.normal,
                center.ability.extra.chance
            }
        }
    end,

    calculate = function(self, card, context)
        if context.consumeable and context.consumeable.ability.set == "Tarot" and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if pseudorandom('thirdeye') < G.GAME.probabilities.normal/card.ability.extra.chance then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {focus = card, message = localize('k_plus_reverse'), func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                local rev = create_card('Reverse', G.consumeables, nil, nil, nil, nil, nil, '3rdi')
                                rev:add_to_deck()
                                G.consumeables:emplace(rev)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                    end},
                    colour = G.C.REVERSE,
                    card = card
                }
            end
        end
    end
}