local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ApiFetchGameIcons_0 = require(l_Parent_0.GameIconRodux).GameIcons.ApiFetchGameIcons;
local l_Functional_0 = require(l_Parent_0.AppCommonLib).Functional;
local v4 = require(l_script_FirstAncestor_0.GamesByPlaceId.GamesMultigetPlaceDetails);
local l_PlaceInfoModel_0 = require(l_Parent_0.PlaceInfoRodux).Models.PlaceInfoModel;
local l_ReceivedPlacesInfos_0 = require(l_Parent_0.PlaceInfoRodux).Actions.ReceivedPlacesInfos;
local l_ConvertUniverseIdToString_0 = require(l_Parent_0.SharedFlags).ConvertUniverseIdToString;
return function(v8, v9) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), l_Functional_0 (copy), l_PlaceInfoModel_0 (copy), l_ConvertUniverseIdToString_0 (copy), l_ReceivedPlacesInfos_0 (copy), l_ApiFetchGameIcons_0 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v9 (copy), v4 (ref), v8 (copy), l_Functional_0 (ref), l_PlaceInfoModel_0 (ref), l_ConvertUniverseIdToString_0 (ref), l_ReceivedPlacesInfos_0 (ref), l_ApiFetchGameIcons_0 (ref)
        if not v9 or #v9 == 0 then
            return;
        else
            return v4(v8, v9):andThen(function(v11) --[[ Line: 18 ]]
                -- upvalues: l_Functional_0 (ref), l_PlaceInfoModel_0 (ref), l_ConvertUniverseIdToString_0 (ref), v10 (copy), l_ReceivedPlacesInfos_0 (ref), l_ApiFetchGameIcons_0 (ref), v8 (ref)
                local l_responseBody_0 = v11.responseBody;
                local v13 = {};
                local v17 = l_Functional_0.Map(l_responseBody_0, function(v14) --[[ Line: 22 ]]
                    -- upvalues: l_PlaceInfoModel_0 (ref), l_ConvertUniverseIdToString_0 (ref), v13 (copy)
                    local v15 = l_PlaceInfoModel_0.fromWeb(v14);
                    local v16 = l_ConvertUniverseIdToString_0(v15.universeId);
                    table.insert(v13, v16);
                    return v15;
                end);
                v10:dispatch(l_ReceivedPlacesInfos_0(v17));
                if #v13 > 0 then
                    v10:dispatch(l_ApiFetchGameIcons_0(v8, v13));
                end;
                return v17;
            end);
        end;
    end;
end;