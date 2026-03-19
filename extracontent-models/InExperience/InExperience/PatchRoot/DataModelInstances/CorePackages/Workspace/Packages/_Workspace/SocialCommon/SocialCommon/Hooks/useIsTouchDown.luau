local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.ReactUtils);
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.React);
local l_useEventConnection_0 = v2.useEventConnection;
local v6 = require(l_Parent_0.Utils.InputUtilities);
return function() --[[ Line: 13 ]]
    -- upvalues: v4 (copy), v6 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v7, v8 = v4.useState(false);
    local v10 = v4.useCallback(function(v9) --[[ Line: 16 ]]
        -- upvalues: v6 (ref), v8 (copy)
        if v6.isTouchInput(v9) then
            v8(true);
        end;
    end, {
        v8
    });
    local v12 = v4.useCallback(function(v11) --[[ Line: 22 ]]
        -- upvalues: v6 (ref), v8 (copy)
        if v6.isTouchInput(v11) then
            v8(false);
        end;
    end, {
        v8
    });
    l_useEventConnection_0(l_UserInputService_0.InputBegan, v10);
    l_useEventConnection_0(l_UserInputService_0.InputEnded, v12);
    return v7;
end;