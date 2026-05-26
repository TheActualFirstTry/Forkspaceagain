SMODS.Joker {
  key = "wall_of_flesh",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    xblindsize = 0.5
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
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind and context.blind.boss then
      return {
        xblindsize = card.ability.extra.xblindsize,
        remove_default_message = true,
        message = "Halved!"
      }
    end
  end
}
