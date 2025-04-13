SMODS.Joker{
    key = 'jimboroger',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 6,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = { boosters = 2 }
    },

    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.boosters
            }
        }
    end,

    calculate = function(self, card, context)
        if context.starting_shop and not context.blueprint then
            card.ability.extra.used = true
            local new_packs = {}
            for i = 1, card.ability.extra.boosters do
                local rand_pack = get_pack()
                local key = rand_pack.key   -- Only basic packs
                key = string.gsub(key, 'jumbo', 'normal')
                key = string.gsub(key, 'mega', 'normal')
                table.insert(new_packs, key)
            end

            for i = 1, #new_packs do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        play_sound('holo1')
                        SMODS.add_booster_to_shop(new_packs[i] or 'shop_pack')
                        card:juice_up(0.3, 0.4)
                        return true
                    end
                }))
            end
            delay(0.4)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    for i = #G.shop_booster.cards-#new_packs+1, #G.shop_booster.cards do
                        G.shop_booster.cards[i].ability.couponed = true
                        G.shop_booster.cards[i]:set_cost()
                        G.shop_booster.cards[i]:juice_up(0.2, 0.2)
                        card:juice_up(0.3, 0.4)
                    end
                    local msg = 'k_treasure'
                    local rand = math.random(1, 7)
                    if rand == 1 then
                        msg = 'k_plunder'
                    elseif rand == 2 then
                        msg = 'k_avast'
                    elseif rand == 3 then
                        msg = 'k_yoho'
                    elseif rand == 4 then
                        msg = 'k_ahoy'
                    elseif rand == 5 then
                        msg = 'k_booty'
                    elseif rand == 6 then
                        msg = 'k_arrr'
                    end
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize(msg)})
                    card:juice_up(0.7, 0.7)
                    return true
                end
            }))
        end
    end
}