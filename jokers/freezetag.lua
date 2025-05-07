SMODS.Joker{
    key = 'freezetag',
    atlas = 'jokers',
    pos = {x = 5, y = 0},
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    in_pool = function(self, args)
        return MOONMOD.content.config.enable_jokers
    end,

    calculate = function(self, card, context)
        if context.skip_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    add_tag(Tag(get_next_tag_key()))
                    return true
                end
            }))
            return {
                message = localize('k_freezetag'),
                colour = G.C.ORANGE,
                card = card
            }
        end
    end
}