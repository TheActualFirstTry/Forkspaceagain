return {
  descriptions = {
    Back = {
      b_star_starstruck = {
        name = "Starstruck Deck",
        text = {
          "Start run with",
          "one {C:attention}Star{} Card",
          "of each suit in deck"
        }
      }
    },
    Joker = {
      j_star_astro = {
        name = "Astro",
        text = {
          "Friend Jokers each",
          "give {X:chips,C:white}X#1#{} Chips"
        }
      },
      j_star_vermi = {
        name = "Vermi",
        text = {
          "{X:mult,C:white}X#1#{} Mult during",
          "{C:attention}context.#2#{}",
          "Context changes at",
          "{C:attention}end of round{}"
        }
      },
      j_star_scrap = {
        name = "Scrap",
        text = {
          "When a {C:tarot}Tarot Card{} is used, balance",
          " {C:chips}Chips{} and {C:mult}Mult{} when calculating",
          "score for next played hand",
          "{C:inactive}(Resets after hand scores){}",
        }
      },
      j_star_astroling = {
        name = "Astroling",
        text = {
          "{C:clubs}Clubs{} and {C:spades}Spades{}",
          "count as the same suit"
        }
      },
      j_star_flash_card = {
        name = "'Flash' Card",
        text = {
          "This Joker gains {X:chips,C:white}X#1#{} Chips if",
          "played hand contains a {C:attention}Flash{}",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips){}"
        }
      },
      j_star_copper_shortsword ={
        name = "Copper Shortsword",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "Chips for every destroyed",
          "{C:attention}playing card{}",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips){}"
        }
      },
      j_star_radiant_joker = {
        name = "Radiant Joker",
        text = {
          "{C:mult}+#1#{} Mult if played",
          "hand contains",
          "a {C:attention}Flash{}"
        }
      },
      j_star_subtle_joker = {
        name = "Subtle Joker",
        text = {
          "{C:chips}+#1#{} Chips if played",
          "hand contains",
          "a {C:attention}Flash{}"
        }
      },
      j_star_the_nuclear_family = {
        name = "The Nuclear Family",
       text = {
        "{X:mult,C:white}X#1#{} Mult if played",
        "hand contains",
        "a {C:attention}Flash{}"
       }
      },
      j_star_crystal = {
        name = "Crystal",
        text = {
          "Copies the ability of",
          "{C:attention}Jokers{} to the left and right"
        }
      },
      j_star_shard = {
        name = "Shard",
        text = {
          "Copies the ability of the",
          "leftmost and rightmost {C:attention}Jokers{}"
        }
      },
    },
    Other = {
    },
    Planet = {
      c_star_planet_popstar = {
        name = "Planet Popstar",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#{}",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} chips"
        }
      }
    },
    Spectral = {
    },
    Voucher = {
    },
  },
  misc = {
    dictionary = {
      -- Rarities
      k_star_galaxy = "Galaxy",

      -- Credits
      star_ui_squad = "Core Team",
      star_ui_artists = "Artists",
      star_ui_coders = "Coders",
      star_ui_shaders = "Shaders",
    },
    labels = {
      k_star_galaxy = "Galaxy",
    },
    poker_hands = {
      star_flash = "Flash",
      star_royal_flash = "Royal Flash"
    },
    poker_hand_descriptions = {
      star_flash = {
        "4 cards with different suits"
      }
    },
    quips = {
    },
    ranks = {
      star_star = "Star"
    }
  }
}

