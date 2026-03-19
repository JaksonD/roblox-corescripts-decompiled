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
local l_FFlagEnablePrivatePartyStartJoin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePrivatePartyStartJoin;
local l_useDeviceOrientation_0 = v6.useDeviceOrientation;
local l_useScreenSize_0 = v6.useScreenSize;
local l_ContextualMenu_0 = v7.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v7.App.Menu.MenuDirection;
local l_PlayButtonStates_0 = v3.PlayButtonStates;
local l_useOnPlayButtonCallback_0 = v3.useOnPlayButtonCallback;
return function(v19) --[[ Line: 42 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_FFlagEnablePrivatePartyStartJoin_0 (copy), l_FFlagPassDownSquadExpInvGameOrigin_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_useScreenSize_0 (copy), l_useDeviceOrientation_0 (copy), l_DeviceOrientationMode_0 (copy), l_MenuDirection_0 (copy), l_mutedError_0 (copy), v5 (copy), l_CloseCentralOverlay_0 (copy), l_PlayButtonStates_0 (copy), l_ContextualMenu_0 (copy), v4 (copy)
    local v20 = l_useDispatch_0();
    local v21 = l_useLocalization_0({
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        joinWithPrivateParty = l_FFlagEnablePrivatePartyStartJoin_0 and "Feature.Squads.Action.JoinWithPrivateParty" or nil, 
        soloPlay = "Feature.Squads.Label.SoloPlay"
    });
    local v22 = if not l_FFlagPassDownSquadExpInvGameOrigin_0 then l_useOnPlayButtonCallback_0(v19.universeId, v19.referralSource, "SquadContextualMenu", nil, nil, nil, nil) else nil;
    local v23 = if not not l_FFlagPassDownSquadExpInvGameOrigin_0 or l_FFlagEnablePrivatePartyStartJoin_0 then l_useOnPlayButtonCallback_0(v19.universeId, v19.referralSource, "SquadContextualMenu", nil, nil, nil, nil) else nil;
    local v24 = if l_FFlagPassDownSquadExpInvGameOrigin_0 then l_useOnPlayButtonCallback_0(v19.universeId, v19.referralSource, "SquadContextualMenu", nil, nil, {
        joinAttemptOrigin = "SquadJoinSoloButton"
    }, nil) else nil;
    local v25 = l_useScreenSize_0();
    local v26 = l_useDeviceOrientation_0() or l_DeviceOrientationMode_0.Portrait;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    if v26 == l_DeviceOrientationMode_0.Landscape then
        if v19.landscapeMenuDirection == l_MenuDirection_0.Up then
            v28 = UDim2.fromOffset(v19.menuAnchorPosition.X + v19.menuAnchorSize.X - 250, v19.menuAnchorPosition.Y - 12);
        elseif v19.landscapeMenuDirection == l_MenuDirection_0.Down then
            v28 = UDim2.fromOffset(v19.menuAnchorPosition.X + v19.menuAnchorSize.X - 250, v19.menuAnchorPosition.Y + v19.menuAnchorSize.Y + 12);
        else
            l_mutedError_0((("Squad contextual menu received unsupported menu direction: %*"):format(v19.landscapeMenuDirection)));
        end;
        v27 = v19.landscapeMenuDirection;
        v29 = UDim2.new(0, 250, 1, 0);
    elseif v26 == l_DeviceOrientationMode_0.Portrait then
        v27 = l_MenuDirection_0.Up;
        v28 = UDim2.fromOffset(0, 0);
        v29 = UDim2.fromScale(1, 1);
    else
        l_mutedError_0((("Squad contextual menu received unsupported device orientation: %*"):format(v26)));
    end;
    local v30 = v5.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v20 (copy), l_CloseCentralOverlay_0 (ref)
        v20(l_CloseCentralOverlay_0());
    end, {
        v20
    });
    local v32 = v5.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v21 (copy), l_FFlagPassDownSquadExpInvGameOrigin_0 (ref), v23 (copy), l_PlayButtonStates_0 (ref), v22 (copy), v30 (copy), l_FFlagEnablePrivatePartyStartJoin_0 (ref), v24 (copy)
        local v31 = {};
        table.insert(v31, {
            text = v21.joinWithParty, 
            onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]
                -- upvalues: l_FFlagPassDownSquadExpInvGameOrigin_0 (ref), v23 (ref), l_PlayButtonStates_0 (ref), v22 (ref), v30 (ref)
                if l_FFlagPassDownSquadExpInvGameOrigin_0 then
                    v23(l_PlayButtonStates_0.PlayableWithParty);
                else
                    v22(l_PlayButtonStates_0.PlayableWithParty);
                end;
                v30();
            end
        });
        if l_FFlagEnablePrivatePartyStartJoin_0 then
            table.insert(v31, {
                text = v21.joinWithPrivateParty, 
                onActivated = function() --[[ Line: 117 ]] --[[ Name: onActivated ]]
                    -- upvalues: v23 (ref), l_PlayButtonStates_0 (ref), v30 (ref)
                    v23(l_PlayButtonStates_0.PlayableWithParty, nil, {
                        isPrivateParty = true
                    });
                    v30();
                end
            });
        end;
        table.insert(v31, {
            text = v21.soloPlay, 
            onActivated = function() --[[ Line: 127 ]] --[[ Name: onActivated ]]
                -- upvalues: l_FFlagPassDownSquadExpInvGameOrigin_0 (ref), v24 (ref), l_PlayButtonStates_0 (ref), v22 (ref), v30 (ref)
                if l_FFlagPassDownSquadExpInvGameOrigin_0 then
                    v24(l_PlayButtonStates_0.Playable);
                else
                    v22(l_PlayButtonStates_0.Playable);
                end;
                v30();
            end
        });
        return v31;
    end, {
        v21.soloPlay, 
        v21.joinWithParty, 
        if l_FFlagEnablePrivatePartyStartJoin_0 then v21.joinWithPrivateParty else nil, 
        v30, 
        if not l_FFlagPassDownSquadExpInvGameOrigin_0 then v22 else nil, 
        if l_FFlagPassDownSquadExpInvGameOrigin_0 then v24 else nil, 
        if not not l_FFlagPassDownSquadExpInvGameOrigin_0 or l_FFlagEnablePrivatePartyStartJoin_0 then v23 else nil
    });
    local v33 = v5.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: v26 (copy), l_DeviceOrientationMode_0 (ref), v5 (ref), l_ContextualMenu_0 (ref), v32 (copy), v27 (ref), v4 (ref), v30 (copy), v25 (copy)
        if v26 == l_DeviceOrientationMode_0.Landscape then
            return v5.createElement(l_ContextualMenu_0, {
                buttonProps = v32, 
                closeBackgroundVisible = false, 
                contextMenuWidthOverride = UDim.new(1, 0), 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                menuDirection = v27, 
                motorOverrideOptions = {
                    motorCallback = v4.instant, 
                    open = {
                        targetValue = 1
                    }, 
                    close = {
                        targetValue = 0
                    }
                }, 
                onDismiss = v30, 
                open = true, 
                openPositionY = UDim.new(0, 0), 
                screenSize = v25, 
                showDropShadow = true
            });
        else
            return v5.createElement(l_ContextualMenu_0, {
                buttonProps = v32, 
                closeBackgroundVisible = false, 
                menuDirection = v27, 
                onDismiss = v30, 
                open = true, 
                openPositionY = UDim.new(1, -76), 
                screenSize = v25, 
                showDropShadow = true
            });
        end;
    end, {
        v32, 
        v26, 
        v27, 
        v30, 
        v25
    });
    return v5.createElement("Frame", {
        Position = v28, 
        Size = v29, 
        BackgroundTransparency = 1
    }, {
        ContextMenu = v33
    });
end;