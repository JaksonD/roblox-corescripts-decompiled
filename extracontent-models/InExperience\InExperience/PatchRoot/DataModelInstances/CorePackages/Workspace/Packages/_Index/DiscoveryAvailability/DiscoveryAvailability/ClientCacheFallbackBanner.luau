local l_Parent_0 = script:FindFirstAncestor("DiscoveryAvailability").Parent;
local v1 = require(l_Parent_0.AppBlox);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Responsive);
local v4 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.CollectionViews);
local v7 = require(l_Parent_0.UIBlox);
local _ = require(l_Parent_0.LuauPolyfill);
local v9 = require(l_Parent_0.NotificationModalsManager);
local l_usePageSideMargin_0 = v6.usePageSideMargin;
local l_Banner_0 = v1.Banner;
local l_View_0 = v4.View;
local l_Enums_0 = v4.Enums;
local l_useTokens_0 = v4.Hooks.useTokens;
return function(v15) --[[ Line: 28 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_usePageSideMargin_0 (copy), v3 (copy), v9 (copy), v7 (copy), l_View_0 (copy), l_Banner_0 (copy), l_Enums_0 (copy)
    local v16 = l_useTokens_0();
    local v17 = l_useLocalization_0({
        errorTitle = "Feature.Home.ClientCacheFallbackBanner.Label.Error", 
        errorMessage = "Feature.Home.ClientCacheFallbackBanner.Label.RefreshPageToLoadContents", 
        refreshButton = "Feature.Home.ClientCacheFallbackBanner.Action.Refresh", 
        errorRefreshingToastTitle = "Feature.Home.ClientCacheFallbackBanner.Label.ErrorRefreshingToastTitle"
    });
    local v18 = v2.useRef(nil);
    local v19 = l_usePageSideMargin_0(v18.current);
    local v20 = v3.useBreakpointXOrSmaller(v3.Keys.Small);
    local v21, v22 = v2.useState(false);
    local v25 = v2.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v22 (copy), v15 (copy), v9 (ref), v7 (ref), v17 (copy)
        v22(true);
        v15.onRefreshButtonClick():andThen(function(_) --[[ Line: 49 ]]
            -- upvalues: v22 (ref)
            v22(false);
        end):catch(function(_) --[[ Line: 52 ]]
            -- upvalues: v22 (ref), v9 (ref), v7 (ref), v17 (ref)
            v22(false);
            v9.SetUIBloxToast({
                iconImage = v7.App.ImageSet.Images["icons/status/alert"], 
                toastTitle = v17.errorRefreshingToastTitle, 
                sequenceNumber = DateTime.now().UnixTimestamp
            });
        end);
    end, {
        v15.onRefreshButtonClick, 
        v17.errorRefreshingToastTitle
    });
    return v2.createElement(l_View_0, {
        position = v15.Position, 
        [v2.Change.AbsoluteSize] = v15[v2.Change.AbsoluteSize], 
        ref = v18, 
        tag = "size-full-0 auto-y"
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v19), 
            PaddingRight = UDim.new(0, v19), 
            PaddingTop = UDim.new(0, v16.Padding.Large), 
            PaddingBottom = UDim.new(0, v20 and 0 or v16.Padding.Large)
        }), 
        BannerContent = v2.createElement(l_Banner_0, {
            icon = l_Enums_0.IconName.CircleX, 
            iconVariant = l_Enums_0.IconVariant.Filled, 
            iconStyle = v16.Color.System.Alert, 
            title = v17.errorTitle, 
            body = v17.errorMessage, 
            buttons = {
                {
                    text = v17.refreshButton, 
                    isLoading = v21, 
                    onActivated = v25
                }
            }
        })
    });
end;