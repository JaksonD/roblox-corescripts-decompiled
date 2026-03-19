local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v5 = require(script.Parent.processConversations);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v6 (copy), v4 (ref), v3 (ref), v7 (copy), v5 (ref)
        if v2.GetUserConversations.getStatus(v8:getState(), v6) == v4.Enum.NetworkStatus.Fetching then
            return v3.resolve();
        else
            return v8:dispatch(v2.GetUserConversations.API(v6, v7)):andThen(function(v9) --[[ Line: 20 ]]
                -- upvalues: v8 (copy), v5 (ref)
                local l_responseBody_0 = v9.responseBody;
                v8:dispatch(v5(l_responseBody_0));
            end):catch(function(v11) --[[ Line: 25 ]]
                warn("NetworkingChat failure in DEPRECATED_getLocalUserConversations, Status: " .. tostring(v11));
            end);
        end;
    end;
end;