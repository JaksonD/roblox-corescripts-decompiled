local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceInfoRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Functional_0 = require(l_Parent_0.AppCommonLib).Functional;
local l_GetPlaceInfos_0 = require(l_script_FirstAncestor_0.Requests).GetPlaceInfos;
local l_PlaceInfoModel_0 = require(l_script_FirstAncestor_0.Models).PlaceInfoModel;
local l_ReceivedMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).ReceivedMultiplePlaceInfos;
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: l_GetPlaceInfos_0 (copy), l_Functional_0 (copy), l_PlaceInfoModel_0 (copy), l_ReceivedMultiplePlaceInfos_0 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: l_GetPlaceInfos_0 (ref), v6 (copy), v7 (copy), l_Functional_0 (ref), l_PlaceInfoModel_0 (ref), l_ReceivedMultiplePlaceInfos_0 (ref)
        return l_GetPlaceInfos_0(v6, v7):andThen(function(v9) --[[ Line: 12 ]]
            -- upvalues: l_Functional_0 (ref), l_PlaceInfoModel_0 (ref), v8 (copy), l_ReceivedMultiplePlaceInfos_0 (ref)
            local l_responseBody_0 = v9.responseBody;
            local v12 = l_Functional_0.Map(l_responseBody_0, function(v11) --[[ Line: 15 ]]
                -- upvalues: l_PlaceInfoModel_0 (ref)
                return l_PlaceInfoModel_0.fromWeb(v11);
            end);
            v8:dispatch(l_ReceivedMultiplePlaceInfos_0(v12));
            return v12;
        end):catch(function(v13) --[[ Line: 22 ]]
            warn("ApiFetchlaceInfos failed with error code " .. tostring(v13.HttpError));
        end);
    end;
end;