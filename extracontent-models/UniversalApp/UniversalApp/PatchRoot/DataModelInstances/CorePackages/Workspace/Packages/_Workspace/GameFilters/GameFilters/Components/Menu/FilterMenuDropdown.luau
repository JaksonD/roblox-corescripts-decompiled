local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v3.Hooks.useTokens;
local v8 = require(l_script_FirstAncestor_0.Analytics.FilterClickButtonName);
local v9 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuActionBar);
local v10 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuHeader);
local v11 = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuOptions);
local v12 = require(l_script_FirstAncestor_0.Analytics.getOptionContextTag);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
local l_FFlagLuaAppChartsActiveFilterChips_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsActiveFilterChips;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v16 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else 10000;
local function _(v17, v18) --[[ Line: 42 ]] --[[ Name: applyTokenScaling ]]
    return v17 * v18.Config.UI.Scale;
end;
return function(v20) --[[ Line: 47 ]] --[[ Name: FilterMenuDropdown ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v16 (copy), v8 (copy), v12 (copy), l_FFlagLuaAppChartsActiveFilterChips_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v10 (copy), v11 (copy), v9 (copy)
    local v21 = l_useTokens_0();
    local v22 = l_useDispatch_0();
    local v23 = 260 * v21.Config.UI.Scale;
    local v24 = 84 * v21.Config.UI.Scale;
    local v25, v26 = v4.useState(v20.filter.selectedOptionId);
    local l_Scrim_0 = v21.Color.Common.Scrim;
    local l_Surface_100_0 = v21.Color.Surface.Surface_100;
    local l_Border_0 = v21.Color.ActionStandard.Border;
    local v30 = nil;
    local v31 = nil;
    if v20.openPosition then
        v30 = UDim2.fromOffset(v20.openPosition.X, v20.openPosition.Y);
        v31 = Vector2.new(0, 0);
    else
        v30 = UDim2.fromScale(0.5, 0.5);
        v31 = Vector2.new(0.5, 0.5);
    end;
    local v32, v33 = v4.useBinding(Vector2.new(0, 0));
    local v34, v35 = v4.useBinding(0);
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
        local v41, v42 = v4.useBinding(0);
        v38 = v41;
        v39 = v42;
        v40 = v4.useCallback(function(v43) --[[ Line: 77 ]]
            -- upvalues: v39 (ref)
            v39(v43.AbsoluteCanvasSize.Y);
        end, {});
    else
        local v44, v45 = v4.useBinding(Vector2.new(v16, 0));
        v36 = v44;
        v37 = v45;
    end;
    local v49 = v32:map(function(v46) --[[ Line: 84 ]]
        -- upvalues: v20 (copy), v23 (copy)
        local v47 = nil;
        local v48 = nil;
        if v20.openPosition then
            v47 = math.max(v46.X - v20.openPosition.X - 24, v23);
            v48 = math.max(v46.Y - v20.openPosition.Y - 24, 0);
        else
            v47 = v46.X - 48;
            v48 = v46.Y - 48;
        end;
        return Vector2.new(v47, v48);
    end);
    local v51 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v49:map(function(v50) --[[ Line: 101 ]]
        return v50.X;
    end);
    local v56 = v4.joinBindings({
        v34, 
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v38 else v36
    }):map(function(v52) --[[ Line: 108 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v24 (copy)
        local v53 = v52[1];
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
            local v54 = v52[2];
            return UDim2.fromOffset(0, v53 + v54 + v24);
        else
            local v55 = v52[2];
            return UDim2.fromOffset(v55.X, v53 + v55.Y + v24);
        end;
    end);
    local v58 = v34:map(function(v57) --[[ Line: 121 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v24 (copy)
        return UDim2.new(l_FFlagLuaAppChartsFilterOptionTextTag_0 and 0 or 1, 0, 1, -v57 - v24);
    end);
    local v59 = v4.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v22 (copy), v20 (copy), v8 (ref), v25 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v12 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v22(v20.closeCentralOverlayThunk());
        v20.onFilterMenuClosed();
        v20.sendFilterClick(v8.CloseDropdown, v20.filter.selectedOptionId, v25, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v20.filter, v20.filter.selectedOptionId) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v20.filter, v25) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20.filter, 
        v25, 
        v20.closeCentralOverlayThunk, 
        v20.onFilterMenuClosed, 
        v20.sendFilterClick
    } else l_dependencyArray_0(v20.filter, v25, v20.closeCentralOverlayThunk, v20.onFilterMenuClosed, v20.sendFilterClick));
    local v60 = v25 ~= v20.filter.selectedOptionId;
    local v61 = v4.useCallback(function() --[[ Line: 163 ]]
        -- upvalues: v20 (copy), v25 (copy), v22 (copy), v8 (ref), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v12 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v20.onFilterApplied(v20.filter.filterType, v25);
        v22(v20.closeCentralOverlayThunk());
        v20.onFilterMenuClosed();
        v20.sendFilterClick(v8.Apply, v25, v20.filter.selectedOptionId, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v20.filter, v25) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v20.filter, v20.filter.selectedOptionId) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20.filter, 
        v25, 
        v20.onFilterApplied, 
        v20.closeCentralOverlayThunk, 
        v20.onFilterMenuClosed, 
        v20.sendFilterClick
    } else l_dependencyArray_0(v20.filter, v25, v20.onFilterApplied, v20.closeCentralOverlayThunk, v20.onFilterMenuClosed, v20.sendFilterClick));
    return v4.createElement("TextButton", {
        BackgroundColor3 = l_Scrim_0.Color3, 
        BackgroundTransparency = l_Scrim_0.Transparency, 
        Size = UDim2.fromScale(1, 1), 
        ClipsDescendants = false, 
        Text = "", 
        AutoButtonColor = false, 
        [v4.Event.Activated] = v59, 
        [v4.Change.AbsoluteSize] = function(v62) --[[ Line: 209 ]]
            -- upvalues: v33 (copy)
            v33(v62.AbsoluteSize);
        end, 
        Selectable = false
    }, {
        Dropdown = v4.createElement("TextButton", {
            BackgroundColor3 = l_Surface_100_0.Color3, 
            BackgroundTransparency = l_Surface_100_0.Transparency, 
            BorderColor3 = l_Border_0.Color3, 
            ClipsDescendants = true, 
            Text = "", 
            AutoButtonColor = false, 
            Position = v30, 
            AnchorPoint = v31, 
            Size = v56, 
            AutomaticSize = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then Enum.AutomaticSize.X else nil, 
            Selectable = false
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v21.Radius.Medium)
            }), 
            SizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(v23, 0), 
                MaxSize = v49
            }), 
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalFlex = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then Enum.UIFlexAlignment.Fill else nil
            }), 
            Header = v4.createElement(v10, {
                LayoutOrder = 1, 
                title = v20.filter.filterDisplayName, 
                onCloseButtonActivated = v59, 
                onHeightChanged = v35
            }), 
            Options = v4.createElement(v11, {
                LayoutOrder = 2, 
                Size = v58, 
                containerMaxWidthBinding = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v51, 
                options = v20.filter.filterOptions, 
                selectedOptionId = v25, 
                onSelectedOptionChanged = v26, 
                onCanvasSizeChanged = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v40 else v37
            }), 
            ActionBar = v4.createElement(v9, {
                LayoutOrder = 3, 
                Size = UDim2.new(l_FFlagLuaAppChartsFilterOptionTextTag_0 and 0 or 1, 0, 0, v24), 
                applyEnabled = v60, 
                onApply = v61
            })
        })
    });
end;