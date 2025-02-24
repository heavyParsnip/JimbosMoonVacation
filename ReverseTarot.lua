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

    loc_txt = {
        collection = 'Reverse Tarot Cards',
        name = 'Reverse Tarot',
        undiscovered = {
            name = 'Undiscovered Reverse',
            text = {'Purchase or use', 'this card in an', 'unseeded run to', 'learn what it does'}
        },
        shop_rate = 100
    }
}

SMODS.UndiscoveredSprite{
    key = "Reverse",
    atlas = 'reverse',
    pos = {x = 2, y = 2}
}

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

    -- loc_vars = function(self,info_queue,center)
    --     return {vars = {center.ability.extra.cards}}
    -- end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
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

        G.GAME.reverse_upgrades.lucky = G.GAME.reverse_upgrades.lucky + 1

        -- print(G.GAME.reverse_upgrades.lucky)
        -- print(G.GAME.probabilities.normal+G.GAME.reverse_upgrades.lucky)
    end
}

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

    -- loc_vars = function(self,info_queue,center)
    --     return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reverseempress',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 3, y = 0},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
    --     return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reverseemperor',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 4, y = 0},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
    --     return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversehierophant',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 5, y = 0},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reverselovers',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 6, y = 0},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversechariot',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 7, y = 0},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversejustice',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 8, y = 0},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversehermit',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 9, y = 0},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversewheeloffortune',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 0, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversestrength',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 1, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversehangedman',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 2, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversedeath',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 3, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversetemperance',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 4, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversedevil',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 5, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversetower',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 6, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversestar',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 7, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversemoon',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 8, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversesun',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 9, y = 1},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reversejudgement',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 0, y = 2},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}

SMODS.Consumable{
    key = 'reverseworld',
    set = 'Reverse',
    atlas = 'reverse',
    pos = {x = 1, y = 2},

    config = {
        extra = {
            cards = 5,
        }
    },

    -- loc_vars = function(self,info_queue,center)
        -- return {vars = {center.ability.extra.cards}}
    -- end,
}