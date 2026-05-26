SMODS.Joker {
  key = "subtle_joker",
  atlas = "jokers",
  pos = { x = 1, y = 5 },
  config = { extra = {
    t_chips = 80
  } },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.t_chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and context.poker_hands['star_flash'] then
      return {
        chips = card.ability.extra.t_chips
      }
    end
  end
}
