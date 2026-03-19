local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v3, v4) --[[ Line: 10 ]] --[[ Name: selectUserInventoryRecommendationsFetchStatus ]]
    -- upvalues: v1 (copy)
    if not v4 then
        return v1.NotStarted;
    else
        assert(v4, "searchUuid is non-nil. Silence type checker.");
        local v5 = v3.AvatarExperience.AvatarEditor.UserInventoryRecommendationsFetchStatus[v4];
        if v5 == nil then
            v5 = v1.NotStarted;
        end;
        return v5;
    end;
end;