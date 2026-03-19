local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Context.AXCatalogStoreContext);
local v4 = require(l_script_FirstAncestor_0.Stores);
return function() --[[ Line: 10 ]] --[[ Name: useAXCatalogStoreContext ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v5 = v2.useContext(v3);
    if not v5 then
        warn("useAXCatalogStoreContext must be used within an AXCatalogStoreContext provider");
        return v4();
    else
        return v5;
    end;
end;