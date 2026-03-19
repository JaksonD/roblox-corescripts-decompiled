local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: openFiatPurchasePage ]]
    -- upvalues: l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    return function(v5) --[[ Line: 8 ]]
        -- upvalues: l_AppPage_0 (ref), v3 (copy), v4 (copy), l_NavigateDown_0 (ref)
        local v6 = {
            name = l_AppPage_0.GenericWebPage, 
            detail = v3, 
            extraProps = {
                titleKey = "Feature.PaidAccessPurchases.Webview.Title.Checkout", 
                onClose = v4
            }
        };
        v5:dispatch(l_NavigateDown_0(v6));
    end;
end;