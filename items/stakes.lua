SMODS.Stake {
    key = "black_glass",
    -- atlas = "",
    pos = { x = 4, y = 0 },
    -- sticker_atlas = "",
    sticker_pos = { x = 0, y = 1 },
    applied_stakes = {},
    colour = HEX("72db94"),
    modifiers = function()
        for k, center in pairs(G.P_CENTERS) do
            if center.set == 'Joker' and not center.original_mod then
                G.GAME.banned_keys[k] = 0
            end
        end
    end,
}
SMODS.Stake {
    key = "opal",
    -- atlas = "",
    pos = { x = 0, y = 1 },
    -- sticker_atlas = "",
    sticker_pos = { x = 1, y = 1 },
    applied_stakes = { "black_glass" },
    colour = HEX("72db94"),
    modifiers = function()
        G.GAME.modifiers.enable_star_spellbound = true
    end,
}
