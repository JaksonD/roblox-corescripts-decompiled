local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v2 = require(script.Parent.getUserInputService);
local v3 = require(script.Parent.Parent.Enums.PlatformBuckets);
local v4 = require(script.Parent.Parent.Enums.PlatformSpecificity);
local v5 = {
    [Enum.Platform.Windows] = v3.Windows, 
    [Enum.Platform.OSX] = v3.Mac, 
    [Enum.Platform.IOS] = v3.IOS, 
    [Enum.Platform.Android] = v3.Android, 
    [Enum.Platform.UWP] = v3.Windows, 
    [Enum.Platform.XBox360] = v3.XBox, 
    [Enum.Platform.XBoxOne] = v3.XBox, 
    [Enum.Platform.PS3] = v3.Playstation, 
    [Enum.Platform.PS4] = v3.Playstation, 
    [Enum.Platform.PS5] = v3.Playstation, 
    [Enum.Platform.None] = v3.None
};
return function(v6) --[[ Line: 24 ]]
    -- upvalues: v2 (copy), v4 (copy), l_IsVRAppBuild_0 (copy), v3 (copy), v5 (copy)
    local v7 = v2();
    local v8 = nil;
    pcall(function() --[[ Line: 29 ]]
        -- upvalues: v8 (ref), v7 (copy)
        v8 = v7:GetPlatform() or Enum.Platform.None;
    end);
    if v6 == v4.All then
        if l_IsVRAppBuild_0() then
            return v3.Quest;
        else
            local v9 = tostring(v8):match(".*%.(.*)");
            if not v9 then
                return v3.None;
            else
                return v9;
            end;
        end;
    elseif v6 == v4.BucketsOnly then
        if l_IsVRAppBuild_0() then
            return v3.Quest;
        else
            return v5[v8] or v3.None;
        end;
    else
        return "";
    end;
end;