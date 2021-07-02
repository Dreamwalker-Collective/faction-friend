------------------------------------------------------
-- FFF_ItemInfo.lua
------------------------------------------------------
-- LOCALIZATION: nothing locale-specific here (any localized names are all in comments)
------------------------------------------------------

------------------------------------------------------
-- Faction IDs
------------------------------------------------------
FFF_FactionIDs = {
-- Classic
    ZANDALAR = 270,
    BROOD_NOZDORMU = 910,
    CENARION_CIRCLE = 609,
    ARGENT_DAWN = 529,
    TIMBERMAW = 576,
    THORIUM_BROTHERHOOD = 59,
    HYDRAXIAN_WATERLORDS = 749,
    SHENDRALAR = 809,
    GADGETZAN = 369,
-- Horde/Alliance racial factions   
    HORDE = 67,
        ORC = 76,
        TAUREN = 81,
        TROLL = 530,
        FORSAKEN = 68,
        BELF = 911,
    ALLIANCE = 469,
        DWARF = 47,
        NELF = 69,
        GNOME = 54,
        HUMAN = 72,
        DRAENEI = 930,
    -- Horde/Alliance Forces            
        FROSTWOLF = 729,
        DEFILERS = 510,
        WARSONG_OUTRIDERS = 889,
        STORMPIKE = 730,
        ARATHOR = 509,
        SILVERWING = 890,

    -- Burning Crusade factions 	    
	TRANQUILLIEN = 922,
	CENARION_EXPEDITION = 942,
	SPOREGGAR = 970,
	KURENAI = 978,
	MAGHAR = 941,
	CONSORTIUM = 933,
	ALDOR = 932,
	SCRYER = 934,
	SHATAR = 935,
	LOWER_CITY = 1011,
	NETHERWING = 1015,
	SKYGUARD = 1031,
	HONOR_HOLD = 946,
	THRALLMAR = 947,
	KEEPERS_OF_TIME = 989,
	SCALE_SANDS = 990,
	SHATTERED_SUN = 1077,
	VIOLET_EYE = 967,
}
local F = FFF_FactionIDs;

------------------------------------------------------
-- For zone-based switching
------------------------------------------------------
FFF_ZoneFactions = {
    ["Horde"] = {
        [ZONE_AV] = F.FROSTWOLF,
        [ZONE_AB] = F.DEFILERS,
        [ZONE_WSG] = F.WARSONG_OUTRIDERS,

        		
		-- BC zones/dungeons
		[ZONE_GHOSTLANDS] = F.TRANQUILLIEN,
		[ZONE_HELLFIRE_RAMPARTS] = F.THRALLMAR,
		[ZONE_BLOOD_FURNACE] = F.THRALLMAR,
		[ZONE_SHATTERED_HALLS] = F.THRALLMAR,
    },
    ["Alliance"] = {
        [ZONE_AV] = F.STORMPIKE,
        [ZONE_AB] = F.ARATHOR,
        [ZONE_WSG] = F.SILVERWING,

        -- BC zones/dungeons
		[ZONE_HELLFIRE_RAMPARTS] = F.HONOR_HOLD,
		[ZONE_BLOOD_FURNACE] = F.HONOR_HOLD,
		[ZONE_SHATTERED_HALLS] = F.HONOR_HOLD,
    },
    ["Neutral"] = {
        [ZONE_MOONGLADE] = F.CENARION_CIRCLE,
        [ZONE_SILITHUS] = F.CENARION_CIRCLE,
        [ZONE_AQ20] = F.CENARION_CIRCLE,
        [ZONE_AQ40] = F.BROOD_NOZDORMU,
        [ZONE_FELWOOD] = F.TIMBERMAW,
        [ZONE_WINTERSPRING] = F.TIMBERMAW,
        [ZONE_WESTERN_PLAGUELANDS] = F.ARGENT_DAWN,
        [ZONE_EASTERN_PLAGUELANDS] = F.ARGENT_DAWN,
        [ZONE_MOLTEN_CORE] = F.HYDRAXIAN_WATERLORDS,
        [ZONE_BLACKROCK_DEPTHS] = F.THORIUM_BROTHERHOOD,
        [ZONE_SEARING_GORGE] = F.THORIUM_BROTHERHOOD,
        [ZONE_DIRE_MAUL] = F.SHENDRALAR,
        [ZONE_TANARIS] = F.GADGETZAN,
        [ZONE_YOJAMBA] = F.ZANDALAR,
        [ZONE_ZUL_GURUB] = F.ZANDALAR,

        -- BC zones/dungeons
		[ZONE_ISLE_QUELDANAS] = F.SHATTERED_SUN,
		[ZONE_AUCHENAI_CRYPTS] = F.LOWER_CITY,
		[ZONE_MANA_TOMBS] = F.CONSORTIUM,
		[ZONE_SETHEKK_HALLS] = F.LOWER_CITY,
		[ZONE_SHADOW_LABYRINTH] = F.LOWER_CITY,
		[ZONE_OLD_HILLSBRAD] = F.KEEPERS_OF_TIME,
		[ZONE_BLACK_MORASS] = F.KEEPERS_OF_TIME,
		[ZONE_SLAVE_PENS] = F.CENARION_EXPEDITION,
		[ZONE_STEAMVAULT] = F.CENARION_EXPEDITION,
		[ZONE_UNDERBOG] = F.CENARION_EXPEDITION,
		[ZONE_MAGISTERS_TERRACE] = F.SHATTERED_SUN,
		[ZONE_ARCATRAZ] = F.SHATAR,
		[ZONE_BOTANICA] = F.SHATAR,
		[ZONE_MECHANAR] = F.SHATAR,
		[ZONE_KARAZHAN] = F.VIOLET_EYE,
		[ZONE_HYJAL_SUMMIT] = F.SCALE_SANDS,
    },
};

------------------------------------------------------
-- keeps Alliance/Horde-specific factions from showing up for opposing players
------------------------------------------------------
FFF_ExcludedFactions = {
    ["Alliance"] = {
        [F.FORSAKEN] = 1,
        [F.TROLL] = 1,
        [F.TAUREN] = 1,
        [F.ORC] = 1,
        [F.FROSTWOLF] = 1,
        [F.DEFILERS] = 1, 
        [F.WARSONG_OUTRIDERS] = 1,
        [F.MAGHAR] = 1,
        [F.TRANQUILLIEN] = 1,
        [F.BELF] = 1
    },
    ["Horde"] = {
        [F.HUMAN] = 1,
        [F.GNOME] = 1,
        [F.NELF] = 1,
        [F.DWARF] = 1,
        [F.STORMPIKE] = 1,
        [F.ARATHOR] = 1,
        [F.SILVERWING] = 1,
        [F.KURENAI] = 1,
        [F.DRAENEI] = 1
    },
};

--[[ only used in disabled quest-rep scanning
-- TODO: autogenerate one or the other of these
FFF_FactionGroups = {
    [F.ORC]         = F.HORDE,
    [F.TROLL]       = F.HORDE,
    [F.TAUREN]      = F.HORDE,
    [F.FORSAKEN]    = F.HORDE,
    [F.BELF]        = F.HORDE,
    [F.GOBLIN]      = F.HORDE,
    [F.HUOJIN]      = F.HORDE,
    
    [F.HUMAN]   = F.ALLIANCE,
    [F.DWARF]   = F.ALLIANCE,
    [F.GNOME]   = F.ALLIANCE,
    [F.NELF]    = F.ALLIANCE,
    [F.DRAENEI] = F.ALLIANCE,
    [F.WORGEN]  = F.ALLIANCE,
    [F.TUSHUI]  = F.ALLIANCE,
    
    [F.HAND_VENGEANCE]      = F.HORDE_EXPEDITION,
    [F.TAUNKA]              = F.HORDE_EXPEDITION,
    [F.SUNREAVERS]          = F.HORDE_EXPEDITION,
    [F.WARSONG_OFFENSIVE]   = F.HORDE_EXPEDITION,

    [F.EXPLORERS]       = F.ALLIANCE_VANGUARD,
    [F.FROSTBORN]       = F.ALLIANCE_VANGUARD,
    [F.SILVER_COVENANT] = F.ALLIANCE_VANGUARD,
    [F.VALIANCE]        = F.ALLIANCE_VANGUARD,
}
FFF_GroupFactions = {
    [F.HORDE] = {
        F.ORC,
        F.TROLL,
        F.TAUREN,
        F.FORSAKEN,
        F.BELF,
        F.GOBLIN,
        F.HUOJIN,
    },
    [F.ALLIANCE] = {
        F.HUMAN,
        F.DWARF,
        F.GNOME,
        F.NELF,
        F.DRAENEI,
        F.WORGEN,
        F.TUSHUI,
    },
    [F.HORDE_EXPEDITION] = {
        F.HAND_VENGEANCE,
        F.TAUNKA,
        F.SUNREAVERS,
        F.WARSONG_OFFENSIVE,
    },
    [F.ALLIANCE_VANGUARD] = {
        F.EXPLORERS,
        F.FROSTBORN,
        F.SILVER_COVENANT,
        F.VALIANCE,
    },
}
]]


------------------------------------------------------
-- Localized item names for "created" items, since they can appear without being cached by client
------------------------------------------------------
FFF_SpecialItems = {
    -- vanilla
    [12844] = FFF_ITEM_AD_TOKEN,
    [19858] = FFF_ITEM_ZG_TOKEN,
}

------------------------------------------------------
-- For item tooltips and potential rep gain calculation
------------------------------------------------------
FFF_ItemInfo = {
    
    -- Racial factions: Horde
    [F.TAUREN] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45722] = 1,    -- Thunder Bluff Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45722] = 1,    -- Thunder Bluff Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70153] = 1,    -- Thunder Bluff Writ of Commendation
            },
        },
    },
    [F.TROLL] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45720] = 1,    -- Sen'jin Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45720] = 1,    -- Sen'jin Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70150] = 1,    -- Sen'jin Writ of Commendation
            },
        },
    },
    [F.FORSAKEN] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45723] = 1,    -- Undercity Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45723] = 1,    -- Undercity Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70154] = 1,    -- Undercity Writ of Commendation
            },
        },
    },
    [F.ORC] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45719] = 1,    -- Orgrimmar Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45719] = 1,    -- Orgrimmar Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70149] = 1,    -- Orgrimmar Writ of Commendation
            },
        },
        
        -- AV turnins
        AV_RiderHarnesses = {
            value = 10,
            items = {
                [17642] = 1,    -- Alterac Ram Hide
            },
        },
        AV_BossSummon_5 = {
            value = 50,
            items = {
                [17306] = 5,    -- Stormpike Soldier's Blood
            },
        },
        AV_BossSummon_1 = {
            value = 10,
            items = {
                [17306] = 1,    -- Stormpike Soldier's Blood
            },
        },
        AV_ArmorScraps = {
            value = 10,
            items = {
                [17422] = 20,   -- Armor Scraps
            },
        },
        AV_3rdAirstrike = {
            value = 10,
            items = {
                [17328] = 1,    -- Stormpike Commander's Flesh
            },
        },
        AV_2ndAirstrike = {
            value = 10,
            items = {
                [17327] = 1,    -- Stormpike Lieutenant's Flesh
            },
        },
        AV_1stAirstrike = {
            value = 10,
            items = {
                [17326] = 1,    -- Stormpike Soldier's Flesh
            },
        },
    },
    
    -- Racial factions: Alliance
    [F.NELF] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45714] = 1,    -- Darnassus Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45714] = 1,    -- Darnassus Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70145] = 1,    -- Darnassus Writ of Commendation
            },
        },
    },
    [F.GNOME] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45716] = 1,    -- Gnomeregan Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45716] = 1,    -- Gnomeregan Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70147] = 1,    -- Gnomeregan Writ of Commendation
            },
        },
    },
    [F.HUMAN] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45718] = 1,    -- Stormwind Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45718] = 1,    -- Stormwind Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70152] = 1,    -- Stormwind Writ of Commendation
            },
        },
    },
    [F.DWARF] = {
        -- Argent Tournament vendor (not really a quest, but it works here)
        ChampionWrit = {
            creates = {
                [45717] = 1,    -- Ironforge Commendation Badge
            },
            value = 0,
            buyValue = 250,
            items = {
                [46114] = 1,    -- Champion's Writ
            },
        },
        A_CommendationBadge = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [45717] = 1,    -- Ironforge Commendation Badge
            },
        },
        -- Molten Front vendor (not really a quest, but it works here)
        A_CommendationWrit = {
            value = 250,
            useItem = 1,
            purchased = 1,
            items = {
                [70148] = 1,    -- Ironforge Writ of Commendation
            },
        },

        -- AV turnins
        AV_RiderHarnesses = {
            value = 10,
            items = {
                [17643] = 1,    -- Frostwolf Hide
            },
        },
        AV_BossSummon_5 = {
            value = 50,
            items = {
                [17423] = 5,    -- Storm Crystal
            },
        },
        AV_BossSummon_1 = {
            value = 10,
            items = {
                [17423] = 1,    -- Storm Crystal
            },
        },
        AV_ArmorScraps = {
            value = 10,
            items = {
                [17422] = 20,   -- Armor Scraps
            },
        },
        AV_3rdAirstrike = {
            value = 10,
            items = {
                [17504] = 1,    -- Frostwolf Commander's Medal
            },
        },
        AV_2ndAirstrike = {
            value = 10,
            items = {
                [17503] = 1,    -- Frostwolf Lieutenant's Medal
            },
        },
        AV_1stAirstrike = {
            value = 10,
            items = {
                [17502] = 1,    -- Frostwolf Soldier's Medal
            },
        },
    },
    
    -- Battleground factions
    [F.FROSTWOLF] = {
        AV_RiderHarnesses = {
            value = 1,
            items = {
                [17642] = 1,    -- Alterac Ram Hide
            },
        },
        AV_BossSummon_5 = {
            value = 5,
            items = {
                [17306] = 5,    -- Stormpike Soldier's Blood
            },
        },
        AV_BossSummon_1 = {
            value = 1,
            items = {
                [17306] = 1,    -- Stormpike Soldier's Blood
            },
        },
        AV_ArmorScraps = {
            value = 1,
            items = {
                [17422] = 20,   -- Armor Scraps
            },
        },
        AV_3rdAirstrike = {
            value = 3,
            items = {
                [17328] = 1,    -- Stormpike Commander's Flesh
            },
        },
        AV_2ndAirstrike = {
            value = 2,
            items = {
                [17327] = 1,    -- Stormpike Lieutenant's Flesh
            },
        },
        AV_1stAirstrike = {
            value = 1,
            items = {
                [17326] = 1,    -- Stormpike Soldier's Flesh
            },
        },
        -- AV_MarkOfHonor = {
        --     value = 100,
        --     items = {
        --         [20560] = 3
        --     }
        -- },
        -- AV_ForGreatHonor = {
        --     value = 150,
        --     items = {
        --         [20560] = 3,
        --         [20558] = 3,
        --         [20559] = 3,
        --     }
        -- }
    },
    [F.STORMPIKE] = {
        AV_RiderHarnesses = {
            value = 1,
            items = {
                [17643] = 1,    -- Frostwolf Hide
            },
        },
        AV_BossSummon_5 = {
            value = 5,
            items = {
                [17423] = 5,    -- Storm Crystal
            },
        },
        AV_BossSummon_1 = {
            value = 1,
            items = {
                [17423] = 1,    -- Storm Crystal
            },
        },
        AV_ArmorScraps = {
            value = 1,
            items = {
                [17422] = 20,   -- Armor Scraps
            },
        },
        AV_3rdAirstrike = {
            value = 3,
            items = {
                [17504] = 1,    -- Frostwolf Commander's Medal
            },
        },
        AV_2ndAirstrike = {
            value = 2,
            items = {
                [17503] = 1,    -- Frostwolf Lieutenant's Medal
            },
        },
        AV_1stAirstrike = {
            value = 1,
            items = {
                [17502] = 1,    -- Frostwolf Soldier's Medal
            },
        },
        -- AV_MarkOfHonor = {
        --     value = 100,
        --     items = {
        --         [20560] = 3
        --     }
        -- },
        -- AV_ForGreatHonor = {
        --     value = 150,
        --     items = {
        --         [20558] = 3,
        --         [20559] = 3,
        --         [20560] = 3
        --     }
        -- },
    },

    -- [F.SILVERWING] = {
    --     WSG_MarkOfHonor = {
    --         value = 50,
    --         items = {
    --             [20558] = 3
    --         }
    --     },
    --     WSG_ForGreatHonor = {
    --         value = 100,
    --         items = {
    --             [20558] = 3,
    --             [20559] = 3,
    --             [20560] = 3
    --         }
    --     },
    -- },
    -- [F.WARSONG_OUTRIDERS] = {
    --     WSG_MarkOfHonor = {
    --         value = 50,
    --         items = {
    --             [20558] = 3
    --         }
    --     },
    --     WSG_ForGreatHonor = {
    --         value = 100,
    --         items = {
    --             [20558] = 3,
    --             [20559] = 3,
    --             [20560] = 3
    --         }
    --     },
    -- },

    -- [F.DEFILERS] = {
    --     AB_MarkOfHonor = {
    --         value = 50,
    --         items = {
    --             [20559] = 3
    --         }
    --     },
    --     AB_ForGreatHonor = {
    --         value = 100,
    --         items = {
    --             [20558] = 3,
    --             [20559] = 3,
    --             [20560] = 3
    --         }
    --     },
    -- },

    [F.ARATHOR] = {
        AB_MarkOfHonor = {
            value = 50,
            items = {
                [20559] = 3
            }
        },
        AB_ForGreatHonor = {
            value = 100,
            items = {
                [20558] = 3,
                [20559] = 3,
                [20560] = 3
            },
        },
    },

    -- Other factions
    [F.ZANDALAR] = {
        A_HonorTokens = {
            value = 50,
            useItem = 1,
            items = {
                [19858] = 1,    -- Zandalar Honor Token
            },
        },
        Red_HakkariBijous = {
            value = 75, 
            items = {
                [19707] = 1, -- Red
            }
        },
        Blue_HakkariBijous = {
            value = 75, 
            items = {
                [19708] = 1, -- Blue
            }
        },
        Yellow_HakkariBijous = {
            value = 75, 
            items = {
                [19709] = 1, -- Yellow
            }
        },
        Orange_HakkariBijous = {
            value = 75,  
            items = {
                [19710] = 1, -- Orange
            }
        },
        Green_HakkariBijous = {
            value = 75,   
            items = {
                [19711] = 1, -- Green
            }
        },
        Purple_HakkariBijous = {
            value = 75,  
            items = {
                [19712] = 1, -- Purple
            }
        },
        Bronze_HakkariBijous = {
            value = 75,  
            items = {
                [19713] = 1, -- Bronze
            }
        },
        Silver_HakkariBijous = {
            value = 75,  
            items = {
                [19714] = 1, -- Silver
            }
        },
        Gold_HakkariBijous = {
            value = 75,  
            items = {
                [19715] = 1, -- Gold
            }
        },
        ZRH_Coins = { -- Zulian, Razzashi, and Hakkari Coins
            value = 25,
            items = {
                [19698] = 1,
                [19699] = 1,
                [19700] = 1,
            }
        },
        SSB_Coins = { -- Sandfury, Skullsplitter, and Bloodscalp Coins
            value = 25,
            items = {
                [19704] = 1,
                [19705] = 1,
                [19706] = 1,
            }
        },
        GVW_Coins = { -- Gurubashi, Vilebranch, and Witherbark Coins
            value = 25,
            items = {
                [19701] = 1,
                [19702] = 1,
                [19703] = 1,
            }
        }
    },
    [F.BROOD_NOZDORMU] = {
        MortalChampions = {
            value = 500,
            items = {
                [21229] = 1,    -- Qiraji Lord's Insignia
            },
        },
        SecretsOfTheQiraji = {
            value = 1000,
            items = {
                [21230] = 1,    -- Ancient Qiraji Artifact
            },
        },
        HandOfTheRighteous = {
            value = 500,
            maxStanding = 4, 
            items = {
                [20384] = 200,  -- Silithid Carapace Fragment
            },
        },
    },
    [F.CENARION_CIRCLE] = {
        _MortalChampions = {
            value = 100,
            items = {
                [21229] = 1,    -- Qiraji Lord's Insignia
            },
        },

        TwilightTexts = {
            value = 100,
            items = {
                [20404] = 10,   -- Encrypted Twilight Text
            },
        },

        Allegiance = {
            value = 200,
            items = {
                [20800] = 1,    -- Cenarion Logistics Badge
                [20801] = 1,    -- Cenarion Tactical Badge
                [20802] = 1,    -- Cenarion Combat Badge
            },
        },

        Abyssal3_Scepters = {
            value = 150,       
            items = {
                [20515] = 3,    -- Abyssal Scepter
            },
        },
        Abyssal2_Signets = {
            value = 100,
            items = {
                [20514] = 3,    -- Abyssal Signet
            },
        },
        Abyssal1_Crests = {
            value = 50,
            items = {
                [20513] = 3,    -- Abyssal Crest
            },
        },
    },
    [F.ARGENT_DAWN] = {
        A_ValorTokens = {
            value = 25,
            useItem = 1,
            items = {
                [12844] = 1,    -- Argent Dawn Valor Token
            },
        },
        CorruptorsScourgestones = {
            value = 25,
            items = {
                [12843] = 1, -- Corruptor's Scourgestones
            },
            --creates = {
            --    item = FFF_ItemInfo[F.ARGENT_DAWN].A_ValorTokens,
            --    quantity = 1
            --},
        },
        InvadersScourgestones = {
            value = 25,
            items = {
                [12841] = 10, -- Invader's Scourgestones
            },
        },
        MinionsScourgestones = {
            value = 25,
            items = {
                [12840] = 20, -- Minion's Scourgestones
            },
        },
        HealthyDragonScale = {
            value = 50,
            items = {
                [13920] = 1
            },
        }
    },
    [F.TIMBERMAW] = {
        Totem_Winterfall = {
            value = 150,
            minStanding = 4, 
            items = {
                [20742] = 1,    -- Winterfall Ritual Totem
            },
        },
        Totem_Deadwood = {
            value = 150,
            minStanding = 4, 
            items = {
                [20741] = 1,    -- Deadwood Ritual Totem
            },
        },
        Feathers_Deadwood = {
            value = 50,
            items = {
                [21377] = 5,    -- Deadwood Headdress Feather
            },
        },
        Beads_Winterfall = {
            value = 50,
            items = {
                [21383] = 5,    -- Winterfall Spirit Beads
            },
        },
    },
    [F.THORIUM_BROTHERHOOD] = {
        DarkIronResidue = {
            value = 25,
            minStanding = 5,
            maxStanding = 5,
            items = {
                [18945] = 4,    -- Dark Iron Residue
            },
        },
        DarkIronOre = {
            value = 50,
            items = {
                [11370] = 10,   -- Dark Iron Ore
            },
        },
        CoreLeather = {
            value = 150,
            items = {
                [17012] = 2,    -- Core Leather
            },
        },
        FieryCore = {
            value = 200,
            items = {
                [17010] = 1,    -- Fiery Core
            },
        },
        LavaCore = {
            value = 200,
            items = {
                [17011] = 1,    -- Lava Core
            },
        },
        BloodOfTheMountain = {
            value = 200,
            items = {
                [11382] = 1,    -- Blood of the Mountain
            },
        },
    },
    [F.GADGETZAN] = {
        WaterPouch = {
            value = 10,         -- Max value, degrades by level to 1 @60
            items = {
                [8483] = 5,     -- Wastewander Water Pouches
            },
        },
    },

    	-- Burning Crusade factions
	[F.CONSORTIUM] = {
		Prisons2_AThousandWorlds = {
			value = 500,
			minStanding = 7, 
			items = {
				[29460] = 5,	-- Ethereum Prison Key
			},
		},
		Prisons1_EthereumSecrets = {
			value = 250,
			minStanding = 6, 
			items = {
				[31957] = 1,	-- Ethereum Prisoner I.D. Tag
			},
		},
		Netherstorm_HeapOfEtherials = {
			value = 250,
			minStanding = 5, 
			items = {
				[29209] = 10,	-- Zaxxis Insignia
			},
		},
		Nagrand_Warbeads = {
			value = 250,
			minStanding = 5, 
			items = {
				[25433] = 10,	-- Obsidian Warbeads
			},
		},
		IvoryTusks = {
			value = 250,
			minStanding = 4, 
			maxStanding = 4, 
			items = {
				[25463] = 3,	-- Pair of Ivory Tusks
			},
		},
		CrystalFragments = {
			value = 250,
			minStanding = 4, 
			maxStanding = 4, 
			items = {
				[25416] = 10,	-- Oshu'gun Crystal Fragment
			},
		},
		-- B_TimewarpedBadge = { -- "A_" and "B_" keys for order dependency
		-- 	creates = {
		-- 		[129945] = 1,	-- Commendation of the Consortium
		-- 	},
		-- 	value = 0,
		-- 	buyValue = 500,
		-- 	items = {
		-- 		["currency:1166"] = 50,	-- Timewarped Badge
		-- 	},
		-- },
		A_TimewarpedCommendation = {
			value = 500,
			items = {
				[129945] = 1,	-- Commendation of the Consortium
			}
		},
	},
	[F.MAGHAR] = {
		Warbeads = {
			value = 500,
			minStanding = 4, 
			items = {
				[25433] = 10,	-- Obsidian Warbeads
			},
		},
	},
	[F.KURENAI] = {
		Warbeads = {
			value = 500,
			minStanding = 4, 
			items = {
				[25433] = 10,	-- Obsidian Warbeads
			},
		},
	},
	[F.CENARION_EXPEDITION] = {
		Junk_IdentifyPlantParts = {
			value = 250,
			minStanding = 4, 
			maxStanding = 5, 
			items = {
				[24401] = 10,	-- Unidentified Plant Parts
			},
		},
		Junk_UncataloguedSpecies = {
			value = 500,
			minStanding = 4, 
			items = {
				[24407] = 1,	-- Uncatalogued Species
			},
		},
		CantGetEarnough = {
			value = 150,
			minStanding = 4, 
			items = {
				[35188] = 15,	-- Nesingwary Lackey Ear
			},
		},
        CoilfangArmaments = {
            value = 75,
            items = {
                [24368] = 1
            }
        },
		-- B_TimewarpedBadge = { -- "A_" and "B_" keys for order dependency
		-- 	creates = {
		-- 		[129949] = 1,	-- Commendation of Cenarion Expedition
		-- 	},
		-- 	value = 0,
		-- 	buyValue = 500,
		-- 	items = {
		-- 		["currency:1166"] = 50,	-- Timewarped Badge
		-- 	},
		-- },
		A_TimewarpedCommendation = {
			value = 500,
			items = {
				[129949] = 1,	-- Commendation of Cenarion Expedition
			}
		},
	},
	[F.SPOREGGAR] = {
		Part3_BringMeAShrubbery = {
			value = 750,
			minStanding = 5, 
			items = {
				[24246] = 5,	-- Sanguine Hibiscus
			},
		},
		Part2_Glowcaps = {
			value = 750,
			minStanding = 4, 
			maxStanding = 4, 
			items = {
				[24245] = 10,	-- Glowcap
			},
		},
		Part2_FertileSpores = {
			value = 750,
			minStanding = 4, 
			items = {
				[24449] = 6,	-- Fertile Spores
			},
		},
		Part1_Tendrils = {
			value = 750,
			maxStanding = 4, 
			items = {
				[24291] = 6,	-- Bog Lord Tendril
			},
		},
		Part1_SporeSacs = {
			value = 750,
			maxStanding = 4, 
			items = {
				[24290] = 10,	-- Mature Spore Sac
			},
		},
		PungentTruffle = {
			value = 15,
			items = {
				[144263] = 1, -- Pungent Truffle
			},
		},
	},
	[F.ALDOR] = {
		Unfriendly_VenomSacs = {
			value = 250,
			maxStanding = 3, 
			items = {
				[25802] = 8,	-- Dreadfang Venom Sac
			},
		},
		MarksOfSargeras_10 = {
			value = 250,
			minStanding = 5, 
			items = {
				[30809] = 10,	-- Mark of Sargeras
			},
		},
		MarksOfSargeras_01 = {
			value = 25,
			minStanding = 5, 
			items = {
				[30809] = 1,	-- Mark of Sargeras
			},
		},
		MarksOfKiljaeden_10 = {
			value = 250,
			minStanding = 4, 
			maxStanding = 5,
			items = {
				[29425] = 10,	-- Mark of Kil'jaeden
			},
		},
		MarksOfKiljaeden_01 = {
			value = 25,
			minStanding = 4,
			maxStanding = 5,
			items = {
				[29425] = 1,	-- Mark of Kil'jaeden
			},
		},
		FelArmament = {
			value = 350,
			minStanding = 5, 
			items = {
				[29740] = 1,	-- Fel Armament
			},
		},
	},
	[F.SCRYER] = {
		Unfriendly_BasiliskEyes = {
			value = 250,
			maxStanding = 3, 
			items = {
				[25744] = 8,	-- Dampscale Basilisk Eye
			},
		},		
		SunfurySignet_10 = {
			value = 250,
			minStanding = 5, 
			items = {
				[30810] = 10,	-- Sunfury Signet
			},
		},
		SunfurySignet_01 = {
			value = 25,
			minStanding = 5, 
			items = {
				[30810] = 1,	-- Sunfury Signet
			},
		},
		FirewingSignet_10 = {
			value = 250,
			minStanding = 4, 
			maxStanding = 5,
			items = {
				[29426] = 10,	-- Firewing Signet
			},
		},
		FirewingSignet_01 = {
			value = 25,
			minStanding = 4, 
			maxStanding = 5,
			items = {
				[29426] = 1,	-- Firewing Signet
			},
		},
		ArcaneTome = {
			value = 350,
			minStanding = 5, 
			items = {
				[29739] = 1,	-- Arcane Tome
			},
		},
	},
	[F.LOWER_CITY] = {
		ArakkoaFeathers = {
			value = 250,
			minStanding = 4, 
			maxStanding = 5, 
			items = {
				[25719] = 30,	-- Arakkoa Feather
			},
		},
		-- B_TimewarpedBadge = { -- "A_" and "B_" keys for order dependency
		-- 	creates = {
		-- 		[129951] = 1,	-- Commendation of Lower City
		-- 	},
		-- 	value = 0,
		-- 	buyValue = 500,
		-- 	items = {
		-- 		["currency:1166"] = 50,	-- Timewarped Badge
		-- 	},
		-- },
		A_TimewarpedCommendation = {
			value = 500,
			items = {
				[129951] = 1,	-- Commendation of Lower City
			}
		},
	},
	[F.NETHERWING] = {
		GreatEggHunt = {
			value = 250,
			minStanding = 4, 
			items = {
				[32506] = 1,	-- Netherwing Egg
			},
		},
	},
	[F.SKYGUARD] = {
		ElixirOfShadows = {
			value = 150,
			minStanding = 4, 
			items = {
				[32388] = 6,	-- Shadow Dust
			},
		},
	},
	[F.SHATAR] = {
		Scryer_ArcaneTome = {
			value = 175,
			maxStanding = 5,
			otherFactionRequired = {
				faction = F.SCRYER,
				minStanding = 5,
			},
			items = {
				[29739] = 1,	-- Arcane Tome
			},
		},
		Scryer_SunfurySignet_10 = {
			value = 125,
			maxStanding = 5,
			otherFactionRequired = {
				faction = F.SCRYER,
				minStanding = 5,
			},
			items = {
				[30810] = 10,	-- Sunfury Signet
			},
		},
		Scryer_FirewingSignet_10 = {
			value = 125,
			maxStanding = 5,
			otherFactionRequired = {
				faction = F.SCRYER,
				minStanding = 4, 
				maxStanding = 5,
			},
			items = {
				[29426] = 10,	-- Firewing Signet
			},
		},

		Aldor_FelArmament = {
			value = 175,
			maxStanding = 5,
			otherFactionRequired = {
				faction = F.ALDOR,
				minStanding = 5,
			},
			items = {
				[29740] = 1,	-- Fel Armament
			},
		},
		Aldor_MarksOfSargeras_10 = {
			value = 125,
			maxStanding = 5,
			otherFactionRequired = {
				faction = F.ALDOR,
				minStanding = 5,
			},
			items = {
				[30809] = 10,	-- Mark of Sargeras
			},
		},
		Aldor_MarksOfKiljaeden_10 = {
			value = 125,
			maxStanding = 5,
			otherFactionRequired = {
				faction = F.ALDOR,
				minStanding = 4, 
				maxStanding = 5,
			},
			items = {
				[29425] = 10,	-- Mark of Kil'jaeden
			},
		},

		-- B_TimewarpedBadge = { -- "A_" and "B_" keys for order dependency
		-- 	creates = {
		-- 		[129946] = 1,	-- Commendation of The Sha'tar
		-- 	},
		-- 	value = 0,
		-- 	buyValue = 500,
		-- 	items = {
		-- 		["currency:1166"] = 50,	-- Timewarped Badge
		-- 	},
		-- },
		A_TimewarpedCommendation = {
			value = 500,
			items = {
				[129946] = 1,	-- Commendation of The Sha'tar
			}
		},
	},
    
};
