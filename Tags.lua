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
        return true
    end,

    apply = function(self, tag, context)
        if not tag.triggered and context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.REVERSE, function()
                local key = 'p_moon_lunar_mega'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
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
        return true
    end,
    
    apply = function(self, tag, context)
        if not tag.triggered and context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.LUNAR, function()
                local key = 'p_moon_reverse_mega'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
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

-- Might come back to this. For now too much trouble to figure out for a tag that probably won't be particularly good
-- SMODS.Tag{
--     key = 'tidallock',
--     atlas = 'tag',
--     pos = { x = 3, y = 0 },
--     discovered = false,
--     --min_ante = 2,

--     config = {
--         possible_ranks = { '_A', '_K', '_Q', '_J', '_T', '_9', '_8', '_7', '_6', '_5', '_4', '_3', '_2' },
--         rank_a = nil,
--         rank_b = nil,
--         levels = 3
--     },

--     loc_vars = function(self,info_queue,center)
--         return {
--             vars = {
--                 G.GAME.lunar_upgrades[center.ability.rank_a].name,
--                 G.GAME.lunar_upgrades[center.ability.rank_b].name,
--                 center.ability.levels
--             }
--         }
--     end,

--     in_pool = function(self, args)
--         return true
--     end,

--     apply = function(self, tag, context)
--         if not tag.triggered and context.type == 'immediate' then
--             local lock = tag.ID
--             G.CONTROLLER.locks[lock] = true
--             tag:yep('+', G.C.LUNARALT, function()
--                 G.E_MANAGER:add_event(Event({
--                     trigger = 'after',
--                     delay = 0.4,
--                     func = function()
--                         update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[tag.ability.rank_a].name..'s',chips = G.GAME.lunar_upgrades[tag.ability.rank_a].chips, mult = G.GAME.lunar_upgrades[tag.ability.rank_a].mult, level=G.GAME.lunar_upgrades[tag.ability.rank_a].level})
--                         level_up_rank(nil, tag.ability.rank_a, 1)
--                         update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
--                         G.E_MANAGER:add_event(Event({
--                             trigger = 'after',
--                             delay = 0.4,
--                             func = function()
--                                 update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=G.GAME.lunar_upgrades[tag.ability.rank_b].name..'s',chips = G.GAME.lunar_upgrades[tag.ability.rank_b].chips, mult = G.GAME.lunar_upgrades[tag.ability.rank_b].mult, level=G.GAME.lunar_upgrades[tag.ability.rank_b].level})
--                                 level_up_rank(nil, tag.ability.rank_b, 1)
--                                 update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
--                                 return true
--                             end
--                         }))
--                         return true
--                     end
--                 }))
--                 G.CONTROLLER.locks[lock] = nil
--                 return true
--             end)
--             self.triggered = true
--             return true
--         end
--     end
-- }

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