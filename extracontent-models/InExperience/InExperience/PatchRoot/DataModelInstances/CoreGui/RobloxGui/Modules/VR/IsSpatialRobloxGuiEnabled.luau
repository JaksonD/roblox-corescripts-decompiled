local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
if require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled then
    return true;
elseif not require(l_RobloxGui_0.Modules.Flags.FFlagEnableSpatialRobloxGui) then
    return false;
else
    local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
    local v3 = require(l_RobloxGui_0.Modules.Flags.FStringSpatialRobloxUIIXPLayerName);
    local v4 = require(l_RobloxGui_0.Modules.Flags.FStringSpatialRobloxUIIXPUITypeVariableName);
    return require(l_RobloxGui_0.Modules.Flags.FStringSpatialRobloxUIIXPSpatialUIVariantValue) == l_IXPServiceWrapper_0:GetLayerData(v3)[v4];
end;