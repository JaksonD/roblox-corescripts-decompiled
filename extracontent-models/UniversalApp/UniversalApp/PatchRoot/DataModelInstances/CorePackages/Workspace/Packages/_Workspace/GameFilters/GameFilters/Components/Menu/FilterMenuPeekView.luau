local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = require(l_Parent_0.PeekView);
local l_PeekView_0 = v4.PeekView;
local l_PeekViewState_0 = v4.PeekViewState;
local v7 = require(l_Parent_0.React);
local l_Signal_0 = v2.Signal;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v12 = require(l_script_FirstAncestor_0.Analytics.FilterClickButtonName);
local v13 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuActionBar);
local v14 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuHeader);
local v15 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuOptions);
local v16 = require(l_script_FirstAncestor_0.Components.Menu.useTopBarHeightSelector);
local v17 = require(l_script_FirstAncestor_0.Analytics.getOptionContextTag);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
local l_FFlagLuaAppChartsActiveFilterChips_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsActiveFilterChips;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 38 ]] --[[ Name: FilterMenuPeekView ]]
    -- upvalues: l_useNavigationProps_0 (copy), v7 (copy), l_useNavigation_0 (copy), l_PeekViewState_0 (copy), v12 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v17 (copy), l_FFlagLuaAppChartsActiveFilterChips_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v16 (copy), l_Signal_0 (copy), l_PeekView_0 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v23 = l_useNavigationProps_0(function(_, v22) --[[ Line: 39 ]]
        return {
            filter = v22.filter, 
            onFilterApplied = v22.onFilterApplied, 
            onFilterMenuClosed = v22.onFilterMenuClosed, 
            sendFilterClick = v22.sendFilterClick
        };
    end);
    local l_filter_0 = v23.filter;
    local v25, v26 = v7.useState(l_filter_0.selectedOptionId);
    local v27 = v7.useRef(false);
    local v28 = l_useNavigation_0();
    local v31 = v7.useCallback(function(v29, _) --[[ Line: 58 ]]
        -- upvalues: l_PeekViewState_0 (ref), v28 (copy), v23 (copy), v27 (copy), v12 (ref), l_filter_0 (copy), v25 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v17 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        if v29 == l_PeekViewState_0.Closed or v29 == l_PeekViewState_0.Hidden then
            v28.goBack();
            v23.onFilterMenuClosed();
            if not v27.current then
                v23.sendFilterClick(v12.ClosePeekView, l_filter_0.selectedOptionId, v25, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, l_filter_0.selectedOptionId) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, v25) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.selectedOptionId, 
        v25, 
        v28, 
        v23.onFilterMenuClosed, 
        v23.sendFilterClick, 
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then l_filter_0 else nil
    } else l_dependencyArray_0(if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.selectedOptionId, v25, v28, v23.onFilterMenuClosed, v23.sendFilterClick, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then l_filter_0 else nil));
    local v32 = v16();
    local v33, v34 = v7.useBinding(Vector2.new(0, 0));
    local v35, v36 = v7.useBinding(0);
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
        local v42, v43 = v7.useBinding(0);
        v39 = v42;
        v40 = v43;
        v41 = v7.useCallback(function(v44) --[[ Line: 109 ]]
            -- upvalues: v40 (ref)
            v40(v44.AbsoluteCanvasSize.Y);
        end, {});
    else
        local v45, v46 = v7.useBinding(Vector2.new(0, 0));
        v37 = v45;
        v38 = v46;
    end;
    local v48 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v33:map(function(v47) --[[ Line: 118 ]]
        return v47.X;
    end);
    local v55 = v7.joinBindings({
        v33, 
        v35, 
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v39 else v37
    }):map(function(v49) --[[ Line: 126 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v32 (copy)
        local l_Y_0 = v49[1].Y;
        local v51 = v49[2];
        local v52 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v49[3] else v49[3].Y;
        local v53 = l_Y_0 - 84 - 25 - v32;
        local v54 = math.min(v51 + v52, v53);
        return UDim2.new(1, 0, 0, v54);
    end);
    local v57 = v35:map(function(v56) --[[ Line: 138 ]]
        return UDim2.new(1, 0, 1, -v56);
    end);
    local v58 = v7.useRef(nil);
    local v62 = v7.useCallback(function(v59) --[[ Line: 144 ]]
        -- upvalues: v58 (copy)
        local l_current_0 = v58.current;
        if l_current_0 then
            local l_Y_1 = v59.AbsoluteSize.Y;
            l_current_0.AutomaticSize = Enum.AutomaticSize.None;
            l_current_0.Size = UDim2.new(1, 0, 0, l_Y_1);
        end;
    end, {});
    local v63 = v7.useRef(l_Signal_0.new());
    local v64 = v7.useCallback(function() --[[ Line: 157 ]]
        -- upvalues: v63 (copy)
        v63.current:fire();
    end, {});
    local v66 = v7.useCallback(function(v65) --[[ Line: 162 ]]
        -- upvalues: v26 (copy)
        v26(v65);
    end, {});
    local v67 = v25 ~= l_filter_0.selectedOptionId;
    local v68 = v7.useCallback(function() --[[ Line: 170 ]]
        -- upvalues: v23 (copy), l_filter_0 (copy), v25 (copy), v27 (copy), v64 (copy), v12 (ref), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v17 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v23.onFilterApplied(l_filter_0.filterType, v25);
        v27.current = true;
        v64();
        v23.sendFilterClick(v12.Apply, v25, l_filter_0.selectedOptionId, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, v25) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, l_filter_0.selectedOptionId) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.filterType, 
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.selectedOptionId, 
        v25, 
        v23.onFilterApplied, 
        v64, 
        v23.sendFilterClick, 
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then l_filter_0 else nil
    } else l_dependencyArray_0(if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.filterType, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.selectedOptionId, v25, v23.onFilterApplied, v64, v23.sendFilterClick, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then l_filter_0 else nil));
    return v7.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        [v7.Change.AbsoluteSize] = function(v69) --[[ Line: 211 ]]
            -- upvalues: v34 (copy)
            v34(v69.AbsoluteSize);
        end
    }, {
        PeekView = v7.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, 0), 
            contentFrameRef = v58, 
            closeSignal = v63.current, 
            hasScrim = true, 
            mountAsFullView = true, 
            returnToFullView = true, 
            showDraggerInClosedState = false, 
            thumbstickScrollEnabled = true, 
            viewStateChanged = v31, 
            bottomDockedContainerHeight = 84, 
            bottomDockedContainerContent = v7.createElement(v13, {
                Size = UDim2.new(1, 0, 0, 84), 
                applyEnabled = v67, 
                onApply = v68
            })
        }, {
            Content = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v55, 
                [v7.Change.AbsoluteSize] = v62
            }, {
                Layout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    HorizontalFlex = Enum.UIFlexAlignment.Fill, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Header = v7.createElement(v14, {
                    LayoutOrder = 1, 
                    title = l_filter_0.filterDisplayName, 
                    onCloseButtonActivated = v64, 
                    onHeightChanged = v36
                }), 
                Options = v7.createElement(v15, {
                    LayoutOrder = 2, 
                    Size = v57, 
                    containerMaxWidthBinding = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v48, 
                    options = l_filter_0.filterOptions, 
                    selectedOptionId = v25, 
                    onSelectedOptionChanged = v66, 
                    onCanvasSizeChanged = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v41 else v38
                })
            })
        })
    });
end;