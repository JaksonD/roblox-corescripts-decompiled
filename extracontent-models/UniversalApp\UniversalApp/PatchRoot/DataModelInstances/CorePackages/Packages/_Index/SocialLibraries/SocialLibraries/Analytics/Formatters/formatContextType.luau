local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextTypes_0 = require(l_Parent_0.Analytics.Enums).ContextTypes;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_ContextTypes_0 (copy)
    if v2 == nil then
        return nil;
    else
        return l_ContextTypes_0[v2.rawValue()].rawValue();
    end;
end;