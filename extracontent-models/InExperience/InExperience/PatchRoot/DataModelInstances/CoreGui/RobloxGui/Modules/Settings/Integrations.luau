local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_FFlagRefactorInExpSettingsInDevelopment_0 = require(l_script_FirstAncestor_0.Flags).FFlagRefactorInExpSettingsInDevelopment;
local l_Integrations_0 = l_script_FirstAncestor_0.Integrations;
local v3 = nil;
if l_FFlagRefactorInExpSettingsInDevelopment_0 then
    v3 = require(l_Integrations_0.Settings);
end;
local v4 = require(l_Integrations_0.Constants);
local v5 = require(l_Integrations_0.Utils);
return {
    Settings = v3, 
    Constants = v4, 
    Utils = v5
};