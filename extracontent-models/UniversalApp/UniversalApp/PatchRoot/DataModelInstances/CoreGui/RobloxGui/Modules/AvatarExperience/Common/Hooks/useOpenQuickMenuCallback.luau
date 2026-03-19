local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
return function(v4) --[[ Line: 7 ]] --[[ Name: useOpenQuickMenuCallback ]]
    -- upvalues: l_useNavigation_0 (copy), v1 (copy), l_AvatarScreen_0 (copy)
    local v5 = l_useNavigation_0();
    return (v1.useCallback(function() --[[ Line: 9 ]]
        -- upvalues: v5 (copy), l_AvatarScreen_0 (ref), v4 (copy)
        if v5 then
            v5.navigate(l_AvatarScreen_0.AvatarExperienceQuickMenu, {
                onOverlayClosed = v4
            });
        end;
    end, {
        v4, 
        v5
    }));
end;