local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v4 = require(l_script_FirstAncestor_0.MediaAsset.MediaAssetStoreTypes);
return {
    gameMediaResponseValidator = v2.interface({
        data = v2.array(v4.mediaAssetResponseItemValidator)
    })
};