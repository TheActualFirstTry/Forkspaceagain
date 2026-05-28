SMODS.Joker {
  key = "selfie",
  atlas = "jokers",
  pos = { x = 2, y = 4 },
  config = { extra = {
    xchips = 1.5,
    type = 'star_flash'
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
        card.ability.extra.xchips,
        localize(card.ability.extra.type, 'poker_hands')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_face() and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xchips = card.ability.extra.xchips
      }
    end
  end
}