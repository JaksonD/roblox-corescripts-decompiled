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
local v15 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else 10000;
local function _(v16, v17) --[[ Line: 40 ]] --[[ Name: applyTokenScaling ]]
    return v16 * v17.Config.UI.Scale;
end;
return function(v19) --[[ Line: 45 ]] --[[ Name: FilterMenuDropdown ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v15 (copy), v8 (copy), v12 (copy), l_FFlagLuaAppChartsActiveFilterChips_0 (copy), l_dependencyArray_0 (copy), v10 (copy), v11 (copy), v9 (copy)
    local v20 = l_useTokens_0();
    local v21 = l_useDispatch_0();
    local v22 = 260 * v20.Config.UI.Scale;
    local v23 = 84 * v20.Config.UI.Scale;
    local v24, v25 = v4.useState(v19.filter.selectedOptionId);
    local l_Scrim_0 = v20.Color.Common.Scrim;
    local l_Surface_100_0 = v20.Color.Surface.Surface_100;
    local l_Border_0 = v20.Color.ActionStandard.Border;
    local v29 = nil;
    local v30 = nil;
    if v19.openPosition then
        v29 = UDim2.fromOffset(v19.openPosition.X, v19.openPosition.Y);
        v30 = Vector2.new(0, 0);
    else
        v29 = UDim2.fromScale(0.5, 0.5);
        v30 = Vector2.new(0.5, 0.5);
    end;
    local v31, v32 = v4.useBinding(Vector2.new(0, 0));
    local v33, v34 = v4.useBinding(0);
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
        local v40, v41 = v4.useBinding(0);
        v37 = v40;
        v38 = v41;
        v39 = v4.useCallback(function(v42) --[[ Line: 75 ]]
            -- upvalues: v38 (ref)
            v38(v42.AbsoluteCanvasSize.Y);
        end, {});
    else
        local v43, v44 = v4.useBinding(Vector2.new(v15, 0));
        v35 = v43;
        v36 = v44;
    end;
    local v48 = v31:map(function(v45) --[[ Line: 82 ]]
        -- upvalues: v19 (copy), v22 (copy)
        local v46 = nil;
        local v47 = nil;
        if v19.openPosition then
            v46 = math.max(v45.X - v19.openPosition.X - 24, v22);
            v47 = math.max(v45.Y - v19.openPosition.Y - 24, 0);
        else
            v46 = v45.X - 48;
            v47 = v45.Y - 48;
        end;
        return Vector2.new(v46, v47);
    end);
    local v50 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v48:map(function(v49) --[[ Line: 99 ]]
        return v49.X;
    end);
    local v55 = v4.joinBindings({
        v33, 
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v37 else v35
    }):map(function(v51) --[[ Line: 106 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v23 (copy)
        local v52 = v51[1];
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
            local v53 = v51[2];
            return UDim2.fromOffset(0, v52 + v53 + v23);
        else
            local v54 = v51[2];
            return UDim2.fromOffset(v54.X, v52 + v54.Y + v23);
        end;
    end);
    local v57 = v33:map(function(v56) --[[ Line: 119 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v23 (copy)
        return UDim2.new(l_FFlagLuaAppChartsFilterOptionTextTag_0 and 0 or 1, 0, 1, -v56 - v23);
    end);
    local v58 = v4.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v21 (copy), v19 (copy), v8 (ref), v24 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v12 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v21(v19.closeCentralOverlayThunk());
        v19.onFilterMenuClosed();
        v19.sendFilterClick(v8.CloseDropdown, v19.filter.selectedOptionId, v24, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v19.filter, v19.filter.selectedOptionId) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v19.filter, v24) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
    end, l_dependencyArray_0(v19.filter, v24, v19.closeCentralOverlayThunk, v19.onFilterMenuClosed, v19.sendFilterClick));
    local v59 = v24 ~= v19.filter.selectedOptionId;
    local v60 = v4.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v19 (copy), v24 (copy), v21 (copy), v8 (ref), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v12 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v19.onFilterApplied(v19.filter.filterType, v24);
        v21(v19.closeCentralOverlayThunk());
        v19.onFilterMenuClosed();
        v19.sendFilterClick(v8.Apply, v24, v19.filter.selectedOptionId, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v19.filter, v24) else nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v12(v19.filter, v19.filter.selectedOptionId) else nil, l_FFlagLuaAppChartsActiveFilterChips_0 and true or nil);
    end, l_dependencyArray_0(v19.filter, v24, v19.onFilterApplied, v19.closeCentralOverlayThunk, v19.onFilterMenuClosed, v19.sendFilterClick));
    return v4.createElement("TextButton", {
        BackgroundColor3 = l_Scrim_0.Color3, 
        BackgroundTransparency = l_Scrim_0.Transparency, 
        Size = UDim2.fromScale(1, 1), 
        ClipsDescendants = false, 
        Text = "", 
        AutoButtonColor = false, 
        [v4.Event.Activated] = v58, 
        [v4.Change.AbsoluteSize] = function(v61) --[[ Line: 190 ]]
            -- upvalues: v32 (copy)
            v32(v61.AbsoluteSize);
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
            Position = v29, 
            AnchorPoint = v30, 
            Size = v55, 
            AutomaticSize = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then Enum.AutomaticSize.X else nil, 
            Selectable = false
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v20.Radius.Medium)
            }), 
            SizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(v22, 0), 
                MaxSize = v48
            }), 
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalFlex = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then Enum.UIFlexAlignment.Fill else nil
            }), 
            Header = v4.createElement(v10, {
                LayoutOrder = 1, 
                title = v19.filter.filterDisplayName, 
                onCloseButtonActivated = v58, 
                onHeightChanged = v34
            }), 
            Options = v4.createElement(v11, {
                LayoutOrder = 2, 
                Size = v57, 
                containerMaxWidthBinding = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else v50, 
                options = v19.filter.filterOptions, 
                selectedOptionId = v24, 
                onSelectedOptionChanged = v25, 
                onCanvasSizeChanged = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v39 else v36
            }), 
            ActionBar = v4.createElement(v9, {
                LayoutOrder = 3, 
                Size = UDim2.new(l_FFlagLuaAppChartsFilterOptionTextTag_0 and 0 or 1, 0, 0, v23), 
                applyEnabled = v59, 
                onApply = v60
            })
        })
    });
end;