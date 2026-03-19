local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v4 = nil;
    local v5 = nil;
    if v3 == "Profile" or v3 == "Chat" then
        v4 = v1.PROFILE_THUMBNAIL_DATA.Type;
        v5 = v1.PROFILE_THUMBNAIL_DATA.Size;
    elseif v3 == "ExperienceDetails" then
        v4 = v1.EXP_THUMBNAIL_DATA.Type;
        v5 = v1.EXP_THUMBNAIL_DATA.Size;
    elseif v3 == "Item" then
        v4 = v1.ITEM_THUMBNAIL_DATA.Type;
        v5 = v1.ITEM_THUMBNAIL_DATA.Size;
    end;
    if v4 then
        return string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", v4, v2, v5, v5);
    else
        return nil;
    end;
end;