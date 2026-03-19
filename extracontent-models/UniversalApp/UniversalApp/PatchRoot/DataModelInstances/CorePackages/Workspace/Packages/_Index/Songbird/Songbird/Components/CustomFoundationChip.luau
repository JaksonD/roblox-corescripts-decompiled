local l_Parent_0 = script:FindFirstAncestor("Songbird").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useCursor_0 = v2.Hooks.useCursor;
local l_Icon_0 = v2.Icon;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_withDefaults_0 = v2.Utility.withDefaults;
local l_withCommonProps_0 = v2.Utility.withCommonProps;
local l_IconSize_0 = v2.Enums.IconSize;
local l_IconPosition_0 = v2.Enums.IconPosition;
local l_StateLayerMode_0 = v2.Enums.StateLayerMode;
local l_CursorType_0 = v2.Enums.CursorType;
local v14 = {
    isDisabled = false, 
    isChecked = false
};
return v1.memo(v1.forwardRef(function(v15, v16) --[[ Line: 50 ]] --[[ Name: Chip ]]
    -- upvalues: l_withDefaults_0 (copy), v14 (copy), l_useTokens_0 (copy), l_useCursor_0 (copy), l_CursorType_0 (copy), v1 (copy), l_IconPosition_0 (copy), l_View_0 (copy), l_withCommonProps_0 (copy), l_StateLayerMode_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local v17 = l_withDefaults_0(v15, v14);
    local v18 = l_useTokens_0();
    local v19 = l_useCursor_0(l_CursorType_0.SmallPill);
    local v20 = v1.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v17 (copy), l_IconPosition_0 (ref)
        if typeof(v17.icon) == "string" then
            return {
                name = v17.icon, 
                position = l_IconPosition_0.Left
            };
        else
            return v17.icon;
        end;
    end, {
        v17.icon
    });
    local v21 = if v17.isChecked then v18.Color.ActionSubEmphasis.Foreground else v18.Color.Content.Emphasis;
    return v1.createElement(l_View_0, l_withCommonProps_0(v17, {
        GroupTransparency = v17.isDisabled and 0.5 or nil, 
        selection = {
            Selectable = not v17.isDisabled, 
            SelectionImageObject = v19
        }, 
        onActivated = v17.onActivated, 
        isDisabled = v17.isDisabled, 
        stateLayer = {
            mode = l_StateLayerMode_0.Inverse
        }, 
        tag = {
            ["row gap-xsmall size-0-800 padding-medium auto-x align-y-center align-x-center clip radius-circle"] = true, 
            ["bg-action-sub-emphasis"] = v17.isChecked, 
            ["bg-shift-200"] = not v17.isChecked
        }, 
        ref = v16
    }), {
        Icon = if v20 then v1.createElement(l_Icon_0, {
            name = v20.name, 
            size = l_IconSize_0.Small, 
            style = v21, 
            LayoutOrder = v20.position == l_IconPosition_0.Left and 1 or 3
        }) else nil, 
        Text = if v17.text and v17.text ~= "" then v1.createElement(l_Text_0, {
            Text = v17.text, 
            textStyle = v21, 
            LayoutOrder = 2, 
            tag = "auto-x size-0-full shrink text-caption-large text-truncate-end"
        }) else nil
    });
end));