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
        cost = 3,
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
        cost = 3,
        consumeable = true
    },

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
        cost = 3,
        consumeable = true
    },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        for i = 1, 4 do
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

    can_use = function(self, card)
        if (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) then return true end
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
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
    end
}

-- Reverse Hierophant
SMODS.Consumable{
    key = 'reversehierophant',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 5, y = 0},

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

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Wheel of Fortune
SMODS.Consumable{
    key = 'reversewheeloffortune',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 0, y = 1},

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Strength
SMODS.Consumable{
    key = 'reversestrength',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 1, y = 1},

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Hanged Man
SMODS.Consumable{
    key = 'reversehangedman',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 2, y = 1},

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Death
SMODS.Consumable{
    key = 'reversedeath',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 3, y = 1},

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Temperance
SMODS.Consumable{
    key = 'reversetemperance',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 4, y = 1},

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Devil
SMODS.Consumable{
    key = 'reversedevil',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 5, y = 1},

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

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Moon
SMODS.Consumable{
    key = 'reversemoon',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 8, y = 1},

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Sun
SMODS.Consumable{
    key = 'reversesun',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 9, y = 1},

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
    end
}

-- Reverse Judgement
SMODS.Consumable{
    key = 'reversejudgement',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 0, y = 2},

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

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        
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