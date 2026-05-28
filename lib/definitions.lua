function count_tarots()
  local tarot_counter = 0
  if G.consumeables then
    for _, card in pairs(G.consumeables.cards) do
      if card.ability.set == "Tarot" then
        tarot_counter = tarot_counter + 1
      end
    end
  end
  return tarot_counter
end

SMODS.current_mod.badge_colour = SMODS.Gradient {
  key = "starspace",
  cycle = 5,
  colours = {
    HEX("13363B"),
    HEX("1D3174")
  }
}

SMODS.current_mod.badge_text_colour = SMODS.Gradient {
  key = "spacestar",
  cycle = 5,
  colours = {
    HEX("C6D1D0"),
    HEX("FFFFFF")
  }
}

SMODS.Gradient {
  key = "rainbow",
  cycle = 20,
  colours = {
    HEX("FF3F3F"),
    HEX("FFA42E"),
    HEX("D6D300"),
    HEX("38FF48"),
    HEX("3B90FF"),
    HEX("B639FF"),
  },
}

SMODS.Gradient {
  key = "trans",
  cycle = 10,
  interpolation = 'trig',
  colours = {
    HEX("73CFF4"),
    HEX("EDAEBF"),
    HEX("D6D6D6"),
    HEX("EDAEBF"),
    HEX("73CFF4"),
  }
}

SMODS.ConsumableType {
    key = 'star_astral',
    default = 'c_star_creation',
    collection = 'b_star_astral_cards',
    primary_colour = SMODS.Gradients.star_rainbow,
    secondary_colour = SMODS.Gradients.star_rainbow,
    collection_rows = { 5, 6 },
    shop_rate = 0,
}

SMODS.Rarity {
  key = "galaxy",
  badge_colour = SMODS.Gradients.star_starspace,
  default_weight = 0
}

-- credits defined here
STAR_UTIL.credits = {
  squad = {
    colour = G.C.GREEN,
    entries = {
      "Astro",
      "Crystal",
      "Meta",
    }
  },
  artists = {
    colour = G.C.CHIPS,
    entries = {
      "Astro",
      "Camostar34",
      "candycane",
      "FirstTry",
      "Slipstream",
      "Lyre",
      "SDM_0"
    }
  },
  coders = {
    colour = G.C.PURPLE,
    entries = {
      "Astro",
      "Meta",
      "ThunderEdge",
      "wingedcatgirl",
      "jamirror",
      "CodeRevo",
      "GhostSalt",
      "candycane"

    }
  },
  shaders = {
    colour = G.C.MULT,
    entries = {
      "cassknows",
      "Meta"
    }
  }
}
