local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 24 ]] --[[ Name: createReplyingToStore ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal(nil);
    return {
        getMessageId = v2, 
        setReplyingTo = function(v4) --[[ Line: 27 ]] --[[ Name: setReplyingTo ]]
            -- upvalues: v3 (copy)
            v3(v4);
        end, 
        clear = function() --[[ Line: 31 ]] --[[ Name: clear ]]
            -- upvalues: v3 (copy)
            v3(nil);
        end
    };
end;