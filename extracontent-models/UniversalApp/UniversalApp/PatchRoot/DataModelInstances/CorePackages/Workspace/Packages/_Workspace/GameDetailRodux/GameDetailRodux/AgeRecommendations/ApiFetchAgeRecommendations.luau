local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.AgeRecommendations.AgeRecommendationDetails);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v7 = require(l_script_FirstAncestor_0.AgeRecommendations.SetAgeRecommendation);
local v8 = require(l_script_FirstAncestor_0.AgeRecommendations.SetAgeRecommendationHeaders);
local v9 = require(l_script_FirstAncestor_0.AgeRecommendations.GetAgeRecommendation);
local v10 = {};
local function _(v11) --[[ Line: 17 ]] --[[ Name: fetchKeymapper ]]
    return "luaapp.experience_guidelines.get-age-guidelines" .. v11;
end;
v10.Fetch = function(v13, v14) --[[ Line: 21 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v9 (copy), v4 (copy), l_Logging_0 (copy), v3 (copy), v7 (copy), v8 (copy), l_SetNetworkingErrorToast_0 (copy)
    return l_PerformFetch_0.Single("luaapp.experience_guidelines.get-age-guidelines" .. v14, function(v15) --[[ Line: 22 ]]
        -- upvalues: v9 (ref), v13 (copy), v14 (copy), v4 (ref), l_Logging_0 (ref), v3 (ref), v7 (ref), v8 (ref), l_SetNetworkingErrorToast_0 (ref)
        return v9(v13, v14):andThen(function(v16) --[[ Line: 23 ]]
            -- upvalues: v4 (ref), l_Logging_0 (ref), v14 (ref), v3 (ref), v15 (copy), v7 (ref), v8 (ref)
            local l_responseBody_0 = v16.responseBody;
            if l_responseBody_0 ~= nil then
                local v18, v19 = v4.fromJsonData(l_responseBody_0.ageRecommendationDetails):unwrap();
                if v18 == false then
                    l_Logging_0.warn("Failed to parse AgeRecommendationDetails for `" .. v14 .. "`");
                    return v3.reject(v16);
                else
                    v15:dispatch(v7(v14, v19));
                    local l_headerDisplayName_0 = l_responseBody_0.headerDisplayName;
                    local l_headerDisplayNameShort_0 = l_responseBody_0.headerDisplayNameShort;
                    v15:dispatch(v8(l_headerDisplayName_0, l_headerDisplayNameShort_0));
                    return v3.resolve(v16);
                end;
            else
                l_Logging_0.warn("Response from GetAgeRecommendation is malformed!");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v22) --[[ Line: 46 ]]
            -- upvalues: v15 (copy), l_SetNetworkingErrorToast_0 (ref), v3 (ref)
            v15:dispatch(l_SetNetworkingErrorToast_0(v22));
            return v3.reject(v22);
        end);
    end);
end;
v10.GetFetchingStatus = function(v23, v24) --[[ Line: 53 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v23, "luaapp.experience_guidelines.get-age-guidelines" .. v24);
end;
return v10;