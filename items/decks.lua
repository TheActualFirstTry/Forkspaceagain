SMODS.Back {
    key = "astral",
    atlas = "decks",
    pos = { x = 1, y = 0 },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0,
            func = function()
                SMODS.upgrade_poker_hands({ instant = true })
                return true
            end
        }))
    end
}

SMODS.Back {
    key = "estrogen",
    atlas = "decks",
    pos = { x = 0, y = 0 },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card.base.value == 'King' then
                        SMODS.change_base(playing_card, nil, 'Queen')
                    end
                end
                return true
            end
        }))
    end
}

SMODS.Back {
    key = "starstruck",
    atlas = "placeholder",
    pos = { x = 1, y = 1 },
    config = { star_rank = true }
}
