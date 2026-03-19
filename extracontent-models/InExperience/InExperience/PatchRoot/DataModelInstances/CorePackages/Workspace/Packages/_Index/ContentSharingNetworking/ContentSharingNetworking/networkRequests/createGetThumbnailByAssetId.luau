local l_Parent_0 = script.Parent.Parent.Parent;
local l_THUMBNAILS_URL_0 = require(l_Parent_0.Http).Url.THUMBNAILS_URL;
return function(v2) --[[ Line: 15 ]]
    -- upvalues: l_THUMBNAILS_URL_0 (copy)
    return v2.roduxNetworking.POST({
        Name = "GetThumbnailByAssetId"
    }, function(v3, v4) --[[ Line: 18 ]]
        -- upvalues: l_THUMBNAILS_URL_0 (ref)
        return v3(l_THUMBNAILS_URL_0):path("v1"):path("batch"):body({
            {
                targetId = v4.assetId, 
                type = v4.assetType, 
                size = v4.size
            }
        });
    end);
end;