local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(script.Parent.ChallengeHeaders);
local v2 = require(script.Parent.BuildChallengeWebViewUrl);
local _ = require(script.Parent.BuildHybridCallback);
local _ = require(l_script_FirstAncestor_0.Types.ChallengeParameters);
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local v8 = if l_GetFFlagEnableUnifiedWebViews_0() then game:GetService("WebViewService") else nil;
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 63 ]] --[[ Name: new ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy), v8 (copy), l_BrowserService_0 (copy), v1 (copy), v2 (copy), v9 (copy)
    local v11 = {};
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v11.webViewService = v10.webViewService or v8;
    else
        v11.browserService = v10.browserService or l_BrowserService_0;
    end;
    local v12 = nil;
    if v10.rawResponseHeaders ~= nil then
        v12 = v1.new(v10.rawResponseHeaders);
    end;
    v11.challengeUrl = v2(v12, v10.challengeType, v10.challengeParameters);
    v11.title = v10.title;
    if v10.hybridCallback ~= nil then
        v11.hybridCallback = v10.hybridCallback;
    end;
    if v10.closeCallback ~= nil then
        v11.closeCallback = v10.closeCallback;
    end;
    if v10.openCallback ~= nil then
        v11.openCallback = v10.openCallback;
    end;
    v11.hybridCallbackConnection = nil;
    v11.modal = false;
    if v10.modal ~= nil then
        v11.modal = v10.modal;
    end;
    return (setmetatable(v11, v9));
end;
v9.setCloseCallback = function(v13, v14) --[[ Line: 108 ]] --[[ Name: setCloseCallback ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy)
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v13.closeCallback = function() --[[ Line: 111 ]]
            -- upvalues: v13 (copy), v14 (copy)
            v13.webViewService:CloseWindow();
            v14();
        end;
        return;
    else
        v13.closeCallback = v14;
        return;
    end;
end;
v9.setOpenCallback = function(v15, v16) --[[ Line: 120 ]] --[[ Name: setOpenCallback ]]
    v15.openCallback = v16;
end;
v9.setHybridCallback = function(v17, v18) --[[ Line: 125 ]] --[[ Name: setHybridCallback ]]
    v17.hybridCallback = v18;
end;
v9.open = function(v19) --[[ Line: 130 ]] --[[ Name: open ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy), l_HttpService_0 (copy)
    assert(v19.hybridCallback ~= nil, "hybrid callback has not been initialized");
    if v19.openCallback ~= nil then
        v19.openCallback();
    end;
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v19.hybridCallbackConnection = v19.webViewService.OnJavaScriptCall:Connect(v19.hybridCallback);
    else
        v19.hybridCallbackConnection = v19.browserService.JavaScriptCallback:Connect(v19.hybridCallback);
    end;
    if v19.closeCallback ~= nil then
        if l_GetFFlagEnableUnifiedWebViews_0() then
            v19.closeCallbackConnection = v19.webViewService.OnWindowClosed:Connect(v19.closeCallback);
        else
            v19.closeCallbackConnection = v19.browserService.BrowserWindowClosed:Connect(v19.closeCallback);
        end;
    end;
    assert(string.len(v19.challengeUrl) > 0, "challenge url must have been constructed");
    assert(v19.hybridCallbackConnection ~= nil, "hybrid callback connection should be initialized");
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v19.webViewService:OpenWindow(v19.challengeUrl, v19.title, true);
        return;
    else
        local v20 = l_HttpService_0:JSONEncode({
            command = "open", 
            url = v19.challengeUrl, 
            title = v19.title, 
            visible = true, 
            modal = v19.modal, 
            isGenericWebview = true, 
            enableOverlayReplacement = true
        });
        v19.browserService:SendCommand(v20);
        return;
    end;
end;
v9.close = function(v21) --[[ Line: 168 ]] --[[ Name: close ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy)
    if v21.hybridCallbackConnection ~= nil then
        v21.hybridCallbackConnection:Disconnect();
    end;
    if l_GetFFlagEnableUnifiedWebViews_0() then
        v21.webViewService:CloseWindow();
    else
        v21.browserService:CloseBrowserWindow();
    end;
    if v21.closeCallbackConnection ~= nil then
        v21.closeCallbackConnection:Disconnect();
    end;
end;
return v9;