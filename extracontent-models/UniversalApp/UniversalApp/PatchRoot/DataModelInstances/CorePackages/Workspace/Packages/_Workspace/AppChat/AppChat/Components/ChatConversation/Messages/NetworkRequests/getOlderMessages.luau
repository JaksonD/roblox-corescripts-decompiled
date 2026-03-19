local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppChatNetworking);
return function(v2, _, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v5) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v2 (copy), v4 (copy)
        return v5:dispatch(v1.rodux.GetOlderMessages.API(v2, v4)):catch(function(v6) --[[ Line: 7 ]]
            warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(v6));
        end);
    end;
end;