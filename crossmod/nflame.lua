SMODS.Joker {
  key = "clanker",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = { t_chips = 15 } },
  rarity = 2,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  pools = { silicon = true },

  loc_vars = function(self, info_queue, card)
    local silicount = G.nflame_get_silicontotal() or 0
    return { vars = { card.ability.extra.t_chips, card.ability.extra.t_chips * silicount } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
      return {
        chips = card.ability.extra.t_chips * G.nflame_get_silicontotal(context)
      }
    end
  end
}