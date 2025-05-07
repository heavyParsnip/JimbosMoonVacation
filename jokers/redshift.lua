SMODS.Joker{
    key = 'redshift',
    atlas = 'jokers',
    pos = {x = 7, y = 0},
    cost = 9,
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    in_pool = function(self, args)
        return (MOONMOD.content.config.enable_jokers and MOONMOD.content.config.enable_unstable_jokers)
    end,

    -- This is madness, but I don't expect I'll come up with a more elegant solution.
    calculate = function(self, card, context)
        local edition_chips = 0 -- there's probably a better way to do this
        if context.individual and context.cardarea == G.play then
            if context.other_card.edition and context.other_card.edition.foil then
                edition_chips = context.other_card.edition.chips
            end
            -- if context.other_card.ability.name == "Stone Card" then
            --     return {
            --         mult = math.floor((context.other_card.ability.bonus+(context.other_card.ability.perma_bonus or 0)+edition_chips+G.GAME.reverse_upgrades.bonus)/2)
            --     }
            -- else
            --     return {
            --         mult = math.floor((context.other_card.base.nominal+context.other_card.ability.bonus+(context.other_card.ability.perma_bonus or 0)+edition_chips+G.GAME.reverse_upgrades.bonus)/2)
            --     }
            -- end
            return {
                mult = math.floor((context.other_card:get_chip_bonus()+edition_chips)/2)
            }
        elseif context.individual and context.cardarea == G.hand then
            h_chips = context.other_card:get_chip_h_bonus()
            if h_chips > 0 then
                return {
                    mult = math.floor(h_chips/2)
                }
            end
        elseif context.post_trigger and context.other_card ~= card then
            local extra_chips = 0   -- What a mess!
            if context.other_card.edition and context.other_card.edition.foil then
                edition_chips = context.other_card.edition.chips or 0
            end
            if context.other_card.ability and context.other_card.ability.t_chips and context.other_card.ability.t_chips ~= 0 then
                extra_chips = extra_chips + context.other_card.ability.t_chips
            elseif context.other_card.ability and context.other_card.ability.extra then
                if type(context.other_card.ability.extra) == "table" then
                    if context.other_card.ability.extra.chips then
                        extra_chips = extra_chips + context.other_card.ability.extra.chips
                    end
                elseif type(context.other_card.ability.extra == "number") then
                    if (context.other_card.ability.name == "Scary Face" or context.other_card.ability.name == "Odd Todd" or context.other_card.ability.name == "Arrowhead") then
                        extra_chips = extra_chips + context.other_card.ability.extra
                    elseif (context.other_card.ability.name == "Banner") then
                        extra_chips = extra_chips + G.GAME.current_round.discards_left*context.other_card.ability.extra
                    elseif (context.other_card.ability.name == "Stone Joker") then
                        extra_chips = extra_chips + context.other_card.ability.extra*context.other_card.ability.stone_tally
                    elseif (context.other_card.ability.name == "Bull") then
                        extra_chips = extra_chips + context.other_card.ability.extra*math.max(0,(G.GAME.dollars + (G.GAME.dollar_buffer or 0)))
                    elseif (context.other_card.ability.name == "Stuntman") then
                        extra_chips = extra_chips + context.other_card.ability.extra*context.other_card.ability.extra.chip_mod
                    elseif (context.other_card.ability.name == "Blue Joker") then
                        extra_chips = extra_chips + context.other_card.ability.extra*#G.deck.cards
                    end
                elseif context.other_card.ability.chips then
                    extra_chips = extra_chips + context.other_card.ability.chips
                end
            end
            if extra_chips > 0 or edition_chips > 0 then
                return {
                    mult = math.floor((extra_chips+edition_chips)/2),
                }
            end
        elseif context.end_of_round then    -- Correct score display issues from Ice Cream
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
    end
}