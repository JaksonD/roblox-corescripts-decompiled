local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
return function() --[[ Line: 15 ]]
    -- upvalues: l_createSignal_0 (copy)
    local v2, v3 = l_createSignal_0(false);
    return {
        getChatInputBarFocused = v2, 
        focusChatInputBar = function() --[[ Line: 18 ]] --[[ Name: focusChatInputBar ]]
            -- upvalues: v3 (copy)
            v3(true);
        end, 
        unfocusChatInputBar = function() --[[ Line: 21 ]] --[[ Name: unfocusChatInputBar ]]
            -- upvalues: v3 (copy)
            v3(false);
        end
    };
end;