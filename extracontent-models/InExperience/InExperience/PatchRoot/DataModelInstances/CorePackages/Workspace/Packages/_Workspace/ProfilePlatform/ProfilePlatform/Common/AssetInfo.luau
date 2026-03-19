local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel;
local v4 = 0;
local function _() --[[ Line: 13 ]]
    -- upvalues: v4 (ref)
    v4 = v4 + 1;
    return (tostring(v4));
end;
return {
    mock = function(v6, v7) --[[ Line: 36 ]] --[[ Name: mock ]]
        -- upvalues: v4 (ref), v2 (copy)
        local v8 = {};
        local v9 = tostring(v6);
        if not v9 then
            v4 = v4 + 1;
            v9 = tostring(v4);
        end;
        v8.id = v9;
        v8.assetType = "0";
        v8.itemType = v7 or v2.ItemTypes.Asset;
        v8.name = "";
        return v8;
    end, 
    fromAsset = function(v10) --[[ Line: 51 ]] --[[ Name: fromAsset ]]
        -- upvalues: l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (copy)
        return {
            id = tostring(v10.id), 
            assetType = tostring(v10.assetType or if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then v10.bundleType else nil), 
            itemType = v10.itemType, 
            name = v10.name, 
            price = v10.price, 
            lowestResalePrice = v10.lowestResalePrice, 
            isOffSale = v10.isOffSale, 
            favoriteCount = v10.favoriteCount
        };
    end
};