local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_ControlState_0 = v2.Enums.ControlState;
local l_IconSize_0 = v2.Enums.IconSize;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FFlagUseBirthdayDropdownForGamepad_0 = require(l_Parent_0.SharedFlags).FFlagUseBirthdayDropdownForGamepad;
return function(v10) --[[ Line: 32 ]] --[[ Name: SideModalDropdown ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_ControlState_0 (copy), l_FFlagUseBirthdayDropdownForGamepad_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v11 = l_useTokens_0();
    local v12, v13 = v1.useState(false);
    local v15 = v1.useCallback(function(v14) --[[ Line: 35 ]]
        -- upvalues: l_ControlState_0 (ref), v13 (copy)
        if v14 == l_ControlState_0.Hover then
            v13(true);
            return;
        else
            v13(false);
            return;
        end;
    end, {
        v13
    });
    local v16 = 40;
    if l_FFlagUseBirthdayDropdownForGamepad_0 then
        v16 = v10.height or v16;
    end;
    local v17 = v10.fixSizeToParent and 1 or 0;
    return v1.createElement(l_View_0, {
        Size = UDim2.new(v17, 0, 0, v16), 
        tag = {
            ["auto-x"] = not v10.fixSizeToParent, 
            ["radius-medium"] = true, 
            ["align-x-left"] = true, 
            ["align-y-center"] = true, 
            ["padding-xxsmall"] = true, 
            ["bg-shift-100"] = true
        }, 
        onStateChanged = v15, 
        onActivated = v10.onActivated, 
        backgroundStyle = if l_FFlagUseBirthdayDropdownForGamepad_0 then v10.backgroundColorToken else nil
    }, {
        UIStroke = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = if v10.isDropdownError then v11.Color.System.Alert.Color3 else v11.Color.Stroke.Default.Color3, 
            Transparency = if v10.isDropdownError then v11.Color.System.Alert.Transparency else if v12 then v11.Color.Stroke.Emphasis.Transparency else v11.Color.Stroke.Default.Transparency, 
            Thickness = v11.Stroke.Standard
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Text = v1.createElement(l_Text_0, {
            Text = v10.text or "", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, -40, 1, 0), 
            tag = "text-truncate-split padding-left-small", 
            LayoutOrder = 0
        }), 
        IconContainer = v1.createElement(l_View_0, {
            tag = "auto-xy padding-right-small", 
            LayoutOrder = 1
        }, {
            Icon = v1.createElement(l_Icon_0, {
                name = "icons/actions/truncationExpand", 
                size = l_IconSize_0.Medium, 
                LayoutOrder = 1
            })
        })
    });
end;