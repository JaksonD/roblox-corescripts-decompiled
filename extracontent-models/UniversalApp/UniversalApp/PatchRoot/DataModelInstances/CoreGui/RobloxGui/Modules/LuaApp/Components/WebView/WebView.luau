local l_WebViewService_0 = game:GetService("WebViewService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local l_AsyncQueue_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).AsyncQueue;
local l_WebViewStateTracker_0 = require(l_CorePackages_0.Workspace.Packages.WebViewUtils).WebViewStateTracker;
local l_FFlagEnableWebViewStateTracker_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableWebViewStateTracker;
local v8 = require(l_Modules_0.LuaApp.Components.WebViewStub);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility);
local l_FFlagFixSelectionWithWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFixSelectionWithWebViews;
local v11 = l_AsyncQueue_0.new();
local function v19(v12) --[[ Line: 31 ]] --[[ Name: useWebView ]]
    -- upvalues: v4 (copy), v11 (copy), l_FFlagEnableWebViewStateTracker_0 (copy), l_WebViewStateTracker_0 (copy), v9 (copy), l_WebViewService_0 (copy), l_FFlagFixSelectionWithWebViews_0 (copy), l_GuiService_0 (copy)
    local v13, v14 = v4.useState(false);
    v4.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v11 (ref), v14 (copy)
        return (v11:request(function() --[[ Line: 35 ]]
            -- upvalues: v14 (ref)
            v14(true);
        end));
    end, {});
    local v15 = v4.useRef(true);
    v4.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v13 (copy), v15 (copy), l_FFlagEnableWebViewStateTracker_0 (ref), l_WebViewStateTracker_0 (ref), v12 (copy), v9 (ref), l_WebViewService_0 (ref)
        if not v13 then
            return;
        elseif v15.current then
            v15.current = false;
            if l_FFlagEnableWebViewStateTracker_0 then
                l_WebViewStateTracker_0.markOpen(v12.url, v12.title, v12.isVisible, v12.hasBackButton);
            end;
            if v9() then
                l_WebViewService_0:OpenWindow(v12.url, v12.title, v12.isVisible, "", v12.transitionAnimation, false, v12.hasBackButton);
                return;
            else
                l_WebViewService_0:OpenWindow(v12.url, v12.title, v12.isVisible, v12.transitionAnimation);
                return;
            end;
        else
            if l_FFlagEnableWebViewStateTracker_0 then
                l_WebViewStateTracker_0.updateMetadata(v12.url, v12.title, v12.isVisible, v12.hasBackButton);
            end;
            if v9() then
                l_WebViewService_0:MutateWindow(v12.url, v12.title, v12.isVisible, "", v12.transitionAnimation, false, v12.hasBackButton);
                return;
            else
                l_WebViewService_0:MutateWindow(v12.url, v12.title, v12.isVisible, v12.transitionAnimation);
                return;
            end;
        end;
    end, {
        v13, 
        v12.url, 
        v12.title, 
        v12.isVisible, 
        v12.transitionAnimation, 
        if v9() then v12.hasBackButton else nil
    });
    v4.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v13 (copy), l_WebViewService_0 (ref)
        if not v13 then
            return;
        else
            return function() --[[ Line: 101 ]]
                -- upvalues: l_WebViewService_0 (ref)
                l_WebViewService_0:CloseWindow();
            end;
        end;
    end, {
        v13
    });
    v4.useEffect(function() --[[ Line: 106 ]]
        -- upvalues: v13 (copy), l_FFlagEnableWebViewStateTracker_0 (ref), v12 (copy), l_WebViewService_0 (ref), l_WebViewStateTracker_0 (ref)
        if not v13 then
            return;
        elseif not l_FFlagEnableWebViewStateTracker_0 and v12.windowCloseCallback == nil then
            return;
        else
            local v16 = l_WebViewService_0.OnWindowClosed:Connect(function() --[[ Line: 115 ]]
                -- upvalues: l_FFlagEnableWebViewStateTracker_0 (ref), l_WebViewStateTracker_0 (ref), v12 (ref)
                if l_FFlagEnableWebViewStateTracker_0 then
                    l_WebViewStateTracker_0.markClosed();
                end;
                if v12.windowCloseCallback then
                    v12.windowCloseCallback();
                end;
            end);
            return function() --[[ Line: 125 ]]
                -- upvalues: v16 (copy)
                v16:Disconnect();
            end;
        end;
    end, {
        v13, 
        v12.windowCloseCallback
    });
    v4.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: v13 (copy), v12 (copy), l_WebViewService_0 (ref)
        if not v13 then
            return;
        elseif v12.javaScriptCallback == nil then
            return;
        else
            local v17 = l_WebViewService_0.OnJavaScriptCall:Connect(v12.javaScriptCallback);
            return function() --[[ Line: 141 ]]
                -- upvalues: v17 (copy)
                v17:Disconnect();
            end;
        end;
    end, {
        v13, 
        v12.javaScriptCallback
    });
    if l_FFlagFixSelectionWithWebViews_0 then
        v4.useEffect(function() --[[ Line: 147 ]]
            -- upvalues: v13 (copy), l_GuiService_0 (ref)
            if not v13 then
                return;
            else
                local l_CoreGuiNavigationEnabled_0 = l_GuiService_0.CoreGuiNavigationEnabled;
                l_GuiService_0.CoreGuiNavigationEnabled = false;
                return function() --[[ Line: 155 ]]
                    -- upvalues: l_GuiService_0 (ref), l_CoreGuiNavigationEnabled_0 (copy)
                    l_GuiService_0.CoreGuiNavigationEnabled = l_CoreGuiNavigationEnabled_0;
                end;
            end;
        end, {
            v13
        });
    end;
end;
return function(v20) --[[ Line: 162 ]] --[[ Name: WebView ]]
    -- upvalues: v19 (copy), v4 (copy), v8 (copy)
    v19(v20);
    local v21 = v20.overlayProps or {};
    return v4.createElement(v8, {
        isVisible = v21.isVisible, 
        DisplayOrder = v21.DisplayOrder
    });
end;