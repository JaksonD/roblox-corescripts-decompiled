local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v2 = require(l_Parent_0.React);
local l_TopicInfosReducer_0 = require(l_Parent_0.TopicInfosRodux).TopicInfosReducer;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v6, v7) --[[ Line: 11 ]] --[[ Name: useGameFilterAnalyticsInfo ]]
    -- upvalues: l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), v2 (copy), l_dependencyArray_0 (copy)
    local v9 = l_useSelector_0(function(v8) --[[ Line: 12 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v6 (copy)
        return v8.Personalization[l_TopicInfosReducer_0.key][v6];
    end);
    return v2.useMemo(function() --[[ Line: 16 ]]
        -- upvalues: v9 (copy), v7 (copy)
        if v9 then
            return {
                gameSetTypeId = v9.gameSetTypeId, 
                gameSetTargetId = v9.gameSetTargetId, 
                sortPos = v7
            };
        else
            return {};
        end;
    end, l_dependencyArray_0(v9, v7));
end;