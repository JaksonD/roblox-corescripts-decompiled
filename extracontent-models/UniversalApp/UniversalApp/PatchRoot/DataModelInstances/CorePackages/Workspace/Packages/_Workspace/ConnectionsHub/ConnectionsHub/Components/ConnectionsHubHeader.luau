local l_Parent_0 = script:FindFirstAncestor("ConnectionsHub").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local l_getPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.getPageMargin;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v9 = require(l_Parent_0.AppHeaderBar);
local l_UserSearchBarButton_0 = require(l_Parent_0.SocialCommon).Components.UserSearchBar.UserSearchBarButton;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
return function() --[[ Line: 23 ]] --[[ Name: ConnectionsHubHeader ]]
    -- upvalues: l_useTokens_0 (copy), l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_getPageMargin_0 (copy), v3 (copy), v9 (copy), l_View_0 (copy), l_AppPage_0 (copy), l_Sources_0 (copy), l_UserSearchBarButton_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = l_useScreenSize_0();
    local v14 = l_useNavigation_0();
    local v15 = l_getPageMargin_0(v13.X);
    local l_Size_1200_0 = v12.Size.Size_1200;
    local v17 = v3.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v14 (copy)
        v14.goBack();
    end, {
        v14
    });
    local v18 = v3.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v9 (ref), v17 (copy)
        return v9.makeBackButton(v17);
    end, {
        v17
    });
    local v19 = v3.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v3 (ref), l_View_0 (ref), v18 (copy)
        return v3.createElement(l_View_0, {
            tag = "size-0 auto-xy align-x-left", 
            LayoutOrder = 1
        }, {
            button = v18()
        });
    end, {
        v18
    });
    local v20 = v3.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v14 (copy), l_AppPage_0 (ref), l_Sources_0 (ref)
        v14.navigate(l_AppPage_0.UserSearch, {
            entryPoint = l_Sources_0.ConnectionsHub, 
            shouldShowUserSearchLandingPage = true
        });
    end, {
        v14
    });
    local v21 = v3.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v3 (ref), l_View_0 (ref), l_UserSearchBarButton_0 (ref), v20 (copy)
        return v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y fill align-x-center", 
            LayoutOrder = 2
        }, {
            bar = v3.createElement(l_UserSearchBarButton_0, {
                onActivated = v20
            })
        });
    end, {
        v20
    });
    return v3.createElement(l_View_0, {
        tag = "row fill align-y-center gap-medium", 
        Size = UDim2.new(1, 0, 0, l_Size_1200_0)
    }, {
        pageMargins = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v15), 
            PaddingRight = UDim.new(0, v15)
        }), 
        backButton = v19, 
        searchBar = v21
    });
end;