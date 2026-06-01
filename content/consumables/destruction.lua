SMODS.Consumable {
    key = 'destruction',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 1 },
    config = { extra = { money_loss = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money_loss, G.GAME.c_star_destruction_used or 0 } }
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(G.consumeables.config.card_limit, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'star_astral', key_append = "star_crt" })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        if G.GAME.c_star_destruction_used and G.GAME.c_star_destruction_used < card.ability.extra.money_loss then
            ease_dollars((-1 * card.ability.extra.money_loss) + G.GAME.c_star_destruction_used)
        else
            ease_dollars(-1 * card.ability.extra.money_loss)
        end
    end,
    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) and
        G.GAME.dollars >= card.ability.extra.money_loss - (G.GAME.c_star_destruction_used or 0)
    end
}
