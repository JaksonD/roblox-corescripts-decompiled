local l_Parent_0 = script:FindFirstAncestor("DiscoveryOtaPatch").Parent;
local l_OtaPatchName_0 = require(l_Parent_0.RobloxAppEnums).OtaPatchName;
local _ = require(l_Parent_0.OtaPatchLoader);
local v3 = game:DefineFastString("DiscoveryOtaBehavior", "app-patch-discovery");
return {
    patchName = l_OtaPatchName_0.DiscoveryOta, 
    patchBehavior = v3, 
    patchConfig = "rbxasset://configs/OtaPatchConfigs/DiscoveryOtaPatchConfig.json", 
    patchPackagesRoot = {
        "DataModelInstances", 
        "OtaPatch", 
        "Packages"
    }, 
    patchStarterScriptPath = {
        "DataModelInstances", 
        "OtaPatch", 
        "DiscoveryOtaStarterScript"
    }
};