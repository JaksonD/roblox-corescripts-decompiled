local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v11 = require(script.Parent.Parent.Config.FlyoutContentSettings);
local v12 = require(script.Parent.PrimaryNavigationItem);
local v13 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local v17 = game:DefineFastString("FlyoutGiftCardSourceParam", "flyout-side-panel");
return function(v18) --[[ Line: 30 ]] --[[ Name: FlyoutNavigationItem ]]
    -- upvalues: l_useDispatch_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v1 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), l_default_0 (copy), v11 (copy), v17 (copy), v13 (copy), l_useLocalization_0 (copy), v12 (copy)
    local v19 = l_useDispatch_0();
    local v20 = if l_FFlagCreateConnectionsHub_0 then l_useNavigation_0() else nil;
    local v22 = l_useSelector_0(function(v21) --[[ Line: 33 ]]
        return v21.LocalUserId;
    end);
    local v24 = l_useAppPolicy_0(function(v23) --[[ Line: 36 ]]
        return v23.getGiftCardSourceRefOverride();
    end);
    local v25 = l_useRoactService_0(l_AppEventIngestService_0);
    local v31 = v1.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v18 (copy), l_FFlagCreateConnectionsHub_0 (ref), l_AppPage_0 (ref), v20 (copy), v19 (copy), l_NavigateDown_0 (ref), l_default_0 (ref), v11 (ref), v22 (copy), v24 (copy), v17 (ref), v13 (ref), v25 (copy)
        v18.closeDrawer();
        local v26 = nil;
        if v18.item.context then
            if v18.item.context.url then
                v26 = v18.item.context.url;
            elseif v18.item.context.appPage then
                local l_appPage_0 = v18.item.context.appPage;
                if l_FFlagCreateConnectionsHub_0 and l_appPage_0 == l_AppPage_0.CoHubMyConnections then
                    v20.navigate(l_appPage_0);
                else
                    v19(l_NavigateDown_0({
                        name = l_appPage_0
                    }));
                end;
            elseif v18.item.context.appUri then
                local l_appUri_0 = v18.item.context.appUri;
                l_default_0:isURLRegistered(l_appUri_0):andThen(function(v29) --[[ Line: 58 ]]
                    -- upvalues: l_default_0 (ref), l_appUri_0 (copy)
                    if v29 then
                        l_default_0:detectURL(l_appUri_0);
                    end;
                end);
            elseif v18.item.context.urlGenerator then
                local l_urlGenerator_0 = v18.item.context.urlGenerator;
                if v18.item.itemType == v11.ItemType.Inventory then
                    v26 = l_urlGenerator_0(v22);
                elseif v18.item.itemType == v11.ItemType.GiftCards and v24 and v24 ~= "" then
                    v26 = l_urlGenerator_0(v24 .. "-" .. v17);
                end;
            end;
        end;
        if v26 then
            v19(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = v26, 
                extraProps = {
                    titleKey = v18.item.textKey
                }
            }));
        end;
        v13.sendMoreLegacyAndFlyoutItemClickEvent(v25, v18.item.itemType, v22, v26);
    end, {
        v18.item, 
        v18.closeDrawer, 
        v22, 
        v24, 
        v25
    });
    local v32 = l_useLocalization_0({
        text = v18.item.textKey
    });
    return v1.createElement(v12, {
        layoutOrder = v18.layoutOrder, 
        onActivated = v31, 
        icon = v18.item.icon, 
        text = v32.text, 
        notificationCount = v18.item.notificationCount
    });
end;