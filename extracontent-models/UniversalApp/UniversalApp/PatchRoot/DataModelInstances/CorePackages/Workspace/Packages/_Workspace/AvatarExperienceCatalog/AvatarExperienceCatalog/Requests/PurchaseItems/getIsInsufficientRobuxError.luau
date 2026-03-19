local l_HttpService_0 = game:GetService("HttpService");
local _ = require(script.Parent.PurchaseItemsTypes);
return function(v2) --[[ Line: 8 ]] --[[ Name: getIsInsufficientRobuxError ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
        -- upvalues: l_HttpService_0 (ref), v2 (copy)
        local v3 = l_HttpService_0:JSONDecode(v2.Body).message or "";
        return string.find(v3, "InsufficientTotalBalance") ~= nil;
    end);
    if not l_status_0 then
        return false;
    else
        return l_result_0;
    end;
end;