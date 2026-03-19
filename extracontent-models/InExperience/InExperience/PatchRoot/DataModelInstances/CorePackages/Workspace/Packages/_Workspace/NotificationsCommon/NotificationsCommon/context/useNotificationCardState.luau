local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.NotificationCardContext);
local _ = require(l_Parent_1.type);
return function(v6) --[[ Line: 8 ]] --[[ Name: useNotificationCardState ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v7 = v3.useContext(v4);
    if v6 then
        return v7.state and v7.state.visualItems and v7.state.visualItems[v6] or {};
    else
        return v7.state;
    end;
end;