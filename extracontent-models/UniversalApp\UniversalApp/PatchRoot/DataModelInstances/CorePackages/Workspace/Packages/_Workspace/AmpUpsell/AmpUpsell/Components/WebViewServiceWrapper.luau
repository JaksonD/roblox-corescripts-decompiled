local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_WebViewService_0 = game:GetService("WebViewService");
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 47 ]] --[[ Name: new ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy), l_WebViewService_0 (copy), v5 (copy)
    local v7 = {};
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v7.webViewService = v6.webViewService or l_WebViewService_0;
    end;
    v7.title = v6.title;
    v7.url = v6.url;
    v7.closeCallbackConnection = nil;
    local v8 = setmetatable(v7, v5);
    v8:setCloseCallback(v6.closeCallback or function() --[[ Line: 62 ]]

    end);
    return v8;
end;
v5.setCloseCallback = function(v9, v10) --[[ Line: 67 ]] --[[ Name: setCloseCallback ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy)
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v9.closeCallback = function() --[[ Line: 72 ]]
            -- upvalues: v9 (copy), v10 (copy)
            v9:close();
            if v10 ~= nil then
                v10();
            end;
        end;
        return;
    else
        v9.closeCallback = v10;
        return;
    end;
end;
v5.setOpenCallback = function(v11, v12) --[[ Line: 85 ]] --[[ Name: setOpenCallback ]]
    v11.openCallback = v12;
end;
v5.open = function(v13) --[[ Line: 89 ]] --[[ Name: open ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy)
    if v13.openCallback ~= nil then
        v13.openCallback();
    end;
    if v13.closeCallback ~= nil and l_GetFFlagEnableUnifiedWebViews_0() then
        v13.closeCallbackConnection = v13.webViewService.OnWindowClosed:Connect(v13.closeCallback);
    end;
    if v13.closeCallback ~= nil and not l_GetFFlagEnableUnifiedWebViews_0() then
        v13.closeCallbackConnection = l_BrowserService_0.BrowserWindowClosed:Connect(v13.closeCallback);
    end;
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v13.webViewService:OpenWindow(v13.url, v13.title, true);
        return;
    else
        local v14 = l_HttpService_0:JSONEncode({
            command = "open", 
            url = v13.url, 
            title = v13.title, 
            visible = true, 
            isGenericWebview = true, 
            enableOverlayReplacement = true
        });
        l_BrowserService_0:SendCommand(v14);
        return;
    end;
end;
v5.close = function(v15) --[[ Line: 117 ]] --[[ Name: close ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy)
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v15.webViewService:CloseWindow();
    end;
    if v15.closeCallbackConnection ~= nil then
        v15.closeCallbackConnection:Disconnect();
    end;
end;
return v5;