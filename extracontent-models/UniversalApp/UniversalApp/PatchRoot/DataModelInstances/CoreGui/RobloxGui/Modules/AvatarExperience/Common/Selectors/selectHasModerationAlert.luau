local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v6, v7) --[[ Line: 12 ]] --[[ Name: selectHasModerationAlert ]]
    -- upvalues: l_AvatarScreen_0 (copy), v4 (copy), v5 (copy)
    local v8 = v7 and v7.opaque and v7.opaque.name == l_AvatarScreen_0.MySharedAvatars and v4.ContextWidgets.MySharedAvatars.Context or nil;
    if not v8 then
        return false;
    else
        local l_ContextWidgetInfo_0 = v6.AvatarExperience.Common.Widgets.ContextWidgetInfo;
        local v10 = l_ContextWidgetInfo_0 and l_ContextWidgetInfo_0[v8] and l_ContextWidgetInfo_0[v8].Details;
        local v11 = v10 and v10[v8] and v10[v8].content;
        if not v11 or type(v11) ~= "table" then
            return false;
        else
            local v12 = v6.AvatarExperience.Common.Widgets.HydratedWidgetData[v4.ContentType.Look];
            for _, v14 in v11 do
                if v14 and v14.id and v12 and type(v12[v14.id]) == "table" and v12[v14.id].moderationStatus == v5.ModerationStatus.Moderated then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;