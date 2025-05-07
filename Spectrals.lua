SMODS.Atlas{
    key = 'spectral',
    path = "Spectrals.png",
    px = 71,
    py = 95,
}

SMODS.Consumable {
    key = 'augur',
    atlas = "spectral",
    set = "Spectral",
    pos = {x = 0, y = 0},
    cost = 4,
    extra_value = 1,

    config = {
        max_highlighted = 1
    },

    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {key = 'moon_reverse_seal', set = 'Other'}
    end,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_reverses
    end,

    can_use = function(self, card)
        return #G.hand.highlighted == card.ability.max_highlighted
    end,

    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            conv_card:set_seal('moon_reverse', nil, true)
            return true end }))
        
        delay(0.5)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}

SMODS.Consumable {
    key = 'syzygy',
    atlas = "spectral",
    set = "Spectral",
    pos = {x = 1, y = 0},
    cost = 4,

    config = {
        max_highlighted = 1
    },

    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {key = 'moon_silver_seal', set = 'Other'}
    end,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_lunars
    end,

    can_use = function(self, card)
        return #G.hand.highlighted == card.ability.max_highlighted
    end,

    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            conv_card:set_seal('moon_silver', nil, true)
            return true end }))
        
        delay(0.5)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}

SMODS.Consumable {
    key = 'quasar',
    atlas = "spectral",
    set = "Spectral",
    pos = {x = 2, y = 0},
    cost = 5,
    extra_value = 1,
    hidden = true,
    soul_set = 'Lunar',
    soul_rate = 0.003,
    can_repeat_soul = true,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_lunars
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize('k_all_ranks'),chips = '...', mult = '...', level=''})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = '+', StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true end }))
        update_hand_text({delay = 0}, {chips = '+', StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
        delay(1.3)
        for k, v in pairs(G.GAME.lunar_upgrades) do
            level_up_rank(card, k, 1, true)
        end
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}