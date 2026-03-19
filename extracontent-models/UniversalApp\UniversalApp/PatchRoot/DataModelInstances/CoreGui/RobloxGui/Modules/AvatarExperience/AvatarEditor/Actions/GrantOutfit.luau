local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
return v2.makeActionCreator(script.Name, function(v4, v5, v6) --[[ Line: 14 ]]
    -- upvalues: v3 (copy)
    return {
        outfitId = v4, 
        outfitType = if v3() then v5 else nil, 
        isEditable = if v3() then v6 else nil
    };
end);