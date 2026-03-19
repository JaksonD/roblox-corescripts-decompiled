local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v6 = require(l_Parent_0.Foundation);
local l_Button_0 = v6.Button;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_ButtonSize_0 = v6.Enums.ButtonSize;
local v10 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local v13 = require(script.Parent.Parent.Config.FlyoutContentSettings);
return function(v14) --[[ Line: 22 ]] --[[ Name: FlyoutQuickSigninButton ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v1 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v13 (copy), v10 (copy), l_useLocalization_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useRoactService_0(l_AppEventIngestService_0);
    local v18 = v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v14 (copy), v15 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v13 (ref), v10 (ref), v16 (copy)
        v14.closeDrawer();
        v15(l_NavigateDown_0({
            name = l_AppPage_0.CrossDeviceLogin
        }));
        local l_QuickSignin_0 = v13.ItemType.QuickSignin;
        v10.sendMoreLegacyAndFlyoutItemClickEvent(v16, l_QuickSignin_0);
    end, {
        v16, 
        v14.closeDrawer
    });
    local v19 = l_useLocalization_0({
        title = "Authentication.CrossDevice.Heading.QuickLogin"
    });
    return v1.createElement(l_Button_0, {
        text = v19.title, 
        variant = l_ButtonVariant_0.Standard, 
        LayoutOrder = v14.layoutOrder, 
        onActivated = v18, 
        isDisabled = false, 
        size = l_ButtonSize_0.Large, 
        width = UDim.new(1, 0)
    });
end;