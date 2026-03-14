local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.queryViewport);
local v2 = require(l_script_FirstAncestor_0.findSourceAssetsFromDescendant);
local v3 = require(l_script_FirstAncestor_0.getSourceAssetsFromDescendants);
local v4 = require(l_script_FirstAncestor_0.isSourceAsset);
local _ = require(l_script_FirstAncestor_0.options.ViewportQueryOptions);
return function(v6, v7) --[[ Line: 62 ]] --[[ Name: getSourceAssetsInView ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    local v9 = v1(v6, function(v8) --[[ Line: 63 ]]
        -- upvalues: v4 (ref), v2 (ref)
        return v4(v8) or #v2(v8) > 0;
    end, v7);
    return v3(v9);
end;