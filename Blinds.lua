SMODS.Atlas{
    key = "blinds",
    path = "Blinds.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
}

SMODS.Blind{
    key = "rain",
    atlas = "blinds",
    pos = { x = 0, y = 0 },
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX('486089'),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.individual and context.cardarea == G.play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.0,
                    func = function()
                        blind:wiggle()
                        return true
                    end
                }))
            end
            if context.before then
                blind:invert_chips(blind)
            elseif context.after then
                blind:invert_chips(blind)
            end
        end
    end
}

SMODS.Blind{
    key = "torch",
    atlas = "blinds",
    pos = { x = 0, y = 1 },
    mult = 2,
    boss = { min = 5, max = 10 },
    boss_colour = HEX('d14f09'),
    config = {
        armed = true,
        ready = false
    },

    disable = function(self)
        self.armed = false
    end,

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.final_scoring_step then
                if G.GAME.chips + (hand_chips*mult) >= G.GAME.blind.chips then
                    blind:wiggle()
                    blind.config.ready = true
                end
            end
            if context.destroy_card and blind.config.ready then     
                if context.cardarea == G.play then
                    return { 
                        message = localize('k_torched'),
                        remove = true,
                        colour = G.C.FILTER,
                        delay = 0.45,
                    }
                elseif context.cardarea == 'unscored' then -- need a separate check for the unscored. putting them in the same conditional retriggers the message for some reason
                    return { 
                        message = localize('k_torched'),
                        remove = true,
                        colour = G.C.FILTER,
                        delay = 0.45,
                    }
                end
            end
        end
    end 
}

SMODS.Blind{
    key = "cloud",
    atlas = "blinds",
    pos = { x = 0, y = 2 },
    mult = 2,
    boss = { min = 2, max = 10 },
    boss_colour = HEX('bfc7d5'),

    config = {
        prepped = false
    },

    disable = function(self)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end

        for k, v in pairs(G.playing_cards) do
            if v.facing == 'back' then
                v:flip()
            end
        end
    end,

    stay_flipped = function(self, area, card)
        if area == G.hand and self.config.prepped then
            return true
        end
    end,

    press_play = function(self)
        self.config.prepped = false
    end,

    calculate = function(self, blind, context)
        if context.discard and not blind.disabled then
            self.config.prepped = true
        end
    end
}

SMODS.Blind{
    key = "mirror",
    atlas = "blinds",
    pos = { x = 0, y = 3 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX('bddec5'),

    calculate = function(self, blind, context)
        if context.before and not blind.disabled then
            blind:wiggle()
            for i = 1, #G.play.cards do
                local percent = 1.15 - (i-0.999)/(#G.play.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.play.cards[i]:flip();play_sound('card1', percent);G.play.cards[i]:juice_up(0.2, 0.2);return true end }))
            end
            delay(0.2)
            for i = 1, #G.play.cards do
                if G.play.cards[i].ability.effect == 'Stone Card' or G.play.cards[i].debuff then return end
                local suit = G.play.cards[i].base.suit
                if suit == 'Spades' then
                    suit = 'Clubs'
                elseif suit == 'Clubs' then
                    suit = 'Spades'
                elseif suit == 'Hearts' then
                    suit = 'Diamonds'
                elseif suit == 'Diamonds' then
                    suit = 'Hearts'
                end
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.play.cards[i]:change_suit(suit);return true end }))
            end
            for i = 1, #G.play.cards do
                local percent = 0.85 + (i-0.999)/(#G.play.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.play.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.play.cards[i]:juice_up(0.2, 0.2);return true end }))
            end
        end
    end
}

SMODS.Blind{
    key = "storm",
    atlas = "blinds",
    pos = { x = 0, y = 4 },
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX('4e3a75'),

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            v.debuff = false
        end
    end,

    calculate = function(self, blind, context)
        if context.before and not blind.disabled then
            blind:wiggle()
            for i = 1, #G.hand.cards do
                G.hand.cards[i]:set_debuff(true)
                G.hand.cards[i]:juice_up(0.2, 0.2)
            end
        end
    end
}

SMODS.Blind{
    key = "boulder",
    atlas = "blinds",
    pos = { x = 0, y = 5 },
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX('a9a9a7'),

    calculate = function(self, blind, context)
        if context.individual and context.cardarea == G.play and not blind.disabled then
            if pseudorandom(pseudoseed('boulder')) < G.GAME.probabilities.normal/2 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local front = pseudorandom_element(G.P_CARDS, pseudoseed('boulder'))
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.m_stone, {playing_card = G.playing_card})
                        card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, card)
                        G.hand:emplace(card)
                        card.states.visible = nil
                        card:start_materialize()
                        blind:wiggle()
                        return true
                    end
                }))
                return {
                    extra = {
                        focus = card,
                        message = localize('k_plus_stone'),
                        colour = G.C.SECONDARY_SET.Enhanced
                    },
                    playing_cards_created = {true}
                }
            end
        end
    end
}

SMODS.Blind{
    key = "foot",
    atlas = "blinds",
    pos = { x = 0, y = 6 },
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX('dab896'),

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            v.debuff = false
        end
    end,

    calculate = function(self, blind, context)
        if context.before and not blind.disabled then
            blind:wiggle()
            for i = #G.play.cards, 1, -1 do
                if i <= #G.play.cards - 2 then
                    G.play.cards[i]:set_debuff(true)
                    G.play.cards[i]:juice_up(0.2, 0.2)
                end
            end
        end
    end
    
}

SMODS.Blind{
    key = "slab",
    atlas = "blinds",
    pos = { x = 0, y = 7 },
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX('76a5af'),

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            v.debuff = false
        end
    end,

    calculate = function(self, blind, context)
        if context.setting_blind and not blind.disabled then
            for k, v in pairs(G.playing_cards) do
                if not v.ability.played_this_ante then
                    v.debuff = true
                end
            end
        end
    end

}

SMODS.Blind{
    key = "nose",
    atlas = "blinds",
    pos = { x = 0, y = 8 },
    mult = 2,
    boss = { min = 2, max = 10 },
    boss_colour = HEX('457430'),

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            v.debuff = false
        end
    end,

    drawn_to_hand = function(self)
        if pseudorandom(pseudoseed('nose')) < 1/2 then
            for i = 1, #G.hand.cards do
                if i > math.floor(#G.hand.cards/2) then
                    G.hand.cards[i]:set_debuff(true)
                    G.hand.cards[i]:juice_up(0.2, 0.2)
                else
                    G.hand.cards[i]:set_debuff(false)
                    G.hand.cards[i]:juice_up(0.2, 0.2)
                end
            end
        else
            for i = 1, #G.hand.cards do
                if i <= math.floor(#G.hand.cards/2) then
                    G.hand.cards[i]:set_debuff(true)
                    G.hand.cards[i]:juice_up(0.2, 0.2)
                else
                    G.hand.cards[i]:set_debuff(false)
                    G.hand.cards[i]:juice_up(0.2, 0.2)
                end
            end
        end
    end,

    calculate = function(self, blind, context)
        if context.hand_drawn and not blind.disabled then
            blind:wiggle()
        end
    end
}

SMODS.Blind{
    key = "ladder",
    atlas = "blinds",
    pos = { x = 0, y = 9 },
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX('705a36'),

    calculate = function(self, blind, context)
        if context.before and not blind.disabled then
            blind:wiggle()
            for i = 1, #G.play.cards do
                local percent = 1.15 - (i-0.999)/(#G.play.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.play.cards[i]:flip();play_sound('card1', percent);G.play.cards[i]:juice_up(0.2, 0.2);return true end }))
            end
            delay(0.2)
            for i = 1, #G.play.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()   -- clean this up eventually maybe...
                        if(G.play.cards[i].base.id == 14) then
                            SMODS.change_base(G.play.cards[i], nil, 'King')
                        elseif(G.play.cards[i].base.id == 13) then
                            SMODS.change_base(G.play.cards[i], nil, 'Queen')
                        elseif(G.play.cards[i].base.id == 12) then
                            SMODS.change_base(G.play.cards[i], nil, 'Jack')
                        elseif(G.play.cards[i].base.id == 11) then
                            SMODS.change_base(G.play.cards[i], nil, '10')
                        elseif(G.play.cards[i].base.id == 10) then
                            SMODS.change_base(G.play.cards[i], nil, '9')
                        elseif(G.play.cards[i].base.id == 9) then
                            SMODS.change_base(G.play.cards[i], nil, '8')
                        elseif(G.play.cards[i].base.id == 8) then
                            SMODS.change_base(G.play.cards[i], nil, '7')
                        elseif(G.play.cards[i].base.id == 7) then
                            SMODS.change_base(G.play.cards[i], nil, '6')
                        elseif(G.play.cards[i].base.id == 6) then
                            SMODS.change_base(G.play.cards[i], nil, '5')
                        elseif(G.play.cards[i].base.id == 5) then
                            SMODS.change_base(G.play.cards[i], nil, '4')
                        elseif(G.play.cards[i].base.id == 4) then
                            SMODS.change_base(G.play.cards[i], nil, '3')
                        elseif(G.play.cards[i].base.id == 3) then
                            SMODS.change_base(G.play.cards[i], nil, '2')
                        elseif(G.play.cards[i].base.id == 2) then
                            SMODS.change_base(G.play.cards[i], nil, 'Ace')
                        end
                        return true
                    end
                }))
            end
            for i = 1, #G.play.cards do
                local percent = 0.85 + (i-0.999)/(#G.play.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.play.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.play.cards[i]:juice_up(0.2, 0.2);return true end }))
            end
        end
    end
}

-- SMODS.Blind{
--     key = "sands",
--     atlas = "blinds",
--     pos = { x = 0, y = 10 },
--     mult = 2,
--     boss = { min = 1, max = 10 },
--     boss_colour = HEX('d8ae6a'),

--     disable = function(self)

--     end,

--     calculate = function(self, blind, context)

--     end

-- }

SMODS.Blind{
    key = "lens",
    atlas = "blinds",
    pos = { x = 0, y = 11 },
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX('DBA5C0'),

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            v.debuff = false
        end
    end,

    calculate = function(self, blind, context)
        if context.before and not blind.disabled then
            blind:wiggle()
            for i = 1, #G.play.cards do
                if G.play.cards[i].base.suit ~= G.play.cards[1].base.suit then
                    G.play.cards[i]:set_debuff(true)
                    G.play.cards[i]:juice_up(0.2, 0.2)
                end
            end
        end
    end

}

SMODS.Blind{
    key = "gate",
    atlas = "blinds",
    pos = { x = 0, y = 12 },
    mult = 2,
    boss = { min = 3, max = 10 },
    boss_colour = HEX('9a8c4e'),
 
    calculate = function(self, blind, context)
        if context.discard and not blind.disabled then
            G.E_MANAGER:add_event(Event({
                func = function()
                    blind.chips = math.floor(blind.chips * 1.1)
                    blind.chip_text = number_format(blind.chips)
                    blind:wiggle()
                    return true
                end
            }))
            delay(0.15)
        end
    end
}

SMODS.Blind{
    key = "final_sword",
    atlas = "blinds",
    pos = { x = 0, y = 13 },
    mult = 2,
    boss = { min = 8, max = 10, showdown = true },
    boss_colour = HEX('a2a9bd'),

    calculate = function(self, blind, context)
        if context.before and not blind.disabled then
            local enhanced_cards = {}
            local triggered_blind = false
            for k, v in ipairs(context.scoring_hand) do
                if v.config.center ~= G.P_CENTERS.c_base and not v.debuff and not v.vampired then
                    enhanced_cards[#enhanced_cards+1] = v
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up(0.2, 0.2)
                            return true
                        end
                    }))
                    v:set_ability(G.P_CENTERS.c_base, nil, true)
                    triggered_blind = true
                end
            end
            if triggered_blind then
                blind:wiggle()
            end
        end
    end
}

SMODS.Blind{
    key = "final_coin",
    atlas = "blinds",
    pos = { x = 0, y = 14 },
    mult = 2,
    boss = { min = 8, max = 10, showdown = true },
    boss_colour = HEX('B87333'),

    calculate = function(self, blind, context)

        if context.individual and context.cardarea == G.play and not blind.disabled then
            ease_dollars(2)
            mult = mult - (G.GAME.dollars + (G.GAME.dollar_buffer or 0))
            if mult < 1 then mult = 1 end
            G.E_MANAGER:add_event(Event({
                func = function()                   
                    blind:wiggle()
                    delay(0.08)
                    return true
                end
            }))
                
        end

        
        -- elseif context.other_card then
        --     card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {type='variable',key='k_taxed',vars={G.GAME.dollars + (G.GAME.dollar_buffer or 0)},colour=G.C.MONEY,delay=0.2})
        -- end
    end
}

SMODS.Blind{
    key = "final_shield",
    atlas = "blinds",
    pos = { x = 0, y = 15 },
    mult = 2,
    boss = { min = 8, max = 10, showdown = true },
    boss_colour = HEX('cea11b'),

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            v.debuff = false
        end
    end,

    calculate = function(self, blind, context)
        if context.final_scoring_step and not blind.disabled then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    for i = 1, #G.play.cards do
                        for k,v in pairs(G.playing_cards) do
                            if G.play.cards[i].base.id == v.base.id and v.debuff == false then
                                v:set_debuff(true)
                                v:juice_up(0.2, 0.2)
                            end
                        end
                    end
                    blind:wiggle()
                    return true
                end
            }))
            
        end
    end
}

SMODS.Blind{
    key = "final_rose",
    atlas = "blinds",
    pos = { x = 0, y = 16 },
    mult = 2,
    boss = { min = 8, max = 10, showdown = true },
    boss_colour = HEX('e60072'),

    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        return 1, 1, true
    end
}

SMODS.Blind{
    key = "final_moon",
    atlas = "blinds",
    pos = { x = 0, y = 17 },
    mult = 2,
    boss = { min = 8, max = 10, showdown = true },
    boss_colour = HEX('e0d49d'),

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            v.debuff = false
        end
    end,

    calculate = function(self, blind, context)
        if context.before and not blind.disabled then
            blind:wiggle()
            for i = 1, #G.play.cards do
                if i > 1 then
                    G.play.cards[i]:set_debuff(true)
                    G.play.cards[i]:juice_up(0.2, 0.2)
                end
            end
        end
    end
}

function Blind:invert_chips()   -- for the rain
    if G.play.cards then
        for i = 1, #G.play.cards do
            G.play.cards[i].base.nominal = -G.play.cards[i].base.nominal
            if G.play.cards[i].ability.bonus then
                G.play.cards[i].ability.bonus = -G.play.cards[i].ability.bonus
            end
            if G.play.cards[i].ability.perma_bonus then
                G.play.cards[i].ability.perma_bonus = -G.play.cards[i].ability.perma_bonus
            end
            if G.play.cards[i].edition and G.play.cards[i].edition.foil then
                G.play.cards[i].edition.chips = -G.play.cards[i].edition.chips
            end
            if G.GAME.reverse_upgrades.bonus ~= 0 then  -- need to refactor how lunar/reverse upgrades work eventually, it's sloppy to have to do this
                G.GAME.reverse_upgrades.bonus = -G.GAME.reverse_upgrades.bonus
            end
            if G.GAME.reverse_upgrades.stone ~= 0 then
                G.GAME.reverse_upgrades.stone = -G.GAME.reverse_upgrades.stone
            end
            if G.GAME.lunar_upgrades then   -- this is particularly goofy and not future-proof
                for k, v in pairs(G.GAME.lunar_upgrades) do
                    if G.play.cards[i].base.value == v.name then
                        v.chips = -v.chips
                        break
                    end
                end
            end
        end
    end
end