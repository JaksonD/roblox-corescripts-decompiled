local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_RobloxGui_0.Modules.Captures.CapturesApp);
local l_CapturesPolicy_0 = require(l_CorePackages_0.Workspace.Packages.CapturesInExperience).CapturesPolicy;
local v8 = require(l_script_FirstAncestor_0.Service);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v10 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_MappedSignal_0 = v9.MappedSignal;
local l_FFlagEnableConsoleExpControls_0 = v5.FFlagEnableConsoleExpControls;
local l_Available_0 = v8.AvailabilitySignal.Available;
l_Available_0 = if not not l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then v8.AvailabilitySignal.Available else v8.AvailabilitySignal.Unavailable;
local v14 = l_MappedSignal_0.new(v6.onIsActiveChanged, function() --[[ Line: 24 ]]
    -- upvalues: v6 (copy)
    return v6.getIsActive();
end);
local v17 = v8:register({
    initialAvailability = l_Available_0, 
    id = "camera_entrypoint", 
    label = "Feature.SettingsHub.Label.Captures", 
    activated = function(_) --[[ Line: 32 ]] --[[ Name: activated ]]
        -- upvalues: v6 (copy)
        v6.onToggleActivationFromChrome();
    end, 
    isActivated = function() --[[ Line: 35 ]] --[[ Name: isActivated ]]
        -- upvalues: v14 (copy)
        return v14:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 39 ]] --[[ Name: Icon ]]
            -- upvalues: v10 (copy), v14 (copy)
            return v10("icons/controls/cameraOff", "icons/controls/cameraOn", v14);
        end
    }
});
v9.setCoreGuiAvailability(v17, Enum.CoreGuiType.Captures);
if l_FFlagEnableConsoleExpControls_0 then
    local v18 = l_CapturesPolicy_0.PolicyImplementation.read();
    if not if v18 then l_CapturesPolicy_0.Mapper(v18).eligibleForCapturesFeature() else false then
        v17.availability:forceUnavailable();
    end;
end;
return v17;