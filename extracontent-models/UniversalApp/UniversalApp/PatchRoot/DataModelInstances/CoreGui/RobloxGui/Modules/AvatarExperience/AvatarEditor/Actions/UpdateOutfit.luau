local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting;
return v2.makeActionCreator(script.Name, function(v6, v7, v8) --[[ Line: 18 ]]
    -- upvalues: l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 (copy)
    return {
        outfitId = tostring(v6), 
        isEditable = v7, 
        outfitType = if l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 then v8 else nil
    };
end);