local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Analytics);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.Actions.SetItemBeingPurchased);
local v7 = require(l_Parent_0.Thunks.SendCounter);
local v8 = {
    v4
};
return function(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 18 ]] --[[ Name: PromptPurchase ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v6 (copy), v5 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), v7 (copy)
    return v3.new(script.Name, v8, function(v16, v17) --[[ Line: 27 ]]
        -- upvalues: v4 (ref), v6 (ref), v9 (copy), v10 (copy), v12 (copy), v5 (ref), l_MarketplaceService_0 (ref), l_Players_0 (ref), v11 (copy), v13 (copy), v14 (copy), v7 (ref), v15 (copy)
        local v18 = v17[v4];
        v16:dispatch(v6(v9, v10));
        local v19 = false;
        if v12 ~= nil then
            v19 = v10 ~= v5.ItemType.Bundle;
        end;
        if v19 then
            l_MarketplaceService_0:PromptCollectiblesPurchase(l_Players_0.LocalPlayer, v9, v11, v13, v12, v14);
            v16:dispatch(v7(v5.Counters.PromptLimitedCollectiblesPurchase));
        elseif v10 == v5.ItemType.Bundle then
            l_MarketplaceService_0:PromptBundlePurchase(l_Players_0.LocalPlayer, v9);
            v16:dispatch(v7(v5.Counters.PromptBundlePurchase));
        elseif v10 == v5.ItemType.Asset then
            local v20 = not v15;
            if v11 ~= nil and v20 then
                l_MarketplaceService_0:PromptPurchase(l_Players_0.LocalPlayer, v9, false);
                v16:dispatch(v7(v5.Counters.PromptUnlimitedCollectiblePurchase));
            else
                l_MarketplaceService_0:PromptRobloxPurchase(v9, false);
                v16:dispatch(v7(v5.Counters.PromptRobloxPurchase));
            end;
        else
            v16:dispatch(v7(v5.Counters.PromptPurchaseUnknownItemType));
        end;
        v18.reportPurchaseAttempt(v10, v9);
    end);
end;