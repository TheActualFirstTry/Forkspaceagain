SMODS.Joker {
  key = "ruby",
  atlas = "jokers",
  pos = { x = 8, y = 6 },
  config = { extra = { t_mult = 0, t_mult_gain = 6 } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "she_her",

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_mult, card.ability.extra.t_mult_gain } }
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'star_astral' then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "t_mult",
        scalar_value = "t_mult_gain",
      })
    end
    if context.joker_main then
      return { mult = card.ability.extra.t_mult }
    end
  end
}

SMODS.Joker {
  key = "astro",
  atlas = "jokers",
  pos = { x = 0, y = 0 },
  config = { extra = { repetitions = 1 } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    local suit = (G.GAME.current_round.star_castle_card or {}).suit or 'Spades'
    return { vars = { localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] } } }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.other_card:is_suit(G.GAME.current_round.star_castle_card.suit) then
      return { repetitions = card.ability.extra.repetitions }
    end
  end
}

SMODS.Joker {
  key = "scrap",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = { tarot_used = false, } },
  rarity = 3,
  cost = 10,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  calculate = function(self, card, context)
    if card.ability.extra.tarot_used == false and context.using_consumeable and context.consumeable.ability.set == 'Tarot' then
      card.ability.extra.tarot_used = true
      local eval = function(card)
        return card.ability.extra.tarot_used
      end
      juice_card_until(card, eval, true, 0.1)
      return { message = "Active!" }
    end
    if card.ability.extra.tarot_used == true and context.final_scoring_step then
      card.ability.extra.tarot_used = false
      return { balance = true, }
    end
  end
}

SMODS.Joker {
  key = "crystal",
  atlas = "jokers",
  pos = { x = 2, y = 0 },
  config = { extra = { p_chips = 25 } },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "she_her",

  add_to_deck = function(self, card, from_debuff)
    if next(SMODS.find_card("j_star_shard")) then
      check_for_unlock { type = "joker_set", set = "ach_star_yuri" }
    end
  end,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.p_chips } }
  end,
  calculate = function(self, card, context)
    if context.discard and not context.other_card.debuff and
        context.other_card:get_id() == 12 then
      context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
          card.ability.extra.p_chips
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS
      }
    end
  end
}

SMODS.Joker {
  key = "shard",
  atlas = "jokers",
  pos = { x = 6, y = 0 },
  config = { extra = { dollars = 4 } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "she_her",

  add_to_deck = function(self, card, from_debuff)
    if next(SMODS.find_card("j_star_crystal")) then
      check_for_unlock { type = "joker_set", set = "ach_star_yuri" }
    end
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and G.GAME.dollars <= card.ability.extra.dollars then
      local blueprint = context.blueprint_card
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.45,
        func = (function()
          (blueprint or card):juice_up()
          add_tag({ key = 'tag_coupon' })
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          return true
        end)
      }))
    end
  end
}

SMODS.Joker {
  key = "meta_knight",
  atlas = "jokers",
  pos = { x = 1, y = 2 },
  config = { extra = { } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return { vars = { } }
  end,

  calculate = function(self, card, context)
  end
}

SMODS.Joker {
  key = "galacta_knight",
  atlas = "jokers",
  pos = { x = 2, y = 2 },
  config = { extra = { } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return { vars = { } }
  end,

  calculate = function(self, card, context)
  end
}

SMODS.Joker {
  key = "flash_grenade",
  atlas = "jokers",
  pos = { x = 6, y = 1 },
  config = { extra = { primed = false, } },
  rarity = 3,
  cost = 8,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "it_its",

  loc_vars = function(self, info_queue, card)
    local _handname, _played = 'High Card', -1
    for hand_key, hand in pairs(G.GAME.hands) do
      if hand.played > _played then
        _played = hand.played
        _handname = hand_key
      end
    end
    local most_played = _handname
    return { vars = { localize(most_played, 'poker_hands') } }
  end,

  calculate = function(self, card, context)
    if context.buying_self then
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound('star_flashbang_equip', 1, 0.7)
          card:juice_up(0.3, 0.5)
          return true
        end
      }))
    end
    if context.before and next(context.poker_hands['star_flash']) then
      card.ability.extra.primed = true
      local eval = function()
        return card.ability.extra.primed
      end
      juice_card_until(card, eval)
      return { message = "Active!", sound = "star_flashbang_explode" }
    end
    if card.ability.extra.primed == true then
      local _handname, _played = 'High Card', -1
      for hand_key, hand in pairs(G.GAME.hands) do
        if hand.played > _played then
          _played = hand.played
          _handname = hand_key
        end
      end
      local most_played = _handname
      if context.evaluate_poker_hand then
        return { replace_scoring_name = most_played }
      end
      if card.ability.extra.primed == true and context.before then
        card.ability.extra.primed = false
      end
    end
  end
}

SMODS.Joker {
  key = "giant_pizza",
  atlas = "jokers",
  pos = { x = 2, y = 6 },
  config = { extra = { xmult_loss = 1, xmult = 8 } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  pronouns = "it_its",

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_loss, card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.after and not context.blueprint then
      if card.ability.extra.xmult - card.ability.extra.xmult_loss <= 1 then
        SMODS.destroy_cards(card, nil, nil, true)
        return { message = localize('k_eaten_ex'), colour = G.C.RED }
      else
        card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
        return { message = "-X1 Mult", colour = G.C.RED }
      end
    end
    if context.joker_main then
      return { xmult = card.ability.extra.xmult }
    end
  end
}

SMODS.Joker {
  key = "movie_star",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  rarity = 3,
  cost = 8,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  calculate = function(self, card, context)
    if #G.play.cards == 1 and context.after then
      local card = G.play.cards[1]
      if card:get_id() == SMODS.Ranks['star_star'].id then
        G.E_MANAGER:add_event(Event({
          trigger = 'before',
          delay = 0.4,
          func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            card:set_seal('Gold', nil, true)
            return true
          end
        }))
      end
    end
  end,
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card:get_id() == SMODS.Ranks['star_star'].id then
        return true
      end
    end
    return false
  end
}

SMODS.Joker {
  key = "selfie",
  atlas = "jokers",
  pos = { x = 2, y = 4 },
  config = { extra = { xchips = 1.5, type = 'star_flash' } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xchips, localize(card.ability.extra.type, 'poker_hands') } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_face() and next(context.poker_hands[card.ability.extra.type]) then
      return { xchips = card.ability.extra.xchips }
    end
  end
}

SMODS.Joker {
  key = "the_grace",
  atlas = "jokers",
  pos = { x = 2, y = 5 },
  config = { extra = { xmult = 2 } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "they_them",

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands['star_flash']) then
      return { xmult = card.ability.extra.xmult }
    end
  end
}

SMODS.Joker {
  key = "twice_twice",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = { active = false } },
  rarity = 3,
  cost = 9,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  calculate = function(self, card, context)
    if context.discard then
      card.ability.extra.active = #context.full_hand == 1
    end
    if card.ability.extra.active and context.star_drawing_cards and G.STATE == G.STATES.DRAW_TO_HAND then
      for _, deck_card in ipairs(context.deck_cards) do
        if deck_card:get_id() == 2 then
          context.priorities[deck_card] = 10
          break
        end
      end
      card.ability.extra.active = false
      return { message = "Twice!" }
    end
  end
}

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
  reset_star_castle_card() -- See Mail-In Rebate
end
