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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v17 = {
    Size = UDim2.new(1, 0, 0, 48), 
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
    BackgroundTransparency = 0, 
    onPressedBackgroundColor3 = Color3.fromRGB(242, 242, 242), 
    onPressedBackgroundTransparency = 1, 
    LayoutOrder = 0, 
    isDisabled = false, 
    onActivated = function() --[[ Line: 56 ]] --[[ Name: onActivated ]]
        print("BaseCell onActivated");
    end, 
    showDivider = true, 
    dividerTransparency = 0, 
    dividerColor3 = Color3.fromRGB(227, 227, 227), 
    avatarCircleCellWidth = 60
};
return l_memo_0(function(v18) --[[ Line: 66 ]] --[[ Name: BaseCell ]]
    -- upvalues: v2 (copy), v17 (copy), l_useState_0 (copy), l_ControlState_0 (copy), v5 (copy), l_useMemo_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v13 (copy), l_useCursor_0 (copy), v3 (copy), v12 (copy), v14 (copy)
    local v19 = v2.Dictionary.join(v17, v18);
    local v20, v21 = l_useState_0(l_ControlState_0.Initialize);
    local v24 = v5.useCallback(function(_, v23) --[[ Line: 70 ]]
        -- upvalues: v19 (copy), v21 (copy)
        if not v19.isDisabled then
            v21(v23);
        end;
    end, {
        v19.isDisabled
    });
    local v25 = v5.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v19 (copy)
        if not v19.isDisabled then
            v19.onActivated();
        end;
    end, {
        v19.isDisabled, 
        v19.onActivated
    });
    local v26 = l_useMemo_0(function() --[[ Line: 83 ]]
        -- upvalues: v20 (copy), l_ControlState_0 (ref), v5 (ref), v19 (copy)
        if v20 == l_ControlState_0.Pressed then
            return (v5.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v19.onPressedBackgroundTransparency, 
                BackgroundColor3 = v19.onPressedBackground3, 
                BorderSizePixel = 0
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20, 
        v19.onPressedBackground3, 
        v19.onPressedBackgroundTransparency
    } else l_dependencyArray_0(v20, v19.onPressedBackground3, v19.onPressedBackgroundTransparency));
    local v27 = l_useMemo_0(function() --[[ Line: 98 ]]
        -- upvalues: v19 (copy), v5 (ref)
        if v19.showDivider then
            return (v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = v5.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                divider = v5.createElement("Frame", {
                    BackgroundTransparency = v19.dividerTransparency, 
                    BackgroundColor3 = v19.dividerColor3, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -v19.avatarCircleCellWidth, 0, 1)
                })
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v19.showDivider, 
        v19.dividerTransparency, 
        v19.dividerColor3, 
        v19.avatarCircleCellWidth
    } else l_dependencyArray_0(v19.showDivider, v19.dividerTransparency, v19.dividerColor3, v19.avatarCircleCellWidth));
    local v28 = l_useMemo_0(function() --[[ Line: 134 ]]
        -- upvalues: v2 (ref), v19 (copy), v26 (copy), v27 (copy)
        return v2.Dictionary.join(v19.children or {}, {
            overlay = v26, 
            divider = v27
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v19.children, 
        v26, 
        v27
    } else l_dependencyArray_0(v19.children, v26, v27));
    local v29 = if v13 then l_useCursor_0(v3.Enums.CursorType.RoundedSlot) else nil;
    return v5.createElement(v12, {
        onStateChanged = v24, 
        [v5.Event.Activated] = v25, 
        [v5.Tag] = if v14 and v19.testId ~= nil then ("data-testid=%*"):format(v19.testId) else nil, 
        AutoButtonColor = false, 
        Selectable = if v13 then v19.Selectable else nil, 
        SelectionImageObject = v29, 
        Size = v19.Size, 
        AutomaticSize = v19.AutomaticSize, 
        BackgroundColor3 = v19.BackgroundColor3, 
        BackgroundTransparency = v19.BackgroundTransparency, 
        LayoutOrder = v19.LayoutOrder, 
        BorderSizePixel = 0
    }, v28);
end);