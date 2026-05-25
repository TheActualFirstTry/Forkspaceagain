SMODS.Joker {
  key = "copper_shortsword",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    t_chips_gain = 13,
    t_chips = 0
  } },
  rarity = 1,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.t_chips_gain,
        card.ability.extra.t_chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      local destroyed_cards = 0
      for _, removed_card in ipairs(context.removed) do
        destroyed_cards = destroyed_cards + 1
      end
    SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "t_chips",
                scalar_value = "gain",
                scalar_table = { gain = (card.ability.extra.t_chips_gain * destroyed_cards) },
                colour = G.C.CHIPS
                  })
                end
    if context.joker_main then
      return {
        chips = card.ability.extra.t_chips
      }
    end
  end
}
