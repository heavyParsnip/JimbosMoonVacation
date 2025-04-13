SMODS.Atlas{
    key = 'seals',
    path = "Seals.png",
    px = 71,
    py = 95
}

SMODS.Seal{
    name = "Silver",
    key = 'silver',
    atlas = 'seals',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('C0C0C0'),
    discovered = false,
    config = {
        last_played_silvers = {}
    },

    loc_txt = {
        label = "Silver Seal"
    },

    draw = function(self, card, layer)
        G.shared_seals[card.seal].role.draw_major = card
        G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
        G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, true, card.children.center)
    end,

    calculate = function(self, card, context)
        if context.playing_card_end_of_round and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            local this_rank = card:get_id()
            local lunar_key = nil
            if this_rank == 2 then
                lunar_key = 'c_moon_deimos'
            elseif this_rank == 3 then
                lunar_key = 'c_moon_phobos'
            elseif this_rank == 4 then
                lunar_key = 'c_moon_dysnomia'
            elseif this_rank == 5 then
                lunar_key = 'c_moon_charon'
            elseif this_rank == 6 then
                lunar_key = 'c_moon_rhea'
            elseif this_rank == 7 then
                lunar_key = 'c_moon_titania'
            elseif this_rank == 8 then
                lunar_key = 'c_moon_triton'
            elseif this_rank == 9 then
                lunar_key = 'c_moon_europa'
            elseif this_rank == 10 then
                lunar_key = 'c_moon_io'
            elseif this_rank == 11 then
                lunar_key = 'c_moon_callisto'
            elseif this_rank == 12 then
                lunar_key = 'c_moon_titan'
            elseif this_rank == 13 then
                lunar_key = 'c_moon_ganymede'
            elseif this_rank == 14 then
                lunar_key = 'c_moon_luna'
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played then
                        local lunar_card = create_card('Lunar',G.consumeables, nil, nil, nil, nil, lunar_key, 'silsl')
                        lunar_card:add_to_deck()
                        G.consumeables:emplace(lunar_card)
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
            
            return {
                message = localize('k_plus_lunar'),
                colour = G.C.LUNAR,
                card = card
            }
        end
    end
}

SMODS.Seal{
    name = "Reverse",
    key = 'reverse',
    atlas = 'seals',
    pos = { x = 1, y = 0 },
    discovered = false,
    badge_colour = HEX('a61a20'),

    loc_txt = {
        label = "Reverse Seal"
    },

    calculate = function(self, card, context)
        if context.pre_discard then
            if not card.debuff then
                local tarots = {}

                for k, v in ipairs(G.consumeables.cards) do
                    if v.ability.set == "Tarot" then tarots[#tarots+1] = v end
                end

                if #tarots > 0 then card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_flipped'), colour = G.C.REVERSE}) end

                for i=1, #tarots do
                    local percent = 1.15 - (i-0.999)/(#tarots-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() tarots[i]:flip();play_sound('card1', percent);tarots[i]:juice_up(0.3, 0.3);return true end }))
                end
                delay(0.2)

                for i=1, #tarots do
                    local key = tarots[i].config.center.key
                    --print(key)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15, 
                        func = function()
                            if key == 'c_fool' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversefool)
                            elseif key == 'c_magician' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversemagician)
                            elseif key == 'c_high_priestess' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversehighpriestess)
                            elseif key == 'c_empress' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reverseempress)
                            elseif key == 'c_emperor' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reverseemperor)
                            elseif key == 'c_heirophant' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversehierophant)
                            elseif key == 'c_lovers' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reverselovers)
                            elseif key == 'c_chariot' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversechariot)
                            elseif key == 'c_justice' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversejustice)
                            elseif key == 'c_hermit' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversehermit)
                            elseif key == 'c_wheel_of_fortune' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversewheeloffortune)
                            elseif key == 'c_strength' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversestrength)
                            elseif key == 'c_hanged_man' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversehangedman)
                            elseif key == 'c_death' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversedeath)
                            elseif key == 'c_temperance' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversetemperance)
                            elseif key == 'c_devil' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversedevil)
                            elseif key == 'c_tower' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversetower)
                            elseif key == 'c_star' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversestar)
                            elseif key == 'c_moon' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversemoon)
                            elseif key == 'c_sun' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversesun)
                            elseif key == 'c_judgement' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reversejudgement)
                            elseif key == 'c_world' then
                                tarots[i]:set_ability(G.P_CENTERS.c_moon_reverseworld)
                            end
                            return true
                        end
                    }))
                end
                for i=1, #tarots do
                    local percent = 0.85 + (i-0.999)/(#tarots-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() tarots[i]:flip();play_sound('tarot2', percent, 0.6);tarots[i]:juice_up(0.3, 0.3);return true end }))
                end
                delay(0.2)
            end
        end
    end
}