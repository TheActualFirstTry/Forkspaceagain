SMODS.Consumable {
    key = 'creation',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 3 },
    config = { extra = { percentage = 25, percentage_gain = 15 } },
    loc_vars = function(self, info_queue, card)
        local final_percent = card.ability.extra.percentage + (card.ability.extra.percentage_gain * (G.GAME.c_star_creation_used or 0))
        local final_money = math.ceil(G.GAME.current_round.dollars * (final_percent / 100))
        return { vars = { final_percent, card.ability.extra.percentage_gain, G.GAME.c_star_creation_used or 0, final_money } }
    end,

    use = function(self, card, area, copier)
        local payout = (G.GAME.current_round.dollars)
        ease_dollars(
            math.ceil(payout * ((card.ability.extra.percentage + (card.ability.extra.percentage_gain * (G.GAME.c_star_creation_used or 0))) / 100)))
    end,

    can_use = function(self, card)
        return true
    end
}
