local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_usePageAnalytics_0 = require(l_script_FirstAncestor_0.Contexts.PageAnalyticsContext).usePageAnalytics;
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
return v3.memo(function(v9) --[[ Line: 30 ]] --[[ Name: CtaButtonsContainer ]]
    -- upvalues: l_usePageNavigation_0 (copy), l_usePageAnalytics_0 (copy), l_useDispatch_0 (copy), v3 (copy), l_View_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy)
    local v10 = l_usePageNavigation_0();
    local v11 = l_usePageAnalytics_0();
    local v12 = l_useDispatch_0();
    local l_CurrentCtaComponent_0 = v10.CurrentCtaComponent;
    if not l_CurrentCtaComponent_0 then
        return nil;
    else
        return v3.createElement(l_View_0, {
            tag = {
                ["size-full-0 auto-y col gap-medium padding-x-xxlarge"] = true, 
                ["padding-y-xsmall"] = not l_FFlagEnableNapDedicatedPage_0, 
                ["padding-bottom-xxlarge"] = l_FFlagEnableNapDedicatedPage_0, 
                ["padding-top-medium"] = l_FFlagEnableNapDedicatedPage_0
            }
        }, v3.createElement(l_CurrentCtaComponent_0, {
            key = v10.currentPageName, 
            moderationDetail = v9.moderationDetail, 
            dispatch = v12, 
            LogoutThunk = v9.LogoutThunk, 
            goToNextPage = v10.goToNextPage, 
            sendPageEvent = v11.sendPageEvent, 
            hasNavigatedForward = v10.hasNavigatedForward
        }));
    end;
end);