local l_Parent_0 = script:FindFirstAncestor("RoduxGames").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {};
v2.new = function(v3) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v2.isValid(v3));
    v2.__index = v2;
    setmetatable(v3, v2);
    return v3;
end;
v2.mock = function(v4) --[[ Line: 31 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    v4 = v4 or {};
    return (v2.new({
        assetTypeId = v4.assetTypeId or 1, 
        assetType = v4.assetType or "Image", 
        imageId = v4.imageId or 1234567890, 
        approved = v4.approved or false
    }));
end;
v2.format = function(v5) --[[ Line: 44 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy)
    return (v2.new({
        assetTypeId = v5.assetTypeId, 
        assetType = v5.assetType, 
        imageId = v5.imageId, 
        videoHash = v5.videoHash, 
        videoTitle = v5.videoTitle, 
        approved = if v5.approved then v5.approved else false, 
        altText = v5.altText
    }));
end;
v2.isValid = v1.strictInterface({
    assetTypeId = v1.optional(v1.number), 
    assetType = v1.string, 
    imageId = v1.optional(v1.number), 
    videoHash = v1.optional(v1.string), 
    videoTitle = v1.optional(v1.string), 
    approved = v1.boolean, 
    altText = v1.optional(v1.string)
});
return v2;