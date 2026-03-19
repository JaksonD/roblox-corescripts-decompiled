local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.CapturesActivated);
local v2 = require(l_Parent_0.Actions.CapturesDeactivated);
local v3 = require(l_Parent_0.Enums.CapturesToastType);
local v4 = require(l_Parent_0.Actions.ToastDismissed);
local v5 = require(l_Parent_0.Actions.ToastTriggered);
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v5 (copy), v3 (copy), v2 (copy), v4 (copy)
    if (not v7 or v7 == 1) and not v6 then
        v8(v10);
        v9(v1());
        v9(v5(v3.CapturesActivated));
        return;
    else
        if v6 then
            v8(v11);
            v9(v2());
            v9(v4());
        end;
        return;
    end;
end;