SMODS.current_mod.calculate = function(self, context)
  if context.using_consumeable and context.consumeable.ability.set == 'star_astral' then
    G.GAME[context.consumeable.config.center.key .. "_used"] = (G.GAME[context.consumeable.config.center.key .. "_used"] or 0) +
        1
  end
end

SMODS.Gradient {
  key = "astral",
  cycle = 1,
  colours = { HEX("8574CE") }
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
  }
}

SMODS.Gradient {
  key = "galaxy",
  cycle = 5,
  interpolation = 'trig',
  colours = {
    HEX("9E74CE"),
    HEX("8574CE")
  }
}

SMODS.ConsumableType {
  key = 'star_astral',
  default = 'c_star_creation',
  collection = 'b_star_astral_cards',
  primary_colour = HEX("8574CE"),
  secondary_colour = HEX("8574CE"),
  collection_rows = { 4, 4 },
  shop_rate = 0,
}

SMODS.Rarity {
  key = "galaxy",
  badge_colour = SMODS.Gradients.star_galaxy,
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
