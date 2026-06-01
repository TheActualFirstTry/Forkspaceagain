SMODS.Joker {
  key = "shard",
  atlas = "jokers",
  pos = { x = 6, y = 0 },
  config = { extra = {
  } },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "she_her",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  calculate = function(self, card, context)
  end
}