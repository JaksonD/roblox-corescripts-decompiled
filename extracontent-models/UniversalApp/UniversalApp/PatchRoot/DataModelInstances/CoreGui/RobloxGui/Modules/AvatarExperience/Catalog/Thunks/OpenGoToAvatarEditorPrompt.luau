local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v6 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v7 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v9 = {
    toastMessage = "Feature.Avatar.Message.AlreadyAcquired", 
    isLocalized = false, 
    toastType = v6.InformationMessage
};
return function(v10, v11, v12, v13, v14) --[[ Line: 27 ]]
    -- upvalues: v5 (copy), v4 (copy), l_AvatarScreen_0 (copy), v7 (copy), v9 (copy), l_NavigateWithLock_0 (copy)
    return function(v15) --[[ Line: 28 ]]
        -- upvalues: v12 (copy), v5 (ref), v13 (copy), v14 (copy), v4 (ref), l_AvatarScreen_0 (ref), v7 (ref), v9 (ref), v11 (copy), v10 (copy), l_NavigateWithLock_0 (ref)
        local v16 = v15:getState();
        local l_name_0 = v12.opaque.name;
        local v18 = nil;
        local v19 = v5(v16.AvatarExperience.Common, v13, v14);
        if v14 == v4.ItemType.Asset then
            v18 = v19.assetType;
        elseif v14 == v4.ItemType.Bundle then
            v18 = v19.bundleType;
        end;
        if l_name_0 == l_AvatarScreen_0.AvatarEditor then
            return v15:dispatch(v7(v9));
        else
            v15:dispatch(l_NavigateWithLock_0(function() --[[ Line: 44 ]]
                -- upvalues: v11 (ref), l_AvatarScreen_0 (ref), v14 (ref), v18 (ref), v10 (ref)
                v11.navigate(l_AvatarScreen_0.LeaveCatalogToAvatarPrompt, {
                    itemType = v14, 
                    itemSubType = v18, 
                    onOverlayClosed = v10
                });
            end));
            return;
        end;
    end;
end;