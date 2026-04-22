local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.UnifiedEventLogConstants);
local v5 = require(l_script_FirstAncestor_0.Utils.UnifiedEventLoggingUtils);
local v6 = require(script.Parent.sendUnifiedEventLog);
local v7 = require(script.Parent.sendUnifiedEventLogForInstance);
local v8 = require(l_Parent_0.AvatarExperienceFlags);
local v9 = require(script.Parent.Store.UnifiedSelectionListStore);
local l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 = require(l_Parent_0.SharedFlags).FFlagAXAvatarSortInDiscoveryUnifiedPurchase;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v8.FFlagAXMISEnableMultiShoppingUnifiedEvents;
return function(v12) --[[ Line: 18 ]]
    -- upvalues: l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_CollectionService_0 (copy), v4 (copy), v6 (copy), v9 (copy), v5 (copy), v3 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v7 (copy)
    if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
        if #l_CollectionService_0:GetTagged(v4.LAST_ACTIVATED_TAG_NAME) == 0 then
            v6(v12);
            return;
        else
            local v13 = v9.getSelectionList();
            local v14 = v4.ATTRIBUTE_PREFIX .. "itemId";
            local v15 = v4.ATTRIBUTE_PREFIX .. "itemType";
            local v16 = nil;
            for _, v18 in v13 do
                if v18[v14] == v12.itemId and tostring(v18[v15]) == tostring(v12.itemType) then
                    v16 = v18;
                    break;
                end;
            end;
            local v19 = v5.getFieldsToSendFromInstanceAttributes(v16);
            local v20 = v3.Dictionary.join(v19, v12);
            v6(v20);
            return;
        end;
    else
        local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v4.LAST_ACTIVATED_TAG_NAME);
        if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then
            if #l_l_CollectionService_0_Tagged_0 > 0 then
                for _, v23 in l_l_CollectionService_0_Tagged_0 do
                    v7(v23, v12, {
                        includeScreenSize = true, 
                        includeElementSizeAndPosition = true
                    });
                end;
                return;
            else
                v6(v12);
                return;
            end;
        else
            for _, v25 in l_l_CollectionService_0_Tagged_0 do
                v7(v25, v12, {
                    includeScreenSize = true, 
                    includeElementSizeAndPosition = true
                });
            end;
            return;
        end;
    end;
end;