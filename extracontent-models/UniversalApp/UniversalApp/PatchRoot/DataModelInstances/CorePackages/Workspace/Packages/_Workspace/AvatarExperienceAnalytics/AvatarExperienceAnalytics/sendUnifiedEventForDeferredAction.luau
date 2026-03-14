local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require(script.Parent.UnifiedEventLogConstants);
local v3 = require(script.Parent.sendUnifiedEventLog);
local v4 = require(script.Parent.sendUnifiedEventLogForInstance);
local l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 = require(l_Parent_0.SharedFlags).FFlagAXAvatarSortInDiscoveryUnifiedPurchase;
return function(v6) --[[ Line: 12 ]]
    -- upvalues: l_CollectionService_0 (copy), v2 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v4 (copy), v3 (copy)
    local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v2.LAST_ACTIVATED_TAG_NAME);
    if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then
        if #l_l_CollectionService_0_Tagged_0 > 0 then
            for _, v9 in l_l_CollectionService_0_Tagged_0 do
                v4(v9, v6, {
                    includeScreenSize = true, 
                    includeElementSizeAndPosition = true
                });
            end;
            return;
        else
            v3(v6);
            return;
        end;
    else
        for _, v11 in l_l_CollectionService_0_Tagged_0 do
            v4(v11, v6, {
                includeScreenSize = true, 
                includeElementSizeAndPosition = true
            });
        end;
        return;
    end;
end;