-- LUNAR CARDS --
--[[function level_up_value(card, hand, instant, amount)

end]]--

local LUNAR_UPGRADES = {
    _2 = {name = "2", value = G.P_CARDS.H_2.value, level = 1, l_mult = 2, l_chips = 5},
    _3 = {name = "3", value = G.P_CARDS.H_3.value, level = 1, l_mult = 1, l_chips = 7},
    _4 = {name = "4", value = G.P_CARDS.H_4.value, level = 1, l_mult = 1, l_chips = 7},
    _5 = {name = "5", value = G.P_CARDS.H_5.value, level = 1, l_mult = 1, l_chips = 5},
    _6 = {name = "6", value = G.P_CARDS.H_6.value, level = 1, l_mult = 1, l_chips = 5},
    _7 = {name = "7", value = G.P_CARDS.H_7.value, level = 1, l_mult = 1, l_chips = 5},
    _8 = {name = "8", value = G.P_CARDS.H_8.value, level = 1, l_mult = 1, l_chips = 5},
    _9 = {name = "9", value = G.P_CARDS.H_9.value, level = 1, l_mult = 1, l_chips = 5},
    _T = {name = "10", value = G.P_CARDS.H_T.value, level = 1, l_mult = 1, l_chips = 5},
    _J = {name = "Jack", value = G.P_CARDS.H_J.value, level = 1, l_mult = 1, l_chips = 3},
    _Q = {name = "Queen", value = G.P_CARDS.H_Q.value, level = 1, l_mult = 1, l_chips = 3},
    _K = {name = "King", value = G.P_CARDS.H_K.value, level = 1, l_mult = 1, l_chips = 3},
    _A = {name = "Ace", value = G.P_CARDS.H_A.value, level = 1, l_mult = 2, l_chips = 3},
}

SMODS.Atlas{
    key = 'lunar',
    path = "Lunar.png",
    px = 71,
    py = 95,
}

SMODS.ConsumableType{
    key = 'Lunar',

    collection_rows = {6, 7},
    primary_colour = G.C.LUNAR,
    secondary_colour = G.C.LUNAR,
    shop_rate = 2,

    loc_txt = {
        collection = 'Lunar Cards',
        name = 'Lunar',
        undiscovered = {
            name = 'Undiscovered Lunar',
            text = {'Purchase or use', 'this card in an', 'unseeded run to', 'learn what it does'}
        },
    }
}

SMODS.UndiscoveredSprite{
    key = "Lunar",
    atlas = 'lunar',
    pos = {x = 3, y = 1}
}

-- Luna
SMODS.Consumable{
    key = 'luna',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 0, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._A.level,
                LUNAR_UPGRADES._A.value,
                LUNAR_UPGRADES._A.l_mult,
                LUNAR_UPGRADES._A.l_chips
            }
        }
    end
}

-- Ganymede
SMODS.Consumable{
    key = 'ganymede',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 1, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._K.level,
                LUNAR_UPGRADES._K.value,
                LUNAR_UPGRADES._K.l_mult,
                LUNAR_UPGRADES._K.l_chips
            }
        }
    end
}

-- Titan
SMODS.Consumable{
    key = 'titan',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 2, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._Q.level,
                LUNAR_UPGRADES._Q.value,
                LUNAR_UPGRADES._Q.l_mult,
                LUNAR_UPGRADES._Q.l_chips
            }
        }
    end
}

-- Callisto
SMODS.Consumable{
    key = 'callisto',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 3, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._J.level,
                LUNAR_UPGRADES._J.value,
                LUNAR_UPGRADES._J.l_mult,
                LUNAR_UPGRADES._J.l_chips
            }
        }
    end
}

-- Io
SMODS.Consumable{
    key = 'io',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 4, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._T.level,
                LUNAR_UPGRADES._T.value,
                LUNAR_UPGRADES._T.l_mult,
                LUNAR_UPGRADES._T.l_chips
            }
        }
    end
}

-- Europa
SMODS.Consumable{
    key = 'europa',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 5, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._9.level,
                LUNAR_UPGRADES._9.value,
                LUNAR_UPGRADES._9.l_mult,
                LUNAR_UPGRADES._9.l_chips
            }
        }
    end
}

-- Triton
SMODS.Consumable{
    key = 'triton',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 6, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._8.level,
                LUNAR_UPGRADES._8.value,
                LUNAR_UPGRADES._8.l_mult,
                LUNAR_UPGRADES._8.l_chips
            }
        }
    end
}

-- Titania
SMODS.Consumable{
    key = 'titania',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 7, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._7.level,
                LUNAR_UPGRADES._7.value,
                LUNAR_UPGRADES._7.l_mult,
                LUNAR_UPGRADES._7.l_chips
            }
        }
    end
}

-- Rhea
SMODS.Consumable{
    key = 'rhea',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 8, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._6.level,
                LUNAR_UPGRADES._6.value,
                LUNAR_UPGRADES._6.l_mult,
                LUNAR_UPGRADES._6.l_chips
            }
        }
    end
}

-- Charon
SMODS.Consumable{
    key = 'charon',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 9, y = 0},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._5.level,
                LUNAR_UPGRADES._5.value,
                LUNAR_UPGRADES._5.l_mult,
                LUNAR_UPGRADES._5.l_chips
            }
        }
    end
}

-- Dysnomia
SMODS.Consumable{
    key = 'dysnomia',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 0, y = 1},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._4.level,
                LUNAR_UPGRADES._4.value,
                LUNAR_UPGRADES._4.l_mult,
                LUNAR_UPGRADES._4.l_chips
            }
        }
    end
}

-- Phobos
SMODS.Consumable{
    key = 'phobos',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 1, y = 1},

    config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._3.level,
                LUNAR_UPGRADES._3.value,
                LUNAR_UPGRADES._3.l_mult,
                LUNAR_UPGRADES._3.l_chips
            }
        }
    end
}

-- Deimos
SMODS.Consumable{
    key = 'deimos',
    set = 'Lunar',
    atlas = 'lunar',
    pos = {x = 2, y = 1},

        config = {
        discovered = false,
        cost = 3,
        consumeable = true
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                LUNAR_UPGRADES._2.level,
                LUNAR_UPGRADES._2.value,
                LUNAR_UPGRADES._2.l_mult,
                LUNAR_UPGRADES._2.l_chips
            }
        }
    end
}

function play_upgrade_anim(card)
    G.E_MANAGER:add_event(Event({
        trigger = 'after', 
        delay = 0.2, 
        func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true 
        end 
    }))
    --update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
    G.E_MANAGER:add_event(Event({
        trigger = 'after', 
        delay = 0.9, 
        func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            return true 
        end 
    }))
    --update_hand_text({delay = 0}, {chips = G.GAME.hands[hand].chips, StatusText = true})
    G.E_MANAGER:add_event(Event({
        trigger = 'after', 
        delay = 0.9, 
        func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true 
        end 
    }))
    --update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
    delay(1.3)
end