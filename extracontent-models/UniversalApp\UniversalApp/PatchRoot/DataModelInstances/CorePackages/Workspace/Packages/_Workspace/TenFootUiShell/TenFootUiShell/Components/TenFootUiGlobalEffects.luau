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
local function v25() --[[ Line: 24 ]] --[[ Name: useAppGamepadDisconnectListener ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useGamepadDisconnectOverlayEffect_0 (copy)
    local v21 = l_useDispatch_0();
    local v22 = v2.useCallback(function() --[[ Line: 27 ]]
        -- upvalues: v21 (copy), l_SetCentralOverlay_0 (ref)
        v21(l_SetCentralOverlay_0());
    end, {
        v21
    });
    local v23 = v2.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v21 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v21(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamepadDisconnected));
    end, {
        v21
    });
    local v24 = l_useRoactService_0(l_AppEventIngestService_0);
    l_useGamepadDisconnectOverlayEffect_0(v23, v22, v24, "InApp");
end;
local function _(v26) --[[ Line: 39 ]] --[[ Name: getAvatarRouteIsActive ]]
    -- upvalues: l_getRouteIsActive_0 (copy), l_AppPage_0 (copy)
    return l_getRouteIsActive_0(v26, l_AppPage_0.AvatarExperienceRoot);
end;
local function v32(v28, v29) --[[ Line: 43 ]] --[[ Name: setSceneTransparency ]]
    if v28 then
        for _, v31 in ipairs(v28:GetChildren()) do
            if v31:IsA("BasePart") then
                v31.Transparency = v29;
            end;
        end;
    end;
end;
local function _(v33, v34) --[[ Line: 57 ]] --[[ Name: applyAvatarCameraFix ]]
    -- upvalues: l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v3 (copy)
    local v35 = l_getRouteIsActive_0(v33, l_AppPage_0.AvatarExperienceRoot);
    local v36 = l_getRouteIsActive_0(v34, l_AppPage_0.AvatarExperienceRoot);
    if v35 and not v36 and workspace.CurrentCamera then
        workspace.CurrentCamera.CFrame = CFrame.new(v3.CAMERA_POSITION);
    end;
end;
local function v42(v38) --[[ Line: 65 ]] --[[ Name: applySceneSwitch ]]
    -- upvalues: v4 (copy), l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v32 (copy)
    local v39 = v4.getBackgroundInstance();
    if v39 then
        local v40 = l_getRouteIsActive_0(v38, l_AppPage_0.AvatarExperienceRoot);
        local v41 = v40 and 1 or 0;
        if v40 then
            task.spawn(function() --[[ Line: 75 ]]
                -- upvalues: v32 (ref), v39 (copy), v41 (copy)
                if workspace:WaitForChild("AvatarSceneNew") then
                    v32(v39, v41);
                end;
            end);
            return;
        else
            v32(v39, v41);
        end;
    end;
end;
local function v49() --[[ Line: 87 ]] --[[ Name: useAvatarSceneEffects ]]
    -- upvalues: l_useNavigation_0 (copy), l_usePrevious_0 (copy), v2 (copy), l_getRouteIsActive_0 (copy), l_AppPage_0 (copy), v3 (copy), v42 (copy)
    local l_state_0 = l_useNavigation_0().state;
    local v44 = l_usePrevious_0(l_state_0) or l_state_0;
    v2.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v44 (copy), l_state_0 (copy), l_getRouteIsActive_0 (ref), l_AppPage_0 (ref), v3 (ref), v42 (ref)
        local l_v44_0 = v44;
        local l_l_state_0_0 = l_state_0;
        local v47 = l_getRouteIsActive_0(l_v44_0, l_AppPage_0.AvatarExperienceRoot);
        local v48 = l_getRouteIsActive_0(l_l_state_0_0, l_AppPage_0.AvatarExperienceRoot);
        if v47 and not v48 and workspace.CurrentCamera then
            workspace.CurrentCamera.CFrame = CFrame.new(v3.CAMERA_POSITION);
        end;
        v42(l_state_0);
    end, {
        l_state_0
    });
end;
local function _() --[[ Line: 98 ]] --[[ Name: useTenFootUiScene ]]
    -- upvalues: v2 (copy), v4 (copy)
    v2.useLayoutEffect(function() --[[ Line: 99 ]]
        -- upvalues: v4 (ref)
        v4.initialize();
        return function() --[[ Line: 101 ]]
            -- upvalues: v4 (ref)
            v4.deinitialize();
        end;
    end, {});
end;
return function(v51) --[[ Line: 107 ]] --[[ Name: GlobalEffects ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), v49 (copy), v14 (copy), v13 (copy), l_useInitializeCrossPlaySettings_0 (copy), v25 (copy), v2 (copy), v4 (copy)
    if not l_FFlagEnableLeftNavOnConsole_0 then
        v49();
    end;
    v14();
    v13();
    l_useInitializeCrossPlaySettings_0();
    v25();
    if not l_FFlagEnableLeftNavOnConsole_0 then
        v2.useLayoutEffect(function() --[[ Line: 99 ]]
            -- upvalues: v4 (ref)
            v4.initialize();
            return function() --[[ Line: 101 ]]
                -- upvalues: v4 (ref)
                v4.deinitialize();
            end;
        end, {});
    end;
    return v2.createElement(v2.Fragment, nil, v51.children);
end;