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
local l_FFlagSduiPageEntryUseSharedHooks_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryUseSharedHooks;
local function _(v21, v22) --[[ Line: 38 ]] --[[ Name: getFromPropsOrNavigationParams ]]
    local v23 = v21.navigation and v21.navigation.getParam("extraProps");
    return v21[v22] or v23 and v23[v22];
end;
local function _(v25, v26) --[[ Line: 46 ]]
    return v25 .. "_" .. v26;
end;
return v7.memo(function(v28) --[[ Line: 50 ]] --[[ Name: SduiEventDetailsPage ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v7 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), l_useNavigation_0 (copy), l_useRouteName_0 (copy), l_useNavigationFocus_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v2 (copy), l_FFlagLuaAppSduiEventDetailsLogExposure_0 (copy), l_IXPService_0 (copy), l_FStringLuaAppSduiEventDetailsIxpLayer_0 (copy), l_DetailsPageLayout_0 (copy), l_SduiPageEntryPoint_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), v5 (copy)
    local v29 = l_useTokens_0();
    local v30 = v28.navigation and v28.navigation.getParam("extraProps");
    local v31 = v28.eventId or v30 and v30.eventId or v28.navigation and v28.navigation.getParam("detail");
    v30 = v3(v31);
    local v34 = v7.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v28 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local l_v28_0 = v28;
        local v33 = l_v28_0.navigation and l_v28_0.navigation.getParam("extraProps");
        return l_v28_0.pageTimer or v33 and v33.pageTimer or l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.EventDetails);
    end, {});
    local v35 = l_useNavigation_0();
    local v36 = l_useRouteName_0();
    local v37 = l_useNavigationFocus_0();
    local v38 = l_useBreakpointXOrSmaller_0(v11.Keys.Small);
    local v39 = v7.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v36 (copy), l_AppPage_0 (ref), v37 (copy), v35 (copy)
        if v36 == l_AppPage_0.EventDetails and v37 then
            v35.goBack();
        end;
    end, {
        v35, 
        v36, 
        v37
    });
    v7.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v31 (copy), v2 (ref), v34 (copy)
        if v31 then
            v2(v31, v34);
        end;
    end, {
        v31, 
        v34
    });
    v7.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v31 (copy), l_FFlagLuaAppSduiEventDetailsLogExposure_0 (ref), l_IXPService_0 (ref), l_FStringLuaAppSduiEventDetailsIxpLayer_0 (ref)
        if v31 and l_FFlagLuaAppSduiEventDetailsLogExposure_0 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppSduiEventDetailsIxpLayer_0);
        end;
    end, {
        v31
    });
    local v40 = v7.useRef(nil);
    if v31 == nil then
        return nil;
    elseif v38 then
        return v7.createElement(l_DetailsPageLayout_0.Root, {
            onClose = v39
        }, {
            Header = v7.createElement(l_DetailsPageLayout_0.Header), 
            Content = v7.createElement(l_DetailsPageLayout_0.Content, {
                scrollingFrameRef = v40
            }, v7.createElement(l_SduiPageEntryPoint_0, {
                appPage = l_AppPage_0.EventDetails, 
                configKey = v30, 
                identifier = l_FFlagSduiPageEntryUseSharedHooks_0 and "event_details_feed" or v30 .. "_" .. "event_details_feed", 
                pageTimer = v34, 
                includeNavigationHeaderBar = false, 
                backgroundStyle = v29.Color.None, 
                disableRootPadding = true, 
                scrollingFrameRef = v40
            }))
        });
    else
        return v7.createElement(v5.Sheet.Root, {
            isOpen = v37, 
            displaySize = v5.Enums.DialogSize.Large, 
            onClose = v39
        }, {
            Header = v7.createElement(v5.Sheet.Header, {
                hasCloseAffordance = true
            }), 
            Content = v7.createElement(v5.Sheet.Content, {
                scrollingFrameRef = v40
            }, v7.createElement(l_SduiPageEntryPoint_0, {
                appPage = l_AppPage_0.EventDetails, 
                configKey = v30, 
                identifier = l_FFlagSduiPageEntryUseSharedHooks_0 and "event_details_feed" or v30 .. "_" .. "event_details_feed", 
                pageTimer = v34, 
                includeNavigationHeaderBar = false, 
                backgroundStyle = v29.Color.None, 
                disableRootPadding = true, 
                scrollingFrameRef = v40
            }))
        });
    end;
end);