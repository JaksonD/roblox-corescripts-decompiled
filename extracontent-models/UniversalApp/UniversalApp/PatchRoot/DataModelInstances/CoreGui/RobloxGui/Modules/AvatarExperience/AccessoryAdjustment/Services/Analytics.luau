local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AnalyticsService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v6 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v8 = {};
local v45 = l_memoize_0(function(v9) --[[ Line: 14 ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_RbxAnalyticsService_0 (copy), v6 (copy)
    local v18 = {
        avatarAARefineNavigationTap = function(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: avatarAARefineNavigationTap ]]
            -- upvalues: v9 (copy)
            local v13 = {
                category = v12, 
                uid = v11, 
                navTab = "Accessory"
            };
            v9.EventStream:sendTelemetryEvent(v10, "avatarRefineNavigationTap", v13);
        end, 
        avatarLCRefineNavigationTap = function(v14, v15, v16) --[[ Line: 28 ]] --[[ Name: avatarLCRefineNavigationTap ]]
            -- upvalues: v9 (copy)
            local v17 = {
                category = v16, 
                uid = v15, 
                navTab = "Clothing"
            };
            v9.EventStream:sendTelemetryEvent(v14, "avatarRefineNavigationTap", v17);
        end
    };
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v18.avatarLayeredMakeupNavigationTap = function(v19, v20, v21) --[[ Line: 40 ]] --[[ Name: avatarLayeredMakeupNavigationTap ]]
            -- upvalues: v9 (copy)
            local v22 = {
                category = v21, 
                uid = v20, 
                navTab = "Makeup"
            };
            v9.EventStream:sendTelemetryEvent(v19, "avatarRefineNavigationTap", v22);
        end;
    end;
    v18.avatarRefineAccessoryResetConfirm = function(v23, v24, _, v26) --[[ Line: 52 ]] --[[ Name: avatarRefineAccessoryResetConfirm ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), v9 (copy)
        local v27 = {
            uid = v24, 
            refineSessionId = l_RbxAnalyticsService_0:GetSessionId(), 
            assetId = v26
        };
        v9.EventStream:sendTelemetryEvent(v23, "avatarRefineAccessoryResetConfirm", v27);
    end;
    v18.avatarRefineAccessoryStart = function(v28, v29, _, v31) --[[ Line: 63 ]] --[[ Name: avatarRefineAccessoryStart ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), v9 (copy)
        local v32 = {
            uid = v29, 
            refineSessionId = l_RbxAnalyticsService_0:GetSessionId(), 
            assetId = v31
        };
        v9.EventStream:sendTelemetryEvent(v28, "avatarRefineAccessoryStart", v32);
    end;
    v18.avatarRefineAccessoryAdjustTap = function(v33) --[[ Line: 74 ]] --[[ Name: avatarRefineAccessoryAdjustTap ]]
        -- upvalues: v9 (copy)
        return function(v34, v35, _, v37) --[[ Line: 75 ]]
            -- upvalues: v33 (copy), v9 (ref)
            local v38 = {
                uid = v35, 
                assetId = v37, 
                adjustTab = v33
            };
            v9.EventStream:sendTelemetryEvent(v34, "avatarRefineAccessoryAdjustTap", v38);
        end;
    end;
    v18.avatarRefineAccessoryApply = function(v39) --[[ Line: 87 ]] --[[ Name: avatarRefineAccessoryApply ]]
        -- upvalues: v6 (ref), v9 (copy)
        return function(v40, v41, _, v43) --[[ Line: 88 ]]
            -- upvalues: v39 (copy), v6 (ref), v9 (ref)
            local v44 = {
                assetId = v43, 
                uid = v41, 
                move_x = v39[v6.PositionX], 
                move_y = v39[v6.PositionY], 
                move_z = v39[v6.PositionZ], 
                rotation_x = v39[v6.RotationX], 
                rotation_y = v39[v6.RotationY], 
                rotation_z = v39[v6.RotationZ], 
                scale = v39[v6.Scale]
            };
            v9.EventStream:sendTelemetryEvent(v40, "avatarRefineAccessoryApply", v44);
        end;
    end;
    return v18;
end);
v8.get = function(_) --[[ Line: 111 ]] --[[ Name: get ]]
    -- upvalues: l_AnalyticsService_0 (copy), v45 (copy)
    return v45(l_AnalyticsService_0);
end;
return v8;