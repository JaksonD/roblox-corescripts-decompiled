local v0 = require(script.Parent.SetUserTyping);
local v1 = 0;
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: v1 (ref), v0 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v0 (ref), v2 (copy), v3 (copy)
        spawn(function() --[[ Line: 9 ]]
            -- upvalues: v1 (ref), v4 (copy), v0 (ref), v2 (ref), v3 (ref)
            v1 = v1 + 1;
            local l_v1_0 = v1;
            v4:dispatch(v0(v2, v3, true));
            wait(8);
            if v1 == l_v1_0 then
                v4:dispatch(v0(v2, v3, false));
            end;
        end);
    end;
end;