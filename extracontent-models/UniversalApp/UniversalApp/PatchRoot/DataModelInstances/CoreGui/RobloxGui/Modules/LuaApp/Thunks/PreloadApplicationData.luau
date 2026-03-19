local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_Modules_0.LuaApp.Promise);
local v7 = require(l_Modules_0.LuaApp.PromiseUtilities);
local v8 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_NetworkProfiler_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkProfiler;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v11 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local l_HttpCanceller_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.HttpCanceller;
local l_OmniFeedConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedConstants;
local l_Modules_1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_FetchGamesPageData_0 = l_Modules_1.LuaApp.Thunks.FetchGamesPageData;
local l_FetchHomePageData_0 = l_Modules_1.LuaApp.Thunks.FetchHomePageData;
local l_FetchUserDataForHomePage_0 = l_Modules_1.LuaApp.Thunks.FetchUserDataForHomePage;
local v18 = require(l_Modules_0.LuaApp.Thunks.FetchNotificationCount);
local v19 = require(l_Modules_0.LuaApp.Thunks.ApiFetchSiteMessage);
local v20 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAutocompleteLocalCache);
local v21 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local l_ReportToDiagByCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).ReportToDiagByCountryCode;
local v23 = require(l_Modules_0.LuaApp.Analytics.Events.usersFriendsPresenceOnAppStartup);
local v24 = require(l_Modules_0.LuaApp.FlagSettings);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAutocompletePreloadedCacheVarIXP);
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
local _ = function(_) --[[ Line: 37 ]] --[[ Name: preloadChatData ]]
    return {};
end;
local function v47(v29) --[[ Line: 43 ]] --[[ Name: startStandardAppFirstClassPagePreloadOperations ]]
    -- upvalues: v8 (copy), l_FetchHomePageData_0 (copy), l_OmniFeedConstants_0 (copy), v6 (copy), v7 (copy)
    local l_networkImpl_0 = v29.networkImpl;
    local l_analytics_0 = v29.analytics;
    local l_store_0 = v29.store;
    local l_userId_0 = v29.userId;
    local l_loggingProtocol_0 = v29.loggingProtocol;
    local l_omniRecommendationsRequest_0 = v29.omniRecommendationsRequest;
    local l_prefetchProtocol_0 = v29.prefetchProtocol;
    local v37 = {};
    if l_store_0:getState().Startup.HomePageDataStatus == v8.NotStarted then
        if l_loggingProtocol_0 then
            l_loggingProtocol_0:logEventOnce("preload_loading_home");
        end;
        local _ = nil;
        table.insert(v37, (l_store_0:dispatch(l_FetchHomePageData_0(l_networkImpl_0, l_omniRecommendationsRequest_0, l_analytics_0, l_userId_0, v29.policyData.getUseOmniRecommendation(), l_loggingProtocol_0, l_prefetchProtocol_0, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.LogIn, nil, true))));
    elseif l_store_0:getState().Startup.FetchHomePageDataStatusAll == v8.Fetching then
        if l_loggingProtocol_0 then
            l_loggingProtocol_0:logEventOnce("preload_home_already_loading");
        end;
        local v39 = nil;
        do
            local l_v39_0 = v39;
            table.insert(v37, (v6.new(function(v41, v42) --[[ Line: 81 ]]
                -- upvalues: l_v39_0 (ref), l_store_0 (copy), v8 (ref)
                l_v39_0 = l_store_0.changed:connect(function(v43, v44) --[[ Line: 82 ]]
                    -- upvalues: v8 (ref), l_v39_0 (ref), v41 (copy), v42 (copy)
                    if v44.Startup.FetchHomePageDataStatusAll == v8.Fetching and v43.Startup.FetchHomePageDataStatusAll ~= v44.Startup.FetchHomePageDataStatusAll then
                        if l_v39_0 ~= nil then
                            l_v39_0:disconnect();
                            l_v39_0 = nil;
                        end;
                        if v43.Startup.FetchHomePageDataStatusAll == v8.Done then
                            v41();
                            return;
                        else
                            v42();
                        end;
                    end;
                end);
            end)));
        end;
    end;
    return v7.Batch(v37):andThen(function(v45) --[[ Line: 103 ]]
        -- upvalues: l_loggingProtocol_0 (copy), v7 (ref), v37 (copy)
        if l_loggingProtocol_0 then
            l_loggingProtocol_0:logEventOnce("preload_first_class_end");
        end;
        local l_failureCount_0 = v7.CountResults(v45).failureCount;
        if l_failureCount_0 ~= 0 then
            warn(string.format("%d of %d first-class preloading operations failed!", l_failureCount_0, #v37));
            if l_loggingProtocol_0 then
                l_loggingProtocol_0:logEventOnce("preload_first_class_error");
            end;
        end;
    end);
end;
local function v59(v48) --[[ Line: 118 ]] --[[ Name: startStandardAppSecondClassPagePreloadOperations ]]
    -- upvalues: l_FetchUserDataForHomePage_0 (copy), v18 (copy), l_LocalizationService_0 (copy), v25 (copy), v11 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v20 (copy), v24 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), v8 (copy), l_FetchGamesPageData_0 (copy), v5 (copy), v21 (copy), v19 (copy), v7 (copy)
    if v48.loggingProtocol then
        v48.loggingProtocol:logEventOnce("preload_second_class_begin");
    end;
    local l_networkImpl_1 = v48.networkImpl;
    local l_analytics_1 = v48.analytics;
    local l_store_1 = v48.store;
    local l_platform_0 = v48.platform;
    local v53 = {};
    l_store_1:dispatch(l_FetchUserDataForHomePage_0(l_networkImpl_1, v48.userId));
    table.insert(v53, l_store_1:dispatch(v18(l_networkImpl_1)));
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if v25() then
        local l_userId_1 = v48.userId;
        table.insert(v53, (l_store_1:dispatch(v11(l_IXPService_0, l_userId_1)):andThen(function() --[[ Line: 139 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_store_1 (copy), v20 (ref), l_networkImpl_1 (copy), l_RobloxLocaleId_0 (copy)
            local l_variationId_0 = l_IXPService_0:GetUserLayerVariables(l_AppUserLayers_0.SearchAutocompleteLayer).variationId;
            return l_store_1:dispatch(v20.Fetch(l_networkImpl_1, 0, l_RobloxLocaleId_0, l_variationId_0));
        end)));
    else
        table.insert(v53, l_store_1:dispatch(v20.Fetch(l_networkImpl_1, 0, l_RobloxLocaleId_0)));
    end;
    if v24.IsLuaGamesPagePreloadingEnabled(l_platform_0) and (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then l_store_1:getState().Startup.GamesPageDataStatus.status else l_store_1:getState().Startup.GamesPageDataStatus) == v8.NotStarted then
        table.insert(v53, (l_store_1:dispatch(l_FetchGamesPageData_0(l_networkImpl_1, l_analytics_1, nil))));
    end;
    v53 = v5.Dictionary.join(v53, {});
    table.insert(v53, (l_store_1:dispatch(v21(l_networkImpl_1, v48.userId, true))));
    table.insert(v53, l_store_1:dispatch(v19(l_networkImpl_1)));
    return v7.Batch(v53):andThen(function(v57) --[[ Line: 173 ]]
        -- upvalues: v7 (ref), v53 (ref)
        local l_failureCount_1 = v7.CountResults(v57).failureCount;
        if l_failureCount_1 ~= 0 then
            warn(string.format("%d of %d second-class preloading operations failed!", l_failureCount_1, #v53));
        end;
    end);
end;
return function(v60, _, v62, v63, v64, v65, v66) --[[ Line: 182 ]]
    -- upvalues: l_HttpCanceller_0 (copy), l_Players_0 (copy), v47 (copy), l_NetworkProfiler_0 (copy), l_ReportToDiagByCountryCode_0 (copy), v23 (copy), v59 (copy), v6 (copy)
    return function(v67) --[[ Line: 191 ]]
        -- upvalues: v64 (copy), l_HttpCanceller_0 (ref), v60 (copy), v62 (copy), v63 (copy), l_Players_0 (ref), v66 (copy), v47 (ref), l_NetworkProfiler_0 (ref), l_ReportToDiagByCountryCode_0 (ref), v23 (ref), v65 (copy), v59 (ref), v6 (ref)
        if v64 then
            v64:logEventOnce("preload_first_class_begin");
        end;
        local v68 = l_HttpCanceller_0.currentSession();
        local v69 = {
            networkImpl = v60, 
            analytics = v62, 
            store = v67, 
            policyData = v63, 
            platform = v67:getState().Platform, 
            userId = tostring(l_Players_0.LocalPlayer.UserId), 
            loggingProtocol = v64, 
            prefetchProtocol = v66
        };
        return v47(v69):andThen(function() --[[ Line: 207 ]]
            -- upvalues: l_NetworkProfiler_0 (ref), l_ReportToDiagByCountryCode_0 (ref), v23 (ref), v67 (copy), v62 (ref), v68 (copy), l_HttpCanceller_0 (ref), v65 (ref), v59 (ref), v69 (copy), v6 (ref)
            l_NetworkProfiler_0:report(l_ReportToDiagByCountryCode_0);
            v23(v67:getState(), v62);
            if v68 ~= l_HttpCanceller_0.currentSession() then
                return;
            elseif not v65 or v65.isInteractive then
                return v59(v69);
            else
                return v6.new(function(v70) --[[ Line: 223 ]]
                    -- upvalues: v65 (ref), v68 (ref), l_HttpCanceller_0 (ref), v59 (ref), v69 (ref)
                    local v71 = nil;
                    v71 = v65.changed:connect(function() --[[ Line: 225 ]]
                        -- upvalues: v65 (ref), v71 (ref), v68 (ref), l_HttpCanceller_0 (ref), v70 (copy), v59 (ref), v69 (ref)
                        if v65.isInteractive then
                            if v71 ~= nil then
                                v71:disconnect();
                                v71 = nil;
                            end;
                            if v68 ~= l_HttpCanceller_0.currentSession() then
                                return;
                            else
                                v70(v59(v69));
                            end;
                        end;
                    end);
                end);
            end;
        end);
    end;
end;