local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.createDataCache);
local v4 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local _ = require(script.Parent.MediaAssetStoreTypes);
return function() --[[ Line: 17 ]] --[[ Name: createMediaAssetStore ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    local v7 = v3();
    local v9 = v4({
        cache = v7, 
        fetchFn = function(_) --[[ Line: 21 ]] --[[ Name: fetchFn ]]
            -- upvalues: v2 (ref)
            return v2.resolve({});
        end
    });
    return {
        getMediaAsset = v9.getCachedItem, 
        getMediaAssets = v9.getCachedItems, 
        updateMediaAssets = v7.updateItems, 
        updateMediaAsset = v7.updateItem, 
        clear = v9.clear, 
        dispose = v9.dispose
    };
end;