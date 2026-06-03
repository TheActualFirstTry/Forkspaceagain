SMODS.Joker {
  key = "michael_jackson",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    xmult = 1.5
  } },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "star_michael_pronoun_jackson",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local last_face = false
      for _, playing_card in ipairs(context.scoring_hand) do
        if playing_card:is_face() then last_face = playing_card end
      end
      if not last_face then return end
      if last_face == context.other_card then
        return { xmult = card.ability.extra.xmult }
      end
    end
  end
}
