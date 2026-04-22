local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v5 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.LockCharacterUpdates);
local v6 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
return function(v8, v9, v10, v11) --[[ Line: 19 ]]
    -- upvalues: v4 (copy), v6 (copy), v5 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy)
    return function(v12) --[[ Line: 20 ]]
        -- upvalues: v4 (ref), v9 (copy), v6 (ref), v10 (copy), v11 (copy), v5 (ref), v8 (copy), l_AvatarScreen_0 (ref), l_NavigateWithLock_0 (ref)
        local v13 = v12:getState();
        if v13.AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates or not v13.AvatarExperience.AvatarEditor.Character.EquippedAssets then
            return;
        else
            v12:dispatch(v4(v9.opaque.name));
            v12:dispatch(v6(v10.avatarRefineButtonTap));
            if v11 then
                v11();
            end;
            v12:dispatch(l_NavigateWithLock_0(function() --[[ Line: 34 ]]
                -- upvalues: v12 (copy), v5 (ref), v8 (ref), l_AvatarScreen_0 (ref)
                v12:dispatch(v5());
                v8.navigate(l_AvatarScreen_0.AvatarRefinement);
            end));
            return;
        end;
    end;
end;