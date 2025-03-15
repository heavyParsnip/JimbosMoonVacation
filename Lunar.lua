-- LUNAR CARDS --

-- local G.GAME.lunar_upgrades = {
--     _2 = {name = "2", value = G.P_CARDS.H_2.value, level = 1, l_mult = 2, l_chips = 5},
--     _3 = {name = "3", value = G.P_CARDS.H_3.value, level = 1, l_mult = 1, l_chips = 7},
--     _4 = {name = "4", value = G.P_CARDS.H_4.value, level = 1, l_mult = 1, l_chips = 7},
--     _5 = {name = "5", value = G.P_CARDS.H_5.value, level = 1, l_mult = 1, l_chips = 5},
--     _6 = {name = "6", value = G.P_CARDS.H_6.value, level = 1, l_mult = 1, l_chips = 5},
--     _7 = {name = "7", value = G.P_CARDS.H_7.value, level = 1, l_mult = 1, l_chips = 5},
--     _8 = {name = "8", value = G.P_CARDS.H_8.value, level = 1, l_mult = 1, l_chips = 5},
--     _9 = {name = "9", value = G.P_CARDS.H_9.value, level = 1, l_mult = 1, l_chips = 5},
--     _T = {name = "10", value = G.P_CARDS.H_T.value, level = 1, l_mult = 1, l_chips = 5},
--     _J = {name = "Jack", value = G.P_CARDS.H_J.value, level = 1, l_mult = 1, l_chips = 3},
--     _Q = {name = "Queen", value = G.P_CARDS.H_Q.value, level = 1, l_mult = 1, l_chips = 3},
--     _K = {name = "King", value = G.P_CARDS.H_K.value, level = 1, l_mult = 1, l_chips = 3},
--     _A = {name = "Ace", value = G.P_CARDS.H_A.value, level = 1, l_mult = 2, l_chips = 3},
-- }

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
        consumeable = true,
        rank = '_A'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._A.level,
                G.GAME.lunar_upgrades._A.value,
                G.GAME.lunar_upgrades._A.l_mult,
                G.GAME.lunar_upgrades._A.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_K'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._K.level,
                G.GAME.lunar_upgrades._K.value,
                G.GAME.lunar_upgrades._K.l_mult,
                G.GAME.lunar_upgrades._K.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_Q'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._Q.level,
                G.GAME.lunar_upgrades._Q.value,
                G.GAME.lunar_upgrades._Q.l_mult,
                G.GAME.lunar_upgrades._Q.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_J'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._J.level,
                G.GAME.lunar_upgrades._J.value,
                G.GAME.lunar_upgrades._J.l_mult,
                G.GAME.lunar_upgrades._J.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_T'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._T.level,
                G.GAME.lunar_upgrades._T.value,
                G.GAME.lunar_upgrades._T.l_mult,
                G.GAME.lunar_upgrades._T.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_9'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._9.level,
                G.GAME.lunar_upgrades._9.value,
                G.GAME.lunar_upgrades._9.l_mult,
                G.GAME.lunar_upgrades._9.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_8'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._8.level,
                G.GAME.lunar_upgrades._8.value,
                G.GAME.lunar_upgrades._8.l_mult,
                G.GAME.lunar_upgrades._8.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_7'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._7.level,
                G.GAME.lunar_upgrades._7.value,
                G.GAME.lunar_upgrades._7.l_mult,
                G.GAME.lunar_upgrades._7.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_6'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._6.level,
                G.GAME.lunar_upgrades._6.value,
                G.GAME.lunar_upgrades._6.l_mult,
                G.GAME.lunar_upgrades._6.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_5'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._5.level,
                G.GAME.lunar_upgrades._5.value,
                G.GAME.lunar_upgrades._5.l_mult,
                G.GAME.lunar_upgrades._5.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_4'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._4.level,
                G.GAME.lunar_upgrades._4.value,
                G.GAME.lunar_upgrades._4.l_mult,
                G.GAME.lunar_upgrades._4.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_3'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._3.level,
                G.GAME.lunar_upgrades._3.value,
                G.GAME.lunar_upgrades._3.l_mult,
                G.GAME.lunar_upgrades._3.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
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
        consumeable = true,
        rank = '_2'
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                G.GAME.lunar_upgrades._2.level,
                G.GAME.lunar_upgrades._2.value,
                G.GAME.lunar_upgrades._2.l_mult,
                G.GAME.lunar_upgrades._2.l_chips,
                colours = {(G.GAME.lunar_upgrades[self.config.rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.lunar_upgrades[self.config.rank].level)])}
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[self.config.rank].name..'s',chips = G.GAME.lunar_upgrades[self.config.rank].chips, mult = G.GAME.lunar_upgrades[self.config.rank].mult, level=G.GAME.lunar_upgrades[self.config.rank].level})
        level_up_rank(card, self.config.rank, 1)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}

function level_up_rank(card, rank, amount)
    amount = amount or 1
    G.GAME.lunar_upgrades[rank].level = math.max(0, G.GAME.lunar_upgrades[rank].level + amount)
    G.GAME.lunar_upgrades[rank].mult = math.max(G.GAME.lunar_upgrades[rank].s_mult + G.GAME.lunar_upgrades[rank].l_mult*(G.GAME.lunar_upgrades[rank].level - 1), 0)
    G.GAME.lunar_upgrades[rank].chips = math.max(G.GAME.lunar_upgrades[rank].s_chips + G.GAME.lunar_upgrades[rank].l_chips*(G.GAME.lunar_upgrades[rank].level - 1), 0)
    
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
    update_hand_text({delay = 0}, {mult = G.GAME.lunar_upgrades[rank].mult, StatusText = true})
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9, 
        func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            return true
        end
    }))
    update_hand_text({delay = 0}, {chips = G.GAME.lunar_upgrades[rank].chips, StatusText = true})
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
    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.lunar_upgrades[rank].level})
    delay(1.3)
end

function Card:get_lunar_chips()
    if self.debuff then return 0 end
    for k, v in pairs(G.GAME.lunar_upgrades) do
        if self.base.value == v.name then
            return v.chips
        end
    end
    return 0
end

function Card:get_lunar_mult()
    if self.debuff then return 0 end
    for k, v in pairs(G.GAME.lunar_upgrades) do
        if self.base.value == v.name then
            return v.mult
        end
    end
    return 0
end