local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.FoundationCloudAssets);
local l_Assets_0 = v2.Assets;
local l_preloadAsset_0 = v2.preloadAsset;
local v5 = require(l_script_FirstAncestor_0.Logger):new("loadFoundationCloudAsset");
return function(v6) --[[ Line: 12 ]] --[[ Name: loadFoundationCloudAsset ]]
    -- upvalues: l_preloadAsset_0 (copy), l_Assets_0 (copy), v5 (copy)
    l_preloadAsset_0(v6);
    local v7 = l_Assets_0[v6];
    if not v7 then
        v5:error("FoundationCloudAsset not found: %s", v6);
        return "", {
            X = 0, 
            Y = 0
        };
    else
        return v7.assetId, v7.size;
    end;
end;