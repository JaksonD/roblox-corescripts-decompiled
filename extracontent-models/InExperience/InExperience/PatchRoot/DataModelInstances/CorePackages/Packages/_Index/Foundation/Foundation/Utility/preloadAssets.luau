local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.FoundationCloudAssets);
local l_Assets_0 = v2.Assets;
local l_preloadAsset_0 = v2.preloadAsset;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), l_Assets_0 (copy), l_preloadAsset_0 (copy)
    if typeof(v5) == "string" then
        v5 = {
            v5
        };
    end;
    v1.forEach(v5, function(v6) --[[ Line: 12 ]]
        -- upvalues: l_Assets_0 (ref), l_preloadAsset_0 (ref)
        assert(l_Assets_0[v6], (("preloadAssets should only be used with valid FoundationCloudAssets; %* is an invalid name"):format(v6)));
        l_preloadAsset_0(v6);
    end);
end;