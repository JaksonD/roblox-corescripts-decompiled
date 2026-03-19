local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
local v1 = require(l_Parent_0.Promise);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
return function(_, v4) --[[ Line: 6 ]] --[[ Name: getUserSubscriptionDetails ]]
    -- upvalues: v1 (copy), l_MarketplaceService_0 (copy)
    return v1.new(function(v5, v6) --[[ Line: 7 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v4 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v4 (ref)
            return l_MarketplaceService_0:GetUserSubscriptionDetailsInternalAsync(v4);
        end);
        if l_status_0 then
            v5(l_result_0);
            return;
        else
            v6(l_result_0);
            return;
        end;
    end);
end;