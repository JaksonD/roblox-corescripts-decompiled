local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v6 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 19 ]]
    -- upvalues: v3 (copy), v4 (copy), l_AvatarScreen_0 (copy), v6 (copy)
    return function(v13) --[[ Line: 20 ]]
        -- upvalues: v3 (ref), v4 (ref), v8 (copy), v9 (copy), v7 (copy), l_AvatarScreen_0 (ref), v12 (copy), v6 (ref), v10 (copy), v11 (copy)
        local v14 = v13:getState();
        if v14.AvatarExperience.AvatarEditor.Character.AvatarType ~= v3.AvatarType.R6 then
            return false;
        else
            local v15 = false;
            local v16 = nil;
            local l_Animations_0 = v3.BundleTypeIdStrings.Animations;
            local v18 = v4(v14.AvatarExperience.Common, v8, v9);
            local v19 = nil;
            local v20 = nil;
            if v18 and v9 == v3.ItemType.Bundle then
                v20 = v18.bundleType;
            elseif v18 and v9 == v3.ItemType.Asset then
                v19 = v18.assetType;
            end;
            if v20 and v20 == l_Animations_0 then
                v15 = true;
                v16 = "Feature.Avatar.Message.R15AnimationsPrompt";
            elseif v19 and v19 == v3.AssetTypeIdStrings.EmoteAnimation then
                v15 = true;
                v16 = v7.state.routeName == l_AvatarScreen_0.ProfilePictureEditorEmotes and "Feature.Avatar.Label.PPEEmoteR15Warning" or "Feature.Avatar.Message.R15EmotesPrompt";
            end;
            if v15 then
                if v12 then
                    v13:dispatch(v6(v7));
                end;
                v7.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                    onOverlayClosed = v10, 
                    onOverlayClosedPostClose = v11, 
                    bodyTextKey = v16
                });
                return true;
            else
                return false;
            end;
        end;
    end;
end;