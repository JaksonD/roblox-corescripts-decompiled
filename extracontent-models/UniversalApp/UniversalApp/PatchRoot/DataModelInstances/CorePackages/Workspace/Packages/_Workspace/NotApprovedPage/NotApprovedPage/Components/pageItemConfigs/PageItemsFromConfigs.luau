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
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
return v3.memo(function(v17) --[[ Line: 45 ]] --[[ Name: PageItemsFromConfigs ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRef_0 (copy), l_usePageNavigation_0 (copy), l_renderPageItemsFromList_0 (copy), l_useEffect_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_View_0 (copy), v12 (copy)
    local v18 = l_useDispatch_0();
    local v19 = l_useRef_0(nil);
    local l_moderationDetail_0 = v17.moderationDetail;
    local v21 = l_usePageNavigation_0();
    local l_currentPage_0 = v21.currentPage;
    local v23 = l_renderPageItemsFromList_0(v21.currentPageConfigs, l_moderationDetail_0, v18, v21.currentPage, v21.hasEducationalPages, v21.isFirstPage, v21.currentPageName, v17.commutationEligibility);
    l_useEffect_0(function() --[[ Line: 66 ]]
        -- upvalues: l_FFlagEnableNapDedicatedPage_0 (ref), v19 (copy)
        if l_FFlagEnableNapDedicatedPage_0 and v19.current then
            local l_FirstChildWhichIsA_0 = v19.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                l_FirstChildWhichIsA_0.CanvasPosition = Vector2.new(0, 0);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_currentPage_0
    } else l_dependencyArray_0(l_currentPage_0));
    local v25 = not l_FFlagEnableNapDedicatedPage_0 and l_currentPage_0 ~= 1;
    local l_createElement_0 = v3.createElement;
    local l_l_ScrollView_0_0 = l_ScrollView_0;
    local v28 = {
        tag = "size-full", 
        ref = if l_FFlagEnableNapDedicatedPage_0 then v19 else nil, 
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            scrollBarVisibility = l_ScrollBarVisibility_0.Always
        }
    };
    local v29 = {};
    local l_createElement_1 = v3.createElement;
    local l_l_View_0_0 = l_View_0;
    local v32 = {
        tag = "size-full-0 auto-y col"
    };
    local v33 = {
        HeaderButtons = if v25 then v3.createElement(v12, {
            LogoutThunk = v17.LogoutThunk
        }) else nil
    };
    local l_createElement_2 = v3.createElement;
    local l_l_View_0_1 = l_View_0;
    local v36 = {};
    local v37 = {
        ["size-full-0 auto-y col gap-xlarge padding-x-xxlarge"] = true
    };
    local v38 = false;
    if l_currentPage_0 == 1 then
        v38 = not l_FFlagEnableNapDedicatedPage_0;
    end;
    v37["padding-top-xxlarge"] = v38;
    v38 = false;
    if l_currentPage_0 ~= 1 then
        v38 = not l_FFlagEnableNapDedicatedPage_0;
    end;
    v37["padding-top-small"] = v38;
    v36.tag = v37;
    v36.LayoutOrder = 2;
    v33.PageItemsContent = l_createElement_2(l_l_View_0_1, v36, unpack(v23));
    v29.Content = l_createElement_1(l_l_View_0_0, v32, v33);
    return l_createElement_0(l_l_ScrollView_0_0, v28, v29);
end);