local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AvatarExperienceCommon);
local v3 = require(l_script_FirstAncestor_0.Utils.TryOns.getTryOnItemComparisonData);
local v4 = require(l_script_FirstAncestor_0.Utils.TryOns.getShouldReplaceTryOn);
getFilteredTryOnItems = function(v5, v6) --[[ Line: 9 ]] --[[ Name: getFilteredTryOnItems ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v7 = {};
    local v8 = {};
    local v9 = v3(v6);
    for v10, v11 in v5 do
        local v12 = v3(v11);
        if v4(v9, v12) then
            v8[v10] = v11;
        else
            v7[v10] = v11;
        end;
    end;
    return v7, v8;
end;
return getFilteredTryOnItems;