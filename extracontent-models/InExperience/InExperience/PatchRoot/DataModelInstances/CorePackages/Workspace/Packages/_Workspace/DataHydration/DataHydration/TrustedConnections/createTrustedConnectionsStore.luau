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
local v10 = game:DefineFastFlag("TCStoreEventReceiverEnabled", false);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local v13 = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0);
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1);
local function _() --[[ Line: 48 ]]
    return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec");
end;
return function() --[[ Line: 52 ]] --[[ Name: createTrustedConnectionsStore ]]
    -- upvalues: v13 (copy), v2 (copy), v10 (copy), v9 (copy), v8 (copy), v3 (copy), v6 (copy), v7 (copy), v5 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy)
    local v15 = if v13 > 0 then v13 else 1e999;
    local v16 = v2(v15);
    local v17 = v2(v15);
    local v18 = nil;
    if v10 then
        v18 = v9(function(v19, v20) --[[ Line: 62 ]]
            -- upvalues: v16 (copy), v17 (copy), v8 (ref)
            v16.updateItems({
                [v19] = v20
            });
            v17.updateItems({
                [v19] = v20 == v8.TrustedFriends
            });
        end);
    end;
    local v29 = v3({
        cache = v17, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        fetchFn = function(v21) --[[ Line: 77 ]] --[[ Name: fetchFn ]]
            -- upvalues: v6 (ref), v7 (ref)
            local v22 = v6.Dictionary.keys(v21);
            return v7.MultiGetUsersAreTrustedConnections(v22):andThen(function(v23) --[[ Line: 79 ]]
                -- upvalues: v6 (ref), v22 (copy)
                local v26 = v6.List.foldLeft(v23, function(v24, v25) --[[ Line: 80 ]]
                    v24[tostring(v25)] = true;
                    return v24;
                end, {});
                return v6.List.foldLeft(v22, function(v27, v28) --[[ Line: 85 ]]
                    -- upvalues: v26 (copy)
                    v27[tostring(v28)] = v26[v28] or false;
                    return v27;
                end, {});
            end);
        end
    });
    local v37 = v3({
        cache = v16, 
        queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"), 
        fetchFn = function(v30) --[[ Line: 96 ]] --[[ Name: fetchFn ]]
            -- upvalues: v6 (ref), v7 (ref), v5 (ref)
            local v31 = v6.Dictionary.keys(v30);
            local v35 = v6.List.foldLeft(v31, function(v32, v33) --[[ Line: 98 ]]
                -- upvalues: v7 (ref)
                table.insert(v32, v7.GetUserTrustedConnectionStatus(v33):andThen(function(v34) --[[ Line: 102 ]]
                    -- upvalues: v33 (copy)
                    return {
                        [v33] = v34
                    };
                end));
                return v32;
            end, {});
            return v5.all(v35):andThen(function(v36) --[[ Line: 109 ]]
                -- upvalues: v6 (ref)
                return v6.Dictionary.join(table.unpack(v36));
            end);
        end
    });
    local function v39(v38) --[[ Line: 115 ]] --[[ Name: getStatus ]]
        -- upvalues: v37 (copy)
        return v37.getAndFetchItem(v38);
    end;
    local function v41(v40) --[[ Line: 119 ]] --[[ Name: getIsTrustedConnection ]]
        -- upvalues: v29 (copy)
        return v29.getAndFetchItem(v40);
    end;
    local function v44(v42, v43) --[[ Line: 123 ]]
        -- upvalues: v7 (ref), v16 (copy), v8 (ref)
        return v7.PostUserSendTrustedConnectionRequest(v42, v43):andThen(function() --[[ Line: 124 ]]
            -- upvalues: v16 (ref), v42 (copy), v8 (ref)
            v16.updateItems({
                [v42] = v8.RequestSent
            });
        end);
    end;
    local function v46(v45) --[[ Line: 131 ]]
        -- upvalues: v7 (ref), v16 (copy), v8 (ref), v17 (copy)
        return v7.PostUserAcceptTrustedConnectionRequest(v45):andThen(function() --[[ Line: 132 ]]
            -- upvalues: v16 (ref), v45 (copy), v8 (ref), v17 (ref)
            v16.updateItems({
                [v45] = v8.TrustedFriends
            });
            v17.updateItems({
                [v45] = true
            });
        end);
    end;
    local function v48(v47) --[[ Line: 143 ]]
        -- upvalues: v7 (ref), v16 (copy), v8 (ref)
        return v7.PostUserIgnoreTrustedConnectionRequest(v47):andThen(function() --[[ Line: 144 ]]
            -- upvalues: v16 (ref), v47 (copy), v8 (ref)
            v16.updateItems({
                [v47] = v8.RequestIgnored
            });
        end);
    end;
    local function v50(v49) --[[ Line: 151 ]]
        -- upvalues: v7 (ref), v16 (copy), v8 (ref), v17 (copy)
        return v7.PostUserRemoveTrustedConnection(v49):andThen(function() --[[ Line: 152 ]]
            -- upvalues: v16 (ref), v49 (copy), v8 (ref), v17 (ref)
            v16.updateItems({
                [v49] = v8.RequestReceived
            });
            v17.updateItems({
                [v49] = false
            });
        end);
    end;
    local function v52(v51) --[[ Line: 163 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserCreateTrustedFriendLink(v51);
    end;
    local function v55(v53, v54) --[[ Line: 167 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserValidateTrustedFriendLink(v53, v54);
    end;
    local function v58(v56, v57) --[[ Line: 171 ]]
        -- upvalues: v7 (ref)
        return v7.PostUserAddTrustedFriendFromLink(v56, v57);
    end;
    local function v59() --[[ Line: 175 ]] --[[ Name: clear ]]
        -- upvalues: v16 (copy), v17 (copy), v29 (copy), v37 (copy)
        v16.clear();
        v17.clear();
        v29.clear();
        v37.clear();
    end;
    local function v60() --[[ Line: 182 ]] --[[ Name: dispose ]]
        -- upvalues: v16 (copy), v17 (copy), v29 (copy), v37 (copy), v10 (ref), v18 (ref)
        v16.dispose();
        v17.dispose();
        v29.dispose();
        v37.dispose();
        if v10 then
            v18();
        end;
    end;
    return {
        getStatus = v39, 
        getIsTrustedConnection = v41, 
        sendTrustedConnectionRequest = v44, 
        acceptTrustedConnectionRequest = v46, 
        ignoreTrustedConnectionRequest = v48, 
        removeTrustedConnectionRequest = v50, 
        createTrustedFriendLink = if l_FFlagTCShareLinkSenderUI_0 then v52 else nil, 
        validateTrustedFriendLink = if l_FFlagTCShareLinkReceiverUI_0 then v55 else nil, 
        addTrustedFriendFromLink = if l_FFlagTCShareLinkReceiverUI_0 then v58 else nil, 
        clear = v59, 
        dispose = v60
    };
end;