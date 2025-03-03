return {
    descriptions = {
        Reverse = {
            -- 0
            c_moon_reversefool = {
                name = "looF ehT",
                text = {
                    "Creates the last",
                    "{C:spectral}Spectral{}, {C:lunar}Lunar{}, or", 
                    "{C:reverse}Reverse Tarot{} card", 
                    "used during this run",
                    "{s:0.8,C:red}looF ehT{s:0.8} excluded"
                }
            },
            -- I
            c_moon_reversemagician = {
                name = "naicigaM ehT",
                text = {
                    "{C:dark_edition}Upgrades{} {C:attention}Lucky Cards{}",
                    "{C:green}probability{} by {C:attention}+1{}",
                    "{s:0.8}{C:inactive}({}{C:green}#1# in 5{} {C:inactive}->{} {C:green}#2# in 5{}{C:inactive}){}{}"
                }
            },
            -- II
            c_moon_reversehighpriestess = {
                name = "ssetseirP hgiH ehT",
                text = {
                    "Creates up to {C:attention}#1#{}",
                    "random {C:dark_edition}Negative",
                    "{C:lunar}Lunar{} cards"
                }
            },
            -- III
            c_moon_reverseempress = {
                name = "sserpmE ehT",
                text = {
                    "{C:dark_edition}Upgrades{} {C:attention}Mult Card{}",
                    "bonus by {C:mult}+3{} Mult",
                    "{s:0.8}{C:inactive}({}{C:mult}+#1# {}{C:inactive}Mult -> {}{C:mult}+#2#{}{C:inactive} Mult){}"
                }
            },
            -- IV
            c_moon_reverseemperor = {
                name = "rorepmE ehT",
                text = {
                    "Creates up to {C:attention}#1#{} random",
                    "{C:reverse}Reverse Tarot{} cards",
                    "{C:inactive}(Must have room){}"
                }
            },
            -- V
            c_moon_reversehierophant = {
                name = "",
                text = {
                    "{C:dark_edition}Upgrades{} {C:attention}Bonus Card{}",
                    "bonus by {C:chips}+20{}",
                    "{s:0.8}{C:inactive}({}{C:chips}+#1# {}{C:inactive}Chips -> {}{C:chips}+#2#{}{C:inactive} Chips){}"
                }
            },
            -- VI
            c_moon_reverselovers = {
                name = "srevoL ehT",
                text = {
                    -- Need to figure out how to implement this eleganty
                    -- "{C:attention}Wild Cards{} retrigger when",
                    -- "scored {C:green}+1{} time.",
                    -- "{s:0.8}{C:inactive}({}{C:green}#1#{}{C:inactive} -> {}{C:green}#2#{}{C:inactive} times){}"
                    
                    -- For now, using this effect as a placeholder
                    "{C:dark_edition}Upgrades{} {C:attention}Wild Cards{} to",
                    "give {X:mult,C:white} X1.5 {} Mult when scored",
                    "{s:0.8}{C:inactive}({}{X:mult,C:white} X#1# {}{C:inactive} Mult -> {}{X:mult,C:white} X#2# {}{C:inactive} Mult){}"
                }
            },
            -- VII
            c_moon_reversechariot = {
                name = "toirahC ehT",
                text = {
                    "{C:dark_edition}Upgrades{} {C:attention}Steel Card{}",
                    "bonus by {X:mult,C:white}X0.25{} Mult",
                    "{s:0.8}{C:inactive}({}{X:mult,C:white} X#1# {}{C:inactive} Mult -> {}{X:mult,C:white} X#2# {}{C:inactive} Mult){}"
                }
            },
            -- VIII
            c_moon_reversejustice = {
                name = "ecitsuJ",
                text = {
                    "{C:dark_edition}Upgrades{} {C:attention}Glass Card{}",
                    "bonus by {X:mult,C:white} X0.75 {} Mult",
                    "{s:0.8}{C:inactive}({}{X:mult,C:white} X#1# {}{C:inactive} Mult -> {}{X:mult,C:white} X#2# {}{C:inactive} Mult){}"
                }
            },
            -- IX
            c_moon_reversehermit = {
                name = "timreH ehT",
                text = {
                    "Halves money and adds",
                    "a free Voucher to",
                    "the current {C:attention}shop{}"
                }
            },
            -- X
            c_moon_reversewheeloffortune = {
                name = "enutroF fo leehW ehT",
                text = {
                    "{C:green}#1# in 4{} chance to add",
                    "{C:dark_edition}Polychrome{} or {C:dark_edition}Negative{} edition",
                    "to a random {C:attention}Joker{}"
                }
            },
            -- XI
            c_moon_reversestrength = {
                name = "htgnertS",
                text = {
                    "Decreses rank of",
                    "up to {C:attention}#1#{} selected",
                    "cards by {C:attention}1{}"
                }
            },
            -- XII
            c_moon_reversehangedman = {
                name = "naM degnaH ehT",
                text = {
                    "Destroys up to",
                    "{C:attention}#1#{} selected cards"
                }
            },
            -- XIII
            c_moon_reversedeath = {
                name = "htaeD",
                text = {
                    "Select {C:attention}#1#{} cards. Apply",
                    "all {C:attention}Enhancements{}, {C:spectral}Seals{}, and ",
                    "{C:dark_edition}Editions{} from the {C:attention}right{} card",
                    "to the {C:attention}left{} card",
                    "{s:0.8,C:inactive}(Ranks and suits are not changed){}"
                }
            },
            -- XIV
            c_moon_reversetemperance = {
                name = "ecnarepmeT",
                text = {
                    "Lose {C:money}#1#{} per {C:Spectral}Spectral{} card",
                    "used this run, then fill your consumable",
                    "area with {C:Spectral}Spectral{} cards",
                    "{C:inactive}(Max of{} {C:money}-$#2#{}{C:inactive}) (Currently {}{C:money}$#3#{}{C:inactive}){}"
                }
            },
            -- XV
            c_moon_reversedevil = {
                name = "liveD ehT",
                text = {
                    "{C:dark_edition}Upgrades{} {C:attention}Gold Card{}",
                    "bonus by {C:money}$4{}",
                    "{s:0.8}{C:inactive}({}{C:money}$#1#{}{C:inactive} -> {}{C:money}$#2#{}{C:inactive}){}"
                }
            },
            -- XVI
            c_moon_reversetower = {
                name = "rewoT ehT",
                text = {
                    "{C:dark_edition}Upgrades{} {C:attention}Stone Card{}",
                    "base value by {C:chips}+30{} Chips",
                    "{s:0.8}{C:inactive}({}{C:chips}+#1# {}{C:inactive}Chips -> {}{C:chips}+#2#{}{C:inactive} Chips){}"
                }
            },
            -- XVII
            c_moon_reversestar = {
                name = "rtaS ehT",
                text = {
                    "Destroys all {C:diamonds}Diamonds{}",
                    "in your hand"
                }
            },
            -- XVIII
            c_moon_reversemoon = {
                name = "nooM ehT",
                text = {
                    "Destroys all {C:clubs}Clubs{}",
                    "in your hand"
                }
            },
            -- XIX
            c_moon_reversesun = {
                name = "nuS ehT",
                text = {
                    "Destroys all {C:hearts}Hearts{}",
                    "in your hand"
                }
            },
            -- XX
            c_moon_reversejudgement = {
                name = "tnemegduJ",
                text = {
                    "Destorys the selected {C:attention}Joker{}",
                    "and creates a new random {C:attention}Joker{}",
                    "of one {C:dark_edition}Rarity{} higher",
                    "{C:inactive}(ex: {}{C:green}Uncommon{} {C:inactive}->{} {C:red}Rare{}{C:inactive}){}"
                }
            },
            -- XXI
            c_moon_reverseworld = {
                name = "dlroW ehT",
                text = {
                    "Destroys all {C:spades}Spades{}",
                    "in your hand"
                }
            }
        },
        Lunar = {
            -- Luna
            c_moon_luna = {
                name = "Luna",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Ganymede
            c_moon_ganymede = {
                name = "Ganymede",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Titan
            c_moon_titan = {
                name = "Titan",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Callisto
            c_moon_callisto = {
                name = "Callisto",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Io
            c_moon_io = {
                name = "Io",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Europa
            c_moon_europa = {
                name = "Europa",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Triton
            c_moon_triton = {
                name = "Triton",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Titania
            c_moon_titania = {
                name = "Titania",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Rhea
            c_moon_rhea = {
                name = "Rhea",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Charon
            c_moon_charon = {
                name = "Charon",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Dysnomia
            c_moon_dysnomia = {
                name = "Dysnomia",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Phobos
            c_moon_phobos = {
                name = "Phobos",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            },
            -- Deimos
            c_moon_deimos = {
                name = "Deimos",
                text = {
                    "{S:0.8}({S:0.8}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#s",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
                }
            }
        },
    },
    misc = {
        dictionary = {
            k_nuhuh = "Nuh-uh!"
        }
    }
}