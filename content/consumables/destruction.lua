SMODS.Consumable {
    key = 'destruction',
    set = 'star_astral',
    atlas = 'astral_cards',
    pos = { x = 0, y = 1 },

    use = function(self, card, area, copier)
        local destroy = math.ceil((G.hand.config.card_limit) / 2)
        local destroyed_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, 'vremade_immolate')

        for i = 1, math.ceil((G.hand.config.card_limit) * 2 / 3) do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    draw = function(self, card, layer)
    end
}
