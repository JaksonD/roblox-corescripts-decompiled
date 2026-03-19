local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.PriceFooter);
local v4 = require(l_Parent_0.UserLib);
local l_Constants_0 = v4.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v4.Utils.getRbxthumbWithTypeSizeAndOptions;
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixResaleLimitedPrice);
local l_ItemTile_0 = v7.Tile.ItemTile;
return function(v12) --[[ Line: 36 ]] --[[ Name: AssetTile ]]
    -- upvalues: l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (copy), v8 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v2 (copy), l_ItemTile_0 (copy), v3 (copy), v10 (copy)
    local v13 = if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 and v12.itemType and v12.itemType == v8.ItemTypes.Bundle then l_Constants_0.RbxthumbTypes.BundleThumbnail else l_Constants_0.RbxthumbTypes.Asset;
    local v14 = l_getRbxthumbWithTypeSizeAndOptions_0(v12.assetId, v13, 150);
    return v2.createElement(l_ItemTile_0, {
        name = v12.name, 
        thumbnail = v14, 
        onActivated = v12.onActivated, 
        useMaxTitleHeight = false, 
        titleTextLineCount = 1, 
        footer = v2.createElement(v3, {
            price = v12.price, 
            isOffSale = v12.isOffSale, 
            lowestResalePrice = if v10 then v12.lowestResalePrice else nil
        }), 
        Selectable = true
    });
end;