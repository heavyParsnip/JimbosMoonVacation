SMODS.Joker{
    key = 'astrophysics',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 7,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Planet' and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_lunar'), colour = G.C.LUNAR})
                    local lunar_card = create_card('Lunar',G.consumeables, nil, nil, nil, nil, lunar_key, 'astr')
                    lunar_card:add_to_deck()
                    G.consumeables:emplace(lunar_card)
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
        end
    end
}