SMODS.Joker{
    key = 'timebomb',
    atlas = 'jokers',
    pos = {x = 5, y = 1},
    cost = 5,
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    config = {
        extra = { bomb_rounds = 0, max_rounds = 1 }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.max_rounds,
                center.ability.extra.bomb_rounds
            }
        }
    end,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.bomb_rounds = 0
        card.ability.extra.max_rounds = 1
    end,

    calculate = function(self, card, context)
        if context.blueprint then return end

        if context.selling_self and card.ability.extra.bomb_rounds >= card.ability.extra.max_rounds then
            local destroyed_cards = {}
            for i = #G.hand.highlighted, 1, -1 do
                destroyed_cards[#destroyed_cards+1] = G.hand.highlighted[i]
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(1.0, 1.0)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function() 
                    for i=#G.hand.highlighted, 1, -1 do
                        local card = G.hand.highlighted[i]
                        if card.ability.name == 'Glass Card' then 
                            card:shatter()
                        else
                            card:start_dissolve(nil, i == #G.hand.highlighted)
                            play_sound('moon_timebomb-boom', 1.0, 0.15)
                        end
                    end
                    return true
                end
            }))
            return {
                message = localize('k_timebombboom'),
                colour = G.C.FILTER
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.bomb_rounds = card.ability.extra.bomb_rounds + 1
            if card.ability.extra.bomb_rounds >= card.ability.extra.max_rounds then
                play_sound('moon_timebomb-ready')
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
                return {
                    message = localize('k_timebombready'),
                    --sound = 'moon_timebomb-ready',
                    colour = G.C.FILTER,
                    card = card
                }
            else
                return {
                    message = card.ability.bomb_rounds..'/'..card.ability.extra.max_rounds,
                    colour = G.C.FILTER
                }
            end
        end
    end
}

SMODS.Sound{
    key = 'timebomb-ready',
    path = 'timebomb-ready.ogg'
}

SMODS.Sound{
    key = 'timebomb-boom',
    path = 'timebomb-boom.ogg'
}