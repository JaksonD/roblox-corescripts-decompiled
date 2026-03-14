local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v1.GetFFlagVRPanelWidthIXPEnabled;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v4 = require(l_Parent_0.IxpUtils);
game:DefineFastInt("VrAvatarPanelsSpreadMultiplierPercentageOverride", 96);
game:DefineFastInt("SystemBarHeightMultiplierPercentageOverride", 80);
game:DefineFastString("VrAvatarPanelsDistanceOffsetOverride", "-1.8");
local v5 = v1.GetFFlagVRPanelWidthIXPLocalOverrideEnabled();
local v6 = v1.GetFIntVrAppPanelCurvatureOverride();
local v7 = v1.GetFIntVrAppPanelWidthMultiplierPercentageOverride();
local l_game_FastInt_0 = game:GetFastInt("VrAvatarPanelsSpreadMultiplierPercentageOverride");
local l_game_FastInt_1 = game:GetFastInt("SystemBarHeightMultiplierPercentageOverride");
local l_game_FastString_0 = game:GetFastString("VrAvatarPanelsDistanceOffsetOverride");
local v11 = v1.GetFStringVrSystemBarXOffSetOverride();
local v12 = v1.GetFStringVrSystemBarYOffSetOverride();
local v13 = v1.GetFStringVrSystemBarZOffSetOverride();
return v4.defineIXPTest({
    name = "PlatformExcellence.QualityImprovement.App.VR.AppPanelWidth", 
    layer = l_AppUserLayers_0.PlatformExcellenceQualityImprovementVR, 
    recordExposure = false, 
    getDependentFlagsEnabled = function() --[[ Line: 37 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 41 ]] --[[ Name: getEnabledFlag ]]
        -- upvalues: l_GetFFlagVRPanelWidthIXPEnabled_0 (copy)
        return l_GetFFlagVRPanelWidthIXPEnabled_0();
    end, 
    getEnabledForAllFlag = function() --[[ Line: 45 ]] --[[ Name: getEnabledForAllFlag ]]
        return false;
    end, 
    variables = {
        VrAppPanelWidthMultiplier = function(v14, _) --[[ Line: 51 ]] --[[ Name: VrAppPanelWidthMultiplier ]]
            -- upvalues: v5 (copy), v7 (copy)
            if v5 then
                return v7 / 100;
            else
                local v16 = tonumber(v14.vr_app_panel_width_multiplier_percentage);
                if v16 then
                    return v16 / 100;
                else
                    return nil;
                end;
            end;
        end, 
        VrAppPanelCurvature = function(v17, _) --[[ Line: 60 ]] --[[ Name: VrAppPanelCurvature ]]
            -- upvalues: v5 (copy), v6 (copy)
            if v5 then
                return v6;
            else
                return tonumber(v17.vr_app_panel_curvature) or nil;
            end;
        end, 
        VrAvatarPanelsSpreadMultiplier = function(v19, _) --[[ Line: 67 ]] --[[ Name: VrAvatarPanelsSpreadMultiplier ]]
            -- upvalues: v5 (copy), l_game_FastInt_0 (copy)
            if v5 then
                return l_game_FastInt_0 / 100;
            else
                local v21 = tonumber(v19.vr_avatar_panels_spread_multiplier_percentage);
                if v21 then
                    return v21 / 100;
                else
                    return nil;
                end;
            end;
        end, 
        VrAvatarPanelsDistanceOffset = function(v22, _) --[[ Line: 77 ]] --[[ Name: VrAvatarPanelsDistanceOffset ]]
            -- upvalues: v5 (copy), l_game_FastString_0 (copy)
            if v5 then
                return (tonumber(l_game_FastString_0));
            else
                return tonumber(v22.vr_avatar_panels_distance_offset) or nil;
            end;
        end, 
        VrSystemBarXOffSet = function(v24, _) --[[ Line: 84 ]] --[[ Name: VrSystemBarXOffSet ]]
            -- upvalues: v5 (copy), v11 (copy)
            if v5 then
                return (tonumber(v11));
            else
                return tonumber(v24.vr_system_bar_x_offset) or nil;
            end;
        end, 
        VrSystemBarYOffSet = function(v26, _) --[[ Line: 91 ]] --[[ Name: VrSystemBarYOffSet ]]
            -- upvalues: v5 (copy), v12 (copy)
            if v5 then
                return (tonumber(v12));
            else
                return tonumber(v26.vr_system_bar_y_offset) or nil;
            end;
        end, 
        VrSystemBarZOffSet = function(v28, _) --[[ Line: 98 ]] --[[ Name: VrSystemBarZOffSet ]]
            -- upvalues: v5 (copy), v13 (copy)
            if v5 then
                return (tonumber(v13));
            else
                return tonumber(v28.vr_system_bar_z_offset) or nil;
            end;
        end, 
        SystemBarHeightMultiplier = function(v30, _) --[[ Line: 105 ]] --[[ Name: SystemBarHeightMultiplier ]]
            -- upvalues: v5 (copy), l_game_FastInt_1 (copy)
            if v5 then
                return l_game_FastInt_1 / 100;
            else
                local v32 = tonumber(v30.system_bar_height_percentage);
                if v32 then
                    return v32 / 100;
                else
                    return nil;
                end;
            end;
        end
    }
});