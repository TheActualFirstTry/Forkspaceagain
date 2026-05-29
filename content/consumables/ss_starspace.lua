SMODS.Consumable {
    key = 'ss_starspace',
    set = 'star_astral',
    atlas = 'placeholder',
    pos = { x = 2, y = 1 },
    hidden = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
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
