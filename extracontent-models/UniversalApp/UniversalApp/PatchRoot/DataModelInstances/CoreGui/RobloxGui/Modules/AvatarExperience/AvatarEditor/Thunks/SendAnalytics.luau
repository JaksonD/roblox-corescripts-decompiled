local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Utils);
return function(v2, v3, v4) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return function(v5) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (copy), v3 (copy), v4 (copy)
        local l_category_0 = v5:getState().AvatarExperience.AvatarEditor.Categories.category;
        local l_subcategory_0 = v5:getState().AvatarExperience.AvatarEditor.Categories.subcategory;
        local v8 = v1.getUserId(v5:getState());
        local l_RequestId_0 = v5:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
        v2(v3, l_category_0, l_subcategory_0, v4, v8, l_RequestId_0);
    end;
end;