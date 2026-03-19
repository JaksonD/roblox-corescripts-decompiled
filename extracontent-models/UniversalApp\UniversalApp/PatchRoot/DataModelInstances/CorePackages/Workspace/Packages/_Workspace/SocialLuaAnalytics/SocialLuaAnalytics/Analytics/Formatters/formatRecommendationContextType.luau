local l_Parent_0 = script.Parent.Parent.Parent;
local l_RecommendationContextTypes_0 = require(l_Parent_0.Analytics.Enums).RecommendationContextTypes;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_RecommendationContextTypes_0 (copy)
    if v2 == nil then
        return nil;
    else
        return l_RecommendationContextTypes_0[v2.rawValue()].rawValue();
    end;
end;