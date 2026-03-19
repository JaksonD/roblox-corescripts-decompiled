local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v3 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_callOnce_0 = require(l_Parent_0.AppCommonLib).callOnce;
local l_MemStorageKeys_0 = require(l_Parent_0.RobloxAppEnums).MemStorageKeys;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v9 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v10 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData);
local v11 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v12 = require(l_Modules_0.LuaApp.Actions.SetHomePageDataStatus);
local v13 = require(l_Modules_0.LuaApp.Actions.SetFetchHomePageDataStatusAll);
local v14 = require(l_Modules_0.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation);
local v15 = require(l_Modules_0.LuaApp.Thunks.FetchUserDataForHomePage);
local v16 = require(l_Modules_0.LuaApp.Flags.GetIxpPerfRegressionTestSeconds);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagPageLoadTimeHome");
local function v47(v19, v20, v21, v22, v23, v24, v25, v26, v27, _, v29) --[[ Line: 25 ]] --[[ Name: fetchHomePageData ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v3 (copy), v12 (copy), v13 (copy), v17 (copy), v14 (copy), v9 (copy), l_AppPage_0 (copy), v11 (copy), l_GameSortGroups_0 (copy), v16 (copy), l_callOnce_0 (copy), l_MemStorageKeys_0 (copy), v15 (copy), l_FVariable_0 (copy), v10 (copy)
    if v23:getState().Startup.HomePageDataStatus == l_RetrievalStatus_0.Fetching then
        return v3.resolve("home page data is already fetching");
    else
        if v25 then
            v25:logEvent("fetch_homepage_data_begin");
        end;
        local v30 = tick();
        v23:dispatch(v12(l_RetrievalStatus_0.Fetching));
        v23:dispatch(v13(l_RetrievalStatus_0.Fetching));
        if v17() then
            v23:dispatch(v14(v19));
        end;
        local v32 = v24 and function() --[[ Line: 56 ]]
            -- upvalues: v26 (copy), v23 (copy), v9 (ref), v19 (copy), v20 (copy), l_AppPage_0 (ref), v27 (copy), v25 (copy)
            local v31 = nil;
            if v26 then
                v31 = v26:popPendingPrefetchGuid();
            end;
            return v23:dispatch(v9(v19, v20, l_AppPage_0.Home, nil, v31, v27, v25, true));
        end or function() --[[ Line: 74 ]]
            -- upvalues: v23 (copy), v11 (ref), v19 (copy), l_GameSortGroups_0 (ref)
            return v23:dispatch(v11(v19, l_GameSortGroups_0.HomeGames, nil));
        end;
        local function _() --[[ Line: 78 ]]
            -- upvalues: v16 (ref), l_callOnce_0 (ref), l_MemStorageKeys_0 (ref)
            local v33, v34 = v16();
            if not v33 then
                return;
            else
                l_callOnce_0(l_MemStorageKeys_0.PerfRegressionTestTTI, function() --[[ Line: 84 ]]
                    -- upvalues: v34 (copy)
                    if v34 ~= 0 then
                        task.wait(v34);
                    end;
                end);
                return;
            end;
        end;
        if not v29 then
            v23:dispatch(v15(v19, v22));
        end;
        if v24 then
            return v32():andThen(function(_) --[[ Line: 96 ]]
                -- upvalues: v16 (ref), l_callOnce_0 (ref), l_MemStorageKeys_0 (ref), v23 (copy), v12 (ref), l_RetrievalStatus_0 (ref), v13 (ref), v30 (copy), v21 (copy), l_FVariable_0 (ref), v25 (copy)
                local v37, v38 = v16();
                if v37 then
                    l_callOnce_0(l_MemStorageKeys_0.PerfRegressionTestTTI, function() --[[ Line: 84 ]]
                        -- upvalues: v38 (copy)
                        if v38 ~= 0 then
                            task.wait(v38);
                        end;
                    end);
                end;
                v23:dispatch(v12(l_RetrievalStatus_0.Done));
                v23:dispatch(v13(l_RetrievalStatus_0.Done));
                v37 = (tick() - v30) * 1000;
                v21.Diag:reportStats(l_FVariable_0, v37);
                if v25 then
                    v25:logEvent("fetch_homepage_data_end");
                end;
            end, function(_) --[[ Line: 106 ]]
                -- upvalues: v23 (copy), v12 (ref), l_RetrievalStatus_0 (ref), v13 (ref), v25 (copy)
                v23:dispatch(v12(l_RetrievalStatus_0.Failed));
                v23:dispatch(v13(l_RetrievalStatus_0.Failed));
                if v25 then
                    v25:logEvent("fetch_homepage_data_error");
                end;
            end);
        else
            return v32():andThen(function(_) --[[ Line: 115 ]]
                -- upvalues: v23 (copy), v12 (ref), l_RetrievalStatus_0 (ref), v10 (ref), v19 (copy), l_GameSortGroups_0 (ref), v3 (ref)
                v23:dispatch(v12(l_RetrievalStatus_0.Done));
                local v41 = {
                    v23:dispatch(v10(v19, l_GameSortGroups_0.HomeGames))
                };
                return v3.all(v41);
            end, function(v42) --[[ Line: 122 ]]
                -- upvalues: v23 (copy), v12 (ref), l_RetrievalStatus_0 (ref), v3 (ref)
                v23:dispatch(v12(l_RetrievalStatus_0.Failed));
                return v3.reject(v42);
            end):andThen(function(_) --[[ Line: 126 ]]
                -- upvalues: v23 (copy), l_RetrievalStatus_0 (ref), v13 (ref), v30 (copy), v21 (copy), l_FVariable_0 (ref), v25 (copy)
                local v44 = v23:getState().Startup.HomePageDataStatus == l_RetrievalStatus_0.Failed;
                v23:dispatch(v13(v44 and l_RetrievalStatus_0.Failed or l_RetrievalStatus_0.Done));
                local v45 = (tick() - v30) * 1000;
                v21.Diag:reportStats(l_FVariable_0, v45);
                if v25 then
                    v25:logEvent("fetch_homepage_data_end");
                end;
            end, function(_) --[[ Line: 137 ]]
                -- upvalues: v23 (copy), v13 (ref), l_RetrievalStatus_0 (ref), v25 (copy)
                v23:dispatch(v13(l_RetrievalStatus_0.Failed));
                if v25 then
                    v25:logEvent("fetch_homepage_data_error");
                end;
            end);
        end;
    end;
end;
return function(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57) --[[ Line: 146 ]]
    -- upvalues: v47 (copy)
    return function(v58) --[[ Line: 158 ]]
        -- upvalues: v47 (ref), v48 (copy), v49 (copy), v50 (copy), v51 (copy), v52 (copy), v53 (copy), v54 (copy), v55 (copy), v56 (copy), v57 (copy)
        return v47(v48, v49, v50, v51, v58, v52, v53, v54, v55, v56, v57);
    end;
end;