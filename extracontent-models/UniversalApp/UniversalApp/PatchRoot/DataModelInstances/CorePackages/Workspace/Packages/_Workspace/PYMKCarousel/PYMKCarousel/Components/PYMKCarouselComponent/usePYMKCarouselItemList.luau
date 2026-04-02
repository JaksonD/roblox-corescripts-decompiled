local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_BtnValues_0 = require(l_Parent_0.Analytics).BtnValues;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local v5 = require(l_Parent_0.Flags.getFIntPYMKSeeAllTileLimit);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.Parent.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v7) --[[ Line: 29 ]] --[[ Name: usePYMKCarouselItemList ]]
    -- upvalues: l_React_0 (copy), l_BtnValues_0 (copy), v5 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    return l_React_0.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v7 (copy), l_BtnValues_0 (ref), v5 (ref)
        if not v7.findFriendsTileEnabled and not v7.seeAllTileEnabled then
            return v7.recommendationIds;
        else
            local v8 = table.clone(v7.recommendationIds);
            if v7.findFriendsTileEnabled then
                table.insert(v8, 1, {
                    id = l_BtnValues_0.FindFriends.rawValue(), 
                    isButtonTile = true
                });
                if v7.recommendationCount == 0 then
                    table.insert(v8, {
                        id = "_findFriendsTooltip", 
                        isTooltip = true
                    });
                end;
            end;
            if v7.seeAllTileEnabled and v7.recommendationCount > v5() then
                table.insert(v8, {
                    id = l_BtnValues_0.SeeAll.rawValue(), 
                    isButtonTile = true
                });
            end;
            return v8;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v7.recommendationIds, 
        v7.findFriendsTileEnabled
    } else l_dependencyArray_0(v7.recommendationIds, v7.findFriendsTileEnabled));
end;