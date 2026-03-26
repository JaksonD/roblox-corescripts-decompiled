local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameMediaImageType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).GameMediaImageType;
local v4 = {
    Loading = "Loading", 
    Found = "Found", 
    NotFound = "NotFound"
};
local v5 = {
    status = v4.Loading, 
    url = nil
};
local v6 = {
    status = v4.NotFound, 
    url = nil
};
return {
    useFirstMediaCarouselImageUri = function(v7) --[[ Line: 24 ]] --[[ Name: useFirstMediaCarouselImageUri ]]
        -- upvalues: l_useSelector_0 (copy), v1 (copy), v5 (copy), l_GameMediaImageType_0 (copy), v4 (copy), v6 (copy)
        local v9 = l_useSelector_0(function(v8) --[[ Line: 25 ]]
            -- upvalues: v7 (copy)
            if v7 then
                return v8.GameMedia[v7];
            else
                return nil;
            end;
        end);
        return v1.useMemo(function() --[[ Line: 32 ]]
            -- upvalues: v9 (copy), v5 (ref), l_GameMediaImageType_0 (ref), v4 (ref), v6 (ref)
            if not v9 then
                return v5;
            else
                for _, v11 in v9 do
                    if v11.assetTypeId == l_GameMediaImageType_0.Image and v11.imageId then
                        local v12 = string.format("rbxthumb://type=Asset&id=%s&w=768&h=432", (tostring(v11.imageId)));
                        return {
                            status = v4.Found, 
                            url = v12
                        };
                    end;
                end;
                return v6;
            end;
        end, {
            v9
        });
    end, 
    MediaCarouselImageStatus = v4
};