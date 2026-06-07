SMODS.ConsumableType {
    key = 'star_astral',
    default = 'c_star_creation',
    collection = 'b_star_astral_cards',
    primary_colour = HEX("8574CE"),
    secondary_colour = HEX("8574CE"),
    collection_rows = { 4, 4 },
    shop_rate = 0,
}

SMODS.Consumable {
    key = 'chaos',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 0 },
    config = { extra = { dollar_loss = 5, dollar_loss_loss = 5 }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        local final_loss = card.ability.extra.dollar_loss +
            (card.ability.extra.dollar_loss_loss * (G.GAME.c_star_chaos_used or 0))
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
        ease_dollars(-1 *
            (card.ability.extra.dollar_loss + (card.ability.extra.dollar_loss_loss * (G.GAME.c_star_chaos_used or 0))))
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted and
            G.GAME.dollars >=
            card.ability.extra.dollar_loss + (card.ability.extra.dollar_loss_loss * (G.GAME.c_star_chaos_used or 0))
    end
}

SMODS.Consumable {
    key = 'destruction',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 1 },
    config = { extra = { money_loss = 8 } },
    loc_vars = function(self, info_queue, card)
        local final_loss = math.max(card.ability.extra.money_loss - (G.GAME.c_star_destruction_used or 0), 0)
        return { vars = { final_loss, G.GAME.c_star_destruction_used or 0 } }
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
            ease_dollars(math.min(0, (-1 * card.ability.extra.money_loss) + G.GAME.c_star_destruction_used))
        else
            ease_dollars(-1 * card.ability.extra.money_loss)
        end
    end,
    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) and
            G.GAME.dollars >= card.ability.extra.money_loss - (G.GAME.c_star_destruction_used or 0)
    end
}

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

SMODS.Consumable {
    key = 'starspace',
    set = 'Spectral',
    atlas = 'consumables',
    pos = { x = 1, y = 2 },
    soul_pos = { x = 2, y = 2 },
    hidden = true,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                check_for_unlock { type = "spawn_rarity", set = "galaxy" }
                SMODS.add_card({ set = 'Joker', rarity = 'star_galaxy', key_append = 'star' })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit or card.area == G.jokers
    end
}

SMODS.current_mod.calculate = function(self, context)
    if context.using_consumeable and context.consumeable.ability.set == 'star_astral' then
        G.GAME[context.consumeable.config.center.key .. "_used"] = (G.GAME[context.consumeable.config.center.key .. "_used"] or 0) + 1
    end
end

--  "chaos",
--  "rebirth",
--  "entropy",
--  "ruin",
--  "destruction",
--  "blood",
--  "end",
--  "fate",
--  "order",
--  "insignia",
--  "light",
--  "fractal",
--  "creation",
--  "genesis",
--  "evolution",
--  "mutation",
--  "starspace"
