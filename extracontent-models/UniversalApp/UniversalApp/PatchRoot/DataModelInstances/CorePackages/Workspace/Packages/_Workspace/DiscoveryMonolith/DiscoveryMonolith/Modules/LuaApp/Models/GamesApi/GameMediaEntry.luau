local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v2 = require(l_Parent_0.ArgCheck);
local l_GameMediaImageType_0 = require(l_Parent_0.DiscoveryTypes).GameMediaImageType;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local v5 = {};
for v6, v7 in pairs(l_GameMediaImageType_0) do
    v5[v7] = v6;
end;
local v8 = {
    new = function() --[[ Line: 44 ]] --[[ Name: new ]]
        return {};
    end
};
v8.fromJsonData = function(v9) --[[ Line: 48 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v8 (copy), v2 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_GameMediaImageType_0 (copy), v5 (copy), l_Logging_0 (copy)
    local v10 = v8.new();
    v10.id = v9.id and tostring(v2.isType(v9.id, "number", "jsonData.id"));
    v10.assetTypeId = v2.isType(v9.assetTypeId, "number", "jsonData.assetTypeId");
    v10.imageId = v9.imageId and tostring(v2.isType(v9.imageId, "number", "jsonData.imageId"));
    v10.youTubeVideoHash = v9.videoHash and v2.isType(v9.videoHash, "string", "jsonData.videoHash");
    v10.youTubeVideoTitle = v9.videoTitle and v2.isType(v9.videoTitle, "string", "jsonData.videoTitle");
    v10.approved = v2.isType(v9.approved, "boolean", "jsonData.approved");
    if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v10.assetTypeId == l_GameMediaImageType_0.Video then
        v10.videoId = v2.isType(v9.videoId, "string", "jsonData.videoId");
    end;
    if v10.assetTypeId == l_GameMediaImageType_0.GamePreviewVideo then
        v10.videoId = v2.isType(v9.videoId, "string", "jsonData.videoId");
    end;
    if not v5[v10.assetTypeId] then
        l_Logging_0.warn("Unrecognized assetTypeId: " .. tostring(v10.assetTypeId));
    end;
    return v10;
end;
return v8;