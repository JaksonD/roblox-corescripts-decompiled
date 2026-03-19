local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local v8 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v8.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v8.FetchStatusNamespace;
local v11 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_NextDataExpirationTimeReducer_0 = v11.NextDataExpirationTimeReducer;
local l_ExpirationTimeNamespace_0 = v11.ExpirationTimeNamespace;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v15 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v15.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v15.Hooks.RoactRodux.useDispatch;
local l_OmniFeedConstants_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedConstants;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v20 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v21 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v22 = v3.strictInterface({
    isOmni = v3.boolean, 
    pageType = v3.string, 
    sortToRefresh = v3.string
});
return v2.memo(function(v23) --[[ Line: 42 ]] --[[ Name: OmniFeedAutoRefresher ]]
    -- upvalues: l_validateProps_0 (copy), v22 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppLogging_0 (copy), v2 (copy), l_useSelector_0 (copy), l_FetchStatusNamespace_0 (copy), l_FetchStatusReducer_0 (copy), l_NextDataExpirationTimeReducer_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_useDispatch_0 (copy), v21 (copy), l_OmniFeedConstants_0 (copy), v20 (copy), l_RetrievalStatus_0 (copy)
    l_validateProps_0(v22, v23);
    local v24 = l_useRoactService_0(l_RoactNetworking_0);
    local v25 = l_useRoactService_0(l_AppLogging_0);
    local l_sortToRefresh_0 = v23.sortToRefresh;
    local v27 = v2.useRef(nil);
    local v28 = v2.useRef(nil);
    local v33 = l_useSelector_0(function(v29) --[[ Line: 53 ]]
        -- upvalues: v23 (copy), l_FetchStatusNamespace_0 (ref), l_sortToRefresh_0 (copy), l_FetchStatusReducer_0 (ref)
        local v30 = nil;
        local v31 = nil;
        if v23.isOmni then
            v30 = l_FetchStatusNamespace_0.OmniRecommendations;
            v31 = v23.pageType;
        else
            v30 = l_FetchStatusNamespace_0.GameSortToken;
            v31 = l_sortToRefresh_0;
        end;
        local v32 = v29.Personalization[l_FetchStatusReducer_0.key][v30];
        if v32 then
            return v32[v31];
        else
            return nil;
        end;
    end);
    local v37 = l_useSelector_0(function(v34) --[[ Line: 72 ]]
        -- upvalues: v23 (copy), l_NextDataExpirationTimeReducer_0 (ref), l_ExpirationTimeNamespace_0 (ref)
        if v23.isOmni then
            local l_OmniRecommendationsRefreshTime_0 = v34.OmniRecommendationsRefreshTime;
            if l_OmniRecommendationsRefreshTime_0 then
                return l_OmniRecommendationsRefreshTime_0[v23.pageType];
            end;
        else
            local v36 = v34.Personalization[l_NextDataExpirationTimeReducer_0.key][l_ExpirationTimeNamespace_0.GameSortGroup];
            if v36 then
                return v36[v23.sortToRefresh];
            end;
        end;
        return nil;
    end);
    local v38 = l_useDispatch_0();
    local v39 = v2.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v27 (copy), v37 (copy), v23 (copy), v38 (copy), v21 (ref), v24 (copy), l_OmniFeedConstants_0 (ref), v25 (copy), v20 (ref), l_sortToRefresh_0 (copy)
        v27.current = v37;
        if v23.isOmni then
            v38(v21(v24, nil, v23.pageType, nil, nil, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.AutoRefresh, v25));
            return;
        else
            v38(v20(v24, l_sortToRefresh_0, nil)):catch(function() --[[ Line: 106 ]]

            end);
            return;
        end;
    end, {
        v37, 
        v23.isOmni, 
        v38, 
        v24, 
        nil, 
        v23.pageType, 
        v25, 
        l_sortToRefresh_0
    });
    v2.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v33 (copy), l_RetrievalStatus_0 (ref), v37 (copy), v27 (copy), v28 (copy), v39 (copy)
        if v33 ~= l_RetrievalStatus_0.Done then
            return;
        elseif not v37 or v37 <= 0 then
            return;
        elseif v27.current and v37 <= v27.current then
            return;
        else
            local v43 = task.defer(function(v40) --[[ Line: 137 ]]
                -- upvalues: v28 (ref), v39 (ref)
                v28.current = true;
                local v41 = v40 - tick();
                while v41 > 0 and v28.current do
                    local v42 = math.min(v41, 300);
                    task.wait(v42);
                    v41 = v40 - tick();
                end;
                if v28.current then
                    v39();
                    v28.current = nil;
                end;
            end, v37);
            return function() --[[ Line: 155 ]]
                -- upvalues: v43 (copy), v28 (ref)
                if v43 and v28.current then
                    task.cancel(v43);
                    v28.current = nil;
                end;
            end;
        end;
    end, {
        v33, 
        v37, 
        v39
    });
    return nil;
end);