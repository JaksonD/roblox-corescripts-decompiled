local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_WebViewService_0 = game:GetService("WebViewService");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local v7 = {};
local function v10() --[[ Line: 14 ]] --[[ Name: cleanup ]]
    -- upvalues: v7 (copy), v6 (copy), l_WebViewService_0 (copy), l_BrowserService_0 (copy)
    for _, v9 in ipairs(v7) do
        v9:Disconnect();
    end;
    table.clear(v7);
    if v6() then
        l_WebViewService_0:CloseWindow();
        return;
    else
        l_BrowserService_0:CloseBrowserWindow();
        return;
    end;
end;
return {
    init = function() --[[ Line: 29 ]] --[[ Name: init ]]
        -- upvalues: v6 (copy), v7 (copy), l_WebViewService_0 (copy), v10 (copy), l_BrowserService_0 (copy), v5 (copy), v4 (copy), l_HttpService_0 (copy)
        if v6() then
            table.insert(v7, l_WebViewService_0.OnWindowClosed:Connect(v10));
            table.insert(v7, l_WebViewService_0.OnJavaScriptCall:Connect(v10));
        else
            table.insert(v7, l_BrowserService_0.BrowserWindowClosed:Connect(function() --[[ Line: 35 ]]

            end));
            table.insert(v7, l_BrowserService_0.JavaScriptCallback:Connect(v10));
        end;
        local v11 = (v5() and v4.STATIC_CDN_URL or v4.WWW_URL) .. "challenge/cdn/hybrid";
        if v6() then
            l_WebViewService_0:OpenWindow(v11, "Prewarm WebView", false);
            return;
        else
            local v12 = l_HttpService_0:JSONEncode({
                command = "open", 
                url = v11, 
                title = "Prewarm WebView", 
                visible = false, 
                modal = true, 
                isGenericWebview = true, 
                enableOverlayReplacement = false, 
                displayOrder = -2000
            });
            l_BrowserService_0:SendCommand(v12);
            return;
        end;
    end, 
    cleanup = v10
};