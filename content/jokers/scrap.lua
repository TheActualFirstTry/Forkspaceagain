SMODS.Joker {
  key = "scrap",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    tarot_used = false,
  }
  },
  rarity = 3,
  cost = 10,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",
  pools = {
    friends_of_astro = true
  },
  attributes = {
    friends_of_astro = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {

      }
    }
  end,

  calculate = function(self, card, context)
    if card.ability.extra.tarot_used == false and context.using_consumeable and context.consumeable.ability.set == 'Tarot' then
      card.ability.extra.tarot_used = true
      local eval = function(card)
        return card.ability.extra.tarot_used
      end
      juice_card_until(card, eval, true, 0.1)
      return {
        message = "Active!"
      }
    end
    if card.ability.extra.tarot_used == true and context.final_scoring_step then
      card.ability.extra.tarot_used = false
      return {
        balance = true
      }
    end
  end
}
