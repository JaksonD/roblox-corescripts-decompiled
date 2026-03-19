local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v6 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local l_getTryOnItemReducerKey_0 = v2.Utils.getTryOnItemReducerKey;
local v9 = {
    toastMessage = "Feature.Avatar.Label.TryOnFail", 
    isLocalized = false, 
    toastType = v6.InformationMessage
};
return function(v10) --[[ Line: 24 ]]
    -- upvalues: v4 (copy), l_getTryOnItemReducerKey_0 (copy), v3 (copy), v7 (copy), v5 (copy), v9 (copy)
    v4.isType(v10, "string", "HandleTryOnFailure request expects bundleId");
    return function(v11) --[[ Line: 26 ]]
        -- upvalues: l_getTryOnItemReducerKey_0 (ref), v10 (copy), v3 (ref), v7 (ref), v5 (ref), v9 (ref)
        local v12 = v11:getState();
        local v13 = l_getTryOnItemReducerKey_0(v10, v3.ItemType.Bundle);
        if v12.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[v13] then
            v11:dispatch(v7(v10));
            v11:dispatch(v5(v9));
        end;
    end;
end;