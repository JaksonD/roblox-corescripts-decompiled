local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProof");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Networking.NetworkingSocialProof);
return v2.createReducer({}, {
    [v4.GetConnectionsByEntityId.Succeeded.name] = function(v5, v6) --[[ Line: 20 ]]
        -- upvalues: v3 (copy)
        local v7 = {};
        local l_connections_0 = v6.responseBody.connections;
        local l_totalCount_0 = v6.responseBody.totalCount;
        local l_entityId_0 = v6.postBody.entityId;
        local l_entityType_0 = v6.postBody.entityType;
        local l_connectionType_0 = v6.postBody.connectionType;
        if not v7[l_connectionType_0] then
            v7[l_connectionType_0] = {};
        end;
        if not v7[l_connectionType_0][l_entityType_0] then
            v7[l_connectionType_0][l_entityType_0] = {};
        end;
        local v13 = {};
        if l_connections_0 then
            v13 = v3.List.map(l_connections_0, function(v14) --[[ Line: 38 ]]
                return (tostring(v14.id));
            end);
        end;
        v7[l_connectionType_0][l_entityType_0][l_entityId_0] = {
            totalConnections = l_totalCount_0, 
            userIds = v13
        };
        return v3.Dictionary.union(v5, v7);
    end
});