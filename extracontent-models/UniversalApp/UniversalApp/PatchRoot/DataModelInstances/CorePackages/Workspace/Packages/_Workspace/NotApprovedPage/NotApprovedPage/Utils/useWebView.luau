local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local v1 = require(l_Parent_0.React);
local l_useEffect_0 = v1.useEffect;
local l_useCallback_0 = v1.useCallback;
local l_useRef_0 = v1.useRef;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_WebViewService_0 = game:GetService("WebViewService");
return function(v12, v13) --[[ Line: 25 ]] --[[ Name: useWebView ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_WebViewService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useEffect_0 (copy)
    local v14 = l_useDispatch_0();
    local v15 = l_useRef_0(nil);
    local v16 = l_useCallback_0(function() --[[ Line: 29 ]]
        -- upvalues: v15 (copy)
        if v15.current then
            v15.current:Disconnect();
            v15.current = nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v15
    } else l_dependencyArray_0(v15));
    local v17 = l_useCallback_0(function() --[[ Line: 37 ]]
        -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (ref), v16 (copy), v15 (copy), l_WebViewService_0 (ref), v12 (copy), v13 (copy), v14 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if l_GetFFlagEnableUnifiedWebViews_0() then
            v16();
            v15.current = l_WebViewService_0.OnWindowClosed:Connect(function() --[[ Line: 43 ]]
                -- upvalues: l_WebViewService_0 (ref), v16 (ref)
                l_WebViewService_0:CloseWindow();
                v16();
            end);
            l_WebViewService_0:OpenWindow(v12, v13, true);
            return;
        else
            v14(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v12, 
                extraProps = {
                    title = v13
                }
            }));
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v12, 
        v13, 
        v16
    } else l_dependencyArray_0(v12, v13, v16));
    l_useEffect_0(function() --[[ Line: 65 ]]
        -- upvalues: v16 (copy)
        return function() --[[ Line: 66 ]]
            -- upvalues: v16 (ref)
            v16();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v16
    } else l_dependencyArray_0(v16));
    return v17;
end;