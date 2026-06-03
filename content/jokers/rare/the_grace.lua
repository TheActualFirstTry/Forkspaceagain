SMODS.Joker {
  key = "the_grace",
  atlas = "jokers",
  pos = { x = 2, y = 5 },
  config = { extra = {
    xmult = 2
  } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "they_them",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands['star_flash']) then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end
}
