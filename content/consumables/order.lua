SMODS.Consumable {
    key = 'order',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 2 },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.c_star_order_used or 0 } }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)
        return true
    end
}
