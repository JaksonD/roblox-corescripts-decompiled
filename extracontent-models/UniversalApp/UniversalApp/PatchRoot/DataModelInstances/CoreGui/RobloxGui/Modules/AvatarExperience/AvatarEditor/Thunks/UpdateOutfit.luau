local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateOutfit);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting;
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 (copy), v2 (copy), v3 (copy)
    v4.isType(v7, "string", "UpdateOutfit thunk expects outfitId to be a string");
    return function(v9) --[[ Line: 14 ]]
        -- upvalues: v7 (copy), l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 (ref), v2 (ref), v3 (ref), v8 (copy)
        local v10 = v9:getState().AvatarExperience.AvatarEditor.OutfitInfos[v7];
        local v11 = (v10 and v10.updateCounter or 0) + 1;
        local v12 = v10 and v10.isEditable or nil;
        local v13 = if l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 then v10 and v10.outfitType or nil else nil;
        v9:dispatch(v2(v7, v12, if l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 then v13 else nil));
        v9:dispatch(v3(v7, v11, nil, v8));
    end;
end;