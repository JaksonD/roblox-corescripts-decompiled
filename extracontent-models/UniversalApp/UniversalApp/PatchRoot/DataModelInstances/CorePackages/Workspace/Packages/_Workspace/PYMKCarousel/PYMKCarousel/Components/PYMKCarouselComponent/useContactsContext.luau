local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.tutils);
local l_useSelector_0 = v1.Hooks.useSelector;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
return function(v8) --[[ Line: 33 ]] --[[ Name: useContactsContext ]]
    -- upvalues: l_useSelector_0 (copy), l_RoduxFriends_0 (copy), v4 (copy), v3 (copy), l_RecommendationContextType_0 (copy)
    local v11 = l_useSelector_0(function(v9) --[[ Line: 34 ]]
        -- upvalues: l_RoduxFriends_0 (ref)
        local v10 = tostring(v9.LocalUserId);
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v9)(v10) or {};
    end, v4.shallowEqual);
    return (v3.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v8 (copy), l_RecommendationContextType_0 (ref), v11 (copy)
        local v12 = {};
        for _, v14 in v8 do
            if v14.recommendationContextType == l_RecommendationContextType_0.Contacts then
                local l_id_0 = v14.id;
                local v16 = v11[l_id_0];
                if v16 then
                    v12[l_id_0] = {
                        isLoading = false, 
                        name = v16.entityDisplayName or "", 
                        avatarThumbnailUrl = if v16.thumbnailEntities then v16.thumbnailEntities.headshotImageUrl or "" else ""
                    };
                end;
            end;
        end;
        return {
            contacts = v12
        };
    end, {
        v8, 
        v11
    }));
end;