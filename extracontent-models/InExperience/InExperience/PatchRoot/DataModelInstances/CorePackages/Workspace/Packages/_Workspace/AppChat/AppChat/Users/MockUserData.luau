local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Cryo);
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Http.RoduxPresence).Enums.PresenceType;
local v5 = {
    ["1"] = {
        id = "1", 
        username = "username1", 
        displayName = "displayName1", 
        combinedName = "combinedName1", 
        alias = "alias1", 
        presenceType = l_PresenceType_0.Online, 
        presenceText = "Online", 
        lastLocation = "TestLocation"
    }, 
    ["2"] = {
        id = "2", 
        username = "username2", 
        displayName = "displayName2", 
        combinedName = "combinedName2", 
        alias = "alias2", 
        presenceType = l_PresenceType_0.InGame, 
        presenceText = "Studio - Testing", 
        lastLocation = "Studio - Testing"
    }, 
    ["3"] = {
        id = "3", 
        username = "username3", 
        displayName = "displayName3", 
        combinedName = "combinedName3", 
        alias = "alias3", 
        presenceType = l_PresenceType_0.Offline, 
        presenceText = "Offline", 
        lastLocation = nil
    }, 
    ["4"] = {
        id = "4", 
        username = "username4", 
        displayName = "displayName4", 
        combinedName = "combinedName4", 
        alias = "alias4", 
        presenceType = l_PresenceType_0.Online, 
        presenceText = "Online", 
        lastLocation = "TestLocation"
    }, 
    ["1989"] = {
        id = "1989", 
        username = "username", 
        displayName = "Test Display Name", 
        combinedName = "Test Primary Name", 
        alias = "Test Primary Name", 
        presenceType = l_PresenceType_0.Online, 
        presenceText = "Online", 
        lastLocation = "TestLocation"
    }, 
    ["1969"] = {
        id = "1969", 
        username = "username", 
        displayName = "ClementOrange", 
        combinedName = "OrangeClement", 
        alias = "OrangeClement", 
        presenceType = l_PresenceType_0.InGame, 
        presenceText = "Studio - Testing", 
        lastLocation = "Studio - Testing"
    }, 
    ["1949"] = {
        id = "1949", 
        username = "username", 
        displayName = "PineAzure", 
        combinedName = "AzurePine", 
        alias = "AzurePine", 
        presenceType = l_PresenceType_0.Offline, 
        presenceText = "Offline", 
        lastLocation = nil
    }, 
    ["422502"] = {
        id = "422502", 
        username = "username", 
        displayName = "TestUserB", 
        combinedName = "TestUserB", 
        alias = "(alias)", 
        presenceType = l_PresenceType_0.InGame, 
        presenceText = "Studio - Testing", 
        lastLocation = "Studio - Testing"
    }
};
createMockUserProfile = function(v6) --[[ Line: 107 ]] --[[ Name: createMockUserProfile ]]
    -- upvalues: v2 (copy)
    local l_createSignal_0 = v2.createSignal;
    local v8, _ = l_createSignal_0(v6.username or "");
    local v10, _ = l_createSignal_0(v6.displayName or "");
    local v12, _ = l_createSignal_0(v6.combinedName or "");
    local v14, _ = l_createSignal_0(v6.combinedName or "");
    local v16, _ = l_createSignal_0(v6.combinedName or "");
    local v18, _ = l_createSignal_0(v6.alias or "");
    local v20, _ = l_createSignal_0("");
    return {
        userId = v6.id, 
        names = {
            getUsername = v8, 
            getDisplayName = v10, 
            getCombinedName = v12, 
            getInExperienceCombinedName = v14, 
            getPlatformName = v16, 
            getAlias = v18
        }, 
        getPlatformProfileId = v20
    };
end;
createMockUserProfileStore = function() --[[ Line: 133 ]] --[[ Name: createMockUserProfileStore ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy)
    local v22 = {};
    for v23, v24 in pairs(v5) do
        v22[v23] = createMockUserProfile(v24);
    end;
    return {
        fetchNamesByUserIds = function(v25) --[[ Line: 141 ]] --[[ Name: fetchNamesByUserIds ]]
            -- upvalues: v3 (ref), v22 (copy), v5 (ref), v2 (ref)
            local v28 = v3.List.filterMap(v25, function(v26) --[[ Line: 142 ]]
                -- upvalues: v22 (ref), v5 (ref)
                local v27 = v22[v26];
                if not v27 and v5[v26] then
                    v27 = createMockUserProfile(v5[v26]);
                    v22[v26] = v27;
                end;
                return v27;
            end);
            local v29 = {
                status = "success", 
                data = v28
            };
            return v2.createSignal(v29);
        end, 
        invalidateCachedNamesForUserIds = function() --[[ Line: 164 ]] --[[ Name: invalidateCachedNamesForUserIds ]]

        end
    };
end;
createMockPresenceData = function() --[[ Line: 169 ]] --[[ Name: createMockPresenceData ]]
    -- upvalues: v5 (copy)
    local v30 = {};
    for v31, v32 in pairs(v5) do
        v30[v31] = {
            userPresenceType = v32.presenceType, 
            lastLocation = v32.lastLocation
        };
    end;
    return v30;
end;
createMockApolloProfiles = function() --[[ Line: 183 ]] --[[ Name: createMockApolloProfiles ]]
    -- upvalues: v5 (copy)
    local v33 = {};
    for v34, v35 in pairs(v5) do
        v33[v34] = {
            combinedName = v35.combinedName, 
            alias = v35.alias, 
            displayName = v35.displayName, 
            username = v35.username, 
            platformName = v35.combinedName
        };
    end;
    return v33;
end;
getUserProfilesFetchData = function() --[[ Line: 200 ]] --[[ Name: getUserProfilesFetchData ]]
    -- upvalues: v3 (copy), v5 (copy)
    return v3.List.map(v5, function(v36) --[[ Line: 201 ]]
        return v36;
    end);
end;
return {
    USERS = v5, 
    createMockUserProfile = createMockUserProfile, 
    createMockUserProfileStore = createMockUserProfileStore, 
    createMockPresenceData = createMockPresenceData, 
    createMockApolloProfiles = createMockApolloProfiles, 
    getUserProfilesFetchData = getUserProfilesFetchData
};