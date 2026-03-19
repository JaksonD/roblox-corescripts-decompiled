local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local _ = require(l_script_FirstAncestor_0.Parent.SceneUnderstanding);
local v2 = require(l_script_FirstAncestor_0.SceneAnalysisContext);
local v3 = require(l_script_FirstAncestor_0.useSourceAssets);
return function(v4) --[[ Line: 72 ]] --[[ Name: useAssetsInView ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = v2.use();
    return v3({
        viewportQueryOptions = v4 or v5.viewportQueryOptions
    }).assetsInView;
end;