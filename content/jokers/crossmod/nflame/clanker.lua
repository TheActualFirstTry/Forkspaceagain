SMODS.Joker {
  key = "clanker",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    t_chips = 0,
    t_chips_gain = 15
  } },
  rarity = 1,
  cost = 1,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  pools = { silicon = true },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.t_chips * G.nflame_get_silicontotal())
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
      chips = t_chips + (t_chips_gain * G.nflame_get_silicontotal())
    end
  end
}
