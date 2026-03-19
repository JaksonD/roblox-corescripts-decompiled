local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.ClientScriptsUpdateSearchFilter);
local v2 = require(script.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter);
return function(v3, v4) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), v0 (copy), v2 (copy)
    local v5 = v3 or {
        clientSearchTerm = "", 
        clientTypeFilters = {}, 
        serverSearchTerm = "", 
        serverTypeFilters = {}
    };
    if v4.type == v1.name then
        local v6 = {
            clientSearchTerm = v4.searchTerm, 
            clientTypeFilters = v0.JoinDictionaries(v5.clientTypeFilters, v4.filterTypes)
        };
        return (v0.JoinDictionaries(v5, v6));
    elseif v4.type == v2.name then
        local v7 = {
            serverSearchTerm = v4.searchTerm, 
            serverTypeFilters = v0.JoinDictionaries(v5.serverTypeFilters, v4.filterTypes)
        };
        return (v0.JoinDictionaries(v5, v7));
    else
        return v5;
    end;
end;