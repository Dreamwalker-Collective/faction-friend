-----------------------------------------------
-- Classic-Specific Utils
-----------------------------------------------

GFW_FactionFriend.Utils = {};

local u = GFW_FactionFriend.Utils;

function u.noPotential(potential)
    return potential == 0;
end

function u.isExalted(standing)
    return standing == 8;
end

function u.isExaltedLabel(standingText)
    return (standingText == FACTION_STANDING_LABEL8 or standingText == FACTION_STANDING_LABEL8_FEMALE);
end

function u.isParagon()
    return nil;
end

function u.getFriendshipReputation()
    return nil;
end