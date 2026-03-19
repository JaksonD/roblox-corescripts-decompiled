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
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
return v3.memo(function(v18) --[[ Line: 42 ]] --[[ Name: HeaderButtons ]]
    -- upvalues: v16 (copy), l_usePageNavigation_0 (copy), l_useState_0 (copy), v5 (copy), l_useNotApprovedPageContext_0 (copy), v17 (copy), l_STATIC_PAGE_NAMES_0 (copy), v3 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_Button_0 (copy), v14 (copy)
    local v19 = if v16 then l_usePageNavigation_0() else nil;
    local v20, v21 = l_useState_0(false);
    local v22 = v5(v21, v18.LogoutThunk);
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v24 = v17 and v19 and v19.currentPageName == l_STATIC_PAGE_NAMES_0.SecondChanceIntro;
    if v16 and v19 then
        local l_createElement_0 = v3.createElement;
        local l_l_View_0_0 = l_View_0;
        local v27 = {
            tag = "size-full-0 auto-y col gap-large padding-y-large"
        };
        local v28 = {
            Buttons = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y row flex-between padding-left-large padding-right-xxlarge", 
                LayoutOrder = 1
            }, {
                BackButton = v3.createElement(l_IconButton_0, {
                    icon = "chevron-large-left", 
                    variant = l_ButtonVariant_0.Utility, 
                    isCircular = true, 
                    onActivated = v19.goToPreviousPage, 
                    LayoutOrder = 1, 
                    size = l_ButtonSize_0.Small, 
                    testId = "back-button"
                }), 
                LogoutButton = v19.isLastPage and v3.createElement(l_Button_0, {
                    text = l_translations_0.logoutButton, 
                    onActivated = v22, 
                    variant = l_ButtonVariant_0.Text, 
                    isLoading = v20, 
                    isDisabled = v20, 
                    size = l_ButtonSize_0.Small, 
                    LayoutOrder = 2
                })
            })
        };
        local v29 = false;
        if v19.totalPages > 2 then
            v29 = not v24 and v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-x-xxlarge", 
                LayoutOrder = 2
            }, v3.createElement(v14, nil));
        end;
        v28.ProgressBar = v29;
        return (l_createElement_0(l_l_View_0_0, v27, v28));
    else
        return (v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y row flex-between padding-small padding-right-xxlarge"
        }, {
            BackButton = v3.createElement(l_Button_0, {
                icon = "icons/actions/cycleLeft", 
                text = l_translations_0.backButton, 
                onActivated = v18.goBackOnePage, 
                variant = l_ButtonVariant_0.Text, 
                testId = "back-button", 
                LayoutOrder = 1
            }), 
            LogoutButton = v3.createElement(l_Button_0, {
                text = l_translations_0.logoutButton, 
                onActivated = v22, 
                variant = l_ButtonVariant_0.Text, 
                isLoading = v20, 
                isDisabled = v20, 
                LayoutOrder = 2
            })
        }));
    end;
end);