local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileInsights");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0["data-hydration"].ProfileInsightsStore);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.React);
return function(v5) --[[ Line: 14 ]] --[[ Name: useSignalProfileInsightsByUserId ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v6 = v2(false).getProfileInsightsByUserId({
        userIds = {
            v5.userId
        }, 
        rankingStrategy = v5.rankingStrategy
    });
    local v7 = v3.useSignalState(v6(false).data.getProfileInsights);
    return v4.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v7 (copy), v5 (copy)
        for _, v9 in v7 do
            if v9.targetUserId == v5.userId then
                return v9;
            end;
        end;
        return {};
    end, {
        v7
    }), v6(false).status == "fetching";
end;