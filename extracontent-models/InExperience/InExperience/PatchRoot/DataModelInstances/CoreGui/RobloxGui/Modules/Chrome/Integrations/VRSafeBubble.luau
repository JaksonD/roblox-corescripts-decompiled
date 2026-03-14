local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v6 = require(l_script_FirstAncestor_0.Service);
local v7 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v8 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_MappedSignal_0 = v7.MappedSignal;
local v10 = if l_isSpatial_0() then v6.AvailabilitySignal.Available else v6.AvailabilitySignal.Unavailable;
local v11 = l_Signal_0.new();
local v12 = l_MappedSignal_0.new(v11, function() --[[ Line: 22 ]]
    -- upvalues: l_VRHub_0 (copy)
    return l_VRHub_0.SafetyBubble and l_VRHub_0.SafetyBubble.enabled;
end);
if l_VRHub_0.SafetyBubble then
    l_VRHub_0.SafetyBubble.Toggled.Event:Connect(function() --[[ Line: 27 ]]
        -- upvalues: v11 (copy)
        v11:fire();
    end);
end;
return (v6:register({
    initialAvailability = v10, 
    id = "vr_safety_bubble", 
    label = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title", 
    isActivated = function() --[[ Line: 36 ]] --[[ Name: isActivated ]]
        -- upvalues: v12 (copy)
        return v12:get();
    end, 
    activated = function() --[[ Line: 39 ]] --[[ Name: activated ]]
        -- upvalues: l_VRHub_0 (copy), l_RbxAnalyticsService_0 (copy)
        l_VRHub_0:ToggleSafetyBubble();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Safety");
    end, 
    components = {
        Icon = function() --[[ Line: 44 ]] --[[ Name: Icon ]]
            -- upvalues: v8 (copy), v12 (copy)
            return v8("rbxasset://textures/ui/MenuBar/icon_safety_off.png", "rbxasset://textures/ui/MenuBar/icon_safety_on.png", v12);
        end
    }
}));