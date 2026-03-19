local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v1 = require(l_Parent_0.React);
local l_useEffect_0 = v1.useEffect;
local l_useCallback_0 = v1.useCallback;
local l_useRef_0 = v1.useRef;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_WebViewService_0 = game:GetService("WebViewService");
return function(v10, v11) --[[ Line: 21 ]] --[[ Name: useWebView ]]
    -- upvalues: l_useRef_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_WebViewService_0 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy), l_useEffect_0 (copy)
    local v12 = l_useRef_0(nil);
    local v13 = l_useCallback_0(function() --[[ Line: 24 ]]
        -- upvalues: v12 (copy)
        if v12.current then
            v12.current:Disconnect();
            v12.current = nil;
        end;
    end, l_dependencyArray_0(v12));
    local v14 = l_useCallback_0(function() --[[ Line: 31 ]]
        -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (ref), v13 (copy), v12 (copy), l_WebViewService_0 (ref), v10 (copy), v11 (copy), l_BrowserService_0 (ref), l_HttpService_0 (ref)
        if l_GetFFlagEnableUnifiedWebViews_0() then
            v13();
            v12.current = l_WebViewService_0.OnWindowClosed:Connect(function() --[[ Line: 37 ]]
                -- upvalues: l_WebViewService_0 (ref), v13 (ref)
                l_WebViewService_0:CloseWindow();
                v13();
            end);
            l_WebViewService_0:OpenWindow(v10, v11, true);
            return;
        else
            l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode({
                command = "open", 
                url = v10, 
                title = v11, 
                visible = true, 
                isGenericWebview = true, 
                enableOverlayReplacement = true
            }));
            return;
        end;
    end, l_dependencyArray_0(v10, v11, v13));
    l_useEffect_0(function() --[[ Line: 56 ]]
        -- upvalues: v13 (copy)
        return function() --[[ Line: 57 ]]
            -- upvalues: v13 (ref)
            v13();
        end;
    end, l_dependencyArray_0(v13));
    return v14;
end;