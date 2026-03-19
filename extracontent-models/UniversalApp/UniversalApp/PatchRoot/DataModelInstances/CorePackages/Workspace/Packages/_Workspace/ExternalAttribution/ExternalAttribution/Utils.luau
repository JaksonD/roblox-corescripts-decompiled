local l_Parent_0 = script:FindFirstAncestor("ExternalAttribution").Parent;
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local v2 = {
    Reopen = "Reopen", 
    SignUp = "SignUp", 
    Login = "Login", 
    Unknown = "Unknown"
};
return {
    PostAuthenticationEvent = v2, 
    parseLaunchContextToPostAuthenticationEventType = function(v3) --[[ Line: 18 ]]
        -- upvalues: l_LaunchContext_0 (copy), v2 (copy)
        if v3 == l_LaunchContext_0.Startup then
            return v2.Reopen;
        elseif v3 == l_LaunchContext_0.SignUp then
            return v2.SignUp;
        elseif v3 == l_LaunchContext_0.Login then
            return v2.Login;
        else
            return v2.Unknown;
        end;
    end
};