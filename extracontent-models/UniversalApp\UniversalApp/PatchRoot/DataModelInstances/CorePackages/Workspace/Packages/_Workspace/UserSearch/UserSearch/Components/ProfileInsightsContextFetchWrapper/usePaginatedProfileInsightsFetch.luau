local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.useProfileInsightsFetch);
local v5 = require(l_script_FirstAncestor_0.Utils.useMatchSearchPagination);
local v6 = require(l_Parent_0.ProfileInsights);
local v7 = require(l_Parent_0.SignalsReact);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local _ = require(l_Parent_0.GraphQLServer);
local l_GetFFlagEnableProfileInsightsApolloMigration_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration;
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_Parent_0.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local function v15(v12) --[[ Line: 30 ]]
    -- upvalues: v3 (copy)
    return v3.reduce(v12, function(v13, v14) --[[ Line: 31 ]]
        v13[v14.targetUserId] = v14;
        return v13;
    end, {});
end;
local function _(v16) --[[ Line: 39 ]]
    return "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. v16;
end;
return function(v18) --[[ Line: 43 ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy), l_GetFFlagEnableProfileInsightsApolloMigration_0 (copy), v6 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), v7 (copy), v4 (copy), v15 (copy)
    local v19 = v18.users or {};
    local v20 = v5({
        users = v19
    });
    local v22 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v3 (ref), v20 (copy)
        return v3.map(v20, function(v21) --[[ Line: 48 ]]
            return v21.id;
        end);
    end, {
        v20
    });
    local v23 = {};
    if l_GetFFlagEnableProfileInsightsApolloMigration_0() then
        local v24 = v6.ProfileInsightsStore(false).getProfileInsightsByPage({
            pageId = "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. v18.searchKeyword, 
            userIds = v22, 
            rankingStrategy = if l_FFlagPlayerSearchEnableOnlineFrequents_0 then v18.rankingStrategy else nil
        });
        v23 = v7.useSignalState(v24(false).data.getProfileInsights);
    else
        local v25 = v4(v22, v18.searchKeyword, if l_FFlagPlayerSearchEnableOnlineFrequents_0 then v18.rankingStrategy else nil);
        v23 = if v25.data and v25.data.profilesInsights then v25.data.profilesInsights.profileInsights else {};
    end;
    return (v2.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v15 (ref), v23 (ref)
        return v15(v23);
    end, {
        v23
    }));
end;