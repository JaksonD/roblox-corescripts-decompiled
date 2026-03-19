local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = {
    Enum = require(l_CorePackages_0.Packages.enumerate)(script.Name, {
        Default = -1, 
        Flooded = 2, 
        InvalidPassword = 7, 
        InvalidCurrentPassword = 8, 
        PinLocked = 9
    })
};
v1.valueToLocalizationKey = {
    [v1.Enum.Default] = "Feature.AccountSecurityPrompt.Message.Error.Password.Default", 
    [v1.Enum.Flooded] = "Feature.AccountSecurityPrompt.Message.Error.Password.Flooded", 
    [v1.Enum.InvalidPassword] = "Feature.AccountSecurityPrompt.Message.Error.Password.InvalidPassword", 
    [v1.Enum.InvalidCurrentPassword] = "Feature.AccountSecurityPrompt.Message.Error.Password.InvalidCurrentPassword", 
    [v1.Enum.PinLocked] = "Feature.AccountSecurityPrompt.Message.Error.Password.PinLocked"
};
v1.localizationKeys = {};
for _, v3 in pairs(v1.valueToLocalizationKey) do
    v1.localizationKeys[v3] = v3;
end;
v1.toString = function(v4, v5) --[[ Line: 31 ]]
    -- upvalues: v1 (copy)
    return v4[v1.valueToLocalizationKey[v5] or v1.valueToLocalizationKey[v1.Enum.Default]];
end;
return v1;