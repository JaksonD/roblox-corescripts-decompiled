local l_CoreGui_0 = game:GetService("CoreGui");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Promise);
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v3 (copy), l_MarketplaceService_0 (copy)
    local v6 = v5 or "";
    return v3.new(function(v7, v8) --[[ Line: 8 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v4 (copy), v6 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v4 (ref), v6 (ref)
            l_MarketplaceService_0:PerformSubscriptionPurchaseV2(v4, v6);
        end);
        if l_status_0 then
            v7(l_result_0);
            return;
        else
            v8(l_result_0);
            return;
        end;
    end);
end;