local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Parent_4 = l_Parent_3.Parent;
local v5 = require(l_Parent_4.Cryo);
local v6 = require(l_Parent_4.React);
local v7 = require(l_Parent_4.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_Parent_4.FitFrame);
local l_FitFrameHorizontal_0 = v9.FitFrameHorizontal;
local v11 = require(l_Parent_2.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_2.ImageSet.Images);
local v13 = require(l_Parent_3.Core.Style.useStyle);
local v14 = require(l_Parent_3.App.Button.IconButton);
local v15 = require(l_Parent_3.Utility.useIsGamepad);
local v16 = require(l_Parent_1.HorizontalNav.ScrollingListWithArrowsAndGradient);
local v17 = require(l_Parent_0.Pillv2);
local function v50(v18) --[[ Line: 60 ]] --[[ Name: PillGroup ]]
    -- upvalues: v15 (copy), v6 (copy), v13 (copy), v7 (copy), v5 (copy), v14 (copy), v11 (copy), v12 (copy), l_Focusable_0 (copy), v17 (copy), l_FitFrameHorizontal_0 (copy), v9 (copy), v16 (copy)
    local v19 = v18.isRoactGamepadEnabled == nil or v18.isRoactGamepadEnabled;
    local v20 = v15() and v19;
    local v21 = v6.useRef(nil);
    local function _() --[[ Line: 66 ]] --[[ Name: scrollToStart ]]
        -- upvalues: v21 (copy)
        local l_current_0 = v21.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
    local v24 = v18.leftPadding or 15;
    local v25 = v18.rightPadding or 15;
    local v26 = v18.selectedPills or {};
    local l_Theme_0 = v13().Theme;
    local v29 = v6.useCallback(function(v28) --[[ Line: 81 ]]
        -- upvalues: v21 (copy)
        if v21.current then
            v21.current.CanvasSize = UDim2.new(0, v28.AbsoluteSize.X, 1, 0);
        end;
    end);
    local v30 = v6.useRef({});
    local v31 = v19 and v7.useRefCache() or v30.current;
    local v32 = v6.useCallback(function() --[[ Line: 90 ]]
        -- upvalues: v18 (copy)
        if v18.onSelectionChanged then
            v18.onSelectionChanged({});
        end;
    end);
    local v36 = v6.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v18 (copy), v5 (ref), v26 (copy)
        local v33 = {};
        for _, v35 in v18.pills do
            if not v5.List.find(v26, v35) then
                table.insert(v33, v35);
            end;
        end;
        return v5.List.join(v26, v33);
    end, {
        v18.pills, 
        v26
    });
    local v37 = #v26 > 1;
    local v38 = {
        ClearButton = v37 and v6.createElement(v14, {
            layoutOrder = 1, 
            size = UDim2.fromOffset(24, 24), 
            iconSize = v11.Medium, 
            icon = v12["icons/actions/reject"], 
            onActivated = v32, 
            key = "0", 
            buttonRef = v31[0], 
            NextSelectionRight = v31[1]
        }) or nil
    };
    local l_isLoading_0 = v18.isLoading;
    for v40, v41 in v36 do
        local function v45() --[[ Line: 124 ]] --[[ Name: onActivated ]]
            -- upvalues: v5 (ref), v26 (copy), v41 (copy), v21 (copy), v18 (copy)
            local v42 = v5.List.find(v26, v41) ~= nil;
            local v43 = if v42 then v5.List.removeValue(v26, v41) else v5.List.join(v26, {
                v41
            });
            if not v42 then
                local l_current_1 = v21.current;
                if l_current_1 then
                    l_current_1:ScrollToTop();
                end;
            end;
            if v18.onSelectionChanged then
                v18.onSelectionChanged(v43);
            end;
        end;
        local v46 = v40 <= #v26;
        if v46 then
            l_isLoading_0 = false;
        end;
        if not v19 then
            v31[v40] = v31[v40] or v6.createRef();
        end;
        v38[v40] = v6.createElement(if v19 then l_Focusable_0[v17] else v17, {
            layoutOrder = v40 + 1, 
            key = tostring(v40), 
            text = v41, 
            isSelected = v46, 
            isLoading = v18.isLoading and not v46, 
            onActivated = v45, 
            ref = v31[v40], 
            NextSelectionLeft = if not (v40 <= 1) or v37 then v31[v40 - 1] else nil, 
            NextSelectionRight = if v40 < #v36 then v31[v40 + 1] else nil
        });
    end;
    if l_isLoading_0 and v20 and v19 then
        v38[1] = v6.createElement(l_Focusable_0[v17], {
            layoutOrder = 2, 
            key = "1", 
            ref = v31[1], 
            text = ""
        });
    end;
    local function v47() --[[ Line: 176 ]] --[[ Name: getScrollingListChildren ]]
        -- upvalues: v6 (ref), l_FitFrameHorizontal_0 (ref), v9 (ref), v25 (copy), v24 (copy), v29 (copy), v38 (copy)
        return {
            SubNavFrame = v6.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                margin = v9.Rect.quad(0, v25, 0, v24), 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v6.Change.AbsoluteSize] = v29
            }, v38)
        };
    end;
    local v48 = {};
    for v49 = 1, #v36 do
        v48[v49] = v31[v49];
    end;
    return v6.createElement(if v19 then l_Focusable_0.Frame else "Frame", {
        Size = UDim2.new(1, 0, 0, 52), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v18.layoutOrder, 
        ref = v18.forwardRef, 
        NextSelectionUp = v18.NextSelectionUp, 
        NextSelectionDown = v18.NextSelectionDown, 
        defaultChild = if v19 then v31[1] else nil
    }, {
        ScrollingList = v6.createElement(v16, {
            getScollingListContent = v47, 
            listHeight = 52, 
            scrollingFrameRef = v21, 
            buttonRefs = v48, 
            buttonPadding = 8, 
            padOutsideEdges = false, 
            hideGradient = true
        })
    });
end;
return v6.forwardRef(function(v51, v52) --[[ Line: 221 ]]
    -- upvalues: v6 (copy), v50 (copy), v5 (copy)
    return v6.createElement(v50, v5.Dictionary.join(v51, {
        forwardRef = v52
    }));
end);