local v0 = {};
local l_Observable_0 = require(script.Parent.Parent.Parent.utilities).Observable;
v0.fromError = function(v2) --[[ Line: 17 ]] --[[ Name: fromError ]]
    -- upvalues: l_Observable_0 (copy)
    return l_Observable_0.new(function(v3) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        v3:error(v2);
    end);
end;
return v0;