local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.AgeVerificationOverlay.GetShowAgeVerificationOverlay);
local v2 = require(l_script_FirstAncestor_0.AgeVerificationOverlay.SetShowAgeVerificationOverlay);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFFlagLogExposureForExperienceUpsell);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
return {
    KeyMapper = function(v9) --[[ Line: 15 ]] --[[ Name: keyMapper ]]
        return "luaapp.showageverificationoverlay." .. v9;
    end, 
    Fetch = function(v10, v11, v12) --[[ Line: 21 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v1 (copy), l_mutedError_0 (copy), v2 (copy), v3 (copy), v5 (copy), l_Logging_0 (copy)
        if type(v11) ~= "string" then
            error("ApiFetchShowAgeVerificationOverlay thunk expects universeId to be a string");
        end;
        v12 = v12 or "";
        if type(v12) ~= "string" then
            error("ApiFetchShowAgeVerificationOverlay thunk expects placeId to be a string");
        end;
        return l_PerformFetch_0.Single("luaapp.showageverificationoverlay." .. v11, function(v13) --[[ Line: 31 ]]
            -- upvalues: v1 (ref), v10 (copy), v11 (copy), v12 (ref), l_mutedError_0 (ref), v2 (ref), v3 (ref), v5 (ref), l_Logging_0 (ref)
            return v1(v10, v11, v12):andThen(function(v14) --[[ Line: 32 ]]
                -- upvalues: l_mutedError_0 (ref), v11 (ref), v13 (copy), v2 (ref), v3 (ref), v5 (ref), l_Logging_0 (ref)
                local l_responseBody_0 = v14.responseBody;
                local v16 = false;
                if l_responseBody_0.voiceSettings ~= nil then
                    v16 = l_responseBody_0.voiceSettings.isVoiceEnabled;
                end;
                if l_responseBody_0.showAgeVerificationOverlay then
                    l_mutedError_0((("showAgeVerificationOverlay is deprecated but was truthy for universe %*"):format(v11)));
                end;
                if l_responseBody_0 ~= nil and l_responseBody_0.showAgeVerificationOverlay ~= nil and l_responseBody_0.universePlaceVoiceEnabledSettings ~= nil then
                    local l_isPlaceEnabledForVoice_0 = l_responseBody_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
                    local l_isUniverseEnabledForVoice_0 = l_responseBody_0.universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice;
                    local l_isUniverseEnabledForAvatarVideo_0 = l_responseBody_0.universePlaceVoiceEnabledSettings.isUniverseEnabledForAvatarVideo;
                    v13:dispatch(v2(v11, l_isPlaceEnabledForVoice_0, l_isUniverseEnabledForVoice_0, v16, l_responseBody_0.showVoiceOptInOverlay, l_isUniverseEnabledForAvatarVideo_0, if v3() then l_responseBody_0.elegibleToSeeVoiceUpsell else nil));
                    return v5.resolve(v14);
                else
                    l_Logging_0.warn("Response from GetShowAgeVerificationOverlay is malformed!");
                    return v5.reject({
                        HttpError = Enum.HttpError.OK
                    });
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v20, v21) --[[ Line: 72 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v20, "luaapp.showageverificationoverlay." .. v21);
    end
};