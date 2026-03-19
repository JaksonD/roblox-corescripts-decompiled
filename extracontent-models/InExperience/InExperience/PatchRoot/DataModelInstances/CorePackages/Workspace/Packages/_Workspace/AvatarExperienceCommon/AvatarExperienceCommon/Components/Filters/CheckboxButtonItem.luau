local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local l_Checkbox_0 = v3.Checkbox;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_InputSize_0 = v3.Enums.InputSize;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Focusable_0 = require(l_Parent_0.RoactGamepad).Focusable;
local v10 = require(script.Parent.ExpandingFrame);
local function v23(v11) --[[ Line: 62 ]] --[[ Name: CheckboxButtonItem ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Text_0 (copy), l_Focusable_0 (copy), l_Checkbox_0 (copy), l_InputSize_0 (copy), v10 (copy)
    local v12 = l_useTokens_0();
    local v13 = v1.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v11 (copy)
        if v11.onActivated then
            v11.onActivated(v11.id);
        end;
    end, {
        v11.onActivated, 
        v11.id
    });
    local v14 = v11.itemHeight or v12.Size.Size_900;
    local v15 = v1.useRef(nil);
    local v16, v17 = v1.useBinding(v14);
    local v20 = v1.useCallback(function(v18) --[[ Line: 76 ]]
        -- upvalues: v14 (copy), v11 (copy), v12 (copy), v17 (copy)
        local l_v14_0 = v14;
        if v18 then
            l_v14_0 = l_v14_0 + v18.AbsoluteSize.Y;
        end;
        if not v11.hideDivider then
            l_v14_0 = l_v14_0 + v12.Size.Size_50;
        end;
        v17(l_v14_0);
        if v11.onHeightChanged then
            v11.onHeightChanged(l_v14_0);
        end;
    end, {
        v14, 
        v11.hideDivider, 
        v17, 
        v11.onHeightChanged
    });
    v1.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v20 (copy), v15 (copy)
        v20(v15.current);
    end, {});
    local v21 = v11.expandedView and v11.isSelected == true;
    return v1.createElement("Frame", {
        Size = v16:map(function(v22) --[[ Line: 97 ]]
            return UDim2.new(1, 0, 0, v22);
        end), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v11.layoutOrder, 
        ref = v11.frameRef, 
        NextSelectionLeft = v11.NextSelectionLeft, 
        NextSelectionRight = v11.NextSelectionRight, 
        NextSelectionUp = v11.NextSelectionUp, 
        NextSelectionDown = v11.NextSelectionDown
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        }), 
        Contents = v1.createElement(l_View_0, {
            tag = "size-full row items-center padding-left-large padding-y-medium padding-right-none", 
            LayoutOrder = 1, 
            ref = v11.defaultChildRef, 
            NextSelectionDown = if v21 then v15 else nil, 
            SelectionImageObject = v11.SelectionImageObject
        }, {
            ClickableTextArea = v1.createElement("TextButton", {
                Size = UDim2.new(1, -v12.Size.Size_400 - v12.Size.Size_400, 1, 0), 
                BackgroundTransparency = 1, 
                Text = "", 
                Active = not v11.isDisabled, 
                [v1.Event.Activated] = if not v11.isDisabled then v13 else nil, 
                LayoutOrder = 1
            }, {
                CustomViewFrame = v11.customView and v1.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    tag = "gui-object-defaults", 
                    LayoutOrder = 1
                }, {
                    CustomView = v11.customView
                }), 
                TitleText = v11.text and not v11.customView and v1.createElement(l_Text_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v11.text, 
                    LayoutOrder = 1, 
                    tag = "text-title-medium content-default text-align-x-left auto-y"
                })
            }), 
            RightContent = v1.createElement(l_Focusable_0[l_Checkbox_0], {
                label = "", 
                isChecked = v11.isSelected, 
                isDisabled = v11.isDisabled, 
                onActivated = v13, 
                size = l_InputSize_0.Medium, 
                LayoutOrder = 3
            })
        }), 
        ExpandingFrame = v11.expandedView and v1.createElement(l_Focusable_0[v10], {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, v11.expandedViewHeight or 0), 
            isExpanded = v11.isSelected == true, 
            onAbsoluteSizeChanged = v20, 
            ref = v15, 
            NextSelectionUp = v11.defaultChildRef
        }, {
            ExpandedView = v11.expandedView
        })
    });
end;
return v1.forwardRef(function(v24, v25) --[[ Line: 165 ]]
    -- upvalues: v1 (copy), v23 (copy), v2 (copy)
    return v1.createElement(v23, v2.Dictionary.join(v24, {
        frameRef = v25
    }));
end);