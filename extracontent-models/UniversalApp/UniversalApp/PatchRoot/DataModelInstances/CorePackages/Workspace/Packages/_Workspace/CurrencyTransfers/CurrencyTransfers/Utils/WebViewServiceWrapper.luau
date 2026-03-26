local l_WebViewService_0 = game:GetService("WebViewService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: l_WebViewService_0 (copy), v1 (copy)
    local v3 = setmetatable({
        webViewService = v2.webViewService or l_WebViewService_0, 
        title = v2.title, 
        url = v2.url, 
        closeCallbackConnection = nil
    }, v1);
    v3:setCloseCallback(v2.closeCallback or function() --[[ Line: 50 ]]

    end);
    return v3;
end;
v1.setCloseCallback = function(v4, v5) --[[ Line: 55 ]] --[[ Name: setCloseCallback ]]
    v4.closeCallback = function() --[[ Line: 56 ]]
        -- upvalues: v4 (copy), v5 (copy)
        v4:close();
        if v5 ~= nil then
            v5();
        end;
    end;
end;
v1.setOpenCallback = function(v6, v7) --[[ Line: 64 ]] --[[ Name: setOpenCallback ]]
    v6.openCallback = v7;
end;
v1.open = function(v8) --[[ Line: 68 ]] --[[ Name: open ]]
    if v8.openCallback ~= nil then
        v8.openCallback();
    end;
    if v8.closeCallback ~= nil then
        v8.closeCallbackConnection = v8.webViewService.OnWindowClosed:Connect(v8.closeCallback);
    end;
    v8.webViewService:OpenWindow(v8.url, v8.title, true);
end;
v1.close = function(v9) --[[ Line: 80 ]] --[[ Name: close ]]
    v9.webViewService:CloseWindow();
    if v9.closeCallbackConnection ~= nil then
        v9.closeCallbackConnection:Disconnect();
    end;
end;
return v1;