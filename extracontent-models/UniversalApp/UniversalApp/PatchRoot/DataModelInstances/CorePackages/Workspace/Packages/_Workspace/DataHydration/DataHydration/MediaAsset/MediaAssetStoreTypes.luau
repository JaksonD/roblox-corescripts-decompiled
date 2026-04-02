local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
return {
    mediaAssetResponseItemValidator = v2.interface({
        imageId = v2.optional(v2.union(v2.number, v2.string)), 
        assetTypeId = v2.optional(v2.number), 
        videoId = v2.optional(v2.union(v2.number, v2.string)), 
        videoHash = v2.optional(v2.string), 
        videoTitle = v2.optional(v2.string)
    })
};