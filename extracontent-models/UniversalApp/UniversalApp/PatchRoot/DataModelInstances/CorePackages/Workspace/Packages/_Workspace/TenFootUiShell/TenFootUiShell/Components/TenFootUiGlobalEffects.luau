local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local l_useInitializeCrossPlaySettings_0 = require(l_Parent_0.CrossPlay).Hooks.useInitializeCrossPlaySettings;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local v7 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_usePrevious_0 = v7.Hooks.usePrevious;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v13 = require(l_script_FirstAncestor_0.Hooks.useHideMouseCursorEffect);
local v14 = require(l_script_FirstAncestor_0.Hooks.useForceNotificationServiceThemeEffect);
local l_useGamepadDisconnectOverlayEffect_0 = require(l_Parent_0.InputUi).Gamepad.useGamepadDisconnectOverlayEffect;
local v16 = require(l_Parent_0.Navigation);
local l_useNavigation_0 = v16.useNavigation;
local l_getRouteIsActive_0 = v16.getRouteIsActive;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagDontUseCrossPlayGlobalEffect_0 = require(l_Parent_0.SharedFlags).FFlagDontUseCrossPlayGlobalEffect;
local function v26() --[[ Line: 25 ]] --[[ Name: useAppGamepadDisconnectListener ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useGamepadDisconnectOverlayEffect_0 (copy)
    local v22 = l_useDispatch_0();
    local v23 = v2.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v22 (copy), l_SetCentralOverlay_0 (ref)
        v22(l_SetCentralOverlay_0());
    end, {
        v22
    });
    local v24 = v2.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v22 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v22(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamepadDisconnected));
    end, {
        v22
    });
    local v25 = l_useRoactService_0(l_AppEventIngestService_0);
    l_useGamepadDisconnectOverlayEffect_0(v24, v23, v25, "InApp");
end;
local function _(v27) --[[ Line: 40 ]] --[[ Name: getAvatarRouteIsActive ]]
    -- upvalues: l_getRouteIsActive_0 (copy), l_AppPage_0 (copy)
    return l_getRouteIsActive_0(v27, l_AppPage_0.AvatarExperienceRoot);
end;
local function v33(v29, v30) --[[ Line: 44 ]] --[[ Name: setSceneTransparency ]]
    if v29 then
        for _, v32 in ipairs(v29:GetChildren()) do
            if v32:IsA("BasePart") then
                v32.Transparency = v30;
            end;
        end;
    end;
end;
local function _(v34, v35) --[[ Line: 58 ]] --[[ Name: applyAvatarCameraFix ]]
    -- upvalues: l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v3 (copy)
    local v36 = l_getRouteIsActive_0(v34, l_AppPage_0.AvatarExperienceRoot);
    local v37 = l_getRouteIsActive_0(v35, l_AppPage_0.AvatarExperienceRoot);
    if v36 and not v37 and workspace.CurrentCamera then
        workspace.CurrentCamera.CFrame = CFrame.new(v3.CAMERA_POSITION);
    end;
end;
local function v43(v39) --[[ Line: 66 ]] --[[ Name: applySceneSwitch ]]
    -- upvalues: v4 (copy), l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v33 (copy)
    local v40 = v4.getBackgroundInstance();
    if v40 then
        local v41 = l_getRouteIsActive_0(v39, l_AppPage_0.AvatarExperienceRoot);
        local v42 = v41 and 1 or 0;
        if v41 then
            task.spawn(function() --[[ Line: 76 ]]
                -- upvalues: v33 (ref), v40 (copy), v42 (copy)
                if workspace:WaitForChild("AvatarSceneNew") then
                    v33(v40, v42);
                end;
            end);
            return;
        else
            v33(v40, v42);
        end;
    end;
end;
local function v50() --[[ Line: 88 ]] --[[ Name: useAvatarSceneEffects ]]
    -- upvalues: l_useNavigation_0 (copy), l_usePrevious_0 (copy), v2 (copy), l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v3 (copy), v43 (copy)
    local l_state_0 = l_useNavigation_0().state;
    local v45 = l_usePrevious_0(l_state_0) or l_state_0;
    v2.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v45 (copy), l_state_0 (copy), l_getRouteIsActive_0 (ref), l_AppPage_0 (ref), v3 (ref), v43 (ref)
        local l_v45_0 = v45;
        local l_l_state_0_0 = l_state_0;
        local v48 = l_getRouteIsActive_0(l_v45_0, l_AppPage_0.AvatarExperienceRoot);
        local v49 = l_getRouteIsActive_0(l_l_state_0_0, l_AppPage_0.AvatarExperienceRoot);
        if v48 and not v49 and workspace.CurrentCamera then
            workspace.CurrentCamera.CFrame = CFrame.new(v3.CAMERA_POSITION);
        end;
        v43(l_state_0);
    end, {
        l_state_0
    });
end;
local function _() --[[ Line: 99 ]] --[[ Name: useTenFootUiScene ]]
    -- upvalues: v2 (copy), v4 (copy)
    v2.useLayoutEffect(function() --[[ Line: 100 ]]
        -- upvalues: v4 (ref)
        v4.initialize();
        return function() --[[ Line: 102 ]]
            -- upvalues: v4 (ref)
            v4.deinitialize();
        end;
    end, {});
end;
return function(v52) --[[ Line: 108 ]] --[[ Name: GlobalEffects ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), v50 (copy), v14 (copy), v13 (copy), l_FFlagDontUseCrossPlayGlobalEffect_0 (copy), l_useInitializeCrossPlaySettings_0 (copy), v26 (copy), v2 (copy), v4 (copy)
    if not l_FFlagEnableLeftNavOnConsole_0 then
        v50();
    end;
    v14();
    v13();
    if not l_FFlagDontUseCrossPlayGlobalEffect_0 then
        l_useInitializeCrossPlaySettings_0();
    end;
    v26();
    if not l_FFlagEnableLeftNavOnConsole_0 then
        v2.useLayoutEffect(function() --[[ Line: 100 ]]
            -- upvalues: v4 (ref)
            v4.initialize();
            return function() --[[ Line: 102 ]]
                -- upvalues: v4 (ref)
                v4.deinitialize();
            end;
        end, {});
    end;
    return v2.createElement(v2.Fragment, nil, v52.children);
end;