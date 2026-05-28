SMODS.Joker {
  key = "selfie",
  atlas = "jokers",
  pos = { x = 2, y = 4 },
  config = { extra = {
    xchips = 1.5
  } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and next(context.poker_hands['star_flash']) and context.cardarea == G.play and context.other_card:is_face() then
      return {
        xchips = card.ability.extra.xchips
      }
    end
  end
}