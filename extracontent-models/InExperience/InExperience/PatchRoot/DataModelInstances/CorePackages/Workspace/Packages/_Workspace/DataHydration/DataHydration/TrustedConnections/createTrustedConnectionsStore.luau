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
local v10 = game:DefineFastFlag("TCStoreEventReceiverEnabled_V2", false);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local v14 = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0);
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1);
local function _() --[[ Line: 51 ]]
    return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec");
end;
return function() --[[ Line: 55 ]] --[[ Name: createTrustedConnectionsStore ]]
    -- upvalues: v14 (copy), v2 (copy), l_FFlagConnectionManagementChips_0 (copy), v10 (copy), v9 (copy), v8 (copy), v3 (copy), v6 (copy), v7 (copy), v5 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy)
    local v16 = if v14 > 0 then v14 else 1e999;
    local v17 = v2(v16);
    local v18 = v2(v16);
    local v19 = if l_FFlagConnectionManagementChips_0 then v2(v16) else nil;
    local v20 = nil;
    if v10 then
        v20 = v9(function(v21, v22) --[[ Line: 67 ]]
            -- upvalues: v17 (copy), v18 (copy), v8 (ref)
            v17.updateItems({
                [v21] = v22
            });
            v18.updateItems({
                [v21] = v22 == v8.TrustedFriends
            });
        end);
    end;
    local v31 = v3({
        cache = v18, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        fetchFn = function(v23) --[[ Line: 82 ]] --[[ Name: fetchFn ]]
            -- upvalues: v6 (ref), v7 (ref)
            local v24 = v6.Dictionary.keys(v23);
            return v7.MultiGetUsersAreTrustedConnections(v24):andThen(function(v25) --[[ Line: 84 ]]
                -- upvalues: v6 (ref), v24 (copy)
                local v28 = v6.List.foldLeft(v25, function(v26, v27) --[[ Line: 85 ]]
                    v26[tostring(v27)] = true;
                    return v26;
                end, {});
                return v6.List.foldLeft(v24, function(v29, v30) --[[ Line: 90 ]]
                    -- upvalues: v28 (copy)
                    v29[tostring(v30)] = v28[v30] or false;
                    return v29;
                end, {});
            end);
        end
    });
    local v39 = v3({
        cache = v17, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        fetchFn = function(v32) --[[ Line: 101 ]] --[[ Name: fetchFn ]]
            -- upvalues: v6 (ref), v7 (ref), v5 (ref)
            local v33 = v6.Dictionary.keys(v32);
            local v37 = v6.List.foldLeft(v33, function(v34, v35) --[[ Line: 103 ]]
                -- upvalues: v7 (ref)
                table.insert(v34, v7.GetUserTrustedConnectionStatus(v35):andThen(function(v36) --[[ Line: 107 ]]
                    -- upvalues: v35 (copy)
                    return {
                        [v35] = v36
                    };
                end));
                return v34;
            end, {});
            return v5.all(v37):andThen(function(v38) --[[ Line: 114 ]]
                -- upvalues: v6 (ref)
                return v6.Dictionary.join(table.unpack(v38));
            end);
        end
    });
    local v44 = if l_FFlagConnectionManagementChips_0 then v3({
        cache = v19, 
        supportsMultiGet = false, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        fetchFn = function(v40, _) --[[ Line: 125 ]] --[[ Name: fetchFn ]]
            -- upvalues: v7 (ref), v6 (ref)
            return v7.GetUserTrustedConnections(v40):andThen(function(v42) --[[ Line: 126 ]]
                -- upvalues: v6 (ref)
                return v6.Dictionary.map(v42.PageItems, function(v43) --[[ Line: 127 ]]
                    return true, (tostring(v43.id));
                end);
            end);
        end
    }) else nil;
    local function v46(v45) --[[ Line: 135 ]] --[[ Name: getStatus ]]
        -- upvalues: v39 (copy)
        return v39.getAndFetchItem(v45);
    end;
    local function v48(v47) --[[ Line: 139 ]] --[[ Name: getIsTrustedConnection ]]
        -- upvalues: v31 (copy)
        return v31.getAndFetchItem(v47);
    end;
    local v50 = l_FFlagConnectionManagementChips_0 and function(v49) --[[ Line: 144 ]]
        -- upvalues: v44 (copy)
        return v44.getAndFetchItem(v49);
    end or nil;
    local function v53(v51, v52) --[[ Line: 149 ]]
        -- upvalues: v7 (ref), v17 (copy), v8 (ref)
        return v7.PostUserSendTrustedConnectionRequest(v51, v52):andThen(function() --[[ Line: 150 ]]
            -- upvalues: v17 (ref), v51 (copy), v8 (ref)
            v17.updateItems({
                [v51] = v8.RequestSent
            });
        end);
    end;
    local function v55(v54) --[[ Line: 157 ]]
        -- upvalues: v7 (ref), v17 (copy), v8 (ref), v18 (copy)
        return v7.PostUserAcceptTrustedConnectionRequest(v54):andThen(function() --[[ Line: 158 ]]
            -- upvalues: v17 (ref), v54 (copy), v8 (ref), v18 (ref)
            v17.updateItems({
                [v54] = v8.TrustedFriends
            });
            v18.updateItems({
                [v54] = true
            });
        end);
    end;
    local function v57(v56) --[[ Line: 169 ]]
        -- upvalues: v7 (ref), v17 (copy), v8 (ref)
        return v7.PostUserIgnoreTrustedConnectionRequest(v56):andThen(function() --[[ Line: 170 ]]
            -- upvalues: v17 (ref), v56 (copy), v8 (ref)
            v17.updateItems({
                [v56] = v8.RequestIgnored
            });
        end);
    end;
    local function v59(v58) --[[ Line: 177 ]]
        -- upvalues: v7 (ref), v17 (copy), v8 (ref), v18 (copy)
        return v7.PostUserRemoveTrustedConnection(v58):andThen(function() --[[ Line: 178 ]]
            -- upvalues: v17 (ref), v58 (copy), v8 (ref), v18 (ref)
            v17.updateItems({
                [v58] = v8.RequestReceived
            });
            v18.updateItems({
                [v58] = false
            });
        end);
    end;
    local function v61(v60) --[[ Line: 189 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserCreateTrustedFriendLink(v60);
    end;
    local function v64(v62, v63) --[[ Line: 193 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserValidateTrustedFriendLink(v62, v63);
    end;
    local function v67(v65, v66) --[[ Line: 197 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserAddTrustedFriendFromLink(v65, v66);
    end;
    local function v68() --[[ Line: 201 ]] --[[ Name: clear ]]
        -- upvalues: v17 (copy), v18 (copy), v31 (copy), v39 (copy), l_FFlagConnectionManagementChips_0 (ref), v19 (copy), v44 (copy)
        v17.clear();
        v18.clear();
        v31.clear();
        v39.clear();
        if l_FFlagConnectionManagementChips_0 then
            v19.clear();
            v44.clear();
        end;
    end;
    local function v69() --[[ Line: 213 ]] --[[ Name: dispose ]]
        -- upvalues: v17 (copy), v18 (copy), v31 (copy), v39 (copy), v10 (ref), v20 (ref), l_FFlagConnectionManagementChips_0 (ref), v19 (copy), v44 (copy)
        v17.dispose();
        v18.dispose();
        v31.dispose();
        v39.dispose();
        if v10 then
            v20();
        end;
        if l_FFlagConnectionManagementChips_0 then
            v19.dispose();
            v44.dispose();
        end;
    end;
    return {
        getStatus = v46, 
        getIsTrustedConnection = v48, 
        getUserTrustedConnections = if l_FFlagConnectionManagementChips_0 then v50 else nil, 
        sendTrustedConnectionRequest = v53, 
        acceptTrustedConnectionRequest = v55, 
        ignoreTrustedConnectionRequest = v57, 
        removeTrustedConnectionRequest = v59, 
        createTrustedFriendLink = if l_FFlagTCShareLinkSenderUI_0 then v61 else nil, 
        validateTrustedFriendLink = if l_FFlagTCShareLinkReceiverUI_0 then v64 else nil, 
        addTrustedFriendFromLink = if l_FFlagTCShareLinkReceiverUI_0 then v67 else nil, 
        clear = v68, 
        dispose = v69
    };
end;