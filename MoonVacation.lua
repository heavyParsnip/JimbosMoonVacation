--- STEAMODDED HEADER
--- MOD_NAME: Jimbo's Moon Vacation
--- MOD_ID: JimbosMoonVacation
--- MOD_AUTHOR: [MorningCoffee]
--- MOD_DESCRIPTION: Jimbo's going to the moon! Enjoy Balatro with new Lunar Cards, Reverse Tarot Cards, and more! Designed to blend as naturally as possible with the vanilla expereience.

----------------------------------------------
------------MOD CODE -------------------------

SMODS.atlas{
    key = 'reverse',
    path = "Reverses.png",
    px = 71,
    py = 95
}

SMODS.ConsumableType{
    key = 'reverse_consumable_type',

    collection_rows = {4, 5},
    primary_colour = HEX('a61a20'),
    secondary_colour = HEX('a61a20'),

    loc_txt = {
        collection = 'Reverse Tarot Cards',
        name = 'Reverse Tarot',
        undiscovered = {
            name = 'Undiscovered Reverse',
            text = {'Purchase or use', 'this card in an', 'unseeded run to', 'learn what it does'}
        },
        shop_rate = 100
    }
}

SMODS.UndiscoveredSprite{
    key = "reverse_consumable_type",
    atlas = 'Reverse',
    pos = {x = 3, y = 3}
}

SMODS.Consumable{
    key = 'reverse_fool',
    set = 'reverse_consumable_type',
    atlas = 'reverse',
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

SMODS.ConsumableType{
    key = 'lunar_consumable_type',

    collection_rows = {4, 5},
    primary_colour = HEX('5b5f8b'),
    secondary_colour = HEX('5b5f8b'),

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
    key = "lunar_consumable_type",
    atlas = 'Planet',
    pos = {x = 0, y = 0}
}

SMODS.Consumable{
    key = 'luna',
    set = 'lunar_consumable_type',
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

----------------------------------------------
------------MOD CODE END----------------------