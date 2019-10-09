local addonName, addonTable = ...; 

------------------------------------------------------
-- Ace3 options panel stuff
------------------------------------------------------

local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceDB = LibStub("AceDB-3.0")

-- Addon Initialization
GFW_FactionFriend = LibStub("AceAddon-3.0"):NewAddon(addonName);
GFW_FactionFriend.date = gsub("$Date: 2013-03-07 22:32:45 -0800 (Thu, 07 Mar 2013) $", "^.-(%d%d%d%d%-%d%d%-%d%d).-$", "%1");

-- TODO: do something about fancy colors for friendship levels?
FFF_FACTION_BAR_COLORS = {
    [1] = {r = 1, g = 0.1, b = 0.05},   -- Hated
    [2] = {r = 0.8, g = 0.3, b = 0.22}, -- Hostile      }
    [3] = {r = 0.75, g = 0.27, b = 0},  -- Unfriendly   } same as default
    [4] = {r = 0.9, g = 0.7, b = 0},    -- Neutral      }
    [5] = {r = 0, g = 0.6, b = 0.1},    -- Friendly     }
    [6] = {r = 0, g = 0.6, b = 0.4},    -- Honored
    [7] = {r = 0, g = 0.7, b = 0.6},    -- Revered
    [8] = {r = 0, g = 0.7, b = 0.8},    -- Exalted
};


function GFW_FactionFriend:OnProfileChanged(event, database, newProfileKey)
    -- this is called every time our profile changes (after the change)
    GFW_FactionFriend.Config = database.profile
end