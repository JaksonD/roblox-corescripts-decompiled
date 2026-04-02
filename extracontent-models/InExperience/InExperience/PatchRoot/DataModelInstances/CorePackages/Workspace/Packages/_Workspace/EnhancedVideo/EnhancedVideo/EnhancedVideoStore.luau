local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Loggers);
local v5 = require(l_Parent_0.EnhancedVideoTelemetry);
local l_flaggedMutedError_0 = v4.flaggedMutedError;
local l_createSignal_0 = v2.createSignal;
local v8 = require(l_Parent_0.serveEnhancedVideo);
local v9 = v3.interface({
    adDisclosureText = v3.string, 
    showAdPreferencesUrl = v3.boolean, 
    videoAssetId = v3.string
});
createEnhancedVideoStore = function() --[[ Line: 30 ]] --[[ Name: createEnhancedVideoStore ]]
    -- upvalues: l_createSignal_0 (copy), v8 (copy), v9 (copy), l_flaggedMutedError_0 (copy), v5 (copy)
    local v10, v11 = l_createSignal_0("");
    local v12, v13 = l_createSignal_0(false);
    local v14, v15 = l_createSignal_0("");
    local function v21(v16, v17) --[[ Line: 35 ]] --[[ Name: fetchInitialData ]]
        -- upvalues: v8 (ref), v9 (ref), l_flaggedMutedError_0 (ref), v11 (copy), v13 (copy), v15 (copy), v5 (ref)
        v8(v16, v17):andThen(function(v18) --[[ Line: 37 ]]
            -- upvalues: v9 (ref), l_flaggedMutedError_0 (ref), v17 (copy), v11 (ref), v13 (ref), v15 (ref)
            local l_responseBody_0 = v18.responseBody;
            if not v9(l_responseBody_0) then
                l_flaggedMutedError_0("EnhancedVideo_InvalidResponseSchema", (("Response does not match expected schema for universe $%*"):format(v17)));
                return;
            else
                v11(l_responseBody_0.adDisclosureText);
                v13(l_responseBody_0.showAdPreferencesUrl);
                v15(l_responseBody_0.videoAssetId);
                return;
            end;
        end):catch(function(v20) --[[ Line: 50 ]]
            -- upvalues: v5 (ref)
            v5.logServeEnhancedVideoError((tostring(v20)));
        end);
    end;
    return {
        getAdDisclosureText = v10, 
        getShowAdPreferencesUrl = v12, 
        getVideoAssetId = v14, 
        fetchInitialData = v21
    };
end;
return v2.createComputed(createEnhancedVideoStore);