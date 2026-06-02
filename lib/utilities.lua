-- Joker table
STAR_UTIL.enabled_commons = {
  "astroling",
  "scrap_machete",
  "copper_shortsword",
  "galileo",
  "michael_jackson",
  "radiant_joker",
  "subtle_joker",
}

STAR_UTIL.enabled_uncommons = {
  "flash_card",
  "magolor",
  "marx",
  "weathergirl",
  "wall_of_flesh",
  "cassknows"
}

STAR_UTIL.enabled_rares = {
  "the_grace",
  "astro",
  "scrap",
  "selfie",
  "crystal",
  "shard",
  "ruby",
  "giant_pizza",
  "twice_twice"
}

STAR_UTIL.enabled_legendaries = {
  -- "zenith"
}

STAR_UTIL.enabled_galaxies = {
  "firsttry"
}

STAR_UTIL.enabled_crossmod = {
  nflame = {
    "clanker"
  },
}

-- Consumables table
STAR_UTIL.enabled_consumables = {
  "chaos",
  "rebirth",
  "entropy",
  "ruin",
  "destruction",
  "blood",
  "end",
  "fate",
  "order",
  "insignia",
  "light",
  "fractal",
  "creation",
  "genesis",
  "evolution",
  "mutation",
  "starspace"
}

-- Decks table
STAR_UTIL.enabled_decks = {
  "starstruck",
  "estrogen",
  "astral"
}

-- Poker hands table
STAR_UTIL.enabled_hands = {
  "flash"
}

-- Modifiers table
STAR_UTIL.enabled_modifiers = {
  "star_rank"
}

-- Quips table
STAR_UTIL.enabled_quips = {
}

-- Vouchers table
STAR_UTIL.enabled_vouchers = {
}

STAR_UTIL.enabled_boosters = {
"space1",
"space2",
"space3",
"space4",
"space_jumbo1",
"space_jumbo2",
"space_mega1",
"space_mega2",
}

STAR_UTIL.enabled_tags = {
  "stardust"
}

STAR_UTIL.enabled_challenges = {
  "shopping"
}

STAR_UTIL.enabled_achievements = {
  "your_pick"
}

-- custom colors
STAR_UTIL.colors = {
}

loc_colour()
for i, v in pairs(STAR_UTIL.colors) do
  G.ARGS.LOC_COLOURS["star_" .. i] = v
end

-- custom pronoun sets
if next(SMODS.find_mod("cardpronouns")) then
  CardPronouns.Pronoun {
    colour = CardPronouns.badge_types.he_him.colour,
    text_colour = CardPronouns.badge_types.he_him.text_colour,
    pronoun_table = { "He", "He" },
    in_pool = function()
      return false
    end,
    key = "star_michael_pronoun_jackson",
    classification = "masculine"
  }
  CardPronouns.Pronoun {
    colour = HEX("80407E"),
    text_colour = G.C.WHITE,
    pronoun_table = { "She", "It" },
    in_pool = function()
      return true
    end,
    key = "she_it"
  }
  CardPronouns.Pronoun {
    colour = HEX("405780"),
    text_colour = G.C.WHITE,
    pronoun_table = { "He", "It" },
    in_pool = function()
      return true
    end,
    key = "he_it"
  }
end

-- load items function
function STAR_UTIL.load_items(names, path)
  for i = 1, #names do
    assert(SMODS.load_file(path .. '/' .. names[i] .. '.lua'))()
  end
end
