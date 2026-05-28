SMODS.Joker {
  key = "radiant_joker",
  atlas = "jokers",
  pos = { x = 0, y = 5 },
  config = { extra = {
    t_mult = 10,
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
        card.ability.extra.t_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands['star_flash']) then
      return {
        mult = card.ability.extra.t_mult
      }
    end
  end
}
