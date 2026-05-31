SMODS.Consumable {
    key = 'ruin',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 3, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.c_star_ruin_used or 0 } }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)
        return true
    end
}
