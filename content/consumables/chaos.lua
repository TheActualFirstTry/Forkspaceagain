SMODS.Consumable {
    key = 'chaos',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 0 },
    config = { extra = { dollar_loss = 5, dollar_loss_loss = 5 }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        local final_loss = card.ability.extra.dollar_loss + (card.ability.extra.dollar_loss_loss * (G.GAME.c_star_chaos_used or 0))
        return { vars = { G.GAME.c_star_chaos_used or 0, card.ability.max_highlighted, final_loss, card.ability.extra.dollar_loss_loss } }
    end,

    use = function(self, card, area, copier)
        local random_seal = SMODS.poll_seal { key = "star_seed", guaranteed = true }
        local random_enhancement = SMODS.poll_enhancement { key = "star_seed", guaranteed = true }
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(random_enhancement)
                        G.hand.highlighted[1]:set_seal(random_seal)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
        ease_dollars(-1 * (card.ability.extra.dollar_loss + (card.ability.extra.dollar_loss_loss * (G.GAME.c_star_chaos_used or 0))))
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted and
       G.GAME.dollars >= card.ability.extra.dollar_loss + (card.ability.extra.dollar_loss_loss * (G.GAME.c_star_chaos_used or 0))
    end
}
