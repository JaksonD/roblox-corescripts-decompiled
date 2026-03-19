local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v5 = require(l_Parent_0.Responsive);
local l_FFlagLuaAppEnableStickyShortcutBar_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableStickyShortcutBar;
local l_FFlagLuaAppResponsiveEnginePreferredInput_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput;
local v8 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then require(l_Parent_0.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled else nil;
return function() --[[ Line: 17 ]] --[[ Name: useIsHoldToPlayEnabledForGames ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v5 (copy), l_useUiModeInfo_0 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), v8 (copy), l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), l_UiMode_0 (copy)
    local v10 = l_useUserExperiment_0({
        l_AppUserLayers_0.PlatformExcellenceQualityImprovementConsoles
    }, function(v9) --[[ Line: 20 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v9[l_AppUserLayers_0.PlatformExcellenceQualityImprovementConsoles] or {}).enableHoldToPlay;
    end);
    local v11 = v5.useLastInput();
    local v12 = l_useUiModeInfo_0();
    local v13 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v8() else nil;
    local v14 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v5.usePreferredInput() else nil;
    local l_v10_0 = v10;
    if l_v10_0 then
        l_v10_0 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v14 == v5.Input.Directional else v11 == v5.Input.Directional;
        if l_v10_0 then
            l_v10_0 = true;
            if v12.uiMode ~= l_UiMode_0.TenFoot then
                if l_FFlagLuaAppEnableStickyShortcutBar_0 then
                    return v13;
                else
                    l_v10_0 = false;
                end;
            end;
        end;
    end;
    return l_v10_0;
end;