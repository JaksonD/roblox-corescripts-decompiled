local l_CorePackages_0 = game:GetService("CorePackages");
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v3 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton);
local v4 = require(l_CorePackages_0.Packages.Otter);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FFlagPassDownSquadExpInvGameOrigin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPassDownSquadExpInvGameOrigin;
local l_useDeviceOrientation_0 = v6.useDeviceOrientation;
local l_useScreenSize_0 = v6.useScreenSize;
local l_ContextualMenu_0 = v7.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v7.App.Menu.MenuDirection;
local l_PlayButtonStates_0 = v3.PlayButtonStates;
local l_useOnPlayButtonCallback_0 = v3.useOnPlayButtonCallback;
return function(v18) --[[ Line: 40 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_FFlagPassDownSquadExpInvGameOrigin_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_useScreenSize_0 (copy), l_useDeviceOrientation_0 (copy), l_DeviceOrientationMode_0 (copy), l_MenuDirection_0 (copy), l_mutedError_0 (copy), v5 (copy), l_CloseCentralOverlay_0 (copy), l_PlayButtonStates_0 (copy), l_ContextualMenu_0 (copy), v4 (copy)
    local v19 = l_useDispatch_0();
    local v20 = l_useLocalization_0({
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        soloPlay = "Feature.Squads.Label.SoloPlay"
    });
    local v21 = if not l_FFlagPassDownSquadExpInvGameOrigin_0 then l_useOnPlayButtonCallback_0(v18.universeId, v18.referralSource, "SquadContextualMenu", nil, nil, nil, nil) else nil;
    local v22 = if l_FFlagPassDownSquadExpInvGameOrigin_0 then l_useOnPlayButtonCallback_0(v18.universeId, v18.referralSource, "SquadContextualMenu", nil, nil, nil, nil) else nil;
    local v23 = if l_FFlagPassDownSquadExpInvGameOrigin_0 then l_useOnPlayButtonCallback_0(v18.universeId, v18.referralSource, "SquadContextualMenu", nil, nil, {
        joinAttemptOrigin = "SquadJoinSoloButton"
    }, nil) else nil;
    local v24 = l_useScreenSize_0();
    local v25 = l_useDeviceOrientation_0() or l_DeviceOrientationMode_0.Portrait;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    if v25 == l_DeviceOrientationMode_0.Landscape then
        if v18.landscapeMenuDirection == l_MenuDirection_0.Up then
            v27 = UDim2.fromOffset(v18.menuAnchorPosition.X + v18.menuAnchorSize.X - 250, v18.menuAnchorPosition.Y - 12);
        elseif v18.landscapeMenuDirection == l_MenuDirection_0.Down then
            v27 = UDim2.fromOffset(v18.menuAnchorPosition.X + v18.menuAnchorSize.X - 250, v18.menuAnchorPosition.Y + v18.menuAnchorSize.Y + 12);
        else
            l_mutedError_0((("Squad contextual menu received unsupported menu direction: %*"):format(v18.landscapeMenuDirection)));
        end;
        v26 = v18.landscapeMenuDirection;
        v28 = UDim2.new(0, 250, 1, 0);
    elseif v25 == l_DeviceOrientationMode_0.Portrait then
        v26 = l_MenuDirection_0.Up;
        v27 = UDim2.fromOffset(0, 0);
        v28 = UDim2.fromScale(1, 1);
    else
        l_mutedError_0((("Squad contextual menu received unsupported device orientation: %*"):format(v25)));
    end;
    local v29 = v5.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v19 (copy), l_CloseCentralOverlay_0 (ref)
        v19(l_CloseCentralOverlay_0());
    end, {
        v19
    });
    local v31 = v5.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v20 (copy), l_FFlagPassDownSquadExpInvGameOrigin_0 (ref), v22 (copy), l_PlayButtonStates_0 (ref), v21 (copy), v29 (copy), v23 (copy)
        local v30 = {};
        table.insert(v30, {
            text = v20.joinWithParty, 
            onActivated = function() --[[ Line: 100 ]] --[[ Name: onActivated ]]
                -- upvalues: l_FFlagPassDownSquadExpInvGameOrigin_0 (ref), v22 (ref), l_PlayButtonStates_0 (ref), v21 (ref), v29 (ref)
                if l_FFlagPassDownSquadExpInvGameOrigin_0 then
                    v22(l_PlayButtonStates_0.PlayableWithParty);
                else
                    v21(l_PlayButtonStates_0.PlayableWithParty);
                end;
                v29();
            end
        });
        table.insert(v30, {
            text = v20.soloPlay, 
            onActivated = function() --[[ Line: 111 ]] --[[ Name: onActivated ]]
                -- upvalues: l_FFlagPassDownSquadExpInvGameOrigin_0 (ref), v23 (ref), l_PlayButtonStates_0 (ref), v21 (ref), v29 (ref)
                if l_FFlagPassDownSquadExpInvGameOrigin_0 then
                    v23(l_PlayButtonStates_0.Playable);
                else
                    v21(l_PlayButtonStates_0.Playable);
                end;
                v29();
            end
        });
        return v30;
    end, {
        v20.soloPlay, 
        v20.joinWithParty, 
        v29, 
        if not l_FFlagPassDownSquadExpInvGameOrigin_0 then v21 else nil, 
        if l_FFlagPassDownSquadExpInvGameOrigin_0 then v23 else nil, 
        if l_FFlagPassDownSquadExpInvGameOrigin_0 then v22 else nil
    });
    local v32 = v5.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v25 (copy), l_DeviceOrientationMode_0 (ref), v5 (ref), l_ContextualMenu_0 (ref), v31 (copy), v26 (ref), v4 (ref), v29 (copy), v24 (copy)
        if v25 == l_DeviceOrientationMode_0.Landscape then
            return v5.createElement(l_ContextualMenu_0, {
                buttonProps = v31, 
                closeBackgroundVisible = false, 
                contextMenuWidthOverride = UDim.new(1, 0), 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                menuDirection = v26, 
                motorOverrideOptions = {
                    motorCallback = v4.instant, 
                    open = {
                        targetValue = 1
                    }, 
                    close = {
                        targetValue = 0
                    }
                }, 
                onDismiss = v29, 
                open = true, 
                openPositionY = UDim.new(0, 0), 
                screenSize = v24, 
                showDropShadow = true
            });
        else
            return v5.createElement(l_ContextualMenu_0, {
                buttonProps = v31, 
                closeBackgroundVisible = false, 
                menuDirection = v26, 
                onDismiss = v29, 
                open = true, 
                openPositionY = UDim.new(1, -76), 
                screenSize = v24, 
                showDropShadow = true
            });
        end;
    end, {
        v31, 
        v25, 
        v26, 
        v29, 
        v24
    });
    return v5.createElement("Frame", {
        Position = v27, 
        Size = v28, 
        BackgroundTransparency = 1
    }, {
        ContextMenu = v32
    });
end;