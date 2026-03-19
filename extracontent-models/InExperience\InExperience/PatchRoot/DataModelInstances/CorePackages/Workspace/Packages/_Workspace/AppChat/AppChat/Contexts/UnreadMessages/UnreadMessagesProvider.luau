local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.UnreadMessagesDispatchContext);
return function(v3) --[[ Line: 11 ]] --[[ Name: UnreadMessagesProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Provider, {
        value = v3.dispatch
    }, v3.children);
end;