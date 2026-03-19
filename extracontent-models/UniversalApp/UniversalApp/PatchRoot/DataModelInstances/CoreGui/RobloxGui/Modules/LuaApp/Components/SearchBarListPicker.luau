local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_withStyle_0 = v7.Style.withStyle;
local l_SearchConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchConstants;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v13 = require(l_Modules_0.LuaApp.FitChildren);
local v14 = require(l_Modules_0.LuaApp.Components.SearchBarListPickerItem);
local v15 = game:DefineFastFlag("LuaAppSearchListFramesSelectable", false);
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local v18 = v1.PureComponent:extend("SearchBarListPicker");
local v19 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.SEARCH_MARGIN else 24;
v18.validateProps = v2.strictInterface({
    items = v2.array(v2.any), 
    width = v2.UDim, 
    height = if l_FFlagSearchOmniAutocompletePage_0 then v2.optional(v2.UDim) else v2.optional(v2.number), 
    layoutOrder = v2.optional(v2.integer), 
    forwardRef = v2.optional(v2.table), 
    BackgroundTransparency = if l_FFlagSearchOmniAutocompletePage_0 then v2.optional(v2.number) else nil, 
    removeAdditionalMargins = if l_FFlagSearchOmniAutocompletePage_0 then v2.optional(v2.boolean) else nil, 
    currentKeyword = if v16 then v2.optional(v2.string) else nil, 
    NextSelectionUp = v2.optional(v2.table), 
    NextSelectionDown = v2.optional(v2.table), 
    NextSelectionLeft = v2.optional(v2.table), 
    NextSelectionRight = v2.optional(v2.table), 
    formFactor = v2.optional(v2.string), 
    screenHeight = v2.optional(v2.integer), 
    topBarHeight = v2.optional(v2.number), 
    globalGuiInset = v2.optional(v2.table)
});
v18.init = function(v20) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v20.focusableRefs = v4.createRefCache();
end;
v18.renderWithProviders = function(v21, v22) --[[ Line: 58 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagSearchOmniAutocompletePage_0 (copy), v1 (copy), v15 (copy), l_Focusable_0 (copy), v14 (copy), v16 (copy), l_CursorKind_0 (copy), l_withStyle_0 (copy), v19 (copy), v13 (copy)
    local l_items_0 = v21.props.items;
    local l_layoutOrder_0 = v21.props.layoutOrder;
    local v25 = nil;
    local l_screenHeight_0 = v21.props.screenHeight;
    local l_topBarHeight_0 = v21.props.topBarHeight;
    local l_globalGuiInset_0 = v21.props.globalGuiInset;
    local l_height_0 = v21.props.height;
    v25 = if l_height_0 then if l_FFlagSearchOmniAutocompletePage_0 then UDim2.new(v21.props.width.Scale, v21.props.width.Offset, l_height_0.Scale, l_height_0.Offset) else UDim2.new(v21.props.width.Scale, v21.props.width.Offset, 0, l_height_0) else UDim2.new(v21.props.width.Scale, v21.props.width.Offset, 0, l_screenHeight_0 - l_globalGuiInset_0.top - l_topBarHeight_0 - l_globalGuiInset_0.bottom);
    local v30 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        TopPadding = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 0
        })
    };
    local function _(v31, v32) --[[ Line: 97 ]] --[[ Name: getAdjacentIndexRef ]]
        -- upvalues: v21 (copy), l_items_0 (copy)
        local v33 = v31 + v32;
        if v33 < 1 then
            return v21.props.NextSelectionUp;
        elseif #l_items_0 < v33 then
            return v21.props.NextSelectionDown or v21.focusableRefs[v31];
        else
            return v21.focusableRefs[v33];
        end;
    end;
    local function _(v35) --[[ Line: 108 ]] --[[ Name: getItemIndexRef ]]
        -- upvalues: l_items_0 (copy), v21 (copy)
        local v36 = false;
        if v35 >= 1 then
            v36 = v35 <= #l_items_0;
        end;
        return v36 and v21.focusableRefs[v35] or nil;
    end;
    local l_forwardRef_0 = v21.props.forwardRef;
    if v15 and #v21.props.items > 0 then
        v21.focusableRefs[1] = l_forwardRef_0;
    end;
    for v39, v40 in ipairs(l_items_0) do
        local l_createElement_0 = v1.createElement;
        local v42 = l_Focusable_0[v14];
        local v43 = {
            item = v40, 
            layoutOrder = v39, 
            separatorEnabled = v39 < #l_items_0, 
            currentKeyword = if v16 then v21.props.currentKeyword else nil
        };
        local v44;
        if v15 then
            local v45 = v39 + -1;
            v44 = if v45 < 1 then v21.props.NextSelectionUp else if #l_items_0 < v45 then v21.props.NextSelectionDown or v21.focusableRefs[v39] else v21.focusableRefs[v45];
        else
            local v46 = v39 - 1;
            local v47 = false;
            if v46 >= 1 then
                v47 = v46 <= #l_items_0;
            end;
            v44 = v47 and v21.focusableRefs[v46] or nil;
        end;
        v43.NextSelectionUp = v44;
        if v15 then
            local v48 = v39 + 1;
            v44 = if v48 < 1 then v21.props.NextSelectionUp else if #l_items_0 < v48 then v21.props.NextSelectionDown or v21.focusableRefs[v39] else v21.focusableRefs[v48];
        else
            local v49 = math.min(#l_items_0, v39 + 1);
            local v50 = false;
            if v49 >= 1 then
                v50 = v49 <= #l_items_0;
            end;
            v44 = v50 and v21.focusableRefs[v49] or nil;
        end;
        v43.NextSelectionDown = v44;
        if v15 then
            v44 = v21.props.NextSelectionRight;
        else
            local v51 = false;
            if v39 >= 1 then
                v51 = v39 <= #l_items_0;
            end;
            v44 = v51 and v21.focusableRefs[v39] or nil;
        end;
        v43.NextSelectionRight = v44;
        if v15 then
            v44 = v21.props.NextSelectionLeft;
        else
            local v52 = false;
            if v39 >= 1 then
                v52 = v39 <= #l_items_0;
            end;
            v44 = v52 and v21.focusableRefs[v39] or nil;
        end;
        v43.NextSelectionLeft = v44;
        v43.SelectionImageObject = v22(l_CursorKind_0.RoundedRectNoInset);
        v44 = v1.Ref;
        local v53 = false;
        if v39 >= 1 then
            v53 = v39 <= #l_items_0;
        end;
        v43[v44] = v53 and v21.focusableRefs[v39] or nil;
        v30[v39] = l_createElement_0(v42, v43);
    end;
    return l_withStyle_0(function(v54) --[[ Line: 142 ]]
        -- upvalues: l_FFlagSearchOmniAutocompletePage_0 (ref), v21 (copy), v25 (ref), v19 (ref), v1 (ref), l_Focusable_0 (ref), l_layoutOrder_0 (copy), v15 (ref), l_items_0 (copy), l_forwardRef_0 (copy), v13 (ref), v30 (copy)
        local v55 = if l_FFlagSearchOmniAutocompletePage_0 then v21.props.BackgroundTransparency or v54.Theme.BackgroundDefault.Transparency else v54.Theme.BackgroundDefault.Transparency;
        local v56 = if l_FFlagSearchOmniAutocompletePage_0 and v21.props.removeAdditionalMargins then v25 else v25 + UDim2.fromOffset(v19 * 2, 0);
        local v57 = if l_FFlagSearchOmniAutocompletePage_0 and v21.props.removeAdditionalMargins then UDim2.new(1, 0, 1, 0) else v25 - UDim2.new(0, v19 * 2, 0, 0);
        return v1.createElement(l_Focusable_0.Frame, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = if l_FFlagSearchOmniAutocompletePage_0 then v56 else v25 + UDim2.fromOffset(v19 * 2, 0), 
            BackgroundColor3 = v54.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = if l_FFlagSearchOmniAutocompletePage_0 then v55 else v54.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = if l_FFlagSearchOmniAutocompletePage_0 then l_layoutOrder_0 else nil, 
            NextSelectionLeft = if v15 then nil else v21.props.NextSelectionLeft, 
            NextSelectionRight = if v15 then nil else v21.props.NextSelectionRight, 
            NextSelectionUp = if v15 then nil else v21.props.NextSelectionUp, 
            NextSelectionDown = if v15 then nil else v21.props.NextSelectionDown, 
            defaultChild = if l_items_0 and #l_items_0 > 0 then v21.focusableRefs[1] else nil, 
            [v1.Ref] = if v15 then nil else l_forwardRef_0, 
            SelectionGroup = v15 and true or nil, 
            SelectionBehaviorDown = if v15 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorLeft = if v15 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if v15 then Enum.SelectionBehavior.Stop else nil
        }, {
            list = v1.createElement(v13.FitScrollingFrame, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v54.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = if l_FFlagSearchOmniAutocompletePage_0 then v55 else v54.Theme.BackgroundDefault.Transparency, 
                LayoutOrder = l_layoutOrder_0, 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                Size = if l_FFlagSearchOmniAutocompletePage_0 then v57 else v25 - UDim2.new(0, v19 * 2, 0, 0), 
                fitFields = {
                    CanvasSize = v13.FitAxis.Height
                }, 
                Selectable = not v15 and nil
            }, v30)
        });
    end);
end;
v18.render = function(v58) --[[ Line: 201 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v59) --[[ Line: 202 ]]
        -- upvalues: v58 (copy)
        return v58:renderWithProviders(v59);
    end);
end;
v18 = v3.connect(function(v60, _) --[[ Line: 207 ]]
    return {
        formFactor = v60.FormFactor, 
        screenHeight = v60.ScreenSize.Y, 
        topBarHeight = v60.TopBar.topBarHeight, 
        globalGuiInset = v60.GlobalGuiInset
    };
end)(v18);
return v1.forwardRef(function(v62, v63) --[[ Line: 216 ]]
    -- upvalues: v1 (copy), v18 (ref), v6 (copy)
    return v1.createElement(v18, v6.Dictionary.join(v62, {
        forwardRef = v63
    }));
end);