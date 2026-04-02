local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SignalsReact);
local l_GameMediaImageType_0 = require(l_Parent_0.DiscoveryTypes).GameMediaImageType;
local v4 = require(l_Parent_0.DataHydration);
local l_DataStatus_0 = v4.DataStatus;
local l_getGameMediaStore_0 = v4.Game.getGameMediaStore;
local v7 = {
    Loading = "Loading", 
    Success = "Success", 
    NotFound = "NotFound"
};
return function(v8) --[[ Line: 25 ]] --[[ Name: useExperienceBannerImage ]]
    -- upvalues: l_getGameMediaStore_0 (copy), v2 (copy), v1 (copy), l_DataStatus_0 (copy), v7 (copy), l_GameMediaImageType_0 (copy)
    local v9 = l_getGameMediaStore_0(false).getAndFetchGameMedia(v8);
    local v10 = v2.useSignalState(v9.data);
    local v11 = v2.useSignalState(v9.status);
    return v1.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v11 (copy), l_DataStatus_0 (ref), v7 (ref), v10 (copy), l_GameMediaImageType_0 (ref)
        if v11 == l_DataStatus_0.NotReady then
            return {
                status = v7.Loading, 
                url = nil
            };
        elseif v11 == l_DataStatus_0.Failed or not v10 then
            return {
                status = v7.NotFound, 
                url = nil
            };
        else
            for _, v13 in v10 do
                if v13.assetTypeId == l_GameMediaImageType_0.Image and v13.imageId then
                    local v14 = string.format("rbxthumb://type=Asset&id=%s&w=768&h=432", (tostring(v13.imageId)));
                    return {
                        status = v7.Success, 
                        url = v14
                    };
                end;
            end;
            return {
                status = v7.NotFound, 
                url = nil
            };
        end;
    end, {
        v11, 
        v10
    });
end;