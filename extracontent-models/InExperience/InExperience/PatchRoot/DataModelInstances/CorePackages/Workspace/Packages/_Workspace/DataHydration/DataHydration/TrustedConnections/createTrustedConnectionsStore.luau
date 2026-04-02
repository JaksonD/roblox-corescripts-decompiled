local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.createDataCache);
local v3 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_script_FirstAncestor_0.TrustedConnections.Requests);
local v8 = require(l_script_FirstAncestor_0.TrustedConnections.Enums.TrustedConnectionStatus);
local v9 = require(l_script_FirstAncestor_0.TrustedConnections.createTrustedConnectionEventListener);
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local v11 = game:DefineFastFlag("TCStoreEventReceiverEnabled_V2", false);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local v15 = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0);
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1);
local function _() --[[ Line: 52 ]]
    return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec");
end;
return function() --[[ Line: 56 ]] --[[ Name: createTrustedConnectionsStore ]]
    -- upvalues: v15 (copy), v2 (copy), l_FFlagConnectionManagementChips_0 (copy), v3 (copy), v7 (copy), v6 (copy), v11 (copy), v9 (copy), v8 (copy), l_getLocalPlayerUserId_0 (copy), v5 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy)
    local v17 = if v15 > 0 then v15 else 1e999;
    local v18 = v2(v17);
    local v19 = v2(v17);
    local v20 = if l_FFlagConnectionManagementChips_0 then v2(v17) else nil;
    local v25 = if l_FFlagConnectionManagementChips_0 then v3({
        cache = v20, 
        supportsMultiGet = false, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        replaceItems = true, 
        fetchFn = function(v21) --[[ Line: 72 ]] --[[ Name: fetchFn ]]
            -- upvalues: v7 (ref), v6 (ref)
            return v7.GetUserTrustedConnections(v21):andThen(function(v22) --[[ Line: 73 ]]
                -- upvalues: v6 (ref)
                local v23 = v22.PageItems or {};
                return v6.List.map(v23, function(v24) --[[ Line: 75 ]]
                    return {
                        id = tostring(v24.id)
                    };
                end);
            end);
        end
    }) else nil;
    local v26 = nil;
    if v11 then
        v26 = v9(function(v27, v28) --[[ Line: 88 ]]
            -- upvalues: v18 (copy), v19 (copy), v8 (ref), l_FFlagConnectionManagementChips_0 (ref), l_getLocalPlayerUserId_0 (ref), v25 (copy)
            v18.updateItems({
                [v27] = v28
            });
            v19.updateItems({
                [v27] = v28 == v8.TrustedFriends
            });
            if l_FFlagConnectionManagementChips_0 then
                local v29 = l_getLocalPlayerUserId_0();
                if v29 then
                    v25.fetchItem((tostring(v29)));
                end;
            end;
        end);
    elseif l_FFlagConnectionManagementChips_0 then
        v26 = v9(function(_, _) --[[ Line: 108 ]]
            -- upvalues: l_getLocalPlayerUserId_0 (ref), v25 (copy)
            local v32 = l_getLocalPlayerUserId_0();
            if v32 then
                v25.fetchItem((tostring(v32)));
            end;
        end);
    end;
    local v41 = v3({
        cache = v19, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        fetchFn = function(v33) --[[ Line: 120 ]] --[[ Name: fetchFn ]]
            -- upvalues: v6 (ref), v7 (ref)
            local v34 = v6.Dictionary.keys(v33);
            return v7.MultiGetUsersAreTrustedConnections(v34):andThen(function(v35) --[[ Line: 122 ]]
                -- upvalues: v6 (ref), v34 (copy)
                local v38 = v6.List.foldLeft(v35, function(v36, v37) --[[ Line: 123 ]]
                    v36[tostring(v37)] = true;
                    return v36;
                end, {});
                return v6.List.foldLeft(v34, function(v39, v40) --[[ Line: 128 ]]
                    -- upvalues: v38 (copy)
                    v39[tostring(v40)] = v38[v40] or false;
                    return v39;
                end, {});
            end);
        end
    });
    local v49 = v3({
        cache = v18, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        fetchFn = function(v42) --[[ Line: 139 ]] --[[ Name: fetchFn ]]
            -- upvalues: v6 (ref), v7 (ref), v5 (ref)
            local v43 = v6.Dictionary.keys(v42);
            local v47 = v6.List.foldLeft(v43, function(v44, v45) --[[ Line: 141 ]]
                -- upvalues: v7 (ref)
                table.insert(v44, v7.GetUserTrustedConnectionStatus(v45):andThen(function(v46) --[[ Line: 145 ]]
                    -- upvalues: v45 (copy)
                    return {
                        [v45] = v46
                    };
                end));
                return v44;
            end, {});
            return v5.all(v47):andThen(function(v48) --[[ Line: 152 ]]
                -- upvalues: v6 (ref)
                return v6.Dictionary.join(table.unpack(v48));
            end);
        end
    });
    local function v51(v50) --[[ Line: 158 ]] --[[ Name: getStatus ]]
        -- upvalues: v49 (copy)
        return v49.getAndFetchItem(v50);
    end;
    local function v53(v52) --[[ Line: 162 ]] --[[ Name: getIsTrustedConnection ]]
        -- upvalues: v41 (copy)
        return v41.getAndFetchItem(v52);
    end;
    local v55 = l_FFlagConnectionManagementChips_0 and function() --[[ Line: 167 ]]
        -- upvalues: l_getLocalPlayerUserId_0 (ref), v25 (copy)
        local v54 = l_getLocalPlayerUserId_0();
        return v25.getAndFetchItem((tostring(v54)));
    end or nil;
    local function v58(v56, v57) --[[ Line: 173 ]]
        -- upvalues: v7 (ref), v18 (copy), v8 (ref)
        return v7.PostUserSendTrustedConnectionRequest(v56, v57):andThen(function() --[[ Line: 174 ]]
            -- upvalues: v18 (ref), v56 (copy), v8 (ref)
            v18.updateItems({
                [v56] = v8.RequestSent
            });
        end);
    end;
    local function v60(v59) --[[ Line: 181 ]]
        -- upvalues: v7 (ref), v18 (copy), v8 (ref), v19 (copy)
        return v7.PostUserAcceptTrustedConnectionRequest(v59):andThen(function() --[[ Line: 182 ]]
            -- upvalues: v18 (ref), v59 (copy), v8 (ref), v19 (ref)
            v18.updateItems({
                [v59] = v8.TrustedFriends
            });
            v19.updateItems({
                [v59] = true
            });
        end);
    end;
    local function v62(v61) --[[ Line: 193 ]]
        -- upvalues: v7 (ref), v18 (copy), v8 (ref)
        return v7.PostUserIgnoreTrustedConnectionRequest(v61):andThen(function() --[[ Line: 194 ]]
            -- upvalues: v18 (ref), v61 (copy), v8 (ref)
            v18.updateItems({
                [v61] = v8.RequestIgnored
            });
        end);
    end;
    local function v64(v63) --[[ Line: 201 ]]
        -- upvalues: v7 (ref), v18 (copy), v8 (ref), v19 (copy)
        return v7.PostUserRemoveTrustedConnection(v63):andThen(function() --[[ Line: 202 ]]
            -- upvalues: v18 (ref), v63 (copy), v8 (ref), v19 (ref)
            v18.updateItems({
                [v63] = v8.RequestReceived
            });
            v19.updateItems({
                [v63] = false
            });
        end);
    end;
    local function v66(v65) --[[ Line: 213 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserCreateTrustedFriendLink(v65);
    end;
    local function v69(v67, v68) --[[ Line: 217 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserValidateTrustedFriendLink(v67, v68);
    end;
    local function v72(v70, v71) --[[ Line: 221 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserAddTrustedFriendFromLink(v70, v71);
    end;
    local function v73() --[[ Line: 225 ]] --[[ Name: clear ]]
        -- upvalues: v18 (copy), v19 (copy), v41 (copy), v49 (copy), l_FFlagConnectionManagementChips_0 (ref), v20 (copy), v25 (copy)
        v18.clear();
        v19.clear();
        v41.clear();
        v49.clear();
        if l_FFlagConnectionManagementChips_0 then
            v20.clear();
            v25.clear();
        end;
    end;
    local function v74() --[[ Line: 237 ]] --[[ Name: dispose ]]
        -- upvalues: v18 (copy), v19 (copy), v41 (copy), v49 (copy), v11 (ref), v26 (ref), l_FFlagConnectionManagementChips_0 (ref), v20 (copy), v25 (copy)
        v18.dispose();
        v19.dispose();
        v41.dispose();
        v49.dispose();
        if v11 then
            v26();
        end;
        if l_FFlagConnectionManagementChips_0 then
            v20.dispose();
            v25.dispose();
        end;
    end;
    return {
        getStatus = v51, 
        getIsTrustedConnection = v53, 
        getUserTrustedConnections = if l_FFlagConnectionManagementChips_0 then v55 else nil, 
        sendTrustedConnectionRequest = v58, 
        acceptTrustedConnectionRequest = v60, 
        ignoreTrustedConnectionRequest = v62, 
        removeTrustedConnectionRequest = v64, 
        createTrustedFriendLink = if l_FFlagTCShareLinkSenderUI_0 then v66 else nil, 
        validateTrustedFriendLink = if l_FFlagTCShareLinkReceiverUI_0 then v69 else nil, 
        addTrustedFriendFromLink = if l_FFlagTCShareLinkReceiverUI_0 then v72 else nil, 
        clear = v73, 
        dispose = v74
    };
end;