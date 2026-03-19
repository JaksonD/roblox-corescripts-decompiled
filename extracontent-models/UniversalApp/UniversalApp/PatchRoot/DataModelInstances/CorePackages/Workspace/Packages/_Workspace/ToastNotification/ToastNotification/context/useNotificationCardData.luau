local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.NotificationCardContext);
return function() --[[ Line: 7 ]] --[[ Name: useNotificationCardData ]]
    -- upvalues: v2 (copy), v3 (copy)
    return (v2.useContext(v3));
end;