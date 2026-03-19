local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.Analytics);
return function(v5) --[[ Line: 16 ]] --[[ Name: useUserSearchAnalytics ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v6 = v5 and v5.userSearchSessionId or l_HttpService_0:GenerateGUID(false);
    return (v2.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v4 (ref), v3 (ref), v5 (copy), v6 (copy)
        return v4({
            infoForAllEvents = v3.Dictionary.join(v5 or {}, {
                userSearchSessionId = v6
            })
        });
    end, {
        v5, 
        v6
    }));
end;