local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local l_Interactable_0 = require(l_Parent_0.UIBlox).Core.Control.Interactable;
local v3 = require(l_Parent_0.Foundation);
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local function v6() --[[ Line: 19 ]] --[[ Name: NOOP ]]

end;
return function(v7) --[[ Line: 21 ]] --[[ Name: SocialCountsItem ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Interactable_0 (copy), v6 (copy), l_Text_0 (copy)
    local v8 = l_useTokens_0();
    local v9 = not v7.isDisabled and v7.count ~= "0";
    local v10 = v9 and v8.Color.Content.Emphasis or v8.Color.Content.Muted;
    return v1.createElement(l_Interactable_0, {
        Size = UDim2.fromScale(0.25, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v1.Event.Activated] = if v9 then v7.onActivated else v6, 
        onStateChanged = v6, 
        LayoutOrder = v7.layoutOrder, 
        Active = v9
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Count = v1.createElement(l_Text_0, {
            Text = v7.count, 
            tag = "text-align-y-bottom auto-xy", 
            fontStyle = v8.Typography.HeadingSmall, 
            textStyle = v10, 
            LayoutOrder = 1
        }), 
        Text = v1.createElement(l_Text_0, {
            Text = v7.text, 
            tag = "text-align-y-top auto-xy", 
            fontStyle = v8.Typography.CaptionMedium, 
            textStyle = v10, 
            LayoutOrder = 2
        })
    });
end;