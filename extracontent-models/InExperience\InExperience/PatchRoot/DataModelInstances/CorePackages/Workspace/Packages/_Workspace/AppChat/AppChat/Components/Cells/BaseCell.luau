local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local l_useCursor_0 = v3.Hooks.useCursor;
local v5 = require(l_Parent_0.React);
local l_useState_0 = v5.useState;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useMemo_0 = v5.useMemo;
local v10 = require(l_Parent_0.UIBlox);
local l_ControlState_0 = v10.Core.Control.Enum.ControlState;
local v12 = l_memo_0(v10.Core.Control.Interactable);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableCellFocusFixes);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local _ = require(l_script_FirstAncestor_0.types);
local v16 = {
    Size = UDim2.new(1, 0, 0, 48), 
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
    BackgroundTransparency = 0, 
    onPressedBackgroundColor3 = Color3.fromRGB(242, 242, 242), 
    onPressedBackgroundTransparency = 1, 
    LayoutOrder = 0, 
    isDisabled = false, 
    onActivated = function() --[[ Line: 54 ]] --[[ Name: onActivated ]]
        print("BaseCell onActivated");
    end, 
    showDivider = true, 
    dividerTransparency = 0, 
    dividerColor3 = Color3.fromRGB(227, 227, 227), 
    avatarCircleCellWidth = 60
};
return l_memo_0(function(v17) --[[ Line: 64 ]] --[[ Name: BaseCell ]]
    -- upvalues: v2 (copy), v16 (copy), l_useState_0 (copy), l_ControlState_0 (copy), v5 (copy), l_useMemo_0 (copy), l_dependencyArray_0 (copy), v13 (copy), l_useCursor_0 (copy), v3 (copy), v12 (copy), v14 (copy)
    local v18 = v2.Dictionary.join(v16, v17);
    local v19, v20 = l_useState_0(l_ControlState_0.Initialize);
    local v23 = v5.useCallback(function(_, v22) --[[ Line: 68 ]]
        -- upvalues: v18 (copy), v20 (copy)
        if not v18.isDisabled then
            v20(v22);
        end;
    end, {
        v18.isDisabled
    });
    local v24 = v5.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v18 (copy)
        if not v18.isDisabled then
            v18.onActivated();
        end;
    end, {
        v18.isDisabled, 
        v18.onActivated
    });
    local v25 = l_useMemo_0(function() --[[ Line: 80 ]]
        -- upvalues: v19 (copy), l_ControlState_0 (ref), v5 (ref), v18 (copy)
        if v19 == l_ControlState_0.Pressed then
            return (v5.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v18.onPressedBackgroundTransparency, 
                BackgroundColor3 = v18.onPressedBackground3, 
                BorderSizePixel = 0
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v19, v18.onPressedBackground3, v18.onPressedBackgroundTransparency));
    local v26 = l_useMemo_0(function() --[[ Line: 91 ]]
        -- upvalues: v18 (copy), v5 (ref)
        if v18.showDivider then
            return (v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = v5.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                divider = v5.createElement("Frame", {
                    BackgroundTransparency = v18.dividerTransparency, 
                    BackgroundColor3 = v18.dividerColor3, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -v18.avatarCircleCellWidth, 0, 1)
                })
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v18.showDivider, v18.dividerTransparency, v18.dividerColor3, v18.avatarCircleCellWidth));
    local v27 = l_useMemo_0(function() --[[ Line: 114 ]]
        -- upvalues: v2 (ref), v18 (copy), v25 (copy), v26 (copy)
        return v2.Dictionary.join(v18.children or {}, {
            overlay = v25, 
            divider = v26
        });
    end, l_dependencyArray_0(v18.children, v25, v26));
    local v28 = if v13 then l_useCursor_0(v3.Enums.CursorType.RoundedSlot) else nil;
    return v5.createElement(v12, {
        onStateChanged = v23, 
        [v5.Event.Activated] = v24, 
        [v5.Tag] = if v14 and v18.testId ~= nil then ("data-testid=%*"):format(v18.testId) else nil, 
        AutoButtonColor = false, 
        Selectable = if v13 then v18.Selectable else nil, 
        SelectionImageObject = v28, 
        Size = v18.Size, 
        AutomaticSize = v18.AutomaticSize, 
        BackgroundColor3 = v18.BackgroundColor3, 
        BackgroundTransparency = v18.BackgroundTransparency, 
        LayoutOrder = v18.LayoutOrder, 
        BorderSizePixel = 0
    }, v27);
end);