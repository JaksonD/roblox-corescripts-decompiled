local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
return function(v7, v8) --[[ Line: 10 ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy), v6 (copy), v4 (copy)
    v5.isTypeOrNil(v7, "string", "SetEmoteAssetId thunk expects emoteAssetId to be a string or nil");
    return function(v9) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v3 (ref), v6 (ref), v8 (copy), v4 (ref), v7 (copy)
        local l_TryOnItems_0 = v9:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        if not v2.isEmpty(l_TryOnItems_0) then
            v9:dispatch(v3());
            v9:dispatch(v6(v8));
        end;
        v9:dispatch(v4(v7));
    end;
end;