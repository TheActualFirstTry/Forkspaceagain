SMODS.Joker {
  key = "twice_twice",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  rarity = 3,
  cost = 10,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  calculate = function(self, card, context)
    if context.after then
      for _, played in ipairs(context.scoring_hand) do
        if played:is_face() then
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              play_sound('tarot1')
              card:juice_up(0.3, 0.5)
              return true
            end,
          }))
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
              assert(SMODS.change_base(played, nil, '2'))
              return true
            end,
          }))
        end
      end
    end
  end
}
