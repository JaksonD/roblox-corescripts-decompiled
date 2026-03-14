local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetCurrentPage);
local v2 = require(l_Parent_0.Components.Pages);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v3:getState();
    v3:dispatch(v1(v2.pagesByKey[v4.menuPage].parentPage));
end;