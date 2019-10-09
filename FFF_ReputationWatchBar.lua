local WatchBar = GFW_FactionFriend.ReputationWatchBar;

function WatchBar.OnClick(self, button)
    if (button == "RightButton" and not (GFW_FactionFriend.Config.CombatDisableMenu and InCombatLockdown())) then
        FFF_ShowMenu(1);
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
    end
end

function WatchBar.OnEnter(self)
    if (not GFW_FactionFriend.Config.ShowPotential) then return; end
    FFF_ShowingTooltip = FFF_ReputationTick_Tooltip(self);
end

function WatchBar.OnLeave()
    FFF_ReputationTick:UnlockHighlight();
    if (FFF_ShowingTooltip ~= nil) then
        tooltip:Hide();
        FFF_ShowingTooltip = nil;
    end
end

function FFF_ReputationTick_Tooltip(self)
    local x,y;
    x,y = FFF_ReputationTick:GetCenter();
    local _, _, _, _, _, factionID = GetWatchedFactionInfo();
    local tooltip = GameTooltip;
    if ( FFF_ReputationTick:IsVisible() ) then
        FFF_ReputationTick:LockHighlight();
        if ( x >= ( GetScreenWidth() / 2 ) ) then
            GameTooltip:SetOwner(FFF_ReputationTick, "ANCHOR_LEFT");
        else
            GameTooltip:SetOwner(FFF_ReputationTick, "ANCHOR_RIGHT");
        end
    else
        GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    end
    FFF_FactionReportTooltip(nil, tooltip);
end