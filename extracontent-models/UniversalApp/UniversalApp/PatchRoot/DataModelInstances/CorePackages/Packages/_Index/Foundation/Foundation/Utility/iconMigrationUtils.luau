local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local l_uiblox_0 = require(l_Parent_1.BuilderIcons).Migration.uiblox;
local v4 = require(l_Parent_0.isBuilderIcon);
return {
    isMigrated = function(v5) --[[ Line: 10 ]] --[[ Name: isMigrated ]]
        -- upvalues: l_uiblox_0 (copy)
        return l_uiblox_0[v5] ~= nil;
    end, 
    isBuilderOrMigratedIcon = function(v6) --[[ Line: 13 ]] --[[ Name: isBuilderOrMigratedIcon ]]
        -- upvalues: v4 (copy), l_uiblox_0 (copy)
        return v4(v6) or l_uiblox_0[v6] ~= nil;
    end
};