local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(script.Parent.fetchEventDetailsPage);
local v3 = require(script.Parent.getEventDetailsPageKey);
local _ = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local v7 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local v11 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v11.useBreakpointXOrSmaller;
local v13 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiPageEntryPoint_0 = v13.SduiPageEntryPoint;
local l_SduiLoadTimer_0 = v13.SduiLoadTimer;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_DetailsPageLayout_0 = require(l_Parent_0.AppBlox).DetailsPageLayout;
local l_FFlagLuaAppSduiEventDetailsLogExposure_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiEventDetailsLogExposure;
local l_FStringLuaAppSduiEventDetailsIxpLayer_0 = require(l_Parent_0.SharedFlags).FStringLuaAppSduiEventDetailsIxpLayer;
local function _(v20, v21) --[[ Line: 37 ]] --[[ Name: getFromPropsOrNavigationParams ]]
    local v22 = v20.navigation and v20.navigation.getParam("extraProps");
    return v20[v21] or v22 and v22[v21];
end;
local function _(v24, v25) --[[ Line: 44 ]]
    return v24 .. "_" .. v25;
end;
return v7.memo(function(v27) --[[ Line: 48 ]] --[[ Name: SduiEventDetailsPage ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v7 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), l_useNavigation_0 (copy), l_useRouteName_0 (copy), l_useNavigationFocus_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v2 (copy), l_FFlagLuaAppSduiEventDetailsLogExposure_0 (copy), l_IXPService_0 (copy), l_FStringLuaAppSduiEventDetailsIxpLayer_0 (copy), l_DetailsPageLayout_0 (copy), l_SduiPageEntryPoint_0 (copy), v5 (copy)
    local v28 = l_useTokens_0();
    local v29 = v27.navigation and v27.navigation.getParam("extraProps");
    local v30 = v27.eventId or v29 and v29.eventId or v27.navigation and v27.navigation.getParam("detail");
    v29 = v3(v30);
    local v33 = v7.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v27 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local l_v27_0 = v27;
        local v32 = l_v27_0.navigation and l_v27_0.navigation.getParam("extraProps");
        return l_v27_0.pageTimer or v32 and v32.pageTimer or l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.EventDetails);
    end, {});
    local v34 = l_useNavigation_0();
    local v35 = l_useRouteName_0();
    local v36 = l_useNavigationFocus_0();
    local v37 = l_useBreakpointXOrSmaller_0(v11.Keys.Small);
    local v38 = v7.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v35 (copy), l_AppPage_0 (ref), v36 (copy), v34 (copy)
        if v35 == l_AppPage_0.EventDetails and v36 then
            v34.goBack();
        end;
    end, {
        v34, 
        v35, 
        v36
    });
    v7.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v30 (copy), v2 (ref), v33 (copy)
        if v30 then
            v2(v30, v33);
        end;
    end, {
        v30, 
        v33
    });
    v7.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v30 (copy), l_FFlagLuaAppSduiEventDetailsLogExposure_0 (ref), l_IXPService_0 (ref), l_FStringLuaAppSduiEventDetailsIxpLayer_0 (ref)
        if v30 and l_FFlagLuaAppSduiEventDetailsLogExposure_0 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppSduiEventDetailsIxpLayer_0);
        end;
    end, {
        v30
    });
    local v39 = v7.useRef(nil);
    if v30 == nil then
        return nil;
    elseif v37 then
        return v7.createElement(l_DetailsPageLayout_0.Root, {
            onClose = v38
        }, {
            Header = v7.createElement(l_DetailsPageLayout_0.Header), 
            Content = v7.createElement(l_DetailsPageLayout_0.Content, {
                scrollingFrameRef = v39
            }, v7.createElement(l_SduiPageEntryPoint_0, {
                appPage = l_AppPage_0.EventDetails, 
                configKey = v29, 
                identifier = v29 .. "_" .. "event_details_feed", 
                pageTimer = v33, 
                includeNavigationHeaderBar = false, 
                backgroundStyle = v28.Color.None, 
                disableRootPadding = true, 
                scrollingFrameRef = v39
            }))
        });
    else
        return v7.createElement(v5.Sheet.Root, {
            isOpen = v36, 
            displaySize = v5.Enums.DialogSize.Large, 
            onClose = v38
        }, {
            Header = v7.createElement(v5.Sheet.Header, {
                hasCloseAffordance = true
            }), 
            Content = v7.createElement(v5.Sheet.Content, {
                scrollingFrameRef = v39
            }, v7.createElement(l_SduiPageEntryPoint_0, {
                appPage = l_AppPage_0.EventDetails, 
                configKey = v29, 
                identifier = v29 .. "_" .. "event_details_feed", 
                pageTimer = v33, 
                includeNavigationHeaderBar = false, 
                backgroundStyle = v28.Color.None, 
                disableRootPadding = true, 
                scrollingFrameRef = v39
            }))
        });
    end;
end);