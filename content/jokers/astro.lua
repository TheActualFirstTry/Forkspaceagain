SMODS.Joker {
  key = "astro",
  atlas = "jokers",
  pos = { x = 0, y = 0 },
  config = { extra = {
    repetitions = 1
  } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    local suit = (G.GAME.current_round.star_castle_card or {}).suit or 'Spades'
    return { vars = { localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] } } }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.other_card:is_suit(G.GAME.current_round.star_castle_card.suit) then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
    if context.end_of_round then
    end
  end
}

-- god bless VanillaRemade
local function reset_star_castle_card()
  G.GAME.current_round.star_castle_card = { suit = 'Spades' }
  local valid_castle_cards = {}
  for _, playing_card in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(playing_card) then
      valid_castle_cards[#valid_castle_cards + 1] = playing_card
    end
  end
  local castle_card = pseudorandom_element(valid_castle_cards,
    'star_castle' .. G.GAME.round_resets.ante)
  if castle_card then
    G.GAME.current_round.star_castle_card.suit = castle_card.base.suit
  end
end

function SMODS.current_mod.reset_game_globals(run_start)
    reset_star_castle_card()    -- See Mail-In Rebate
end