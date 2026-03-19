local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.findSourceAssetsFromDescendant);
local v2 = require(l_script_FirstAncestor_0.getSourceAssetsFromDescendants);
local v3 = require(l_script_FirstAncestor_0.isSourceAsset);
local v4 = require(l_script_FirstAncestor_0.options.RangeQueryOptions);
return function(v5, v6) --[[ Line: 30 ]] --[[ Name: getSourceAssetsInRange ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v2 (copy)
    local v7 = {};
    local v8 = v4.new(v6);
    for _, v10 in workspace:GetPartBoundsInRadius(v5, v8.maxDistance) do
        if v3(v10) or #v1(v10) > 0 then
            table.insert(v7, v10);
        end;
    end;
    return v2(v7);
end;