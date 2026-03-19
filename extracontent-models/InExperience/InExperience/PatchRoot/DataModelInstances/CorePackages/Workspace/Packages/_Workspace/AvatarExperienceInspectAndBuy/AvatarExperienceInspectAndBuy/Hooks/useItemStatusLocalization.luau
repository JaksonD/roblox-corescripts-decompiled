local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AXCommon);
local _ = require(l_script_FirstAncestor_0.Types);
local l_ItemTypeEnum_0 = v3.Enums.ItemTypeEnum;
local v6 = require(l_script_FirstAncestor_0.Constants);
local l_AssetLocalizationKeys_0 = v6.AssetLocalizationKeys;
local l_BundleLocalizationKeys_0 = v6.BundleLocalizationKeys;
local l_PriceStatusLocalizationKeys_0 = v6.PriceStatusLocalizationKeys;
local l_ItemDetailsLocalizationKeys_0 = v6.ItemDetailsLocalizationKeys;
local v11 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v13) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), l_ItemTypeEnum_0 (copy), l_BundleLocalizationKeys_0 (copy), l_AssetLocalizationKeys_0 (copy), v11 (copy), l_PriceStatusLocalizationKeys_0 (copy), l_ItemDetailsLocalizationKeys_0 (copy), l_useLocalization_0 (copy)
    local v14 = v2.useMemo(function() --[[ Line: 18 ]]
        -- upvalues: v13 (copy), l_ItemTypeEnum_0 (ref), l_BundleLocalizationKeys_0 (ref), l_AssetLocalizationKeys_0 (ref)
        if v13 and v13.itemType == l_ItemTypeEnum_0.Bundle then
            return l_BundleLocalizationKeys_0;
        else
            return l_AssetLocalizationKeys_0;
        end;
    end, {
        v13
    });
    local v15 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v11 (ref), v14 (copy), l_PriceStatusLocalizationKeys_0 (ref), l_ItemDetailsLocalizationKeys_0 (ref), v13 (copy)
        return v11.Dictionary.join(v14, l_PriceStatusLocalizationKeys_0, l_ItemDetailsLocalizationKeys_0, {
            ownedItems = {
                l_ItemDetailsLocalizationKeys_0.ownedItems; 
                QUANTITY = if v13 and v13.collectibleItemDetails then v13.collectibleItemDetails.resellableCount else 0
            }
        });
    end, {
        v14, 
        v13
    });
    return (l_useLocalization_0(v15));
end;