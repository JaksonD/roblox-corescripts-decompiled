local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
return function(v2) --[[ Line: 5 ]] --[[ Name: openWebview ]]
    -- upvalues: l_HttpService_0 (copy), l_GuiService_0 (copy)
    local v3 = {
        FullScreen = 0, 
        FormSheet = 2
    };
    local v4 = l_HttpService_0:JSONEncode({
        title = "", 
        presentationStyle = v3.FormSheet, 
        visible = true, 
        url = v2
    });
    l_GuiService_0:BroadcastNotification(v4, 20);
end;