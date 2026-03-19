local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Sheet");
local v6 = require(l_script_FirstAncestor_1.SheetContext);
local v7 = require(l_script_FirstAncestor_1.SheetType);
local v8 = require(l_script_FirstAncestor_0.Components.ScrollView);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v10 = require(l_script_FirstAncestor_0.Components.View);
local v11 = require(l_script_FirstAncestor_0.Utility.isScrollingFrameOverflowingY);
return v2.memo(v2.forwardRef(function(v12, v13) --[[ Line: 22 ]] --[[ Name: SheetContent ]]
    -- upvalues: v3 (copy), v2 (copy), v6 (copy), v4 (copy), v11 (copy), v7 (copy), v8 (copy), v10 (copy)
    local v14 = v3();
    local v15 = v2.useContext(v6);
    local l_innerScrollingEnabled_0 = v15.innerScrollingEnabled;
    local l_setInnerScrollY_0 = v15.setInnerScrollY;
    local l_actionsHeight_0 = v15.actionsHeight;
    local l_sheetContentHeight_0 = v15.sheetContentHeight;
    local l_setHasActionsDivider_0 = v15.setHasActionsDivider;
    local l_bottomPadding_0 = v15.bottomPadding;
    local l_hasHeader_0 = v15.hasHeader;
    local l_sheetType_0 = v15.sheetType;
    local l_testId_0 = v15.testId;
    assert(l_innerScrollingEnabled_0 and l_setInnerScrollY_0 and l_actionsHeight_0 and l_setHasActionsDivider_0 and l_bottomPadding_0 and l_hasHeader_0 and l_testId_0, "SheetContent must be used within a Sheet");
    local v25 = nil;
    local v26 = nil;
    if v4.FoundationSheetContentSelectable then
        local v27, v28 = v2.useBinding(false);
        v25 = v27;
        v26 = v28;
    end;
    local v31 = v2.useCallback(function(v29) --[[ Line: 51 ]]
        -- upvalues: l_setInnerScrollY_0 (copy), v11 (ref), l_setHasActionsDivider_0 (copy), v4 (ref), v26 (ref)
        l_setInnerScrollY_0(v29.CanvasPosition.Y);
        local v30 = v11(v29, 1);
        l_setHasActionsDivider_0(v30);
        if v4.FoundationSheetContentSelectable then
            v26(v30);
        end;
    end, {
        l_setHasActionsDivider_0, 
        l_setInnerScrollY_0
    });
    local v32 = nil;
    local v33 = nil;
    if v4.FoundationAddHeightPropToCenterSheet then
        local v34, v35 = v2.useBinding(0);
        v32 = v34;
        v33 = v35;
    end;
    local v37 = if v4.FoundationAddHeightPropToCenterSheet then v2.useCallback(function(v36) --[[ Line: 68 ]]
        -- upvalues: v33 (ref)
        v33(v36.AbsoluteSize.Y);
    end, {}) else nil;
    local v38 = l_sheetType_0 == v7.Bottom;
    local v39 = v12.Selectable == nil or v12.Selectable;
    local v41 = if v4.FoundationSheetContentSelectable and v25 then v25:map(function(v40) --[[ Line: 77 ]]
        -- upvalues: v39 (copy)
        return v39 and v40;
    end) else nil;
    return v2.createElement(v8, {
        scrollingFrameRef = v12.scrollingFrameRef, 
        ZIndex = 1, 
        selection = if v4.FoundationSheetContentSelectable then {
            Selectable = v41, 
            NextSelectionUp = v12.NextSelectionUp, 
            NextSelectionDown = v12.NextSelectionDown, 
            NextSelectionLeft = v12.NextSelectionLeft, 
            NextSelectionRight = v12.NextSelectionRight
        } else nil, 
        scroll = {
            ScrollingEnabled = l_innerScrollingEnabled_0, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = if v4.FoundationAddHeightPropToCenterSheet and l_sheetContentHeight_0 then v32:map(function(v42) --[[ Line: 100 ]]
                return UDim2.new(1, 0, 0, v42);
            end) else UDim2.fromScale(1, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y
        }, 
        Size = if v4.FoundationAddHeightPropToCenterSheet and l_sheetContentHeight_0 then UDim2.fromScale(1, 1) else nil, 
        padding = {
            top = l_hasHeader_0:map(function(v43) --[[ Line: 110 ]]
                -- upvalues: v38 (copy), v14 (copy)
                if v43 then
                    return (UDim.new(0, 0));
                else
                    return (UDim.new(0, if v38 then v14.Padding.Small else v14.Margin.Small));
                end;
            end), 
            bottom = if v38 then l_actionsHeight_0:map(function(v44) --[[ Line: 116 ]]
                -- upvalues: l_bottomPadding_0 (copy), v14 (copy)
                return UDim.new(0, v44 + l_bottomPadding_0 + v14.Margin.Small);
            end) else UDim.new(0, v14.Padding.Small), 
            left = UDim.new(0, v14.Padding.Small), 
            right = UDim.new(0, v14.Padding.Small)
        }, 
        ClipsDescendants = not v38 or l_hasHeader_0, 
        onCanvasPositionChanged = function(v45) --[[ Line: 124 ]] --[[ Name: onCanvasPositionChanged ]]
            -- upvalues: l_setInnerScrollY_0 (copy)
            l_setInnerScrollY_0(v45.CanvasPosition.Y);
        end, 
        onAbsoluteCanvasSizeChanged = v31, 
        onAbsoluteWindowSizeChanged = v31, 
        testId = ("%*--content"):format(l_testId_0), 
        tag = "size-full-0 auto-y fill", 
        ref = v13
    }, v2.createElement(v10, {
        onAbsoluteSizeChanged = v37, 
        tag = "col size-full-0 auto-y padding-x-medium gap-medium align-x-center"
    }, v12.children));
end));