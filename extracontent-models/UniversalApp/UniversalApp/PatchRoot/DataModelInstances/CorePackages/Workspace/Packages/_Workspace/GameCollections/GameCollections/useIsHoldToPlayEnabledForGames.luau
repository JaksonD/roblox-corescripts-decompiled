local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v5 = require(l_Parent_0.Responsive);
local l_FFlagLuaAppEnableStickyShortcutBar_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableStickyShortcutBar;
local l_FFlagLuaAppResponsiveEnginePreferredInput_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput;
local l_FFlagGuacStickyShortcutBarEnabled_0 = require(l_Parent_0.SharedFlags).FFlagGuacStickyShortcutBarEnabled;
local v9 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then require(l_Parent_0.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled else nil;
local v10 = if l_FFlagGuacStickyShortcutBarEnabled_0 then require(l_Parent_0.UniversalAppPolicy).useAppPolicy else nil;
return function() --[[ Line: 21 ]] --[[ Name: useIsHoldToPlayEnabledForGames ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v5 (copy), l_useUiModeInfo_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), v10 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), v9 (copy), l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), l_UiMode_0 (copy)
    local v12 = l_useUserExperiment_0({
        l_AppUserLayers_0.PlatformExcellenceQualityImprovementConsoles
    }, function(v11) --[[ Line: 24 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v11[l_AppUserLayers_0.PlatformExcellenceQualityImprovementConsoles] or {}).enableHoldToPlay;
    end);
    local v13 = v5.useLastInput();
    local v14 = l_useUiModeInfo_0();
    local v16 = if l_FFlagGuacStickyShortcutBarEnabled_0 then v10(function(v15) --[[ Line: 36 ]]
        return v15.getStickyShortcutBarEnabled();
    end) else if l_FFlagLuaAppEnableStickyShortcutBar_0 then v9() else nil;
    local v17 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v5.usePreferredInput() else nil;
    local l_v12_0 = v12;
    if l_v12_0 then
        l_v12_0 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v17 == v5.Input.Directional else v13 == v5.Input.Directional;
        if l_v12_0 then
            l_v12_0 = true;
            if v14.uiMode ~= l_UiMode_0.TenFoot then
                if l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then
                    return v16;
                else
                    l_v12_0 = false;
                end;
            end;
        end;
    end;
    return l_v12_0;
end;