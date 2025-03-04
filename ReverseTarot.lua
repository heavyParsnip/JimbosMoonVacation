-- REVERSE TAROT CARDS --
SMODS.Atlas{
    key = 'reverse',
    path = "Reverses.png",
    px = 71,
    py = 95,
}

SMODS.ConsumableType{
    key = 'Reverse',

    collection_rows = {5, 6},
    primary_colour = G.C.REVERSE,
    secondary_colour = G.C.REVERSE,
    shop_rate = 1,

    loc_txt = {
        collection = 'Reverse Tarot Cards',
        name = 'Reverse Tarot',
        undiscovered = {
            name = 'Undiscovered Reverse',
            text = {'Purchase or use', 'this card in an', 'unseeded run to', 'learn what it does'}
        },
    }
}

SMODS.UndiscoveredSprite{
    key = "Reverse",
    atlas = 'reverse',
    pos = {x = 2, y = 2}
}

-- Reverse Fool
SMODS.Consumable{
    key = 'reversefool',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 0, y = 0},


    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

-- Reverse Magician
SMODS.Consumable{
    key = 'reversemagician',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 1, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.probabilities.normal+G.GAME.reverse_upgrades.lucky,
                G.GAME.probabilities.normal+G.GAME.reverse_upgrades.lucky+1
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)
        G.GAME.reverse_upgrades.lucky = G.GAME.reverse_upgrades.lucky + 1
    end
}

-- Reverse High Priestess
SMODS.Consumable{
    key = 'reversehighpriestess',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 2, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
        moons = 4
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                self.config.moons
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        for i = 1, self.config.moons do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                    play_sound('timpani')
                    local new_card = SMODS.create_card{set = "Lunar", area = G.consumeables}
                    new_card:set_edition({negative = true}, true)
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                    card:juice_up(0.3, 0.5)
                    return true 
                end
            }))
        end
        delay(0.6)
    end
}

-- Reverse Empress
SMODS.Consumable{
    key = 'reverseempress',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 3, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                4+(G.GAME.reverse_upgrades.mult*3),
                7+(G.GAME.reverse_upgrades.mult*3)
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)
        G.GAME.reverse_upgrades.mult = G.GAME.reverse_upgrades.mult + 1
    end
}

-- Reverse Emperor
SMODS.Consumable{
    key = 'reverseemperor',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 4, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
        reverses = 2
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.reverses
            }
        }
    end,

    can_use = function(self, card)
        if (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) then return true end
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.reverses, G.consumeables.config.card_limit - #G.consumeables.cards) do
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', 
                    delay = 0.4, 
                    func = function()
                        play_sound('timpani')
                        local new_card = SMODS.create_card{set = "Reverse", area = G.consumeables}
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        card:juice_up(0.3, 0.5)
                        return true 
                    end
                }))
            end
        end
        delay(0.6)
    end
}

-- Reverse Hierophant
SMODS.Consumable{
    key = 'reversehierophant',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 5, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                30+(G.GAME.reverse_upgrades.bonus*20),
                50+(G.GAME.reverse_upgrades.bonus*20)
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)

        G.GAME.reverse_upgrades.bonus = G.GAME.reverse_upgrades.bonus + 1
    end
}

-- Reverse Lovers
SMODS.Consumable{
    key = 'reverselovers',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 6, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                -- G.GAME.reverse_upgrades.wild,
                -- G.GAME.reverse_upgrades.wild+1
                1.0+(G.GAME.reverse_upgrades.wild*0.5),
                1.5+(G.GAME.reverse_upgrades.wild*0.5)
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)

        G.GAME.reverse_upgrades.wild = G.GAME.reverse_upgrades.wild + 1
    end
}

-- Reverse Chariot
SMODS.Consumable{
    key = 'reversechariot',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 7, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                1.5+(G.GAME.reverse_upgrades.steel*0.25),
                1.75+(G.GAME.reverse_upgrades.steel*0.25)
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)

        G.GAME.reverse_upgrades.steel = G.GAME.reverse_upgrades.steel + 1
    end
}

-- Reverse Justice
SMODS.Consumable{
    key = 'reversejustice',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 8, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                2+(G.GAME.reverse_upgrades.glass*0.75),
                2.75+(G.GAME.reverse_upgrades.glass*0.75)
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)

        G.GAME.reverse_upgrades.glass = G.GAME.reverse_upgrades.glass + 1
    end
}

-- Reverse Hermit
SMODS.Consumable{
    key = 'reversehermit',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 9, y = 0},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    can_use = function(self, card)
        return not not G.shop
    end,

    use = function(self, card, area, copier)
        local voucher_key = get_next_voucher_key()
        G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
        local voucher = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2, 
        G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[voucher_key],{bypass_discovery_center = true, bypass_discovery_ui = true})
        voucher.cost = 0
        create_shop_card_ui(voucher, 'Voucher', G.shop_vouchers)
        voucher:start_materialize()     -- Ideally would want this played after the shop reappears
        G.shop_vouchers:emplace(voucher)

        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.4,
            func = function()
                card:juice_up(0.3, 0.5)
                play_sound('timpani')
                if G.GAME.dollars ~= 0 then
                    ease_dollars(math.floor(-G.GAME.dollars/2), true)
                else
                    ease_dollars(0, true)
                end
                return true
            end
        }))

        -- Any way to get this event to play after the consumeable animation ends and the shop reappers?
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                voucher:juice_up(0.3, 0.5)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end
        }))
        -- delay(0.6)
    end
}

-- Reverse Wheel of Fortune
SMODS.Consumable{
    key = 'reversewheeloffortune',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 0, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
        chance = 4
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.probabilities.normal
            }
        }
    end,

    can_use = function(self, card)
        for k, v in pairs(G.jokers.cards) do
           if v.ability.set == 'Joker' and (not v.edition) then return true end
        end
    end,

    use = function(self, card, area, copier)
        if pseudorandom('reverse_wheel_of_fortune') < G.GAME.probabilities.normal / card.ability.chance then
            local joker_pool = {}
            for k, v in pairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and (not v.edition) then
                    table.insert(joker_pool, v)
                end
            end

            local chosen_joker = pseudorandom_element(joker_pool, pseudoseed('reverse_wheel_of_fortune'))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    set_edition_pn(chosen_joker)
                    chosen_joker:juice_up(0.3, 0.5)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)  -- Match the animation spacing of the original Wheel of Fortune
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nuhuh'),
                        colour = G.C.WHITE,
                        backdrop_colour = G.C.REVERSE,
                        scale = 1.3, 
                        hold = 1.4,
                        major = card,
                        align = 'cm',
                        })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', 
                        delay = 0.06*G.SETTINGS.GAMESPEED, 
                        blockable = false, 
                        blocking = false, 
                        func = function()
                            play_sound('tarot2', 0.76, 0.4);
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)  -- Match the animation spacing of the original Wheel of Fortune
        end

    end
}

-- Reverse Strength
SMODS.Consumable{
    key = 'reversestrength',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 1, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
        max_highlighted = 4
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.max_highlighted
            }
        }
    end,

    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()   -- hmm....
                    if(G.hand.highlighted[i].base.id == 14) then
                        SMODS.change_base(G.hand.highlighted[i], nil, 'King')
                    elseif(G.hand.highlighted[i].base.id == 13) then
                        SMODS.change_base(G.hand.highlighted[i], nil, 'Queen')
                    elseif(G.hand.highlighted[i].base.id == 12) then
                        SMODS.change_base(G.hand.highlighted[i], nil, 'Jack')
                    elseif(G.hand.highlighted[i].base.id == 11) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '10')
                    elseif(G.hand.highlighted[i].base.id == 10) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '9')
                    elseif(G.hand.highlighted[i].base.id == 9) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '8')
                    elseif(G.hand.highlighted[i].base.id == 8) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '7')
                    elseif(G.hand.highlighted[i].base.id == 7) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '6')
                    elseif(G.hand.highlighted[i].base.id == 6) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '5')
                    elseif(G.hand.highlighted[i].base.id == 5) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '4')
                    elseif(G.hand.highlighted[i].base.id == 4) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '3')
                    elseif(G.hand.highlighted[i].base.id == 3) then
                        SMODS.change_base(G.hand.highlighted[i], nil, '2')
                    elseif(G.hand.highlighted[i].base.id == 2) then
                        SMODS.change_base(G.hand.highlighted[i], nil, 'Ace')
                    end
                    return true
                end
            }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
    end
}

-- Reverse Hanged Man
SMODS.Consumable{
    key = 'reversehangedman',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 2, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
        max_highlighted = 5
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.max_highlighted
            }
        }
    end,

    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,

    use = function(self, card, area, copier)
        local destroyed_cards = {}
        for i=#G.hand.highlighted, 1, -1 do
            destroyed_cards[#destroyed_cards+1] = G.hand.highlighted[i]
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                for i=#G.hand.highlighted, 1, -1 do
                    local to_destroy = G.hand.highlighted[i]
                    if to_destroy.ability.name == 'Glass Card' then 
                        to_destroy:shatter()
                    else
                        to_destroy:start_dissolve(nil, i == #G.hand.highlighted)
                    end
                end
                return true
            end
        }))
        delay(0.3)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
        end
    end
}

-- Reverse Death
SMODS.Consumable{
    key = 'reversedeath',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 3, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
        need_highlighted = 2
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.need_highlighted
            }
        }
    end,

    can_use = function(self, card)
        return #G.hand.highlighted == card.ability.need_highlighted
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end 
        }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        local rightmost = G.hand.highlighted[1]
        for i=1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x > rightmost.T.x then rightmost = G.hand.highlighted[i] end 
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.hand.highlighted[i] ~= rightmost then
                        old_rank = G.hand.highlighted[i].base.value
                        old_suit = G.hand.highlighted[i].base.old_suit
                        copy_card(rightmost, G.hand.highlighted[i])
                        SMODS.change_base(G.hand.highlighted[i], old_suit, old_rank)
                    end
                    return true
                end
            }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
    end
}

-- Reverse Temperance
SMODS.Consumable{
    key = 'reversetemperance',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 4, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true,
        penalty_per_spectral = 2,
        money_penalty = 0,
        max_penalty = 30
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.penalty_per_spectral,
                center.ability.max_penalty,
                center.ability.money_penalty
            }
        }
    end,

    can_use = function(self, card)
        if (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) then return true end
    end,

    use = function(self, card, area, copier)
        local spectrals_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'Spectral' then spectrals_used = spectrals_used + 1 end
        end
        self.config.money_penalty = spectrals_used*2
        
        for i = 1, G.consumeables.config.card_limit - #G.consumeables.cards do
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', 
                    delay = 0.4, 
                    func = function()
                        play_sound('timpani')
                        local new_card = SMODS.create_card{set = "Spectral", area = G.consumeables}
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        card:juice_up(0.3, 0.5)
                        ease_dollars(-(math.min(self.config.money_penalty, card.ability.max_penalty)), true)
                        return true 
                    end
                }))
            end
        end
        delay(0.6)
    end
}

-- Reverse Devil
SMODS.Consumable{
    key = 'reversedevil',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 5, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                3+(G.GAME.reverse_upgrades.gold*4),
                7+(G.GAME.reverse_upgrades.gold*4)
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)

        G.GAME.reverse_upgrades.gold = G.GAME.reverse_upgrades.gold + 1
    end
}

-- Reverse Tower
SMODS.Consumable{
    key = 'reversetower',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 6, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                50+(G.GAME.reverse_upgrades.stone*30),
                80+(G.GAME.reverse_upgrades.stone*30)
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        reverse_kaboom(card)

        G.GAME.reverse_upgrades.stone = G.GAME.reverse_upgrades.stone + 1
    end
}

-- Reverse Star
SMODS.Consumable{
    key = 'reversestar',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 7, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    can_use = function(self, card)
        local has_diamonds = false
        
        if G.hand and G.hand.cards then
            for k, v in ipairs(G.hand.cards) do
                if v:is_suit("Diamonds") and v.ability.effect ~= "Stone Card" then
                    has_diamonds = true
                end
            end
        end
        return has_diamonds
    end,

    use = function(self, card, area, copier)
        local destroyed_cards = {}

        for i = #G.hand.cards, 1, -1 do
            if G.hand.cards[i]:is_suit("Diamonds") and G.hand.cards[i].ability.effect ~= "Stone Card" then
                destroyed_cards[#destroyed_cards+1] = G.hand.cards[i]
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                for i=#destroyed_cards, 1, -1 do
                    local to_destroy = destroyed_cards[i]
                    if to_destroy.ability.name == 'Glass Card' then 
                        to_destroy:shatter()
                    else
                        to_destroy:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true
            end
        }))
        delay(0.3)
    end
}

-- Reverse Moon
SMODS.Consumable{
    key = 'reversemoon',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 8, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    can_use = function(self, card)
        local has_clubs = false
        
        if G.hand and G.hand.cards then
            for k, v in ipairs(G.hand.cards) do
                if v:is_suit("Clubs") and v.ability.effect ~= "Stone Card" then
                    has_clubs = true
                end
            end
        end
        return has_clubs
    end,

    use = function(self, card, area, copier)
        local destroyed_cards = {}

        for i = #G.hand.cards, 1, -1 do
            if G.hand.cards[i]:is_suit("Clubs") and G.hand.cards[i].ability.effect ~= "Stone Card" then
                destroyed_cards[#destroyed_cards+1] = G.hand.cards[i]
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                for i=#destroyed_cards, 1, -1 do
                    local to_destroy = destroyed_cards[i]
                    if to_destroy.ability.name == 'Glass Card' then 
                        to_destroy:shatter()
                    else
                        to_destroy:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true
            end
        }))
        delay(0.3)
    end
}

-- Reverse Sun
SMODS.Consumable{
    key = 'reversesun',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 9, y = 1},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    can_use = function(self, card)
        local has_hearts = false
        
        if G.hand and G.hand.cards then
            for k, v in ipairs(G.hand.cards) do
                if v:is_suit("Hearts") and v.ability.effect ~= "Stone Card" then
                    has_hearts = true
                end
            end
        end
        return has_hearts
    end,

    use = function(self, card, area, copier)
        local destroyed_cards = {}

        for i = #G.hand.cards, 1, -1 do
            if G.hand.cards[i]:is_suit("Hearts") and G.hand.cards[i].ability.effect ~= "Stone Card" then
                destroyed_cards[#destroyed_cards+1] = G.hand.cards[i]
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                for i=#destroyed_cards, 1, -1 do
                    local to_destroy = destroyed_cards[i]
                    if to_destroy.ability.name == 'Glass Card' then 
                        to_destroy:shatter()
                    else
                        to_destroy:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true
            end
        }))
        delay(0.3)
    end
}

-- Reverse Judgement
SMODS.Consumable{
    key = 'reversejudgement',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 0, y = 2},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse World
SMODS.Consumable{
    key = 'reverseworld',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 1, y = 2},

    config = {
        discovered = false,
        cost = 5,
        consumeable = true
    },

    can_use = function(self, card)
        local has_spades = false
        
        if G.hand and G.hand.cards then
            for k, v in ipairs(G.hand.cards) do
                if v:is_suit("Spades") and v.ability.effect ~= "Stone Card" then
                    has_spades = true
                end
            end
        end
        return has_spades
    end,

    use = function(self, card, area, copier)
        local destroyed_cards = {}

        for i = #G.hand.cards, 1, -1 do
            if G.hand.cards[i]:is_suit("Spades") and G.hand.cards[i].ability.effect ~= "Stone Card" then
                destroyed_cards[#destroyed_cards+1] = G.hand.cards[i]
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                for i=#destroyed_cards, 1, -1 do
                    local to_destroy = destroyed_cards[i]
                    if to_destroy.ability.name == 'Glass Card' then 
                        to_destroy:shatter()
                    else
                        to_destroy:start_dissolve(nil, i == #destroyed_cards)
                    end
                end
                return true
            end
        }))
        delay(0.3)
    end
}

function reverse_kaboom(card)
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.8,
        func = function()
            card:juice_up(0.3, 0.5)
            play_sound('timpani')
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 2.8,
        func = function()
            card:explode({G.C.REVERSE})
            return true
        end
    }))
end

-- For reverse wheel of fortune. Sets the given joker to Polychrome (70%) or Negative (30%)
function set_edition_pn(joker)
    local edition_poll = pseudorandom(pseudoseed('reverse_wheel_of_fortune'))
    if edition_poll > 0.7 then 
        joker:set_edition({negative = true}, true)
        return true
    elseif edition_poll > 0 then
        joker:set_edition({polychrome = true}, true)
        return true
    end
end