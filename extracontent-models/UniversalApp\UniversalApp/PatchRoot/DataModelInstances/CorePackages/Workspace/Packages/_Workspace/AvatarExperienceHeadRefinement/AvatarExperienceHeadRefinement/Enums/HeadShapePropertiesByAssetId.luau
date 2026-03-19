local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(script.Parent.HeadShapeProperties);
if not require(l_Parent_0.AvatarExperienceFlags).FFlagDynamicHeadsMigration then
    return (v1.keyBy(v2, function(v3, _) --[[ Line: 18 ]]
        return (tostring(v3.assetId));
    end));
else
    return ((function() --[[ Line: 21 ]]
        -- upvalues: v2 (copy)
        local v5 = {};
        for _, v7 in v2 do
            if type(v7) == "table" and v7.assetId then
                v5[tostring(v7.assetId)] = v7;
            end;
        end;
        return v5;
    end)());
end;