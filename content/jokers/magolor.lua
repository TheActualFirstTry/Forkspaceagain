SMODS.Joker {
  key = "magolor",
  atlas = "jokers",
  pos = { x = 0, y = 2 },
  config = { extra = {
    numerator = 1,
    denominator = 2,
    xmult = 2
  } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS['m_lucky']
    local num, denom = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator)
    return { vars = { num, denom, card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and SMODS.pseudorandom_probability(card, 'example_prob', card.ability.extra.numerator, card.ability.extra.denominator) and
        SMODS.has_enhancement(context.other_card, 'm_lucky') then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
  
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_lucky') then
        return true
      end
    end
    return false
  end
}
