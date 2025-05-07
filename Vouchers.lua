SMODS.Atlas{
    key = 'voucher',
    path = "Vouchers.png",
    px = 71,
    py = 95,
}

SMODS.Voucher{
    key = 'eclipse',
    atlas = 'voucher',
    pos = { x = 1, y = 0 },

    config = {
        extra = 2
    },

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_lunars
    end,

    redeem = function(self, card)
        G.GAME.lunar_rate = G.GAME.lunar_rate*card.ability.extra
    end
}

SMODS.Voucher{
    key = 'asteroidbelt',
    atlas = 'voucher',
    pos = { x = 1, y = 1 },

    config = {
        extra = 1.2
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.extra
            }
        }
    end,

    in_pool = function(self, args)
        return (G.GAME.used_vouchers.v_moon_eclipse and MOONMOD.content.config.enable_lunars)
    end
}

SMODS.Voucher{
    key = 'fortuneflipper',
    atlas = 'voucher',
    pos = { x = 0, y = 0  },

    config = {
        reverse_rate = 2
    },

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_reverses
    end,

    redeem = function(self, card)
        G.GAME.reverse_rate = card.ability.reverse_rate
    end
}

SMODS.Voucher{
    key = 'twistoffate',
    atlas = 'voucher',
    pos = { x = 0, y = 1 },

    in_pool = function(self, args)
        return (G.GAME.used_vouchers.v_moon_fortuneflipper and MOONMOD.content.config.enable_reverses)
    end,

    calculate = function(self, card, context)
        if context.consumeable and context.consumeable.ability.set == "Reverse" then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                return {
                    extra = {
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    local card_key = context.consumeable.config.center.key
                                    local flipped = nil
                                    if card_key == 'c_moon_reversefool' then    -- however it has to happen...
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_fool', 'flip')
                                    elseif card_key == 'c_moon_reversemagician' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_magician', 'flip')
                                    elseif card_key == 'c_moon_reversehighpriestess' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_high_priestess', 'flip')
                                    elseif card_key == 'c_moon_reverseempress' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_empress', 'flip')
                                    elseif card_key == 'c_moon_reverseemperor' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_emperor', 'flip')
                                    elseif card_key == 'c_moon_reversehierophant' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_heirophant', 'flip')
                                    elseif card_key == 'c_moon_reverselovers' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_lovers', 'flip')
                                    elseif card_key == 'c_moon_reversechariot' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_chariot', 'flip')
                                    elseif card_key == 'c_moon_reversejustice' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_justice', 'flip')
                                    elseif card_key == 'c_moon_reversehermit' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_hermit', 'flip')
                                    elseif card_key == 'c_moon_reversewheeloffortune' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_wheel_of_fortune', 'flip')
                                    elseif card_key == 'c_moon_reversestrength' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_strength', 'flip')
                                    elseif card_key == 'c_moon_reversehangedman' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_hanged_man', 'flip')
                                    elseif card_key == 'c_moon_reversedeath' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_death', 'flip')
                                    elseif card_key == 'c_moon_reversetemperance' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_temperance', 'flip')
                                    elseif card_key == 'c_moon_reversedevil' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_devil', 'flip')
                                    elseif card_key == 'c_moon_reversetower' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_tower', 'flip')
                                    elseif card_key == 'c_moon_reversestar' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_star', 'flip')
                                    elseif card_key == 'c_moon_reversemoon' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_moon', 'flip')
                                    elseif card_key == 'c_moon_reversesun' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_sun', 'flip')
                                    elseif card_key == 'c_moon_reversejudgement' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_judgement', 'flip')
                                    elseif card_key == 'c_moon_reverseworld' then
                                        flipped = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_world', 'flip')
                                    end
                
                                    if not not flipped then
                                        flipped:add_to_deck()
                                        G.consumeables:emplace(flipped)
                                    end
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                        ),
                        focus = context.consumeable,
                        message = localize('k_flipped'),
                        colour = G.C.REVERSE,
                    }
                }
            end
        end
    end
}