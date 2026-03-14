return {
    mock = function(v0) --[[ Line: 18 ]] --[[ Name: mock ]]
        return {
            assetTypeId = -1, 
            assetType = "Image", 
            imageId = v0 or 123456789, 
            videoHash = nil, 
            videoTitle = nil, 
            approved = true, 
            altText = "Alt Text"
        };
    end
};