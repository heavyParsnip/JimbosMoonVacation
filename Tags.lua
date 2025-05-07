-- Tags --
SMODS.Atlas{
    key = 'tag',
    path = "Tags.png",
    px = 34,
    py = 34
}

SMODS.Tag{
    key = 'comet',
    atlas = 'tag',
    pos = { x = 2, y = 0 },
    discovered = false,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_lunars
    end,

    apply = function(self, tag, context)
        if not tag.triggered and context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.REVERSE, function()
                local key = 'p_moon_lunar_mega_1'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            self.triggered = true
            return true
        end
    end,
}

SMODS.Tag{
    key = 'seer',
    atlas = 'tag',
    pos = { x = 1, y = 0 },
    discovered = false,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_reverses
    end,
    
    apply = function(self, tag, context)
        if not tag.triggered and context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.LUNAR, function()
                local key = 'p_moon_reverse_mega_1'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            self.triggered = true
            return true
        end
    end,
}

SMODS.Tag{
    key = 'reversehermit',
    atlas = 'tag',
    pos = { x = 4, y = 0 },
    discovered = false,

    in_pool = function(self, args)
        return false    -- Should not spawn as a tag normally
    end,

    apply = function(self, tag, context)
        if not tag.triggered and (context.type == 'shop_final_pass') then
            local lock = 888
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.LUNARALT, function()
                local voucher_key = get_next_voucher_key()
                G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
                local voucher = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2, 
                G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[voucher_key],{bypass_discovery_center = true, bypass_discovery_ui = true})
                create_shop_card_ui(voucher, 'Voucher', G.shop_vouchers)
                voucher:start_materialize()
                G.shop_vouchers:emplace(voucher)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        voucher.ability.couponed = true
                        voucher:set_cost()
                        voucher:juice_up(0.3, 0.5)
                        play_sound('timpani')
                        return true
                    end
                }))
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            self.triggered = true
            return true
        end
    end
}