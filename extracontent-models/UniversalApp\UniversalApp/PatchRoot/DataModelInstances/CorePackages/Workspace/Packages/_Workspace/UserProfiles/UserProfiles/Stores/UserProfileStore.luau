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
local l_FFlagEnableBlackbirdCheckDev_0 = v2.FFlagEnableBlackbirdCheckDev;
local v12 = require(script.Parent.UserProfileModel);
local v105 = l_createComputed_0(function(_) --[[ Line: 33 ]]
    -- upvalues: l_Parent_0 (copy), v1 (copy), v6 (copy), v7 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v12 (copy), v8 (copy), l_createSignal_0 (copy), v9 (copy)
    local v14 = require(l_Parent_0.UrlBuilder);
    local l_UrlBuilder_0 = v14.UrlBuilder;
    local l_UrlBase_0 = v14.UrlBase;
    local v17 = v1.Logger.new(nil, "UserProfileStore");
    v17:setContext({
        prefix = "[UserProfileStore] "
    });
    v17:addSink({
        maxLevel = v6, 
        log = function(_, _, _) --[[ Line: 51 ]] --[[ Name: log ]]

        end
    });
    local l_HttpService_0 = game:GetService("HttpService");
    local v22 = l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "user-profile-api/v1/user/profiles/get-profiles"
    })();
    local l_v7_0 = v7;
    local v24 = {
        USERNAME = "names.username", 
        DISPLAY_NAME = "names.displayName", 
        COMBINED_NAME = "names.combinedName", 
        IN_EXPERIENCE_COMBINED_NAME = "names.inExperienceCombinedName", 
        PLATFORM_NAME = "names.platformName", 
        CONTACT_NAME = "names.contactName", 
        ALIAS = "names.alias", 
        PLATFORM_PROFILE_ID = "platformProfileId", 
        IS_VERIFIED = l_FFlagEnableVerifiedBadgeStore_0 and "isVerified" or nil, 
        HAS_ROBLOX_SUBSCRIPTION = l_FFlagEnableBlackbirdCheckDev_0 and "hasRobloxSubscription" or nil
    };
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local v28 = false;
    local function _(v29) --[[ Line: 82 ]] --[[ Name: getOrCreateByUserId ]]
        -- upvalues: v25 (copy), v17 (copy), v12 (ref)
        local v30 = v25[v29];
        if v30 ~= nil then
            v17:trace("Found profile: {}", v29);
            return v30;
        else
            v17:trace("Creating profile: {}", v29);
            v30 = v12.create(v29);
            v25[v29] = v30;
            return v30;
        end;
    end;
    local function v32(v33, v34, v35, v36) --[[ Line: 95 ]] --[[ Name: performBatchFetch ]]
        -- upvalues: v17 (copy), v26 (copy), v8 (ref), l_HttpService_0 (copy), v22 (copy), l_v7_0 (copy), v25 (copy), v12 (ref), v32 (copy)
        if #v33 == 0 then
            v17:trace("No more ids to fetch. Setting result.");
            for _, v38 in ipairs(v35) do
                local v39 = {};
                local v40 = v26[v34];
                for _, v42 in v38.userIds do
                    local v43 = v40[v42];
                    if v43 then
                        v17:trace("Found cached profile: {}", v42);
                        table.insert(v39, v43);
                    else
                        v17:debug("Expected cached profile: {}", v42);
                    end;
                end;
                local v44 = {
                    status = v36 and "success" or "failed", 
                    data = v39
                };
                v38.setResult(v44);
                local l_callback_0 = v38.callback;
                if l_callback_0 ~= nil then
                    l_callback_0(v44);
                end;
            end;
            return;
        else
            local v46 = {};
            local v47 = {};
            if #v33 > v8 then
                v46 = {};
                for v48 = 1, v8 do
                    table.insert(v46, v33[v48]);
                end;
                for v49 = v8 + 1, #v33 do
                    table.insert(v47, v33[v49]);
                end;
            else
                v46 = v33;
            end;
            local v50 = string.split(v34, ",");
            local v51 = l_HttpService_0:JSONEncode({
                userIds = v46, 
                fields = v50
            });
            v17:debug("Fetching: {}", v51);
            l_HttpService_0:RequestInternal({
                Url = v22, 
                Method = "POST", 
                Body = v51, 
                Timeout = l_v7_0, 
                CachePolicy = Enum.HttpCachePolicy.None, 
                Priority = 0, 
                Headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }, 
                RequestType = Enum.HttpRequestType.Default
            }):Start(function(v52, v53) --[[ Line: 165 ]]
                -- upvalues: l_HttpService_0 (ref), v17 (ref), v51 (copy), v26 (ref), v34 (copy), v25 (ref), v12 (ref), v32 (ref), v47 (copy), v35 (copy), v36 (copy)
                if v52 == true then
                    local l_Body_0 = v53.Body;
                    if l_Body_0 ~= nil then
                        local _, l_result_0 = pcall(function() --[[ Line: 169 ]]
                            -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                            return l_HttpService_0:JSONDecode(l_Body_0);
                        end);
                        if l_result_0 ~= nil then
                            v17:trace("Fetched: {}\nresponse: {}", v51, l_Body_0);
                            local l_profileDetails_0 = l_result_0.profileDetails;
                            if l_profileDetails_0 ~= nil then
                                local v58 = v26[v34];
                                for _, v60 in ipairs(l_profileDetails_0) do
                                    local v61 = tostring(v60.userId);
                                    local v62 = v25[v61];
                                    local v63;
                                    if v62 ~= nil then
                                        v17:trace("Found profile: {}", v61);
                                        v63 = v62;
                                    else
                                        v17:trace("Creating profile: {}", v61);
                                        v62 = v12.create(v61);
                                        v25[v61] = v62;
                                        v63 = v62;
                                    end;
                                    if v60 then
                                        v17:trace("Updating profile: {}", v61);
                                        v12.update(v63, v60);
                                    end;
                                    v58[v61] = v63;
                                end;
                            end;
                        end;
                    end;
                else
                    v17:error("Error fetching");
                end;
                v32(v47, v34, v35, v52 ~= false and v36);
            end);
            return;
        end;
    end;
    local function v73() --[[ Line: 197 ]] --[[ Name: processQueuedRequests ]]
        -- upvalues: v27 (ref), v17 (copy), v26 (copy), v32 (copy)
        for v64, v65 in pairs(v27) do
            v17:trace("Processing requests ({}) for fields: {}", #v65, v64);
            local v66 = {};
            local v67 = {};
            local v68 = v26[v64];
            for _, v70 in ipairs(v65) do
                for _, v72 in ipairs(v70.userIds) do
                    if v66[v72] == nil then
                        v66[v72] = v72;
                        if v68[v72] == nil then
                            table.insert(v67, v72);
                        end;
                    end;
                end;
            end;
            v32(v67, v64, table.clone(v65), true);
        end;
        v27 = {};
    end;
    local function v92(v74, v75, v76) --[[ Line: 219 ]] --[[ Name: fetchByUserIds ]]
        -- upvalues: v26 (copy), v25 (copy), v17 (copy), v12 (ref), l_createSignal_0 (ref), v27 (ref), v28 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), v73 (copy), v9 (ref)
        table.sort(v75);
        local v77 = table.concat(v75, ",");
        local v78 = v26[v77];
        if v78 == nil then
            v78 = {};
            v26[v77] = v78;
        end;
        local v79 = {};
        local v80 = false;
        for _, v82 in v74 do
            local v83 = v78[v82];
            if v83 == nil and v80 == false then
                v80 = true;
            end;
            local l_v83_0 = v83;
            if not l_v83_0 then
                local v85 = v25[v82];
                if v85 ~= nil then
                    v17:trace("Found profile: {}", v82);
                    l_v83_0 = v85;
                else
                    v17:trace("Creating profile: {}", v82);
                    v85 = v12.create(v82);
                    v25[v82] = v85;
                    l_v83_0 = v85;
                end;
            end;
            table.insert(v79, l_v83_0);
        end;
        if v80 == false then
            v17:trace("All requested profiles are cached. Calling back early");
            local v86 = {
                status = "success", 
                data = v79
            };
            local v87 = l_createSignal_0(v86);
            if v76 ~= nil then
                v76(v86);
            end;
            return v87;
        else
            local v88 = {
                status = "fetching", 
                data = v79
            };
            local v89, v90 = l_createSignal_0(v88);
            local v91 = v27[v77];
            if v91 == nil then
                v91 = {};
                v27[v77] = v91;
            end;
            table.insert(v91, {
                userIds = v74, 
                getResult = v89, 
                setResult = v90, 
                callback = v76
            });
            if not v28 then
                v28 = true;
                if l_FFlagEnableBlackbirdCheckDev_0 then
                    task.defer(function() --[[ Line: 282 ]]
                        -- upvalues: v73 (ref), v28 (ref)
                        v73();
                        v28 = false;
                    end);
                else
                    task.delay(v9, function() --[[ Line: 287 ]]
                        -- upvalues: v73 (ref), v28 (ref)
                        v73();
                        v28 = false;
                    end);
                end;
            end;
            if v76 ~= nil then
                v76(v88);
            end;
            return v89;
        end;
    end;
    local function v96(v93, v94) --[[ Line: 299 ]] --[[ Name: fetchNamesByUserIds ]]
        -- upvalues: v24 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), v92 (copy)
        local v95 = {
            v24.COMBINED_NAME, 
            v24.DISPLAY_NAME, 
            v24.USERNAME, 
            v24.IN_EXPERIENCE_COMBINED_NAME, 
            v24.CONTACT_NAME, 
            v24.ALIAS, 
            v24.PLATFORM_NAME, 
            v24.PLATFORM_PROFILE_ID
        };
        if l_FFlagEnableVerifiedBadgeStore_0 then
            table.insert(v95, v24.IS_VERIFIED);
        end;
        if l_FFlagEnableBlackbirdCheckDev_0 then
            table.insert(v95, v24.HAS_ROBLOX_SUBSCRIPTION);
        end;
        return (v92(v93, v95, v94));
    end;
    local function v102(v97, v98) --[[ Line: 325 ]] --[[ Name: invalidateCachedProfiles ]]
        -- upvalues: v26 (copy)
        table.sort(v97);
        local v99 = v26[table.concat(v97, ",")];
        if v99 == nil then
            return;
        elseif v98 ~= nil then
            for _, v101 in v98 do
                v99[v101] = nil;
            end;
            return;
        else
            v99 = {};
            return;
        end;
    end;
    return {
        fetchNamesByUserIds = v96, 
        invalidateCachedNamesForUserIds = function(v103) --[[ Line: 343 ]] --[[ Name: invalidateCachedNamesForUserIds ]]
            -- upvalues: v24 (copy), v102 (copy)
            local v104 = {
                v24.COMBINED_NAME, 
                v24.DISPLAY_NAME, 
                v24.USERNAME, 
                v24.IN_EXPERIENCE_COMBINED_NAME, 
                v24.CONTACT_NAME, 
                v24.ALIAS, 
                v24.PLATFORM_NAME, 
                v24.PLATFORM_PROFILE_ID
            };
            v102(v104, v103);
        end
    };
end);
return {
    get = function() --[[ Line: 364 ]] --[[ Name: get ]]
        -- upvalues: v105 (copy)
        return v105(false);
    end
};