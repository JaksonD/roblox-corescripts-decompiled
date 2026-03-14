local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values);
return function(v5) --[[ Line: 23 ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy)
    return function(v6) --[[ Line: 24 ]]
        -- upvalues: v5 (copy), v1 (ref), v3 (ref), v4 (ref)
        local l_DefaultBodyColorRanges_0 = v6:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
        assert(l_DefaultBodyColorRanges_0 ~= nil, "defaultBodyColorRanges is nil");
        local v8 = {};
        local v9 = {};
        for v10, v11 in v5 do
            local v12, v13 = v1.findRangeAndSliderValueForColor3(v11, l_DefaultBodyColorRanges_0);
            v8[v10] = v12;
            v9[v10] = v13;
        end;
        v6:dispatch(v3(v8));
        for v14, v15 in v9 do
            local v16 = v5[v14];
            local v17 = v8[v14];
            v6:dispatch(v4(v17, v14, v15, v16));
        end;
    end;
end;