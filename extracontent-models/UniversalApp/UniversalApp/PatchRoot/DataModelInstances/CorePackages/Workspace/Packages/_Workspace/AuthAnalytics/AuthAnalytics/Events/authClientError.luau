local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.checkAndSendEvent);
local v2 = game:DefineFastFlag("ClientErrorAdditionalArgs", false);
return function(v3, v4, v5, v6) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v7 = {};
    if v4 then
        v7.state = v4;
    end;
    if v2 and v5 then
        v7.url = v5;
    end;
    if v2 and v6 then
        v7.origin = v6;
    end;
    v1(v3, "authClientError", v7);
end;