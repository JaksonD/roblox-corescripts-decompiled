local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local l_CursorType_0 = v2.Enums.CursorType;
local l_useCursor_0 = v2.Hooks.useCursor;
local l_FFlagAXResetAvatarButton_0 = v3.FFlagAXResetAvatarButton;
return (v1.forwardRef(function(v7, v8) --[[ Line: 21 ]]
    -- upvalues: v2 (copy), l_useCursor_0 (copy), l_CursorType_0 (copy), v1 (copy), l_FFlagAXResetAvatarButton_0 (copy)
    local v9 = v2.Hooks.useTokens();
    local v10 = l_useCursor_0(l_CursorType_0.SmallPill);
    local v11, v12 = v1.useBinding(false);
    local v14 = v1.useCallback(function(v13) --[[ Line: 28 ]]
        -- upvalues: v2 (ref), v12 (copy)
        if v13 == v2.Enums.ControlState.Default then
            v12(false);
            return;
        else
            if v13 == v2.Enums.ControlState.Hover then
                v12(true);
            end;
            return;
        end;
    end, {});
    return v1.createElement(v2.View, {
        tag = l_FFlagAXResetAvatarButton_0 and "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1000" or "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1100", 
        testId = "RobuxBalance", 
        ref = v8, 
        onActivated = v7.onActivated, 
        onStateChanged = v14, 
        backgroundStyle = v11:map(function(v15) --[[ Line: 46 ]]
            -- upvalues: v9 (copy)
            if v15 then
                return v9.Color.Shift.Shift_200;
            else
                return v9.Color.Surface.Surface_0;
            end;
        end), 
        stateLayer = {
            affordance = v2.Enums.StateLayerAffordance.None
        }, 
        selection = {
            Selectable = true, 
            SelectionImageObject = v10, 
            NextSelectionLeft = v7.NextSelectionLeft
        }
    }, {
        RobuxBalanceIcon = v1.createElement(v2.Icon, {
            name = "robux", 
            style = v9.Color.ActionStandard.Foreground, 
            size = v2.Enums.IconSize.Small, 
            LayoutOrder = 1, 
            testId = "RobuxBalanceIcon"
        }), 
        RobuxBalanceText = v1.createElement(v2.Text, {
            tag = "auto-xy", 
            testId = "RobuxBalanceText", 
            Text = v7.text, 
            textStyle = v9.Color.Content.Emphasis, 
            fontStyle = v9.Typography.LabelMedium, 
            LayoutOrder = 2, 
            selection = {
                Selectable = false
            }
        })
    });
end));