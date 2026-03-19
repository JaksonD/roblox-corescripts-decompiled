local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.checkAndSendEvent);
local v2 = game:DefineFastFlag("FixAuthFormInteractionEnteredParamType", false);
return function(v3, v4, v5, v6, v7) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v8 = {};
    if v4 then
        v8.field = v4;
    end;
    if v5 then
        v8.state = v5;
    end;
    if v6 then
        v8.origin = v6;
    end;
    if v7 ~= nil then
        if v2 then
            v8.entered = tostring(v7);
        else
            v8.entered = v7;
        end;
    end;
    v1(v3, "authFormInteraction", v8);
end;