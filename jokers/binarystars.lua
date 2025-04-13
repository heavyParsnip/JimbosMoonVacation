SMODS.Joker{
    key = 'binarystars',
    atlas = 'jokers',
    pos = {x = 0, y = 0},
    cost = 8,
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        xmult = 0,
        extra = {
            bonus_xmult = 0.2,
        }
    },
    
    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.bonus_xmult,
                'Pair',
                'Two Pair',
                center.ability.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            if (next(context.poker_hands['Pair']) or next(context.poker_hands['Two Pair'])) and not (next(context.poker_hands['Three of a Kind']) or next(context.poker_hands['Four of a Kind']) or next(context.poker_hands['Full House']) or next(context.poker_hands['Five of a Kind']) or next(context.poker_hands['Flush Five']) or next(context.poker_hands['Flush House'])) then
                card.ability.xmult = card.ability.xmult + card.ability.extra.bonus_xmult
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.RED})
            elseif card.ability.xmult >  1 then
                card.ability.xmult = card.ability.xmult - card.ability.extra.bonus_xmult
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult_minus', vars={card.ability.extra.bonus_xmult}}, colour = G.C.RED})
            end
        end

        if context.joker_main and card.ability.xmult > 1 then
            return {
                x_mult = 1 + card.ability.xmult,
                colour = G.C.RED,
                card = card
            }
        end
    end
}