local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useRef_0 = v3.useRef;
local v7 = require(l_Parent_0.Foundation);
local l_View_0 = v7.View;
local l_ScrollView_0 = v7.ScrollView;
local l_ScrollBarVisibility_0 = v7.Enums.ScrollBarVisibility;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v12 = require(l_script_FirstAncestor_0.Components.HeaderButtons);
local l_renderPageItemsFromList_0 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils).renderPageItemsFromList;
local v14 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.PunishmentDescriptionConfig);
local v15 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.RecentActivityConfig);
local v16 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.PreventionStepsConfig);
local v17 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.ChargebackStepsConfig);
local v18 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.WhatHappenedConfig);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
local v22 = {
    {
        v14, 
        v18, 
        v15
    }, 
    {
        v16, 
        v17
    }
};
return v3.memo(function(v23) --[[ Line: 73 ]] --[[ Name: PageItemsFromConfigs ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRef_0 (copy), l_renderPageItemsFromList_0 (copy), v22 (copy), v19 (copy), l_usePageNavigation_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), l_useEffect_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_View_0 (copy), v12 (copy)
    local v24 = l_useDispatch_0();
    local v25 = l_useRef_0(nil);
    local l_page_0 = v23.page;
    local l_moderationDetail_0 = v23.moderationDetail;
    local v28 = l_renderPageItemsFromList_0(v22[l_page_0], l_moderationDetail_0, v24, l_page_0);
    local v29 = if v19 then l_usePageNavigation_0() else nil;
    local v30 = if v19 and v29 then l_renderPageItemsFromList_0(v29.currentPageConfigs, l_moderationDetail_0, v24, l_page_0, v29.hasEducationalPages, v29.isFirstPage, v29.currentPageName, v23.commutationEligibility) else {};
    local v31 = if l_FFlagEnableNapDedicatedPage_0 and v19 and v29 then v29.currentPage else l_page_0;
    l_useEffect_0(function() --[[ Line: 103 ]]
        -- upvalues: l_FFlagEnableNapDedicatedPage_0 (ref), v25 (copy)
        if l_FFlagEnableNapDedicatedPage_0 and v25.current then
            local l_FirstChildWhichIsA_0 = v25.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                l_FirstChildWhichIsA_0.CanvasPosition = Vector2.new(0, 0);
            end;
        end;
    end, l_dependencyArray_0(v31));
    local v33 = v19 and v29 and v29.currentPage ~= 1;
    local v34 = not v19 and l_page_0 ~= 1;
    local v35 = not l_FFlagEnableNapDedicatedPage_0 and (v33 or v34);
    return v3.createElement(l_ScrollView_0, {
        tag = "size-full", 
        ref = if l_FFlagEnableNapDedicatedPage_0 then v25 else nil, 
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            scrollBarVisibility = l_ScrollBarVisibility_0.Always
        }
    }, {
        Content = v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y col"
        }, {
            HeaderButtons = if v35 then v3.createElement(v12, {
                goBackOnePage = v23.goBackOnePage, 
                LogoutThunk = v23.LogoutThunk
            }) else nil, 
            PageItemsContent = v3.createElement(l_View_0, {
                tag = {
                    ["size-full-0 auto-y col gap-xlarge padding-x-xxlarge"] = true, 
                    ["padding-top-xxlarge"] = if v19 and v29 then v29.currentPage == 1 and not l_FFlagEnableNapDedicatedPage_0 else l_page_0 == 1 and not l_FFlagEnableNapDedicatedPage_0, 
                    ["padding-top-small"] = if v19 and v29 then v29.currentPage ~= 1 and not l_FFlagEnableNapDedicatedPage_0 else l_page_0 ~= 1 and not l_FFlagEnableNapDedicatedPage_0
                }, 
                LayoutOrder = 2
            }, unpack(if v19 and v29 then v30 else v28))
        })
    });
end);