--- STEAMODDED HEADER
--- MOD_NAME: Jimbo's Moon Vacation
--- MOD_ID: JimbosMoonVacation
--- MOD_AUTHOR: [MorningCoffee]
--- MOD_DESCRIPTION: Jimbo's going to the moon! Enjoy Balatro with new Lunar Cards, Reverse Tarot Cards, and more! Designed to blend as naturally as possible with the vanilla expereience.

----------------------------------------------
------------MOD CODE -------------------------

SMODS.ConsumableType{
    key = 'ReverseConsumableType',

    collection_rows = {4, 5},
    primary_colour = G.C.HEX(a61a2000),
    secondary_colour = G.C.HEX(a61a2000),

    loc_txt = {
        collection = 'Reverse Tarot Cards',
        name = 'Reverse Tarot',
        undiscovered = {
            name = 'Undiscovered Reversal',
            text = {'Find in an unseeded run', 'to discover this card.'}
        },
        shop_rate = 100
    }
}

SMODS.UndiscoveredSprite{
    key = "ReverseConsumableType",
    atlas = 'Tarot',
    pos = {x = 0, y = 0}
}

SMODS.Consumable{
    key = 'Reverse',
    set = 'ReverseConsumableType',
    atlas = 'Tarot',
    pos = {x = 0, y = 0},

    loc_txt = {
        name = "looF ehT",
        text = {
            "Creates the last Spectral, Lunar, or Reverse card",
            "used during this run",
            "(looF ehT and Soul excluded)"
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

----------------------------------------------
------------MOD CODE END----------------------