local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.UnreadMessagesDispatchContext);
return function() --[[ Line: 7 ]] --[[ Name: useUnreadMessagesDispatch ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2);
end;