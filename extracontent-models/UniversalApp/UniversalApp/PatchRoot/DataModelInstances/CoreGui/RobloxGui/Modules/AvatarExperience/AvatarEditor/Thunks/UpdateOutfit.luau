local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateOutfit);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v6, v7) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    v4.isType(v6, "string", "UpdateOutfit thunk expects outfitId to be a string");
    return function(v8) --[[ Line: 10 ]]
        -- upvalues: v6 (copy), v2 (ref), v3 (ref), v7 (copy)
        local v9 = v8:getState().AvatarExperience.AvatarEditor.OutfitInfos[v6];
        local v10 = (v9 and v9.updateCounter or 0) + 1;
        local v11 = v9 and v9.isEditable or nil;
        v8:dispatch(v2(v6, v11));
        v8:dispatch(v3(v6, v10, nil, v7));
    end;
end;