local l_Parent_0 = script:FindFirstAncestor("ProfileInsights").Parent;
local v1 = require(l_Parent_0.Signals);
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
local v4 = require(script.Parent.ProfileInsightsModel);
local l_HttpService_0 = game:GetService("HttpService");
local v6 = game:DefineFastInt("ProfileInsightsStoreHttpTimeout", 1500);
local v7 = require(l_Parent_0.UrlBuilder);
local l_UrlBuilder_0 = v7.UrlBuilder;
local l_UrlBase_0 = v7.UrlBase;
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "profile-insights-api/v1/multiProfileInsights"
})();
local function v21(v11, v12, v13, v14) --[[ Line: 46 ]] --[[ Name: makeHttpCall ]]
    -- upvalues: l_HttpService_0 (copy), v10 (copy), v6 (copy)
    l_HttpService_0:RequestInternal({
        Url = v10, 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            userIds = v11, 
            count = if v13 then nil else v12 or 2, 
            rankingStrategy = v13
        }), 
        Timeout = v6, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Priority = 0, 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }, 
        RequestType = Enum.HttpRequestType.Default
    }):Start(function(v15, v16) --[[ Line: 70 ]]
        -- upvalues: l_HttpService_0 (ref), v14 (copy)
        local v17 = nil;
        local v18 = false;
        if v16 and v16.Body then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
                -- upvalues: l_HttpService_0 (ref), v16 (copy)
                return l_HttpService_0:JSONDecode(v16.Body);
            end);
            v18 = l_status_0;
            v17 = l_result_0;
        end;
        v14(if v15 then v18 else false, v17);
    end);
end;
local function _(v22, v23) --[[ Line: 82 ]] --[[ Name: createFetchResult ]]
    return {
        status = v22, 
        data = v23
    };
end;
return l_createComputed_0(function(_) --[[ Line: 93 ]]
    -- upvalues: l_createSignal_0 (copy), v4 (copy), v21 (copy), l_HttpService_0 (copy)
    local v26 = {};
    local v27 = {};
    local function _(v28, v29, v30) --[[ Line: 98 ]] --[[ Name: getCacheKey ]]
        return table.concat(v28, ",") .. tostring(v29) .. tostring(v30);
    end;
    local function v42(v32, v33) --[[ Line: 102 ]] --[[ Name: mergeWithExisting ]]
        -- upvalues: v27 (copy)
        local v34 = v27[v32];
        if v34 then
            local v35 = {};
            local v36 = {
                table.unpack(v34.getProfileInsights(false))
            };
            local v37 = false;
            for _, v39 in v36 do
                v35[v39.targetUserId] = true;
            end;
            for _, v41 in v33 do
                if not v35[v41.targetUserId] then
                    v35[v41.targetUserId] = true;
                    table.insert(v36, v41);
                    v37 = true;
                end;
            end;
            if v37 then
                return v36;
            else
                return (v34.getProfileInsights(false));
            end;
        else
            return v33;
        end;
    end;
    local function v58(v43) --[[ Line: 129 ]] --[[ Name: getProfileInsightsByUserId ]]
        -- upvalues: l_createSignal_0 (ref), v26 (copy), v4 (ref), v21 (ref)
        local l_userIds_0 = v43.userIds;
        local l_count_0 = v43.count;
        local l_rankingStrategy_0 = v43.rankingStrategy;
        if not l_userIds_0 or #l_userIds_0 == 0 then
            return l_createSignal_0({
                status = "success", 
                data = {}
            });
        else
            local v47 = table.concat(l_userIds_0, ",") .. tostring(l_count_0) .. tostring(l_rankingStrategy_0);
            if v26[v47] then
                local l_l_createSignal_0_0 = l_createSignal_0;
                local v49 = v26[v47];
                return l_l_createSignal_0_0({
                    status = "success", 
                    data = v49
                });
            else
                v26[v47] = v4.createProfileInsightsSignalList();
                local v50 = v26[v47];
                local v51 = {
                    status = "fetching", 
                    data = v50
                };
                local v52;
                v50, v52 = l_createSignal_0(v51);
                v21(l_userIds_0, l_count_0, l_rankingStrategy_0, function(v53, v54) --[[ Line: 148 ]]
                    -- upvalues: v26 (ref), v47 (copy), v4 (ref), v52 (copy)
                    if v53 and v54.userInsights then
                        v26[v47].setProfileInsights(v4.createProfileInsightsList(v54.userInsights));
                        local v55 = v26[v47];
                        local v56 = {
                            status = "success", 
                            data = v55
                        };
                        v52(v56);
                        return;
                    else
                        local v57 = {
                            status = "failed", 
                            data = {}
                        };
                        v52(v57);
                        return;
                    end;
                end);
                return v50;
            end;
        end;
    end;
    local function v77(v59) --[[ Line: 163 ]] --[[ Name: getProfileInsightsByPage ]]
        -- upvalues: l_HttpService_0 (ref), v27 (copy), v4 (ref), l_createSignal_0 (ref), v26 (copy), v42 (copy), v21 (ref)
        local v60 = if v59.pageId then v59.pageId else l_HttpService_0:GenerateGUID(false);
        local l_userIds_1 = v59.userIds;
        local l_count_1 = v59.count;
        local l_rankingStrategy_1 = v59.rankingStrategy;
        if not v27[v60] then
            v27[v60] = v4.createProfileInsightsSignalList();
        end;
        if not l_userIds_1 or #l_userIds_1 == 0 then
            local l_l_createSignal_0_1 = l_createSignal_0;
            local v65 = v27[v60];
            return l_l_createSignal_0_1({
                status = "success", 
                data = v65
            });
        else
            local v66 = table.concat(l_userIds_1, ",") .. tostring(l_count_1) .. tostring(l_rankingStrategy_1);
            if v26[v66] then
                v27[v60].setProfileInsights((v42(v60, v26[v66].getProfileInsights(false))));
                local l_l_createSignal_0_2 = l_createSignal_0;
                local v68 = v27[v60];
                return l_l_createSignal_0_2({
                    status = "success", 
                    data = v68
                });
            else
                v26[v66] = v4.createProfileInsightsSignalList();
                local l_l_createSignal_0_3 = l_createSignal_0;
                local v70 = v27[v60];
                local v71;
                l_l_createSignal_0_3, v71 = l_l_createSignal_0_3({
                    status = "success", 
                    data = v70
                });
                v21(l_userIds_1, l_count_1, l_rankingStrategy_1, function(v72, v73) --[[ Line: 185 ]]
                    -- upvalues: v4 (ref), v26 (ref), v66 (copy), v27 (ref), v60 (copy), v42 (ref), v71 (copy)
                    if v72 and v73.userInsights then
                        local v74 = v4.createProfileInsightsList(v73.userInsights);
                        v26[v66].setProfileInsights(v74);
                        v27[v60].setProfileInsights((v42(v60, v74)));
                        local l_v71_0 = v71;
                        local v76 = v27[v60];
                        l_v71_0({
                            status = "success", 
                            data = v76
                        });
                        return;
                    else
                        v71({
                            status = "failed", 
                            data = {}
                        });
                        return;
                    end;
                end);
                return l_l_createSignal_0_3;
            end;
        end;
    end;
    return {
        getProfileInsightsByUserId = v58, 
        getProfileInsightsByPage = v77
    };
end);