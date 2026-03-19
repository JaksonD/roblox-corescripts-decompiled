local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v9 = require(l_Modules_0.LuaApp.Components.More.LogOutButton);
local v10 = require(l_Modules_0.LuaApp.Components.More.MoreButton);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v16 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks);
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v19 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v20 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useFocusGuiObject_0 = v19.useFocusGuiObject;
local v22 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v23 = v2.PureComponent:extend("MoreItemContainer");
v23.defaultProps = {
    layoutInfo = {}, 
    eventIngest = if v22 then v11.any else nil
};
v23.init = function(v24) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v16 (copy), v22 (copy), v2 (copy)
    v24.navigateDown = function() --[[ Line: 36 ]]
        -- upvalues: v24 (copy), v17 (ref), v16 (ref), v22 (ref)
        local l_item_0 = v24.props.item;
        local l_url_0 = l_item_0.context.url;
        local l_titleKey_0 = l_item_0.context.titleKey;
        local l_notificationType_0 = l_item_0.context.notificationType;
        if l_item_0.urlGenerator then
            local l_localUserId_0 = v24.props.localUserId;
            l_url_0 = if v17() then l_item_0.urlGenerator(l_localUserId_0, v24.props.appPolicy) else l_item_0.urlGenerator(l_localUserId_0);
        end;
        local v30 = nil;
        if l_item_0.getSearchParams then
            v30 = l_item_0.getSearchParams(v24.props.formFactor);
        end;
        local v31 = nil;
        if l_titleKey_0 or v30 or l_notificationType_0 then
            v31 = {
                titleKey = l_titleKey_0, 
                searchParams = v30, 
                notificationType = l_notificationType_0
            };
        end;
        local v32 = l_item_0.shouldOpenInExternalBrowser and v24.props.shouldUseExternalBrowserForMorePageItem();
        local v33 = false;
        if v24.props.disableWebViewSupport == true then
            v33 = l_item_0.context.fallbackToExternalBrowser == true;
        end;
        if v32 or v33 then
            v16(v24.props.linking, l_url_0);
        else
            v24.props.navigateDown({
                name = l_item_0.context.page, 
                detail = l_url_0, 
                extraProps = v31
            });
        end;
        if v22 then
            v24.props.eventIngest:sendEventDeferred("moreGridItem", "moreGridItemClick", {
                itemType = l_item_0.itemType, 
                url = l_url_0, 
                localUserId = v24.props.localUserId, 
                source = "flyout"
            });
        end;
    end;
    v24.focusableButtonRef = v2.createRef();
end;
v23.didMount = function(v34) --[[ Line: 92 ]] --[[ Name: didMount ]]
    local l_layoutInfo_0 = v34.props.layoutInfo;
    if v34.props.focusGuiObject and v34.focusableButtonRef and v34.focusableButtonRef.current and l_layoutInfo_0.LayoutOrder == 1 then
        v34.props.focusGuiObject(v34.focusableButtonRef.current);
    end;
end;
v23.render = function(v36) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), v9 (copy), v10 (copy), v1 (copy), v22 (copy)
    local l_layoutInfo_1 = v36.props.layoutInfo;
    local l_item_1 = v36.props.item;
    v5.isType(l_layoutInfo_1, "table", "MoreItemContainer.props.layoutInfo");
    v5.isType(l_item_1, "table", "MoreItemContainer.props.item");
    if l_item_1.itemType == v6.ItemType.LogOut then
        return v2.createElement(v9, {
            onActivated = v36.onActivated
        });
    else
        return v2.createElement(v10, v1.Dictionary.join(l_layoutInfo_1, {
            badgeComponent = l_item_1.badgeComponent, 
            badgeCount = l_item_1.badgeCount, 
            icon = if v22 then nil else l_item_1.icon, 
            rightImage = l_item_1.rightImage, 
            textKey = l_item_1.textKey, 
            TextXAlignment = l_item_1.textXAlignment, 
            onActivated = v36.navigateDown, 
            buttonRef = v36.focusableButtonRef
        }));
    end;
end;
v23 = v3.connect(function(v39, _) --[[ Line: 133 ]]
    return {
        formFactor = v39.FormFactor, 
        localUserId = v39.LocalUserId
    };
end, function(v41) --[[ Line: 138 ]]
    -- upvalues: v14 (copy)
    return {
        navigateDown = function(v42) --[[ Line: 140 ]] --[[ Name: navigateDown ]]
            -- upvalues: v41 (copy), v14 (ref)
            v41(v14(v42));
        end
    };
end)(v23);
v23 = l_RoactAppPolicy_0.connect(function(v43) --[[ Line: 146 ]]
    -- upvalues: v17 (copy)
    local v44 = not v43.getWebViewSupport();
    return {
        shouldUseExternalBrowserForMorePageItem = v43.shouldUseExternalBrowserForMorePageItem, 
        disableWebViewSupport = v44, 
        appPolicy = if v17() then v43 else nil
    };
end)(v23);
v23 = l_RoactServices_0.connect({
    linking = l_AppLinking_0, 
    networkImpl = v13, 
    eventIngest = if v22 then v12 else nil
})(v23);
return function(v45) --[[ Line: 161 ]]
    -- upvalues: l_useFocusGuiObject_0 (copy), v18 (copy), v20 (copy), v2 (copy), v23 (ref), v1 (copy)
    local v46 = l_useFocusGuiObject_0();
    local v47 = v18.useLastInputMethod();
    local v48 = v20.useIsSpatial();
    local v49 = not ((not (v47 ~= "Gamepad") or v47 == "Keyboard") and not v48);
    return v2.createElement(v23, v1.Dictionary.join(v45, {
        focusGuiObject = if not v49 then v46 else nil
    }));
end;