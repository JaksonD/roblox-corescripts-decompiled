local l_script_FirstAncestor_0 = script:FindFirstAncestor("FetchStatusRodux");
local v1 = require(l_script_FirstAncestor_0.SetFetchStatus);
local v2 = require(l_script_FirstAncestor_0.FetchStatusNamespace);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagLuaAppSortDeeplinkFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSortDeeplinkFix;
local function v7() --[[ Line: 11 ]] --[[ Name: initializeFetchStatus ]]
    -- upvalues: v2 (copy), l_RetrievalStatus_0 (copy), l_FFlagLuaAppSortDeeplinkFix_0 (copy)
    return {
        [v2.GameSortToken] = {
            Games = l_RetrievalStatus_0.NotStarted, 
            HomeGames = l_RetrievalStatus_0.NotStarted, 
            GamesSeeAll = l_RetrievalStatus_0.NotStarted, 
            GamesList = if l_FFlagLuaAppSortDeeplinkFix_0 then l_RetrievalStatus_0.NotStarted else nil
        }, 
        [v2.GameSorts] = {}, 
        [v2.OmniRecommendations] = {}, 
        [v2.SearchLandingPage] = {}
    };
end;
return {
    key = "FetchStatusKey", 
    reducer = function(v8, v9) --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v1 (copy)
        v8 = v8 or v7();
        if v9.type == v1.name then
            assert(v8, "state should always exist, assert for linter");
            local l_fetchNamespace_0 = v9.fetchNamespace;
            local l_fetchKey_0 = v9.fetchKey;
            assert(l_fetchNamespace_0, "SetFetchStatus does not have a valid fetch namespace");
            assert(l_fetchKey_0, (("SetFetchStatus does not have a valid fetch key for namespace %*"):format(l_fetchNamespace_0)));
            local v12 = v8[l_fetchNamespace_0];
            if not v12 then
                warn((("No namespace %* defined in FetchStatusReducer for action"):format(l_fetchNamespace_0)));
                return v8;
            else
                assert(v12, "namespaceState should always exist, assert for linter");
                local v13 = table.clone(v12);
                v13[l_fetchKey_0] = v9.fetchStatus;
                local v14 = table.clone(v8);
                v14[l_fetchNamespace_0] = v13;
                return v14;
            end;
        else
            return v8;
        end;
    end
};