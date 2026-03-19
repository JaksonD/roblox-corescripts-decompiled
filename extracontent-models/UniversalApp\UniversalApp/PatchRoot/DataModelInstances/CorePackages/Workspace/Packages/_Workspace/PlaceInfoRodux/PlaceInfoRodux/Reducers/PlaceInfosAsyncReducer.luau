local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceInfoRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_RequestMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).RequestMultiplePlaceInfos;
local l_FailedToFetchMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).FailedToFetchMultiplePlaceInfos;
local l_ReceivedMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).ReceivedMultiplePlaceInfos;
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: l_RequestMultiplePlaceInfos_0 (copy), l_Immutable_0 (copy), l_ReceivedMultiplePlaceInfos_0 (copy), l_FailedToFetchMultiplePlaceInfos_0 (copy)
    v6 = v6 or {};
    if v7.type == l_RequestMultiplePlaceInfos_0.name then
        local v8 = {};
        for _, v10 in ipairs(v7.placeIds) do
            v8[v10] = true;
        end;
        return l_Immutable_0.JoinDictionaries(v6, v8);
    elseif v7.type == l_ReceivedMultiplePlaceInfos_0.name then
        local v11 = {};
        for _, v13 in ipairs(v7.placeInfos) do
            v11[v13.placeId] = false;
        end;
        return l_Immutable_0.JoinDictionaries(v6, v11);
    elseif v7.type == l_FailedToFetchMultiplePlaceInfos_0.name then
        local v14 = {};
        for _, v16 in ipairs(v7.placeIds) do
            v14[v16] = false;
        end;
        return l_Immutable_0.JoinDictionaries(v6, v14);
    else
        return v6;
    end;
end;