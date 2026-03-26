local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v2 = require(l_Parent_0.React);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_TopicInfosReducer_0 = require(l_Parent_0.TopicInfosRodux).TopicInfosReducer;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v7, v8) --[[ Line: 13 ]] --[[ Name: useGameFilterAnalyticsInfo ]]
    -- upvalues: l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), v2 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v10 = l_useSelector_0(function(v9) --[[ Line: 14 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v7 (copy)
        return v9.Personalization[l_TopicInfosReducer_0.key][v7];
    end);
    return v2.useMemo(function() --[[ Line: 19 ]]
        -- upvalues: v10 (copy), v8 (copy)
        if v10 then
            return {
                gameSetTypeId = v10.gameSetTypeId, 
                gameSetTargetId = v10.gameSetTargetId, 
                sortPos = v8
            };
        else
            return {};
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v10, 
        v8
    } else l_dependencyArray_0(v10, v8));
end;