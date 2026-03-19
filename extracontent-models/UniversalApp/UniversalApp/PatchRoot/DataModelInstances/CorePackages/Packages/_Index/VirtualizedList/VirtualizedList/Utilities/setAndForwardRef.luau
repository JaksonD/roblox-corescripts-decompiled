local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.React);
return function(v2) --[[ Line: 57 ]] --[[ Name: setAndForwardRef ]]
    local l_getForwardedRef_0 = v2.getForwardedRef;
    local l_setLocalRef_0 = v2.setLocalRef;
    return function(v5) --[[ Line: 59 ]]
        -- upvalues: l_getForwardedRef_0 (copy), l_setLocalRef_0 (copy)
        local v6 = l_getForwardedRef_0();
        l_setLocalRef_0(v5);
        if typeof(v6) == "function" then
            v6(v5);
            return;
        else
            if typeof(v6) == "table" then
                v6.current = v5;
            end;
            return;
        end;
    end;
end;