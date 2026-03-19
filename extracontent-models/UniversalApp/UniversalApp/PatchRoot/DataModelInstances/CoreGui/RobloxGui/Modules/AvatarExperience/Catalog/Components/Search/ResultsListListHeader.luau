local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v4.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v4.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasModerationAlert);
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasNoSharedAvatarsOnMySharedAvatars);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Components.WidgetListModerationAlert);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.MySharedAvatars.NoSharedAvatars);
local v12 = game:DefineFastFlag("TurnOffModerationAlert", false);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function(_) --[[ Line: 24 ]] --[[ Name: ResultsListListHeader ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v12 (copy), v8 (copy), l_getUseSelectorDeepEquals_0 (copy), v9 (copy), l_AvatarScreen_0 (copy), v3 (copy), v10 (copy), v11 (copy)
    local v15 = l_useAvatarRoute_0();
    local v17 = l_useSelector_0(function(v16) --[[ Line: 27 ]]
        -- upvalues: v12 (ref), v8 (ref), v15 (copy)
        if v12 then
            return false;
        else
            return v8(v16, v15);
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v19 = l_useSelector_0(function(v18) --[[ Line: 33 ]]
        -- upvalues: v9 (ref), v15 (copy)
        return v9(v18, v15);
    end, l_getUseSelectorDeepEquals_0());
    if v15 and v15.opaque and v15.opaque.name == l_AvatarScreen_0.MySharedAvatars then
        if v17 then
            return v3.createElement(v10);
        elseif v19 then
            return v3.createElement(v11);
        end;
    end;
    return nil;
end;