local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Signals);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: onDisposed ]]
    v2(function(_, v5) --[[ Line: 8 ]] --[[ Name: source ]]
        -- upvalues: v3 (copy)
        if v5 then
            v3();
        end;
        return 0;
    end);
end;