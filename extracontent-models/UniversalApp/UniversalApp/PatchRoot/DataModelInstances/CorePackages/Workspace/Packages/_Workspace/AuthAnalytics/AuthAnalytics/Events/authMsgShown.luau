local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.checkAndSendEvent);
return function(v2, v3, v4, v5) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v6 = {};
    if v3 then
        v6.state = v3;
    end;
    if v4 then
        v6.field = v4;
    end;
    if v5 then
        v6.errorCode = v5;
    end;
    v1(v2, "authMsgShown", v6);
end;