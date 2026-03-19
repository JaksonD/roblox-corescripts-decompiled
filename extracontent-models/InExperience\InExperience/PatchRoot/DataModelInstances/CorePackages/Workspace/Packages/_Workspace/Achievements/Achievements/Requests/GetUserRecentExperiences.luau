local l_Parent_0 = script:FindFirstAncestor("Achievements").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Dash);
local l_MakeOmniRecommendationsRequest_0 = require(l_Parent_0.GraphQlShared).MakeOmniRecommendationsRequest;
return function(v4, _) --[[ Line: 44 ]]
    -- upvalues: l_MakeOmniRecommendationsRequest_0 (copy), v1 (copy), v2 (copy)
    return l_MakeOmniRecommendationsRequest_0(v4, "Home", "0", nil, nil, nil, {
        (tostring(100000003))
    }):andThen(function(v6) --[[ Line: 47 ]]
        -- upvalues: v1 (ref), v2 (ref)
        if v6.responseBody == nil then
            return v1.reject("Response has no body.");
        else
            local l_sorts_0 = v6.responseBody.sorts;
            if not l_sorts_0 then
                return v1.reject("Response has no sorts.");
            else
                local v8 = {};
                for _, v10 in pairs(l_sorts_0) do
                    if v10.topicId == 100000003 then
                        local l_recommendationList_0 = v10.recommendationList;
                        if not l_recommendationList_0 then
                            return v1.reject("No recommendation list found in sorts.");
                        else
                            v8 = l_recommendationList_0;
                            break;
                        end;
                    end;
                end;
                local v12 = #v8;
                if not v2.find(v8, function(v13) --[[ Line: 73 ]]
                    return v13.contentId == game.GameId;
                end) then
                    v12 = v12 + 1;
                end;
                return v1.resolve(v12);
            end;
        end;
    end);
end;