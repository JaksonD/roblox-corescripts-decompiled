local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local v1 = require(l_Parent_0.Lumberyak);
local v2 = require(l_Parent_0.SharedFlags);
local v3 = require(l_Parent_0.Signals);
local l_createSignal_0 = v3.createSignal;
local l_createComputed_0 = v3.createComputed;
local v6 = game:DefineFastString("UserProfileStoreMaxLoggingLevel", v1.Logger.Levels.Error);
local v7 = game:DefineFastInt("UserProfileStoreHttpTimeout", 1500);
local v8 = game:DefineFastInt("UserProfileStoreBatchSize", 50);
local v9 = game:DefineFastInt("UserProfileStoreQueueProcessDelay", 1);
local l_FFlagEnableVerifiedBadgeStore_0 = v2.FFlagEnableVerifiedBadgeStore;
local v11 = require(script.Parent.UserProfileModel);
local v104 = l_createComputed_0(function(_) --[[ Line: 32 ]]
    -- upvalues: l_Parent_0 (copy), v1 (copy), v6 (copy), v7 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v11 (copy), v8 (copy), l_createSignal_0 (copy), v9 (copy)
    local v13 = require(l_Parent_0.UrlBuilder);
    local l_UrlBuilder_0 = v13.UrlBuilder;
    local l_UrlBase_0 = v13.UrlBase;
    local v16 = v1.Logger.new(nil, "UserProfileStore");
    v16:setContext({
        prefix = "[UserProfileStore] "
    });
    v16:addSink({
        maxLevel = v6, 
        log = function(_, _, _) --[[ Line: 50 ]] --[[ Name: log ]]

        end
    });
    local l_HttpService_0 = game:GetService("HttpService");
    local v21 = l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "user-profile-api/v1/user/profiles/get-profiles"
    })();
    local l_v7_0 = v7;
    local v23 = {
        USERNAME = "names.username", 
        DISPLAY_NAME = "names.displayName", 
        COMBINED_NAME = "names.combinedName", 
        IN_EXPERIENCE_COMBINED_NAME = "names.inExperienceCombinedName", 
        PLATFORM_NAME = "names.platformName", 
        CONTACT_NAME = "names.contactName", 
        ALIAS = "names.alias", 
        PLATFORM_PROFILE_ID = "platformProfileId", 
        IS_VERIFIED = l_FFlagEnableVerifiedBadgeStore_0 and "isVerified" or nil
    };
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = false;
    local function _(v28) --[[ Line: 80 ]] --[[ Name: getOrCreateByUserId ]]
        -- upvalues: v24 (copy), v16 (copy), v11 (ref)
        local v29 = v24[v28];
        if v29 ~= nil then
            v16:trace("Found profile: {}", v28);
            return v29;
        else
            v16:trace("Creating profile: {}", v28);
            v29 = v11.create(v28);
            v24[v28] = v29;
            return v29;
        end;
    end;
    local function v31(v32, v33, v34, v35) --[[ Line: 93 ]] --[[ Name: performBatchFetch ]]
        -- upvalues: v16 (copy), v25 (copy), v8 (ref), l_HttpService_0 (copy), v21 (copy), l_v7_0 (copy), v24 (copy), v11 (ref), v31 (copy)
        if #v32 == 0 then
            v16:trace("No more ids to fetch. Setting result.");
            for _, v37 in ipairs(v34) do
                local v38 = {};
                local v39 = v25[v33];
                for _, v41 in v37.userIds do
                    local v42 = v39[v41];
                    if v42 then
                        v16:trace("Found cached profile: {}", v41);
                        table.insert(v38, v42);
                    else
                        v16:debug("Expected cached profile: {}", v41);
                    end;
                end;
                local v43 = {
                    status = v35 and "success" or "failed", 
                    data = v38
                };
                v37.setResult(v43);
                local l_callback_0 = v37.callback;
                if l_callback_0 ~= nil then
                    l_callback_0(v43);
                end;
            end;
            return;
        else
            local v45 = {};
            local v46 = {};
            if #v32 > v8 then
                v45 = {};
                for v47 = 1, v8 do
                    table.insert(v45, v32[v47]);
                end;
                for v48 = v8 + 1, #v32 do
                    table.insert(v46, v32[v48]);
                end;
            else
                v45 = v32;
            end;
            local v49 = string.split(v33, ",");
            local v50 = l_HttpService_0:JSONEncode({
                userIds = v45, 
                fields = v49
            });
            v16:debug("Fetching: {}", v50);
            l_HttpService_0:RequestInternal({
                Url = v21, 
                Method = "POST", 
                Body = v50, 
                Timeout = l_v7_0, 
                CachePolicy = Enum.HttpCachePolicy.None, 
                Priority = 0, 
                Headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }, 
                RequestType = Enum.HttpRequestType.Default
            }):Start(function(v51, v52) --[[ Line: 163 ]]
                -- upvalues: l_HttpService_0 (ref), v16 (ref), v50 (copy), v25 (ref), v33 (copy), v24 (ref), v11 (ref), v31 (ref), v46 (copy), v34 (copy), v35 (copy)
                if v51 == true then
                    local l_Body_0 = v52.Body;
                    if l_Body_0 ~= nil then
                        local _, l_result_0 = pcall(function() --[[ Line: 167 ]]
                            -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                            return l_HttpService_0:JSONDecode(l_Body_0);
                        end);
                        if l_result_0 ~= nil then
                            v16:trace("Fetched: {}\nresponse: {}", v50, l_Body_0);
                            local l_profileDetails_0 = l_result_0.profileDetails;
                            if l_profileDetails_0 ~= nil then
                                local v57 = v25[v33];
                                for _, v59 in ipairs(l_profileDetails_0) do
                                    local v60 = tostring(v59.userId);
                                    local v61 = v24[v60];
                                    local v62;
                                    if v61 ~= nil then
                                        v16:trace("Found profile: {}", v60);
                                        v62 = v61;
                                    else
                                        v16:trace("Creating profile: {}", v60);
                                        v61 = v11.create(v60);
                                        v24[v60] = v61;
                                        v62 = v61;
                                    end;
                                    if v59 then
                                        v16:trace("Updating profile: {}", v60);
                                        v11.update(v62, v59);
                                    end;
                                    v57[v60] = v62;
                                end;
                            end;
                        end;
                    end;
                else
                    v16:error("Error fetching");
                end;
                v31(v46, v33, v34, v51 ~= false and v35);
            end);
            return;
        end;
    end;
    local function v72() --[[ Line: 195 ]] --[[ Name: processQueuedRequests ]]
        -- upvalues: v26 (ref), v16 (copy), v25 (copy), v31 (copy)
        for v63, v64 in pairs(v26) do
            v16:trace("Processing requests ({}) for fields: {}", #v64, v63);
            local v65 = {};
            local v66 = {};
            local v67 = v25[v63];
            for _, v69 in ipairs(v64) do
                for _, v71 in ipairs(v69.userIds) do
                    if v65[v71] == nil then
                        v65[v71] = v71;
                        if v67[v71] == nil then
                            table.insert(v66, v71);
                        end;
                    end;
                end;
            end;
            v31(v66, v63, table.clone(v64), true);
        end;
        v26 = {};
    end;
    local function v91(v73, v74, v75) --[[ Line: 217 ]] --[[ Name: fetchByUserIds ]]
        -- upvalues: v25 (copy), v24 (copy), v16 (copy), v11 (ref), l_createSignal_0 (ref), v26 (ref), v27 (ref), v9 (ref), v72 (copy)
        table.sort(v74);
        local v76 = table.concat(v74, ",");
        local v77 = v25[v76];
        if v77 == nil then
            v77 = {};
            v25[v76] = v77;
        end;
        local v78 = {};
        local v79 = false;
        for _, v81 in v73 do
            local v82 = v77[v81];
            if v82 == nil and v79 == false then
                v79 = true;
            end;
            local l_v82_0 = v82;
            if not l_v82_0 then
                local v84 = v24[v81];
                if v84 ~= nil then
                    v16:trace("Found profile: {}", v81);
                    l_v82_0 = v84;
                else
                    v16:trace("Creating profile: {}", v81);
                    v84 = v11.create(v81);
                    v24[v81] = v84;
                    l_v82_0 = v84;
                end;
            end;
            table.insert(v78, l_v82_0);
        end;
        if v79 == false then
            v16:trace("All requested profiles are cached. Calling back early");
            local v85 = {
                status = "success", 
                data = v78
            };
            local v86 = l_createSignal_0(v85);
            if v75 ~= nil then
                v75(v85);
            end;
            return v86;
        else
            local v87 = {
                status = "fetching", 
                data = v78
            };
            local v88, v89 = l_createSignal_0(v87);
            local v90 = v26[v76];
            if v90 == nil then
                v90 = {};
                v26[v76] = v90;
            end;
            table.insert(v90, {
                userIds = v73, 
                getResult = v88, 
                setResult = v89, 
                callback = v75
            });
            if not v27 then
                v27 = true;
                task.delay(v9, function() --[[ Line: 279 ]]
                    -- upvalues: v72 (ref), v27 (ref)
                    v72();
                    v27 = false;
                end);
            end;
            if v75 ~= nil then
                v75(v87);
            end;
            return v88;
        end;
    end;
    local function v95(v92, v93) --[[ Line: 290 ]] --[[ Name: fetchNamesByUserIds ]]
        -- upvalues: v23 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), v91 (copy)
        local v94 = {
            v23.COMBINED_NAME, 
            v23.DISPLAY_NAME, 
            v23.USERNAME, 
            v23.IN_EXPERIENCE_COMBINED_NAME, 
            v23.CONTACT_NAME, 
            v23.ALIAS, 
            v23.PLATFORM_NAME, 
            v23.PLATFORM_PROFILE_ID
        };
        if l_FFlagEnableVerifiedBadgeStore_0 then
            table.insert(v94, v23.IS_VERIFIED);
        end;
        return (v91(v92, v94, v93));
    end;
    local function v101(v96, v97) --[[ Line: 312 ]] --[[ Name: invalidateCachedProfiles ]]
        -- upvalues: v25 (copy)
        table.sort(v96);
        local v98 = v25[table.concat(v96, ",")];
        if v98 == nil then
            return;
        elseif v97 ~= nil then
            for _, v100 in v97 do
                v98[v100] = nil;
            end;
            return;
        else
            v98 = {};
            return;
        end;
    end;
    return {
        fetchNamesByUserIds = v95, 
        invalidateCachedNamesForUserIds = function(v102) --[[ Line: 330 ]] --[[ Name: invalidateCachedNamesForUserIds ]]
            -- upvalues: v23 (copy), v101 (copy)
            local v103 = {
                v23.COMBINED_NAME, 
                v23.DISPLAY_NAME, 
                v23.USERNAME, 
                v23.IN_EXPERIENCE_COMBINED_NAME, 
                v23.CONTACT_NAME, 
                v23.ALIAS, 
                v23.PLATFORM_NAME, 
                v23.PLATFORM_PROFILE_ID
            };
            v101(v103, v102);
        end
    };
end);
return {
    get = function() --[[ Line: 351 ]] --[[ Name: get ]]
        -- upvalues: v104 (copy)
        return v104(false);
    end
};