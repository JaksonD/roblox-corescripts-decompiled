local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local v7 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v9 = require(l_script_FirstAncestor_0.Service);
local v10 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v11 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_MappedSignal_0 = v10.MappedSignal;
local l_UIManager_0 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi).UIManager;
local v14 = if l_isSpatial_0() then v9.AvailabilitySignal.Available else v9.AvailabilitySignal.Unavailable;
local v15 = l_Signal_0.new();
local v16 = l_MappedSignal_0.new(v15, function() --[[ Line: 28 ]]
    -- upvalues: l_VRHub_0 (copy)
    return l_VRHub_0.ShowTopBar;
end);
l_VRHub_0.ShowTopBarChanged.Event:Connect(function() --[[ Line: 32 ]]
    -- upvalues: v15 (copy)
    v15:fire();
end);
return (v9:register({
    initialAvailability = v14, 
    id = "vr_toggle_button", 
    label = "Feature.Catalog.Label.Filter.Hide", 
    isActivated = function() --[[ Line: 40 ]] --[[ Name: isActivated ]]
        -- upvalues: v16 (copy)
        return v16:get();
    end, 
    activated = function() --[[ Line: 43 ]] --[[ Name: activated ]]
        -- upvalues: l_VRHub_0 (copy), l_UIManager_0 (copy), v7 (copy), l_RbxAnalyticsService_0 (copy)
        if l_VRHub_0.ShowTopBar then
            l_UIManager_0.getInstance():prepareGuiToggleAnimationState();
            l_VRHub_0:SetShowTopBar(false);
            if v7:GetVisibility() then
                v7:ToggleVisibility();
            end;
        else
            l_VRHub_0:SetShowTopBar(true);
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-ToggleGui");
    end, 
    components = {
        Icon = function() --[[ Line: 57 ]] --[[ Name: Icon ]]
            -- upvalues: v11 (copy), v16 (copy)
            return v11("rbxasset://textures/ui/MenuBar/icon_maximize.png", "rbxasset://textures/ui/MenuBar/icon_minimize.png", v16);
        end
    }
}));