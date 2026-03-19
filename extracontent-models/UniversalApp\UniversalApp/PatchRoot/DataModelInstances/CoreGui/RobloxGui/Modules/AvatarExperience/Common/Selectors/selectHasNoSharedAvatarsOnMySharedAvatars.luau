local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
return function(v6, v7) --[[ Line: 13 ]] --[[ Name: selectHasNoSharedAvatarsOnMySharedAvatars ]]
    -- upvalues: l_AvatarScreen_0 (copy), v5 (copy), v2 (copy)
    local v8 = v7 and v7.opaque and v7.opaque.name == l_AvatarScreen_0.MySharedAvatars and v5.ContextWidgets.MySharedAvatars.Context or nil;
    if not v8 then
        return false;
    else
        local l_ContextWidgetInfo_0 = v6.AvatarExperience.Common.Widgets.ContextWidgetInfo;
        local v10 = l_ContextWidgetInfo_0 and l_ContextWidgetInfo_0[v8] and l_ContextWidgetInfo_0[v8].Details;
        if not v10 or type(v10) ~= "table" then
            return false;
        else
            local v11 = v10[v8] and v10[v8].content;
            if not v11 or type(v11) ~= "table" or #v2.keys(v11) == 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;