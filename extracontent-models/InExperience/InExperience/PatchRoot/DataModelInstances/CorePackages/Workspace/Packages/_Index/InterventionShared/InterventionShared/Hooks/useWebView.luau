local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v1 = require(l_Parent_0.React);
local l_useEffect_0 = v1.useEffect;
local l_useCallback_0 = v1.useCallback;
local l_useRef_0 = v1.useRef;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_WebViewService_0 = game:GetService("WebViewService");
return function(v11, v12) --[[ Line: 23 ]] --[[ Name: useWebView ]]
    -- upvalues: l_useRef_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_WebViewService_0 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy), l_useEffect_0 (copy)
    local v13 = l_useRef_0(nil);
    local v14 = l_useCallback_0(function() --[[ Line: 26 ]]
        -- upvalues: v13 (copy)
        if v13.current then
            v13.current:Disconnect();
            v13.current = nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13
    } else l_dependencyArray_0(v13));
    local v15 = l_useCallback_0(function() --[[ Line: 34 ]]
        -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (ref), v14 (copy), v13 (copy), l_WebViewService_0 (ref), v11 (copy), v12 (copy), l_BrowserService_0 (ref), l_HttpService_0 (ref)
        if l_GetFFlagEnableUnifiedWebViews_0() then
            v14();
            v13.current = l_WebViewService_0.OnWindowClosed:Connect(function() --[[ Line: 40 ]]
                -- upvalues: l_WebViewService_0 (ref), v14 (ref)
                l_WebViewService_0:CloseWindow();
                v14();
            end);
            l_WebViewService_0:OpenWindow(v11, v12, true);
            return;
        else
            l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode({
                command = "open", 
                url = v11, 
                title = v12, 
                visible = true, 
                isGenericWebview = true, 
                enableOverlayReplacement = true
            }));
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v11, 
        v12, 
        v14
    } else l_dependencyArray_0(v11, v12, v14));
    l_useEffect_0(function() --[[ Line: 63 ]]
        -- upvalues: v14 (copy)
        return function() --[[ Line: 64 ]]
            -- upvalues: v14 (ref)
            v14();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v14
    } else l_dependencyArray_0(v14));
    return v15;
end;