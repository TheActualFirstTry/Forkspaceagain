SMODS.Rank {
  key = "star",
  card_key = "S",
  nominal = 12,
  face = true,

  lc_atlas = "ranks_lc",
  hc_atlas = "ranks_lc", -- temp
  pos = { x = 0 },
  shorthand = "S",

  strength_effect = { ignore = true },

  in_pool = function(self, args)
    if args and args.initial_deck then
      if G.GAME.selected_back then
        return G.GAME.selected_back.effect.config.star_rank
      end
    else
      for i, v in pairs(G.playing_cards or {}) do
        if v:get_id() == self.id then return true end
      end
      return false
    end
  end
}
