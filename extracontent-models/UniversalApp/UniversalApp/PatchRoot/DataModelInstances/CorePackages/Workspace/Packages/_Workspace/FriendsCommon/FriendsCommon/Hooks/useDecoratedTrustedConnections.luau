local l_Parent_0 = script:FindFirstAncestor("FriendsCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.SignalsReact);
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local v5 = require(l_Parent_0.DataHydration);
local _ = require(l_Parent_0.GraphQLServer);
local v7 = if l_FFlagConnectionManagementChips_0 then v5.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v8) --[[ Line: 17 ]] --[[ Name: useDecoratedTrustedConnections ]]
    -- upvalues: l_FFlagConnectionManagementChips_0 (copy), v7 (copy), v3 (copy), v1 (copy), v2 (copy)
    if not l_FFlagConnectionManagementChips_0 then
        return;
    else
        local v9 = v7.getUserTrustedConnections();
        local v10 = v3.useSignalState(v9.data);
        local v14 = v1.useMemo(function() --[[ Line: 25 ]]
            -- upvalues: v8 (copy)
            if not v8 then
                return {};
            else
                local v11 = {};
                for _, v13 in v8 do
                    v11[v13.id] = true;
                end;
                return v11;
            end;
        end, {
            v8
        });
        local v18 = v1.useMemo(function() --[[ Line: 37 ]]
            -- upvalues: v10 (copy)
            if not v10 then
                return {};
            else
                local v15 = {};
                for _, v17 in v10 do
                    v15[v17.id] = true;
                end;
                return v15;
            end;
        end, {
            v10
        });
        return (v1.useMemo(function() --[[ Line: 49 ]]
            -- upvalues: v10 (copy), v2 (ref), v8 (copy), v18 (copy), v14 (copy)
            if not v10 then
                return {};
            else
                local v20 = v2.List.filter(v8 or {}, function(v19) --[[ Line: 54 ]]
                    -- upvalues: v18 (ref)
                    return v18[v19.id] == true;
                end);
                local v22 = v2.List.filter(v10, function(v21) --[[ Line: 58 ]]
                    -- upvalues: v14 (ref)
                    return v14[v21.id] ~= true;
                end);
                return v2.List.join(v20, v22);
            end;
        end, {
            v18, 
            v10, 
            v14
        }));
    end;
end;