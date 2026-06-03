SMODS.Consumable {
    key = 'creation',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 3 },
    config = { extra = { denominator = 5 } },
    loc_vars = function(self, info_queue, card)
        local div = (1 + (G.GAME.c_star_creation_used or 0)) .. "/" .. card.ability.extra.denominator
        local final_money = math.ceil(G.GAME.current_round.dollars *
        ((1 + (G.GAME.c_star_creation_used or 0)) / card.ability.extra.denominator))
        return { vars = { div, G.GAME.c_star_creation_used or 0, final_money } }
    end,

    use = function(self, card, area, copier)
        ease_dollars(math.ceil(G.GAME.current_round.dollars *
        ((1 + (G.GAME.c_star_creation_used or 0)) / card.ability.extra.denominator)))
    end,

    can_use = function(self, card)
        return true
    end
}
