local l_Parent_0 = script:FindFirstAncestor("DiscoveryTypes").Parent;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
return {
    Image = 1, 
    YouTubeVideo = 33, 
    Video = l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and 62 or nil, 
    GamePreviewVideo = 86
};