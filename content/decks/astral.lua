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
