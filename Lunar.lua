-- LUNAR CARDS --
SMODS.ConsumableType{
    key = 'LunarConsumableType',

    collection_rows = {4, 5},
    primary_colour = G.C.LUNAR,
    secondary_colour = G.C.LUNAR,

    loc_txt = {
        collection = 'Lunar Cards',
        name = 'Lunar',
        undiscovered = {
            name = 'Undiscovered Lunar',
            text = {'Purchase or use', 'this card in an', 'unseeded run to', 'learn what it does'}
        },
        shop_rate = 100
    }
}

SMODS.UndiscoveredSprite{
    key = "LunarConsumableType",
    atlas = 'Planet',
    pos = {x = 0, y = 0}
}

SMODS.Consumable{
    key = 'luna',
    set = 'LunarConsumableType',
    atlas = 'Planet',
    pos = {x = 0, y = 0},

    loc_txt = {
        name = "Luna",
        text = {
            "Permanently upgrade all Aces",
            "+3 Chips",
            "+2 Mult"
        }
    },

    config = {
        extra = {
            cards = 5,
        }
    },

    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.cards}}
    end,
}