SMODS.Joker {
  key = "clanker",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    t_chips = 15,
    t_chips_gain = 15
  } },
  rarity = 2,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  pools = { silicon = true },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.t_chips * (G.nflame_get_silicontotal() - 1),
        card.ability.extra.t_chips_gain
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
      chips = t_chips + (t_chips_gain * G.nflame_get_silicontotal())
    end
  end
}
