local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(script.Parent.Parent.Immutable);
return function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createReducer({
        clientSearchTerm = "", 
        clientTypeFilters = {}, 
        serverSearchTerm = "", 
        serverTypeFilters = {}
    }, {
        ClientLogAppendMessage = function(v5, v6) --[[ Line: 13 ]] --[[ Name: ClientLogAppendMessage ]]
            -- upvalues: v2 (ref)
            return v2.JoinDictionaries(v5, {
                clientData = v2.Append(v5.clientData, v6.newMessage)
            });
        end, 
        ServerLogAppendMessage = function(v7, v8) --[[ Line: 19 ]] --[[ Name: ServerLogAppendMessage ]]
            -- upvalues: v2 (ref)
            return v2.JoinDictionaries(v7, {
                serverData = v2.Append(v7.serverData, v8.newMessage)
            });
        end, 
        ClientLogAppendFilteredMessage = function(v9, v10) --[[ Line: 25 ]] --[[ Name: ClientLogAppendFilteredMessage ]]
            -- upvalues: v2 (ref)
            local v11 = {
                clientData = v2.Append(v9.clientData, v10.newMessage), 
                clientDataFiltered = v2.Append(v9.clientDataFiltered, v10.newMessage)
            };
            return v2.JoinDictionaries(v9, v11);
        end, 
        ServerLogAppendFilteredMessage = function(v12, v13) --[[ Line: 32 ]] --[[ Name: ServerLogAppendFilteredMessage ]]
            -- upvalues: v2 (ref)
            local v14 = {
                serverData = v2.Append(v12.serverData, v13.newMessage), 
                serverDataFiltered = v2.Append(v12.serverDataFiltered, v13.newMessage)
            };
            return v2.JoinDictionaries(v12, v14);
        end, 
        ClientLogSetData = function(v15, v16) --[[ Line: 39 ]] --[[ Name: ClientLogSetData ]]
            -- upvalues: v2 (ref)
            local v17 = {
                clientData = v16.newData, 
                clientDataFiltered = v16.newDataFiltered
            };
            return v2.JoinDictionaries(v15, v17);
        end, 
        ServerLogSetData = function(v18, v19) --[[ Line: 46 ]] --[[ Name: ServerLogSetData ]]
            -- upvalues: v2 (ref)
            local v20 = {
                serverData = v19.newData, 
                serverDataFiltered = v19.newDataFiltered
            };
            return v2.JoinDictionaries(v18, v20);
        end, 
        ClientLogUpdateSearchFilter = function(v21, v22) --[[ Line: 53 ]] --[[ Name: ClientLogUpdateSearchFilter ]]
            -- upvalues: v2 (ref)
            local v23 = {
                clientSearchTerm = v22.searchTerm, 
                clientTypeFilters = v2.JoinDictionaries(v21.clientTypeFilters, v22.filterTypes)
            };
            return v2.JoinDictionaries(v21, v23);
        end, 
        ServerLogUpdateSearchFilter = function(v24, v25) --[[ Line: 60 ]] --[[ Name: ServerLogUpdateSearchFilter ]]
            -- upvalues: v2 (ref)
            local v26 = {
                serverSearchTerm = v25.searchTerm, 
                serverTypeFilters = v2.JoinDictionaries(v24.serverTypeFilters, v25.filterTypes)
            };
            return v2.JoinDictionaries(v24, v26);
        end
    })(v3, v4);
end;