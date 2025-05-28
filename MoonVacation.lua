SMODS.current_mod.optional_features = {
    post_trigger = true,
    cardareas = {
        deck = true
    }
}

SMODS.Atlas {
    key = "modicon",
    path = "modicon.png",
    px = 34,
    py = 34
}

MOONMOD = {vars = {}, funcs = {}, content = SMODS.current_mod}
local config = MOONMOD.content.config

-- store mod config
function MOONMOD.content.save_config(self)
    SMODS.save_mod_config(self)
end

-- generate config menu
function MOONMOD.content.config_tab()
    return {n = G.UIT.ROOT,
        config = {
            r = 0.1,
            minw = 8,
            minh = 6,
            align = "tm",
            padding = "0.2",
            colour = G.C.BLACK
        },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    align = 'tl',
                    minw = 4,
                    padding = 0.2,
                    colour = G.C.BLACK
                },
                nodes = {
                    -- enable_reverses
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            padding = 0.12,
                            colour = G.C.BLACK
                        },
                        nodes = {
                            create_toggle({
                                label = config.reverses.label,
                                info = config.reverses.info,
                                ref_table = MOONMOD.content.config,
                                ref_value = 'enable_reverses',
                                callback = function() MOONMOD.content:save_config() end
                            })
                        }
                    },
                    -- enable_lunars
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            padding = 0.12
                        },
                        nodes = {
                            create_toggle({
                                label = config.lunars.label,
                                info = config.lunars.info,
                                ref_table = MOONMOD.content.config,
                                ref_value = 'enable_lunars',
                                callback = function() MOONMOD.content:save_config() end
                            })
                        }
                    },
                    -- enable_blinds
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            padding = 0.12
                        },
                        nodes = {
                            create_toggle({
                                label = config.blinds.label,
                                info = config.blinds.info,
                                ref_table = MOONMOD.content.config,
                                ref_value = 'enable_blinds',
                                callback = function() MOONMOD.content:save_config() end
                            })
                        }
                    },
                    -- enable_jokers
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            padding = 0.12
                        },
                        nodes = {
                            create_toggle({
                                label = config.jokers.label,
                                info = config.jokers.info,
                                ref_table = MOONMOD.content.config,
                                ref_value = 'enable_jokers',
                                callback = function() MOONMOD.content:save_config() end
                            })
                        }
                    },
                    -- enable_unstable_jokers
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            padding = 0.12
                        },
                        nodes = {
                            create_toggle({
                                label = config.unstable_jokers.label,
                                info = config.unstable_jokers.info,
                                ref_table = MOONMOD.content.config,
                                ref_value = 'enable_unstable_jokers',
                                callback = function() MOONMOD.content:save_config() end
                            })
                        }
                    },
                }
            }
        }
    }
end

assert(SMODS.load_file("ReverseTarot.lua"))()
assert(SMODS.load_file("Lunar.lua"))()
assert(SMODS.load_file("Boosters.lua"))()
assert(SMODS.load_file("Tags.lua"))()
assert(SMODS.load_file("Vouchers.lua"))()
assert(SMODS.load_file("Jokers.lua"))()
assert(SMODS.load_file("Seals.lua"))()
assert(SMODS.load_file("Blinds.lua"))()
assert(SMODS.load_file("Spectrals.lua"))()

-- JOKER TIME BABY
local sub = "jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path..sub)
for k, v in pairs(jokers) do
    assert(SMODS.load_file(sub.."/"..v))()
end



