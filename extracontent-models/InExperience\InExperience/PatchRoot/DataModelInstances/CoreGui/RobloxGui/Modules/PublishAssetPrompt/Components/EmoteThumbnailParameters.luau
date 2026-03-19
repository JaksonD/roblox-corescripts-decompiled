local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
return {
    validate = v1.strictInterface({
        thumbnailKeyframe = v1.number, 
        thumbnailTime = v1.number, 
        thumbnailZoom = v1.number, 
        thumbnailVerticalOffset = v1.number, 
        thumbnailHorizontalOffset = v1.number, 
        thumbnailCharacterRotation = v1.number
    }), 
    defaultParameters = {
        thumbnailKeyframe = 1, 
        thumbnailTime = 0, 
        thumbnailZoom = 1, 
        thumbnailVerticalOffset = 0, 
        thumbnailHorizontalOffset = 0, 
        thumbnailCharacterRotation = 0
    }, 
    encodeAsATable = function(v2) --[[ Line: 41 ]]
        return {
            ThumbnailBundleId = 515, 
            ThumbnailCharacterRotation = v2.thumbnailCharacterRotation, 
            ThumbnailHorizontalOffset = v2.thumbnailHorizontalOffset, 
            ThumbnailVerticalOffset = v2.thumbnailVerticalOffset, 
            ThumbnailZoom = v2.thumbnailZoom, 
            ThumbnailKeyframe = v2.thumbnailKeyframe, 
            ThumbnailTime = v2.thumbnailTime
        };
    end
};