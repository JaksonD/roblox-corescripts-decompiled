local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
return {
    getEntryButtonWidgetActivationFunc = function(v5, v6, v7) --[[ Line: 9 ]]
        -- upvalues: v4 (copy), l_AvatarScreen_0 (copy)
        if v5 == v4.Types.ProfilePictureEditorWidget then
            return function() --[[ Line: 11 ]]
                -- upvalues: v6 (copy), l_AvatarScreen_0 (ref), v7 (copy)
                v6.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes, {
                    prevNavPage = l_AvatarScreen_0.Catalog, 
                    prevNavHistory = v7
                });
            end;
        else
            return nil;
        end;
    end
};