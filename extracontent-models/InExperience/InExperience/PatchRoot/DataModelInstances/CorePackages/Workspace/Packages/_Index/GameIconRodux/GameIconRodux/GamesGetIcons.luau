local l_Parent_0 = script:FindFirstAncestor("GameIconRodux").Parent;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IxpServiceWrapper).IXPServiceWrapper;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_FFlagGetGameIconsFromThumbnailsDeliveryApiIxp_0 = require(l_Parent_0.SharedFlags).FFlagGetGameIconsFromThumbnailsDeliveryApiIxp;
local l_FFlagForceGetGameIconsFromThumbnailsDeliveryApi_0 = require(l_Parent_0.SharedFlags).FFlagForceGetGameIconsFromThumbnailsDeliveryApi;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v6, v7, v8) --[[ Line: 25 ]]
    -- upvalues: l_Url_0 (copy), l_FFlagForceGetGameIconsFromThumbnailsDeliveryApi_0 (copy), l_FFlagGetGameIconsFromThumbnailsDeliveryApiIxp_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy)
    local v9 = l_Url_0:makeQueryString({
        universeIds = table.concat(v7, ","), 
        format = "png", 
        size = v8
    });
    local l_THUMBNAILS_URL_0 = l_Url_0.THUMBNAILS_URL;
    if l_FFlagForceGetGameIconsFromThumbnailsDeliveryApi_0 then
        l_THUMBNAILS_URL_0 = l_Url_0.THUMBNAILSDELIVERY_URL;
    elseif l_FFlagGetGameIconsFromThumbnailsDeliveryApiIxp_0 then
        local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(l_AppUserLayers_0.ServeThumbnailsFromEdge);
        if l_l_IXPServiceWrapper_0_LayerData_0 and l_l_IXPServiceWrapper_0_LayerData_0.get_gamesicons_from_edge then
            l_THUMBNAILS_URL_0 = l_Url_0.THUMBNAILSDELIVERY_URL;
        end;
    end;
    return v6(string.format("%sv1/games/icons?%s", l_THUMBNAILS_URL_0, v9), "GET");
end;