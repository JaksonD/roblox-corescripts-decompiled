local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.openYouTubeVideo);
local v4 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v5 = {
    autoplay = 1, 
    controls = 0, 
    modestbranding = 1, 
    rel = 0, 
    loop = 0, 
    cc_load_policy = 0, 
    playsinline = 0
};
return function(v6, v7, v8, v9, v10, v11, v12) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), l_HttpService_0 (copy), v2 (copy)
    return function(_) --[[ Line: 19 ]]
        -- upvalues: v4 (ref), v5 (ref), v7 (copy), v3 (ref), v10 (copy), v9 (copy), v8 (copy), v11 (copy), v12 (copy), l_HttpService_0 (ref), v6 (copy), v2 (ref)
        local v14 = v4.new({
            base = "https://www.youtube-nocookie.com", 
            path = "/embed/{id}", 
            query = v5
        })({
            id = v7
        });
        v3(v10, v9, v8, v7, v11, v12);
        local v15 = l_HttpService_0:JSONEncode({
            url = v14, 
            title = v8, 
            animated = true
        });
        v6:BroadcastNotification(v15, v2.OPEN_YOUTUBE_VIDEO);
    end;
end;