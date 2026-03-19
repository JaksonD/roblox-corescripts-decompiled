local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v7 = require(l_script_FirstAncestor_0.Components.UserSearchHeaderBar);
local v8 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v8.EventNames;
local l_useUserSearchAnalytics_0 = v8.useUserSearchAnalytics;
return function(v11) --[[ Line: 31 ]] --[[ Name: UserSearchScreen ]]
    -- upvalues: l_useNavigation_0 (copy), l_useStyle_0 (copy), l_useUserSearchAnalytics_0 (copy), v2 (copy), l_EventNames_0 (copy), l_AppPage_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v7 (copy)
    local l_renderUserSearchResults_0 = v11.renderUserSearchResults;
    local v13 = l_useNavigation_0();
    local v14 = l_useStyle_0();
    local l_Tokens_0 = v14.Tokens;
    local v16 = v13.getParam("searchKeyword");
    local v17 = v13.getParam("shouldShowUserSearchLandingPage");
    local v18 = v13.getParam("entryPoint");
    local v19 = l_useUserSearchAnalytics_0({
        currentPage = v18
    });
    local l_userSearchSessionId_0 = v19.getInfoForAllEvents().userSearchSessionId;
    v2.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v17 (copy), v19 (copy), l_EventNames_0 (ref)
        if v17 then
            v19.fireAnalyticsEvent(l_EventNames_0.UserSearchBarOpen);
        end;
    end, {});
    local v22 = v2.useCallback(function(v21) --[[ Line: 55 ]]
        -- upvalues: v13 (copy), l_AppPage_0 (ref), v18 (copy), v19 (copy), l_EventNames_0 (ref)
        v13.replace(l_AppPage_0.UserSearch, {
            searchKeyword = v21, 
            entryPoint = v18
        });
        v19.fireAnalyticsEvent(l_EventNames_0.UserSearchBarSubmit, {
            kwd = v21
        });
    end, {
        v18
    });
    local v23 = v2.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v13 (copy), v19 (copy), l_EventNames_0 (ref)
        v13.pop();
        v19.fireAnalyticsEvent(l_EventNames_0.UserSearchBarCancel);
    end, {});
    local v24 = v2.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: l_renderUserSearchResults_0 (copy), v16 (copy), v17 (copy), l_userSearchSessionId_0 (copy)
        return l_renderUserSearchResults_0({
            searchKeyword = v16, 
            shouldShowUserSearchLandingPage = v17, 
            searchUuid = l_userSearchSessionId_0
        });
    end, {
        v16, 
        v17, 
        l_userSearchSessionId_0
    });
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v14.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v14.Theme.BackgroundDefault.Transparency
    }, {
        UserSearchHeaderBar = v2.createElement(v7, {
            searchKeyword = v16, 
            focusOnSearchInput = v17, 
            onSubmitSearch = v22, 
            onBackClick = v23, 
            headerHeight = l_Tokens_0.Global.Size_600
        }), 
        PageContent = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, l_Tokens_0.Global.Size_600), 
            Size = UDim2.new(1, 0, 1, -l_Tokens_0.Global.Size_600)
        }, {
            UserSearchPage = v24
        })
    });
end;