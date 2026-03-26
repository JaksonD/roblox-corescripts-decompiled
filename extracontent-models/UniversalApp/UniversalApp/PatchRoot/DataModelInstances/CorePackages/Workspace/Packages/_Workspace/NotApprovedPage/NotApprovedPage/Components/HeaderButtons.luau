local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useState_0 = v3.useState;
local v5 = require(l_script_FirstAncestor_0.Utils.useLogout);
local v6 = require(l_Parent_0.Foundation);
local l_View_0 = v6.View;
local l_Button_0 = v6.Button;
local l_IconButton_0 = v6.IconButton;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_ButtonSize_0 = v6.Enums.ButtonSize;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
local v14 = require(l_script_FirstAncestor_0.Components.HeaderProgressBar);
local l_STATIC_PAGE_NAMES_0 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils).STATIC_PAGE_NAMES;
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
return v3.memo(function(v17) --[[ Line: 39 ]] --[[ Name: HeaderButtons ]]
    -- upvalues: l_usePageNavigation_0 (copy), l_useState_0 (copy), v5 (copy), l_useNotApprovedPageContext_0 (copy), v16 (copy), l_STATIC_PAGE_NAMES_0 (copy), v3 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_Button_0 (copy), v14 (copy)
    local v18 = l_usePageNavigation_0();
    local v19, v20 = l_useState_0(false);
    local v21 = v5(v20, v17.LogoutThunk);
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v23 = v16 and v18 and v18.currentPageName == l_STATIC_PAGE_NAMES_0.SecondChanceIntro;
    local l_createElement_0 = v3.createElement;
    local l_l_View_0_0 = l_View_0;
    local v26 = {
        tag = "size-full-0 auto-y col gap-large padding-y-large"
    };
    local v27 = {
        Buttons = v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y row flex-between padding-left-large padding-right-xxlarge", 
            LayoutOrder = 1
        }, {
            BackButton = v3.createElement(l_IconButton_0, {
                icon = "chevron-large-left", 
                variant = l_ButtonVariant_0.Utility, 
                isCircular = true, 
                onActivated = v18.goToPreviousPage, 
                LayoutOrder = 1, 
                size = l_ButtonSize_0.Small, 
                testId = "back-button"
            }), 
            LogoutButton = v18.isLastPage and v3.createElement(l_Button_0, {
                text = l_translations_0.logoutButton, 
                onActivated = v21, 
                variant = l_ButtonVariant_0.Text, 
                isLoading = v19, 
                isDisabled = v19, 
                size = l_ButtonSize_0.Small, 
                LayoutOrder = 2
            })
        })
    };
    local v28 = false;
    if v18.totalPages > 2 then
        v28 = not v23 and v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-x-xxlarge", 
            LayoutOrder = 2
        }, v3.createElement(v14, nil));
    end;
    v27.ProgressBar = v28;
    return l_createElement_0(l_l_View_0_0, v26, v27);
end);