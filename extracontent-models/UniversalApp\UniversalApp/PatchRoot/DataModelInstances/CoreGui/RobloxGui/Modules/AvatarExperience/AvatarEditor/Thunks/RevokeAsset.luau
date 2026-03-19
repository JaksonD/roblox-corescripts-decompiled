local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeAsset);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
return function(v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    return function(v9) --[[ Line: 11 ]]
        -- upvalues: v6 (ref), v7 (ref), v4 (ref), v3 (ref), v8 (copy), v2 (ref)
        local l_EquippedAssets_0 = v9:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
        v6 = tostring(v6);
        v7 = tostring(v7);
        if v4.isAssetEquipped(v7, v6, l_EquippedAssets_0) then
            v9:dispatch(v3(v6, v7, v8));
        end;
        v9:dispatch(v2(v6, v7));
    end;
end;