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
return function() --[[ Line: 36 ]] --[[ Name: FilterMenuPeekView ]]
    -- upvalues: l_useNavigationProps_0 (copy), v7 (copy), l_useNavigation_0 (copy), l_PeekViewState_0 (copy), v12 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v17 (copy), l_FFlagLuaAppChartsActiveFilterChips_0 (copy), l_dependencyArray_0 (copy), v16 (copy), l_Signal_0 (copy), l_PeekView_0 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v22 = l_useNavigationProps_0(function(_, v21) --[[ Line: 37 ]]
        return {
            filter = v21.filter, 
            onFilterApplied = v21.onFilterApplied, 
            onFilterMenuClosed = v21.onFilterMenuClosed, 
            sendFilterClick = v21.sendFilterClick
        };
    end);
    local l_filter_0 = v22.filter;
    local v24, v25 = v7.useState(l_filter_0.selectedOptionId);
    local v26 = v7.useRef(false);
    local v27 = l_useNavigation_0();
    local v30 = v7.useCallback(function(v28, _) --[[ Line: 56 ]]
        -- upvalues: l_PeekViewState_0 (ref), v27 (copy), v22 (copy), v26 (copy), v12 (ref), l_filter_0 (copy), v24 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v17 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        if v28 == l_PeekViewState_0.Closed or v28 == l_PeekViewState_0.Hidden then
            v27.goBack();
            v22.onFilterMenuClosed();
            if not v26.current then
                v22.sendFilterClick(v12.ClosePeekView, l_filter_0.selectedOptionId, v24, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, l_filter_0.selectedOptionId) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, v24) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
            end;
        end;
    end, l_dependencyArray_0(if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.selectedOptionId, v24, v27, v22.onFilterMenuClosed, v22.sendFilterClick, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then l_filter_0 else nil));
    local v31 = v16();
    local v32, v33 = v7.useBinding(Vector2.new(0, 0));
    local v34, v35 = v7.useBinding(0);
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
        local v41, v42 = v7.useBinding(0);
        v38 = v41;
        v39 = v42;
        v40 = v7.useCallback(function(v43) --[[ Line: 98 ]]
            -- upvalues: v39 (ref)
            v39(v43.AbsoluteCanvasSize.Y);
        end, {});
    else
        local v44, v45 = v7.useBinding(Vector2.new(0, 0));
        v36 = v44;
        v37 = v45;
    end;
    local v47 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v32:map(function(v46) --[[ Line: 107 ]]
        return v46.X;
    end);
    local v54 = v7.joinBindings({
        v32, 
        v34, 
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v38 else v36
    }):map(function(v48) --[[ Line: 115 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v31 (copy)
        local l_Y_0 = v48[1].Y;
        local v50 = v48[2];
        local v51 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v48[3] else v48[3].Y;
        local v52 = l_Y_0 - 84 - 25 - v31;
        local v53 = math.min(v50 + v51, v52);
        return UDim2.new(1, 0, 0, v53);
    end);
    local v56 = v34:map(function(v55) --[[ Line: 127 ]]
        return UDim2.new(1, 0, 1, -v55);
    end);
    local v57 = v7.useRef(nil);
    local v61 = v7.useCallback(function(v58) --[[ Line: 133 ]]
        -- upvalues: v57 (copy)
        local l_current_0 = v57.current;
        if l_current_0 then
            local l_Y_1 = v58.AbsoluteSize.Y;
            l_current_0.AutomaticSize = Enum.AutomaticSize.None;
            l_current_0.Size = UDim2.new(1, 0, 0, l_Y_1);
        end;
    end, {});
    local v62 = v7.useRef(l_Signal_0.new());
    local v63 = v7.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v62 (copy)
        v62.current:fire();
    end, {});
    local v65 = v7.useCallback(function(v64) --[[ Line: 151 ]]
        -- upvalues: v25 (copy)
        v25(v64);
    end, {});
    local v66 = v24 ~= l_filter_0.selectedOptionId;
    local v67 = v7.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v22 (copy), l_filter_0 (copy), v24 (copy), v26 (copy), v63 (copy), v12 (ref), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v17 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v22.onFilterApplied(l_filter_0.filterType, v24);
        v26.current = true;
        v63();
        v22.sendFilterClick(v12.Apply, v24, l_filter_0.selectedOptionId, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, v24) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v17(l_filter_0, l_filter_0.selectedOptionId) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
    end, l_dependencyArray_0(if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.filterType, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else l_filter_0.selectedOptionId, v24, v22.onFilterApplied, v63, v22.sendFilterClick, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then l_filter_0 else nil));
    return v7.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        [v7.Change.AbsoluteSize] = function(v68) --[[ Line: 190 ]]
            -- upvalues: v33 (copy)
            v33(v68.AbsoluteSize);
        end
    }, {
        PeekView = v7.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, 0), 
            contentFrameRef = v57, 
            closeSignal = v62.current, 
            hasScrim = true, 
            mountAsFullView = true, 
            returnToFullView = true, 
            showDraggerInClosedState = false, 
            thumbstickScrollEnabled = true, 
            viewStateChanged = v30, 
            bottomDockedContainerHeight = 84, 
            bottomDockedContainerContent = v7.createElement(v13, {
                Size = UDim2.new(1, 0, 0, 84), 
                applyEnabled = v66, 
                onApply = v67
            })
        }, {
            Content = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v54, 
                [v7.Change.AbsoluteSize] = v61
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
                    onCloseButtonActivated = v63, 
                    onHeightChanged = v35
                }), 
                Options = v7.createElement(v15, {
                    LayoutOrder = 2, 
                    Size = v56, 
                    containerMaxWidthBinding = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v47, 
                    options = l_filter_0.filterOptions, 
                    selectedOptionId = v24, 
                    onSelectedOptionChanged = v65, 
                    onCanvasSizeChanged = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v40 else v37
                })
            })
        })
    });
end;