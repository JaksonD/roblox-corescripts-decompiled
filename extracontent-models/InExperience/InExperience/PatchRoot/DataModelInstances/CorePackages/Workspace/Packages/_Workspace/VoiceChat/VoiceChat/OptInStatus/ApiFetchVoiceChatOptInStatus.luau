local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.OptInStatus.GetVoiceChatOptInStatus);
local v2 = require(l_script_FirstAncestor_0.OptInStatus.SetVoiceChatOptInStatus);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
return {
    KeyMapper = "luaapp.voicechatoptinstatus", 
    Fetch = function(v7) --[[ Line: 16 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v1 (copy), v2 (copy), v4 (copy), l_Logging_0 (copy)
        return l_PerformFetch_0.Single("luaapp.voicechatoptinstatus", function(v8) --[[ Line: 17 ]]
            -- upvalues: v1 (ref), v7 (copy), v2 (ref), v4 (ref), l_Logging_0 (ref)
            return v1(v7):andThen(function(v9) --[[ Line: 18 ]]
                -- upvalues: v8 (copy), v2 (ref), v4 (ref), l_Logging_0 (ref)
                local l_responseBody_0 = v9.responseBody;
                if l_responseBody_0 ~= nil and l_responseBody_0.isUserOptIn ~= nil then
                    v8:dispatch(v2(l_responseBody_0.isUserOptIn));
                    return v4.resolve(v9);
                else
                    l_Logging_0.warn("Response from GetVoiceChatOptInStatus is malformed!");
                    return v4.reject({
                        HttpError = Enum.HttpError.OK
                    });
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v11) --[[ Line: 31 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v11, "luaapp.voicechatoptinstatus");
    end
};