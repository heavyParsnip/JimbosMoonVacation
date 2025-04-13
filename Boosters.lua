-- Booster Packs --
SMODS.Atlas{
    key = 'booster',
    path = "Boosters.png",
    px = 71,
    py = 95,
}

SMODS.Booster{
    key = 'reverse_normal_1',
    group_key = 'k_moon_reversepack',
    atlas = 'booster',
    pos = {x = 0, y = 0},
    discovered = false,
    cost = 4,
    weight = 0.35,
    draw_hand = true,
    kind = 'Reverse',

    config = {
        extra = 3,
        choose = 1,
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    particles = function(self)
        init_reverse_particles()
    end,

    create_card = function(self, card, i)
        return create_card('Reverse', G.pack_cards, nil, nil, true, true, nil, 'rev')
    end,
    
    update_pack = function(self, dt)
        init_reverse_booster(self, dt)
    end

}

SMODS.Booster{
    key = 'reverse_normal_2',
    group_key = 'k_moon_reversepack',
    atlas = 'booster',
    pos = {x = 1, y = 0},
    discovered = false,
    cost = 4,
    weight = 0.35,
    draw_hand = true,
    kind = 'Reverse',

    config = {
        extra = 3,
        choose = 1,
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    particles = function(self)
        init_reverse_particles()
    end,

    create_card = function(self, card, i)
        return create_card('Reverse', G.pack_cards, nil, nil, true, true, nil, 'rev')
    end,

    update_pack = function(self, dt)
        init_reverse_booster(self, dt)
    end
}

SMODS.Booster{
    key = 'reverse_jumbo_1',
    group_key = 'k_moon_reversepack',
    atlas = 'booster',
    pos = {x = 2, y = 0},
    discovered = false,
    cost = 6,
    weight = 0.35,
    draw_hand = true,
    kind = 'Reverse',

    config = {
        extra = 5,
        choose = 1,
    },

    particles = function(self)
        init_reverse_particles()
    end,

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    create_card = function(self, card, i)
        return create_card('Reverse', G.pack_cards, nil, nil, true, true, nil, 'rev')
    end,

    update_pack = function(self, dt)
        init_reverse_booster(self, dt)
    end

}

SMODS.Booster{
    key = 'reverse_mega_1',
    group_key = 'k_moon_reversepack',
    atlas = 'booster',
    pos = {x = 3, y = 0},
    discovered = false,
    cost = 8,
    weight = 0.1,
    draw_hand = true,
    kind = 'Reverse',

    config = {
        extra = 5,
        choose = 2,
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    particles = function(self)
        init_reverse_particles()
    end,

    create_card = function(self, card, i)
        return create_card('Reverse', G.pack_cards, nil, nil, true, true, nil, 'rev')
    end,

    update_pack = function(self, dt)
        init_reverse_booster(self, dt)
    end

}


SMODS.Booster{
    key = 'lunar_normal_1',
    group_key = 'k_moon_lunarpack',
    atlas = 'booster',
    pos = {x = 0, y = 1},
    discovered = false,
    cost = 4,
    weight = 0.9,
    kind = 'Lunar',

    config = {
        extra = 3,
        choose = 1,
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    particles = function(self)
        init_lunar_particles()
    end,

    create_card = function(self, card, i)
        return create_card('Lunar', G.pack_cards, nil, nil, true, true, nil, 'lun')
    end,

    update_pack = function(self, dt)
        init_lunar_booster(self, dt)
    end
}

SMODS.Booster{
    key = 'lunar_normal_2',
    group_key = 'k_moon_lunarpack',
    atlas = 'booster',
    pos = {x = 1, y = 1},
    discovered = false,
    cost = 4,
    weight = 0.9,
    kind = 'Lunar',
    
    config = {
        extra = 3,
        choose = 1,
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    particles = function(self)
        init_lunar_particles()
    end,

    create_card = function(self, card, i)
        return create_card('Lunar', G.pack_cards, nil, nil, true, true, nil, 'lun')
    end,

    update_pack = function(self, dt)
        init_lunar_booster(self, dt)
    end

}

SMODS.Booster{
    key = 'lunar_jumbo_1',
    group_key = 'k_moon_lunarpack',
    atlas = 'booster',
    pos = {x = 2, y = 1},
    discovered = false,
    cost = 6,
    weight = 0.9,
    kind = 'Lunar',
    
    config = {
        extra = 5,
        choose = 1,
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    particles = function(self)
        init_lunar_particles()
    end,

    create_card = function(self, card, i)
        return create_card('Lunar', G.pack_cards, nil, nil, true, true, nil, 'lun')
    end,

    update_pack = function(self, dt)
        init_lunar_booster(self, dt)
    end

}

SMODS.Booster{
    key = 'lunar_mega_1',
    group_key = 'k_moon_lunarpack',
    atlas = 'booster',
    pos = {x = 3, y = 1},
    discovered = false,
    cost = 6,
    weight = 0.23,
    kind = 'Lunar',
    
    config = {
        extra = 5,
        choose = 2,
    },

    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.choose,
                center.ability.extra
            }
        }
    end,

    particles = function(self)
        init_lunar_particles()
    end,

    create_card = function(self, card, i)
        return create_card('Lunar', G.pack_cards, nil, nil, true, true, nil, 'lun')
    end,

    update_pack = function(self, dt)
        init_lunar_booster(self, dt)
    end
}

function init_reverse_booster(self, dt) -- gotta get those custom colors
    if G.buttons then G.buttons:remove(); G.buttons = nil end
    if G.shop then G.shop.alignment.offset.y = G.ROOM.T.y+11 end

    if not G.STATE_COMPLETE then
        G.STATE_COMPLETE = true
        G.CONTROLLER.interrupt.focus = true
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                if self.particles and type(self.particles) == "function" then self:particles() end
                G.booster_pack = UIBox{
                    definition = self:create_UIBox(),
                    config = {align="tmi", offset = {x=0,y=G.ROOM.T.y + 9}, major = G.hand, bond = 'Weak'}
                }
                G.booster_pack.alignment.offset.y = -2.2
                G.ROOM.jiggle = G.ROOM.jiggle + 3
                ease_background_colour{new_colour = G.C.REVERSE, special_colour = darken(G.C.BLACK, 0.1), contrast = 2}
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        if self.draw_hand == true then G.FUNCS.draw_from_deck_to_hand() end

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                G.CONTROLLER:recall_cardarea_focus('pack_cards')
                                return true
                            end}))
                        return true
                    end
                }))
                return true
            end
        }))
    end
end

function init_lunar_booster(self, dt)
    if G.buttons then G.buttons:remove(); G.buttons = nil end
    if G.shop then G.shop.alignment.offset.y = G.ROOM.T.y+11 end

    if not G.STATE_COMPLETE then
        G.STATE_COMPLETE = true
        G.CONTROLLER.interrupt.focus = true
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                if self.particles and type(self.particles) == "function" then self:particles() end
                G.booster_pack = UIBox{
                    definition = self:create_UIBox(),
                    config = {align="tmi", offset = {x=0,y=G.ROOM.T.y + 9}, major = G.hand, bond = 'Weak'}
                }
                G.booster_pack.alignment.offset.y = -2.2
                G.ROOM.jiggle = G.ROOM.jiggle + 3
                ease_background_colour{new_colour = darken(G.C.LUNAR, 0.5), contrast = 1}
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        if self.draw_hand == true then G.FUNCS.draw_from_deck_to_hand() end

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                G.CONTROLLER:recall_cardarea_focus('pack_cards')
                                return true
                            end}))
                        return true
                    end
                }))
                return true
            end
        }))
    end

    G.ARGS.push.desired_track = 'music3'

    if G.F_SOUND_THREAD then
        G.SOUND_MANAGER.channel:push(G.ARGS.push)
    else
        MODULATE(G.ARGS.push)
    end
end

function init_reverse_particles()
    G.booster_pack_sparkles = Particles(1, 1, 0,0, {
        timer = 0.015,
        scale = 0.2,
        initialize = true,
        lifespan = 1,
        speed = 1.1,
        padding = -1,
        attach = G.ROOM_ATTACH,
        colours = {G.C.WHITE, lighten(G.C.REVERSEALT, 0.4), lighten(G.C.REVERSEALT, 0.2), lighten(G.C.GOLD, 0.2)},
        fill = true
    })
    G.booster_pack_sparkles.fade_alpha = 1
    G.booster_pack_sparkles:fade(1, 0)
end

function init_lunar_particles()
    G.booster_pack_stars = Particles(1, 1, 0,0, {
        timer = 0.07,
        scale = 0.1,
        initialize = true,
        lifespan = 15,
        speed = 0.1,
        padding = -4,
        attach = G.ROOM_ATTACH,
        colours = {G.C.WHITE, HEX('a7d6e0'), HEX('fddca0')},
        fill = true
    })
    G.booster_pack_meteors = Particles(1, 1, 0,0, {
        timer = 2,
        scale = 0.05,
        lifespan = 1.5,
        speed = 4,
        attach = G.ROOM_ATTACH,
        colours = {G.C.WHITE},
        fill = true
    })
end