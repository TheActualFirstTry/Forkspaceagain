SMODS.Back {
  key = "estrogen_deck",
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
