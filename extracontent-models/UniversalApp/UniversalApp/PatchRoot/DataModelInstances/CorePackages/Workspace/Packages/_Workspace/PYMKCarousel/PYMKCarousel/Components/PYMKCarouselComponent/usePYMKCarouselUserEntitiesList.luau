local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Dash);
local l_EntityType_0 = require(l_Parent_1.UserList).Enums.EntityType;
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
return function(v7) --[[ Line: 23 ]] --[[ Name: usePYMKCarouselUserEntitiesList ]]
    -- upvalues: v3 (copy), v4 (copy), l_RecommendationContextType_0 (copy), l_EntityType_0 (copy)
    return v3.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v4 (ref), v7 (copy), l_RecommendationContextType_0 (ref), l_EntityType_0 (ref)
        return v4.map(v4.filter(v7, function(v8) --[[ Line: 26 ]]
            return not v8.isButtonTile and not v8.isTooltip;
        end), function(v9) --[[ Line: 30 ]]
            -- upvalues: l_RecommendationContextType_0 (ref), l_EntityType_0 (ref)
            return {
                id = v9.id, 
                type = if v9.recommendationContextType == l_RecommendationContextType_0.Contacts then l_EntityType_0.Contact else l_EntityType_0.User
            };
        end);
    end, {
        v7
    });
end;