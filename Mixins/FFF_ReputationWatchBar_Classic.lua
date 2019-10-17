-----------------------------------------------
-- FFF_ReputationWatchBar_Classic.lua
--
-- The Reputation/Exp Bar has been revamped a
-- few times, so we've extracted this out to
-- make it easier to maintain in the long run. 
-----------------------------------------------


local WatchBar = GFW_FactionFriend.ReputationWatchBar;

function WatchBar.Update()
    local name, standing, min, max, value, factionID = GetWatchedFactionInfo();
    if (not name) then return; end

    local bar = ReputationWatchBar;
    local statusBar = bar.StatusBar;

    if FFF_ReputationExtraFillBar == nil then
        FFF_ReputationExtraFillBar = CreateFrame("StatusBar", "FFF_ReputationExtraFillBar", bar, "FFF_ReputationExtraFillBarTemplate")
        FFF_ReputationExtraFillBar:SetAllPoints()
        FFF_ReputationExtraFillBar:SetFrameLevel(math.max(statusBar:GetFrameLevel() - 1, 0));
        
        FFF_ReputationTick = CreateFrame("Button", "FFF_ReputationTick", bar, "FFF_ReputationTickTemplate");
        FFF_ReputationTick:SetPoint("CENTER", bar, "CENTER", 0, 0);
        
        -- first time seeing ReputationBar means time to hook it
        bar:HookScript("OnEnter", WatchBar.OnEnter);
        bar:HookScript("OnLeave", WatchBar.OnLeave);
        bar:HookScript("OnMouseDown", WatchBar.OnClick);
    end

    local standingText;
    standingText = FFF_LabelForStanding(standing);

    TextStatusBar_UpdateTextString(ReputationWatchBar);
    --ReputationWatchBar.StatusBar:SetValue(name..": "..standingText.." "..value-min.." / "..max-min);

    if (name ~= GFW_FactionFriend.RecentFactions[1]) then
        FFF_AddToRecentFactions(name);
    end

    local potential = FFF_GetWatchedFactionPotential();
    local totalValue = value + potential;
    local tickSet = ((totalValue - min) / (max - min)) * ReputationWatchBar:GetWidth();
    local tickSet = math.max(tickSet, 0);
    local tickSet = math.min(tickSet, ReputationWatchBar:GetWidth());
    FFF_ReputationTick:ClearAllPoints();
    if (potential == 0 or not FFF_Config or not FFF_Config.ShowPotential) then
        FFF_ReputationTick:Hide();
        FFF_ReputationExtraFillBarTexture:Hide();
    else
        if (totalValue > max) then 
            FFF_ReputationTick:Hide();
        else
            FFF_ReputationTick:Show();
        end
        FFF_ReputationTick:SetPoint("CENTER", "ReputationWatchBar", "LEFT", tickSet, 0);
        FFF_ReputationExtraFillBarTexture:Show();
        FFF_ReputationExtraFillBarTexture:SetPoint("TOPRIGHT", "ReputationWatchBar", "TOPLEFT", tickSet, 0);
        local color = FACTION_BAR_COLORS[standing];
        FFF_ReputationTickHighlight:SetVertexColor(color.r, color.g, color.b);
        if (totalValue > max) then 
            local potentialStanding = FFF_StandingForValue(totalValue);
            color = FACTION_BAR_COLORS[potentialStanding];
            FFF_ReputationExtraFillBarTexture:SetVertexColor(color.r, color.g, color.b, 0.25);
        else
            FFF_ReputationExtraFillBarTexture:SetVertexColor(color.r, color.g, color.b, 0.15);
        end
    end
end

function WatchBar.RegisterFunctions()
    hooksecurefunc("MainMenuBar_UpdateExperienceBars", WatchBar.Update);
end