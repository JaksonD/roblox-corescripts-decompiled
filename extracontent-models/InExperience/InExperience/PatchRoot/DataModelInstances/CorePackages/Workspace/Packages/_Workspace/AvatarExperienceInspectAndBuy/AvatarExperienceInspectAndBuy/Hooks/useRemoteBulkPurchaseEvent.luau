local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Types);
local l_FIntBulkPurchaseRequestLimit_0 = require(l_Parent_0.SharedFlags).FIntBulkPurchaseRequestLimit;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Utils.bulkPurchaseUtils);
local v8 = require(l_Parent_0.tutils);
local l_ItemTypeEnum_0 = require(l_Parent_0.AXCommon).Enums.ItemTypeEnum;
local l_FFlagAXFixBulkPurchaseFreeItems_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXFixBulkPurchaseFreeItems;
local function v12(v11) --[[ Line: 36 ]]
    return {
        assets = v11.assets, 
        bundles = v11.bundles
    };
end;
return function(v13, v14) --[[ Line: 43 ]]
    -- upvalues: l_useSelector_0 (copy), v12 (copy), v8 (copy), v3 (copy), v7 (copy), l_RobloxReplicatedStorage_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixBulkPurchaseFreeItems_0 (copy), l_FIntBulkPurchaseRequestLimit_0 (copy)
    local v15 = l_useSelector_0(v12, v8.deepEqual);
    local v16 = v3.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v7 (ref), v13 (copy), v15 (copy)
        return v7.getBulkPurchaseEligibleItems(v13, v15);
    end, {
        v13, 
        v15
    });
    return v3.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref), v16 (copy), l_ItemTypeEnum_0 (ref), v14 (copy)
        coroutine.wrap(function() --[[ Line: 52 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v16 (ref), l_ItemTypeEnum_0 (ref), v14 (ref)
            l_RobloxReplicatedStorage_0:WaitForChild("ServerSideBulkPurchaseEvent", 1e999):FireServer(v16.requestedItems);
            for _, v18 in v16.requestedItems do
                local v19 = if v18.itemType == Enum.AvatarItemType.Asset.Value then l_ItemTypeEnum_0.Asset else l_ItemTypeEnum_0.Bundle;
                local v20 = tostring(v18.id);
                v14.reportPurchaseAttempt(v19, v20);
            end;
        end)();
    end, {
        v16
    }), v3.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: l_FFlagAXFixBulkPurchaseFreeItems_0 (ref), v16 (copy), l_FIntBulkPurchaseRequestLimit_0 (ref)
        local _ = false;
        if l_FFlagAXFixBulkPurchaseFreeItems_0 then
            if v16.requestedItems then
                local v22 = false;
                if #v16.requestedItems <= l_FIntBulkPurchaseRequestLimit_0 then
                    v22 = #v16.requestedItems > 0;
                end;
                return v22;
            else
                return false;
            end;
        elseif v16.requestedItems then
            return #v16.requestedItems <= l_FIntBulkPurchaseRequestLimit_0;
        else
            return false;
        end;
    end, {
        v16
    }), v16.totalPrice or 0;
end;