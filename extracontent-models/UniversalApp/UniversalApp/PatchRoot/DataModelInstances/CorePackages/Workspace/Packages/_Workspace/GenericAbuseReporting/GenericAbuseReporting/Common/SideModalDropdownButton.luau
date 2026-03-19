local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_ControlState_0 = v2.Enums.ControlState;
local l_IconSize_0 = v2.Enums.IconSize;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FFlagPrefillPreciseSelectionChoices_0 = require(l_Parent_0.SharedFlags).FFlagPrefillPreciseSelectionChoices;
return function(v11) --[[ Line: 29 ]] --[[ Name: SideModalDropdown ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_useLocalization_0 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_FFlagPrefillPreciseSelectionChoices_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v12 = l_useTokens_0();
    local v13, v14 = v1.useState(false);
    local v15 = l_useLocalization_0({
        ChooseOne = "Feature.ReportAbuse.Label.ChooseOne"
    });
    local v17 = v1.useCallback(function(v16) --[[ Line: 36 ]]
        -- upvalues: l_ControlState_0 (ref), v14 (copy)
        if v16 == l_ControlState_0.Hover then
            v14(true);
            return;
        else
            v14(false);
            return;
        end;
    end, {
        v14
    });
    return v1.createElement(l_View_0, {
        Size = if l_FFlagPrefillPreciseSelectionChoices_0 then UDim2.new(1, 0, 0, 48) else UDim2.new(0, 0, 0, 48), 
        tag = "auto-x radius-medium align-x-left align-y-center padding-xxsmall bg-shift-100", 
        onStateChanged = v17, 
        onActivated = v11.onActivated, 
        LayoutOrder = if l_FFlagPrefillPreciseSelectionChoices_0 then v11.layoutOrder else nil
    }, {
        UIStroke = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = if v11.isDropdownError then v12.Color.System.Alert.Color3 else v12.Color.Stroke.Default.Color3, 
            Transparency = if v11.isDropdownError then v12.Color.System.Alert.Transparency else if v13 then v12.Color.Stroke.Emphasis.Transparency else v12.Color.Stroke.Default.Transparency, 
            Thickness = v12.Stroke.Standard
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Text = v1.createElement(l_Text_0, {
            Text = v11.text or v15.ChooseOne, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, -44, 1, 0), 
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