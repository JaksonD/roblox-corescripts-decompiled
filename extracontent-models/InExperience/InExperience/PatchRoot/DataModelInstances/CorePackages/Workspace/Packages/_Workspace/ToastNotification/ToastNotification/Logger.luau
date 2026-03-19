local l_Parent_0 = script.Parent;
local l_Lumberyak_0 = require(l_Parent_0.dependencies).Lumberyak;
local l_Logger_0 = l_Lumberyak_0.Logger;
local v3 = game:DefineFastString("ToastNotificationEventLoggingLevel", l_Lumberyak_0.Logger.Levels.Warning);
local v4 = l_Logger_0.new(nil, "ToastNotification");
v4:setContext({
    prefix = "[ToastNotification] - "
});
v4:addSink({
    maxLevel = v3, 
    log = function(_, v6, _) --[[ Line: 16 ]] --[[ Name: log ]]
        print(v6);
    end
});
return v4;