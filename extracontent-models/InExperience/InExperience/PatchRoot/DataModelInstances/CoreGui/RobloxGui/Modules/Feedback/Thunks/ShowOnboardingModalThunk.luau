local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.ShowOnboardingModal);
return function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v2 (copy)
        v3:dispatch(v1(v2));
    end;
end;