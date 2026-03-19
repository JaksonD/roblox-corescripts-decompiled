local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local l_Migration_0 = require(l_Parent_0.BuilderIcons).Migration;
return function(v2) --[[ Line: 7 ]] --[[ Name: migrateIconName ]]
    -- upvalues: l_Migration_0 (copy)
    return l_Migration_0.uiblox[v2];
end;