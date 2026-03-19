local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetAvatarPreviewDetails);
local v5 = require(l_Parent_0.Actions.UpdateBulkPuchaseResults);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local l_ItemTypeEnum_0 = v6.Enums.ItemTypeEnum;
local v9 = require(l_Parent_0.Flags.FFlagAXEnableFetchAvatarPreview);
local l_FFlagAXEnableInspectAndBuyBulkPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase;
return v2.createReducer({}, {
    [v5.name] = l_FFlagAXEnableInspectAndBuyBulkPurchase_0 and function(v11, v12) --[[ Line: 31 ]]
        -- upvalues: v1 (copy)
        local l_RobuxSpent_0 = v12.result.RobuxSpent;
        local v14 = v11.totalPrice - l_RobuxSpent_0;
        return v1.Dictionary.join(v11, {
            totalPrice = v14
        });
    end or nil, 
    [v4.name] = v9 and function(v15, v16) --[[ Line: 41 ]]
        -- upvalues: v1 (copy), l_ItemTypeEnum_0 (copy)
        local v17 = {};
        local v18 = nil;
        local v19 = nil;
        if v16.avatarPreviewDetails and v16.avatarPreviewDetails.look then
            local l_look_0 = v16.avatarPreviewDetails.look;
            v18 = l_look_0.totalPrice;
            v19 = l_look_0.totalValue;
            if l_look_0.items then
                v17 = v1.List.map(l_look_0.items, function(v21) --[[ Line: 53 ]]
                    -- upvalues: l_ItemTypeEnum_0 (ref)
                    return {
                        id = tostring(v21.id), 
                        itemType = if v21.itemType == l_ItemTypeEnum_0.Asset then l_ItemTypeEnum_0.Asset else l_ItemTypeEnum_0.Bundle, 
                        noPriceStatus = v21.noPriceStatus, 
                        quantityOwned = v21.quantityOwned
                    };
                end);
            end;
        end;
        return v1.Dictionary.join(v15, {
            totalPrice = v18, 
            totalValue = v19, 
            items = v17
        });
    end or nil
});