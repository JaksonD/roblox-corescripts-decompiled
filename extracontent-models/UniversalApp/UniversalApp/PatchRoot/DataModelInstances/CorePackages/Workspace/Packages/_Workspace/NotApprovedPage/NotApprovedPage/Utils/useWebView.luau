local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local v1 = require(l_Parent_0.React);
local l_useEffect_0 = v1.useEffect;
local l_useCallback_0 = v1.useCallback;
local l_useRef_0 = v1.useRef;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_WebViewService_0 = game:GetService("WebViewService");
return function(v11, v12) --[[ Line: 23 ]] --[[ Name: useWebView ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_WebViewService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useEffect_0 (copy)
    local v13 = l_useDispatch_0();
    local v14 = l_useRef_0(nil);
    local v15 = l_useCallback_0(function() --[[ Line: 27 ]]
        -- upvalues: v14 (copy)
        if v14.current then
            v14.current:Disconnect();
            v14.current = nil;
        end;
    end, l_dependencyArray_0(v14));
    local v16 = l_useCallback_0(function() --[[ Line: 34 ]]
        -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (ref), v15 (copy), v14 (copy), l_WebViewService_0 (ref), v11 (copy), v12 (copy), v13 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if l_GetFFlagEnableUnifiedWebViews_0() then
            v15();
            v14.current = l_WebViewService_0.OnWindowClosed:Connect(function() --[[ Line: 40 ]]
                -- upvalues: l_WebViewService_0 (ref), v15 (ref)
                l_WebViewService_0:CloseWindow();
                v15();
            end);
            l_WebViewService_0:OpenWindow(v11, v12, true);
            return;
        else
            v13(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v11, 
                extraProps = {
                    title = v12
                }
            }));
            return;
        end;
    end, l_dependencyArray_0(v11, v12, v15));
    l_useEffect_0(function() --[[ Line: 58 ]]
        -- upvalues: v15 (copy)
        return function() --[[ Line: 59 ]]
            -- upvalues: v15 (ref)
            v15();
        end;
    end, l_dependencyArray_0(v15));
    return v16;
end;