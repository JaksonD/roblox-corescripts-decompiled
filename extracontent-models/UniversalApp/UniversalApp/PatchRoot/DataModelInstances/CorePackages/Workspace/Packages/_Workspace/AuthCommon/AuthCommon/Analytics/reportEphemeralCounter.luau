local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Platform_0 = game:GetService("UserInputService"):GetPlatform();
local l_FStringLuaAppEphemeralCounterPrefix_0 = require(l_Parent_0.SharedFlags).FStringLuaAppEphemeralCounterPrefix;
return function(v4, v5) --[[ Line: 13 ]]
    -- upvalues: l_Platform_0 (copy), l_FStringLuaAppEphemeralCounterPrefix_0 (copy), l_RbxAnalyticsService_0 (copy)
    pcall(function() --[[ Line: 14 ]]
        -- upvalues: v4 (ref), v5 (ref), l_Platform_0 (ref), l_FStringLuaAppEphemeralCounterPrefix_0 (ref), l_RbxAnalyticsService_0 (ref)
        assert(type(v4) == "string", "Expected counterName to be a string");
        v4 = v4 or "";
        v5 = v5 or 1;
        if l_Platform_0 == Enum.Platform.Android then
            v4 = "Android-" .. tostring(v4);
        elseif l_Platform_0 == Enum.Platform.IOS then
            v4 = "iOS-" .. tostring(v4);
        elseif l_Platform_0 == Enum.Platform.Windows then
            v4 = "Win32-" .. tostring(v4);
        elseif l_Platform_0 == Enum.Platform.UWP then
            v4 = "UWP-" .. tostring(v4);
        elseif l_Platform_0 == Enum.Platform.OSX then
            v4 = "Mac-" .. tostring(v4);
        elseif l_FStringLuaAppEphemeralCounterPrefix_0 ~= "" then
            v4 = l_FStringLuaAppEphemeralCounterPrefix_0 .. tostring(v4);
        end;
        l_RbxAnalyticsService_0:ReportCounter(v4, v5);
    end);
end;