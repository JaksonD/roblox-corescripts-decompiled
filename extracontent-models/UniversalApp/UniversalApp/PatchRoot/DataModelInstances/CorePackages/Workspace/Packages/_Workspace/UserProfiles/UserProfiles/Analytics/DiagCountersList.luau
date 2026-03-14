local v0 = require(script.Parent.EventNames);
local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local l_DiagEventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v3 = require(script.Parent.ErrorCodesForLogging);
return {
    [v0.UserProfilesRequestBegin] = {
        name = game:DefineFastString("UserProfilesRequestBegin", "UserProfilesRequestBegin")
    }, 
    [v0.UserProfilesRequestSuccess] = {
        name = game:DefineFastString("UserProfilesRequestSuccess", "UserProfilesRequestSuccess")
    }, 
    [v0.UserProfilesRequestFail] = {
        name = game:DefineFastString("UserProfilesRequestFail", "UserProfilesRequestFail")
    }, 
    [v0.UserProfilesRequestFailAfterRetry] = {
        name = game:DefineFastString("UserProfilesRequestFailAfterRetry", "UserProfilesRequestFailAfterRetry")
    }, 
    [v0.UserProfilesRequestSuccessAfterRetry] = {
        name = game:DefineFastString("UserProfilesRequestSuccessAfterRetry", "UserProfilesRequestSuccessAfterRetry")
    }, 
    [v0.UserProfilesErrorCode] = {
        type = l_DiagEventTypes_0.Counter, 
        name = function(v4) --[[ Line: 31 ]] --[[ Name: name ]]
            -- upvalues: v0 (copy), v3 (copy)
            local v5 = tostring(v4.status);
            local l_UserProfilesErrorCode_0 = v0.UserProfilesErrorCode;
            if v3[v5] then
                return l_UserProfilesErrorCode_0 .. v5;
            else
                return l_UserProfilesErrorCode_0 .. "Other";
            end;
        end
    }, 
    [v0.UserProfilesUnmountEarly] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserProfilesUnmountEarly", "UserProfilesUnmountEarly")
    }
};