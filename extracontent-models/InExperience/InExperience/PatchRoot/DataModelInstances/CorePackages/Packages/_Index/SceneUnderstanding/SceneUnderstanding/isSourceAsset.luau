local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.safelyAccessProperty);
return function(v2) --[[ Line: 26 ]] --[[ Name: isSourceAsset ]]
    -- upvalues: v1 (copy)
    return v1(v2, "SourceAssetId", -1) > 0;
end;