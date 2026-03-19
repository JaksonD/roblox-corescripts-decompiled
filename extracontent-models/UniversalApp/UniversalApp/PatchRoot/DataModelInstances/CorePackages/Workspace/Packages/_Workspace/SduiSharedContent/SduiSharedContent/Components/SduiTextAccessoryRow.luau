local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_AvatarGroup_0 = v2.AvatarGroup;
local l_Icon_0 = v2.Icon;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v14 = v1.memo(function(v10) --[[ Line: 72 ]] --[[ Name: AccessoryComponent ]]
    -- upvalues: v1 (copy), l_AvatarGroup_0 (copy), l_Icon_0 (copy)
    local l_LayoutOrder_0 = v10.LayoutOrder;
    if v10.accessory.type == "AvatarGroup" then
        local l_accessory_0 = v10.accessory;
        return v1.createElement(l_AvatarGroup_0, {
            LayoutOrder = l_LayoutOrder_0, 
            avatars = l_accessory_0.avatars, 
            type = l_accessory_0.groupType, 
            max = l_accessory_0.max, 
            backplateStyle = v10.accessory.backplateStyle, 
            size = l_accessory_0.size, 
            testId = ("%*--%*-avatar-group"):format(v10.testIdPrefix, v10.position)
        });
    elseif v10.accessory.type == "Icon" then
        local l_accessory_1 = v10.accessory;
        return v1.createElement(l_Icon_0, {
            LayoutOrder = l_LayoutOrder_0, 
            name = l_accessory_1.name, 
            variant = l_accessory_1.variant, 
            size = l_accessory_1.size, 
            style = l_accessory_1.style, 
            testId = ("%*--%*-icon"):format(v10.testIdPrefix, v10.position)
        });
    else
        return nil;
    end;
end);
return v1.memo(function(v15) --[[ Line: 103 ]] --[[ Name: SduiTextAccessoryRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), v2 (copy), v14 (copy), l_Text_0 (copy)
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    if l_FFlagSduiServerCompat_0 then
        v16 = v15.layoutOrder;
        v17 = v15.anchorPoint;
        v18 = v15.size;
        v19 = v15.position;
    else
        v16 = v15.LayoutOrder;
        v17 = v15.AnchorPoint;
        v18 = v15.Size;
        v19 = v15.Position;
    end;
    local v20 = l_useTokens_0();
    local v21 = v15.textStyle or v20.Color.Content.Emphasis;
    local v22 = if v15.fontStyle then nil else "text-caption-large";
    local v23 = v15.leading and 2 or 1;
    local v24 = v15.leading and 3 or 2;
    local v25 = v15.testId or "--sdui-text-accessory-row";
    local v26 = v1.useMemo(function() --[[ Line: 132 ]]
        -- upvalues: v15 (copy)
        return {
            ["row align-y-center auto-xy"] = true, 
            ["gap-small"] = not v15.gap
        };
    end, {
        v15.gap
    });
    return v1.createElement(l_View_0, {
        tag = v26, 
        LayoutOrder = v16, 
        AnchorPoint = v17, 
        Size = v18, 
        Position = v19, 
        onActivated = v15.onActivated, 
        testId = v25, 
        stateLayer = {
            affordance = v2.Enums.StateLayerAffordance.None
        }
    }, {
        ListLayout = if v15.gap then v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v15.gap)
        }) else nil, 
        LeadingAccessory = if v15.leading then v1.createElement(v14, {
            accessory = v15.leading, 
            LayoutOrder = 1, 
            testIdPrefix = v25, 
            position = "leading"
        }) else nil, 
        TextElement = if v15.text then v1.createElement(l_Text_0, {
            Text = v15.text, 
            textStyle = v21, 
            fontStyle = v15.fontStyle, 
            tag = ("auto-xy %*"):format(v22 or ""), 
            LayoutOrder = v23, 
            testId = ("%*--text"):format(v25), 
            RichText = true
        }) else nil, 
        TrailingAccessory = if v15.trailing then v1.createElement(v14, {
            accessory = v15.trailing, 
            LayoutOrder = v24, 
            testIdPrefix = v25, 
            position = "trailing"
        }) else nil
    });
end);