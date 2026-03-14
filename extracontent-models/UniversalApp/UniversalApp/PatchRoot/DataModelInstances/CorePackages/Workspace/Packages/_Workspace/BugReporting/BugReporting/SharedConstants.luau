local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local l_InfoNames_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol.InfoNames;
local v2 = {
    l_InfoNames_0.APP_VERSION, 
    l_InfoNames_0.DEVICE_NAME, 
    l_InfoNames_0.SYSTEM_VERSION, 
    "screen"
};
return {
    ISSUE_CHANNEL = "internal-in-app", 
    SCREENSHOT_BUCKET = "InternalInAppBugReporting", 
    SCREENSHOT_URN_PREFIX = "urn:roblox:moderationscreenshot:InternalInAppBugReporting", 
    SCREEN_SUMMARY_KEY = "screen", 
    DEVICE_SUMMARY_ORDERED_KEYS = v2
};