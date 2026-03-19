local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_BtnValues_0 = require(l_Parent_0.Analytics).BtnValues;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local v5 = require(l_Parent_0.Flags.getFIntPYMKSeeAllTileLimit);
return function(v6) --[[ Line: 25 ]] --[[ Name: usePYMKCarouselItemList ]]
    -- upvalues: l_React_0 (copy), l_BtnValues_0 (copy), v5 (copy), l_dependencyArray_0 (copy)
    return l_React_0.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v6 (copy), l_BtnValues_0 (ref), v5 (ref)
        if not v6.findFriendsTileEnabled and not v6.seeAllTileEnabled then
            return v6.recommendationIds;
        else
            local v7 = table.clone(v6.recommendationIds);
            if v6.findFriendsTileEnabled then
                table.insert(v7, 1, {
                    id = l_BtnValues_0.FindFriends.rawValue(), 
                    isButtonTile = true
                });
                if v6.recommendationCount == 0 then
                    table.insert(v7, {
                        id = "_findFriendsTooltip", 
                        isTooltip = true
                    });
                end;
            end;
            if v6.seeAllTileEnabled and v6.recommendationCount > v5() then
                table.insert(v7, {
                    id = l_BtnValues_0.SeeAll.rawValue(), 
                    isButtonTile = true
                });
            end;
            return v7;
        end;
    end, l_dependencyArray_0(v6.recommendationIds, v6.findFriendsTileEnabled));
end;