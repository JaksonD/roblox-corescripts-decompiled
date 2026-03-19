local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.RoduxAliasesTypes);
return function(v2) --[[ Line: 6 ]]
    return {
        getAliasByUserId = require(script.getAliasByUserId)(v2)
    };
end;