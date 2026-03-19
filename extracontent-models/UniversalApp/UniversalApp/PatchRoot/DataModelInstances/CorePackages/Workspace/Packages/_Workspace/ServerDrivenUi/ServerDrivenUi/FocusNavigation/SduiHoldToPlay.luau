local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Responsive);
local l_GetInputModeStore_0 = v4.GetInputModeStore;
local l_Constants_0 = require(l_Parent_0.HoldToPlay).Constants;
local l_AppShortcutBarContext_0 = require(l_Parent_0.AppShortcutBar).AppShortcutBarContext;
local v8 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v8.FocusNavigationEventNameEnum;
local l_useButtonHold_0 = v8.useButtonHold;
local l_ButtonHoldStateEnum_0 = v8.ButtonHoldStateEnum;
local v12 = require(l_Parent_0.GamePlayButton);
local l_useOnPlayButtonCallback_0 = v12.useOnPlayButtonCallback;
local l_usePlayButtonState_0 = v12.usePlayButtonState;
local l_PlayButtonStates_0 = v12.PlayButtonStates;
local v16 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v16.SetGamePlaySession;
local l_SessionType_0 = v16.SessionType;
local l_HoldToPlayLauncher_0 = require(l_Parent_0.DiscoveryAnalytics).Constants.Context.HoldToPlayLauncher;
local _ = require(l_Parent_0.SduiCoreSystem);
local v21 = require(l_script_FirstAncestor_0.FocusNavigation.SduiFocusNavActions);
local v22 = require(l_script_FirstAncestor_0.Analytics.useSduiReportExperienceLaunched);
return v3.memo(function(v23) --[[ Line: 49 ]] --[[ Name: SduiHoldToPlay ]]
    -- upvalues: v3 (copy), l_useButtonHold_0 (copy), l_Constants_0 (copy), l_ButtonHoldStateEnum_0 (copy), l_AppShortcutBarContext_0 (copy), l_GuiService_0 (copy), l_GetInputModeStore_0 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_HoldToPlayLauncher_0 (copy), v22 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_PlayButtonStates_0 (copy), v21 (copy)
    local l_dependencies_0 = v23.sduiContext.dependencies;
    local l_networking_0 = l_dependencies_0.networking;
    local l_sessionService_0 = l_dependencies_0.sessionService;
    local v27 = v3.useRef(nil);
    local v28 = l_useButtonHold_0(l_Constants_0.SIGNAL_HOLD_INTENT_SECONDS, l_Constants_0.SIGNAL_HOLD_COMPLETE_SECONDS);
    local v29 = true;
    if v28.holdState ~= l_ButtonHoldStateEnum_0.HOLDING then
        v29 = true;
        if v28.holdState ~= l_ButtonHoldStateEnum_0.JUST_PRESSED then
            v29 = v28.holdState == l_ButtonHoldStateEnum_0.COMPLETED;
        end;
    end;
    local v30 = v28.holdState == l_ButtonHoldStateEnum_0.COMPLETED;
    local v31 = l_AppShortcutBarContext_0.useDispatchButtonHoldStarted();
    local v32 = l_AppShortcutBarContext_0.useDispatchButtonHoldEnded();
    local v33 = v3.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v23 (copy), l_GuiService_0 (ref)
        if v23.guiObject then
            return v23.guiObject;
        else
            return l_GuiService_0.SelectedCoreObject;
        end;
    end, {
        v23.guiObject
    });
    local v34 = true;
    if v28.holdState ~= l_ButtonHoldStateEnum_0.HOLDING then
        v34 = v28.holdState == l_ButtonHoldStateEnum_0.COMPLETED;
    end;
    v3.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v34 (copy), l_GetInputModeStore_0 (ref), v23 (copy), v4 (ref)
        if v34 then
            local v35 = l_GetInputModeStore_0(false).getLastInputType(false);
            if v23.setDisabledForHold and v35 == v4.Input.Directional then
                v23.setDisabledForHold(true);
            end;
        end;
        return function() --[[ Line: 83 ]]
            -- upvalues: v23 (ref)
            if v23.setDisabledForHold then
                v23.setDisabledForHold(false);
            end;
        end;
    end, {
        v34, 
        v23.setDisabledForHold
    });
    v3.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v27 (copy), v29 (copy), v31 (copy), l_FocusNavigationEventNameEnum_0 (ref), v28 (copy), v32 (copy)
        if not v27.current and v29 then
            v27.current = true;
            v31(l_FocusNavigationEventNameEnum_0.HoldToPlay, v28.holdProgress);
            return;
        else
            if v27.current and not v29 then
                v32(l_FocusNavigationEventNameEnum_0.HoldToPlay);
                v27.current = false;
            end;
            return;
        end;
    end, {
        v29, 
        v28.holdProgress, 
        v31, 
        v32
    });
    local v36 = l_usePlayButtonState_0(l_networking_0, v23.universeId);
    local v37 = l_useOnPlayButtonCallback_0(v23.universeId, nil, l_HoldToPlayLauncher_0, nil, nil);
    local v38 = v22(v23.sduiContext, v23.analyticsContext, v23.universeId, v23.placeId);
    v3.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v30 (copy), v36 (copy), l_SetGamePlaySession_0 (ref), l_sessionService_0 (copy), l_SessionType_0 (ref), v37 (copy), v38 (copy), v28 (copy), l_PlayButtonStates_0 (ref)
        if v30 then
            local l_playButtonState_0 = v36.playButtonState;
            l_SetGamePlaySession_0(l_sessionService_0, l_SessionType_0.StructuralIdentifier.GamePlayFromHoldToPlay, true);
            v37(l_playButtonState_0, v38);
            if v28.cancelHold and l_playButtonState_0 == l_PlayButtonStates_0.Playable then
                v28.cancelHold();
            end;
        end;
    end, {
        v30, 
        v28.cancelHold, 
        v36.playButtonState, 
        l_sessionService_0, 
        v38, 
        v37
    });
    local v40 = v3.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v28 (copy)
        return {
            keys = {
                [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.HoldToPlay
            }, 
            events = {
                [l_FocusNavigationEventNameEnum_0.HoldToPlay] = {
                    handler = v28.eventHandler
                }
            }
        };
    end, {
        v28.eventHandler
    });
    return v3.createElement(v21, {
        focusNavActions = v40, 
        guiObject = v33
    });
end);