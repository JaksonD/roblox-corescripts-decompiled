local l_Parent_0 = script.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v2 = require(l_Parent_0.Enums.ItemType);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v4 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "https?://m.", "https?://www.");
local v5 = v4 .. "thumbs/asset.ashx?assetid=";
local v6 = v4 .. "outfit-thumbnail/image?userOutfitId=%s&width=100&height=100&format=png";
return function(v7, v8) --[[ Line: 15 ]] --[[ Name: getPreviewImageUrl ]]
    -- upvalues: v2 (copy), v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v5 (copy)
    local v9 = nil;
    if v7.itemType == v2.Bundle then
        if v7.costumeId then
            return string.format(v6, v7.costumeId);
        else
            v9 = v7.items[1].id;
        end;
    elseif v7.AssetId ~= nil and v7.AssetId ~= 0 then
        v9 = v7.AssetId;
    elseif v7.IconImageAssetId ~= nil then
        v9 = v7.IconImageAssetId;
    elseif l_FFlagEnableUnifiedProductPurchaseFlow_0 and v7.ImageUrl ~= nil then
        return v7.ImageUrl;
    elseif v8 == Enum.Platform.XBoxOne then
        return "rbxasset://textures/ui/Shell/Icons/ROBUXIcon@1080.png";
    end;
    return v5 .. tostring(v9) .. "&x=100&y=100&format=png";
end;