local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_SharedFlags_0 = v1.SharedFlags;
local l_default_0 = v1.LinkingProtocol.LinkingProtocol.default;
local l_SettingsRoute_0 = v1.LinkingProtocol.Enums.SettingsRoute;
local l_FFlagEnableRetryForLinkingProtocolFetch_0 = l_SharedFlags_0.FFlagEnableRetryForLinkingProtocolFetch;
local l_FIntLinkingProtocolFetchRetries_0 = l_SharedFlags_0.FIntLinkingProtocolFetchRetries;
local l_FIntLinkingProtocolFetchTimeoutMS_0 = l_SharedFlags_0.FIntLinkingProtocolFetchTimeoutMS;
return function() --[[ Line: 20 ]]
    -- upvalues: l_FFlagEnableRetryForLinkingProtocolFetch_0 (copy), l_FIntLinkingProtocolFetchRetries_0 (copy), l_default_0 (copy), l_SettingsRoute_0 (copy), l_FIntLinkingProtocolFetchTimeoutMS_0 (copy)
    local v8 = false;
    local v9 = false;
    if l_FFlagEnableRetryForLinkingProtocolFetch_0 then
        for _ = 0, l_FIntLinkingProtocolFetchRetries_0 do
            local v13 = task.spawn(function() --[[ Line: 26 ]]
                -- upvalues: v8 (ref), v9 (ref), l_default_0 (ref), l_SettingsRoute_0 (ref)
                local v11, v12 = l_default_0:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
                v8 = v11;
                v9 = v12;
            end);
            task.wait(l_FIntLinkingProtocolFetchTimeoutMS_0 / 1000);
            task.cancel(v13);
            if v9 ~= nil then
                break;
            end;
        end;
    else
        local v14, v15 = l_default_0:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
        v8 = v14;
        v9 = v15;
    end;
    return v8 and v9 == true;
end;