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
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
return v3.memo(function(v16) --[[ Line: 43 ]] --[[ Name: PageItemsFromConfigs ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRef_0 (copy), l_usePageNavigation_0 (copy), l_renderPageItemsFromList_0 (copy), l_useEffect_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_View_0 (copy), v12 (copy)
    local v17 = l_useDispatch_0();
    local v18 = l_useRef_0(nil);
    local l_moderationDetail_0 = v16.moderationDetail;
    local v20 = l_usePageNavigation_0();
    local l_currentPage_0 = v20.currentPage;
    local v22 = l_renderPageItemsFromList_0(v20.currentPageConfigs, l_moderationDetail_0, v17, v20.currentPage, v20.hasEducationalPages, v20.isFirstPage, v20.currentPageName, v16.commutationEligibility);
    l_useEffect_0(function() --[[ Line: 64 ]]
        -- upvalues: l_FFlagEnableNapDedicatedPage_0 (ref), v18 (copy)
        if l_FFlagEnableNapDedicatedPage_0 and v18.current then
            local l_FirstChildWhichIsA_0 = v18.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                l_FirstChildWhichIsA_0.CanvasPosition = Vector2.new(0, 0);
            end;
        end;
    end, l_dependencyArray_0(l_currentPage_0));
    local v24 = not l_FFlagEnableNapDedicatedPage_0 and l_currentPage_0 ~= 1;
    local l_createElement_0 = v3.createElement;
    local l_l_ScrollView_0_0 = l_ScrollView_0;
    local v27 = {
        tag = "size-full", 
        ref = if l_FFlagEnableNapDedicatedPage_0 then v18 else nil, 
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            scrollBarVisibility = l_ScrollBarVisibility_0.Always
        }
    };
    local v28 = {};
    local l_createElement_1 = v3.createElement;
    local l_l_View_0_0 = l_View_0;
    local v31 = {
        tag = "size-full-0 auto-y col"
    };
    local v32 = {
        HeaderButtons = if v24 then v3.createElement(v12, {
            LogoutThunk = v16.LogoutThunk
        }) else nil
    };
    local l_createElement_2 = v3.createElement;
    local l_l_View_0_1 = l_View_0;
    local v35 = {};
    local v36 = {
        ["size-full-0 auto-y col gap-xlarge padding-x-xxlarge"] = true
    };
    local v37 = false;
    if l_currentPage_0 == 1 then
        v37 = not l_FFlagEnableNapDedicatedPage_0;
    end;
    v36["padding-top-xxlarge"] = v37;
    v37 = false;
    if l_currentPage_0 ~= 1 then
        v37 = not l_FFlagEnableNapDedicatedPage_0;
    end;
    v36["padding-top-small"] = v37;
    v35.tag = v36;
    v35.LayoutOrder = 2;
    v32.PageItemsContent = l_createElement_2(l_l_View_0_1, v35, unpack(v22));
    v28.Content = l_createElement_1(l_l_View_0_0, v31, v32);
    return l_createElement_0(l_l_ScrollView_0_0, v27, v28);
end);