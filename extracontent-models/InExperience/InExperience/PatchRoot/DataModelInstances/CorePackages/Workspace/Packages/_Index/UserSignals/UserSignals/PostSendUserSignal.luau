local l_HttpService_0 = game:GetService("HttpService");
local l_SessionService_0 = game:GetService("SessionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSignals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local v5 = require(l_Parent_0.Http);
local _ = require(l_Parent_0.RobloxAppEnums);
local l_Url_0 = v5.Url;
local _ = require(l_script_FirstAncestor_0.UserSignalTypes);
local l_FFlagLuaAppAddSessionIdToUserSignals_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSessionIdToUserSignals;
return function(v10, v11, v12, v13, v14) --[[ Line: 82 ]]
    -- upvalues: l_FFlagLuaAppAddSessionIdToUserSignals_0 (copy), l_SessionService_0 (copy), l_SessionType_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy)
    local v15 = if l_FFlagLuaAppAddSessionIdToUserSignals_0 then l_SessionService_0:GetMetadata(l_SessionType_0.StructuralIdentifier.HomePageSessionInfo, l_SessionType_0.Metadata.HomePageSessionInfo.OmniSessionId) else nil;
    local v16 = tostring(DateTime.now().UnixTimestampMillis);
    return v10(string.format("%suser-signal-http-gateway/v1/user-signal/ingest", l_Url_0.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            userSignalEvents = {
                {
                    signalValue = v11, 
                    timestampMs = v16, 
                    signalValueType = v13, 
                    signalEntity = v12, 
                    signalType = v14, 
                    omniSessionId = if l_FFlagLuaAppAddSessionIdToUserSignals_0 then v15 else nil
                }
            }
        })
    });
end;