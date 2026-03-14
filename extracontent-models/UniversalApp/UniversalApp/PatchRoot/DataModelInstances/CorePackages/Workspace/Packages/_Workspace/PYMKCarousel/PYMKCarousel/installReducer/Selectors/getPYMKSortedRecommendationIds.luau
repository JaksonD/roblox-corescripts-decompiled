local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_llama_0 = v1.llama;
local v4 = require(script.Parent.filterOutPYMKRecommendations);
return function(v5) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), l_RoduxFriends_0 (copy), l_llama_0 (copy)
    return function(v6) --[[ Line: 16 ]]
        -- upvalues: v4 (ref), l_RoduxFriends_0 (ref), v5 (copy), l_llama_0 (ref)
        local v7 = v4(l_RoduxFriends_0.Selectors.getSortedByRankRecommendations(v6, v5))(v6);
        return l_llama_0.List.map(v7, function(v8, v9) --[[ Line: 20 ]]
            return {
                id = v8.id, 
                absolutePosition = v9, 
                recommendationRank = v8.rank, 
                recommendationContextType = v8.contextType
            };
        end);
    end;
end;