local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.AvatarExperienceNavigation);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_canGoBack_0 = require(l_Parent_0.Navigation).canGoBack;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ClearTryOns_0 = require(l_Parent_0.AvatarExperienceCommon).State.Actions.ClearTryOns;
local l_useAvatarRoute_0 = v3.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v3.Enums.AvatarScreen;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v4.FFlagAXEnableExpiredUserLookCheckout;
return v1.memo(function() --[[ Line: 21 ]] --[[ Name: CheckoutPageHeader ]]
    -- upvalues: l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), l_useAvatarRoute_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_AvatarScreen_0 (copy), l_ClearTryOns_0 (copy), l_canGoBack_0 (copy)
    local v13 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then l_useDispatch_0() else nil;
    local v14 = l_useNavigation_0();
    local v15 = v2.Hooks.useTokens();
    local v16 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then l_useAvatarRoute_0() else nil;
    local v17 = l_useLocalization_0({
        checkoutTitle = "Feature.Catalog.Header.Checkout"
    });
    local v18 = v1.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v16 (copy), l_AvatarScreen_0 (ref), v13 (copy), l_ClearTryOns_0 (ref), l_canGoBack_0 (ref), v14 (copy)
        if l_FFlagAXEnableExpiredUserLookCheckout_0 and (v16 and v16.current and v16.current.name) == l_AvatarScreen_0.ExpiredUserLookCheckout then
            v13(l_ClearTryOns_0());
        end;
        if l_canGoBack_0(v14) then
            v14.goBack();
        end;
    end, {
        v14, 
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then v16 else nil, 
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then v13 else nil
    });
    return v1.createElement(v2.View, {
        tag = "auto-y size-full-0 bg-surface-0 row items-center padding-x-xlarge padding-y-medium gap-medium"
    }, {
        BackButton = v1.createElement(v2.IconButton, {
            onActivated = v18, 
            size = v2.Enums.InputSize.Medium, 
            icon = "chevron-large-left", 
            tag = "content-emphasis"
        }), 
        Title = v1.createElement(v2.Text, {
            Text = v17.checkoutTitle, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            tag = "grow text-label-large content-emphasis auto-y"
        }), 
        Spacer = v1.createElement(v2.View, {
            Size = UDim2.fromOffset(v15.Size.Size_1000, 0)
        })
    });
end);