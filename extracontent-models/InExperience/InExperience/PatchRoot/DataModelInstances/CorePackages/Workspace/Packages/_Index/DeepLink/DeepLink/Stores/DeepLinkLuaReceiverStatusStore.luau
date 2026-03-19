local l_script_FirstAncestor_0 = script:FindFirstAncestor("DeepLink");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.DeepLinkLuaPostAuthReceiverStatus);
return v2.createComputed(function() --[[ Line: 7 ]] --[[ Name: createDeepLinkConnectionStore ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4, v5 = v2.createSignal(nil);
    local v6, v7 = v2.createSignal(v3.Disconnected);
    return {
        setDeepLinkLuaPostAuthReceiverStatus = function(v8, v9) --[[ Line: 15 ]] --[[ Name: setDeepLinkLuaPostAuthReceiverStatus ]]
            -- upvalues: v3 (ref), v5 (copy), v7 (copy)
            if v8 == v3.Ready then
                if v9 then
                    v5(v9);
                end;
            else
                v5(nil);
            end;
            v7(v8);
        end, 
        getDeepLinkLuaPostAuthReceiverStatus = v6, 
        setLastDetectedPostAuthUrl = v5, 
        getLastDetectedPostAuthUrl = v4
    };
end);