local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Style);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.Foundation);
local l_useDesignTokens_0 = v2.useDesignTokens;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_FooterCornerButtonStyle_0 = require(l_Parent_0.GameTile).FooterCornerButtonStyle;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_FooterCornerButtonStyle_0 (copy), v1 (copy)
    local v9 = l_useDesignTokens_0();
    local v10 = l_useTokens_0();
    local v11 = l_useLocalization_0({
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        joinEvent = "Feature.VirtualEvents.JoinEvent"
    });
    local l_Color3_0 = v9.Semantic.Color.Action.PrimaryBrand.Background.Color3;
    local l_Color3_1 = v9.Semantic.Color.Action.PrimaryBrand.Content.Color3;
    local l_joinEvent_0 = v11.joinEvent;
    if v8.buttonStyle == l_FooterCornerButtonStyle_0.Follow then
        l_Color3_0 = v10.Color.ActionSubEmphasis.Background.Color3;
        l_Color3_1 = v10.Color.ActionSubEmphasis.Foreground.Color3;
        l_joinEvent_0 = v11.notifyMe;
    elseif v8.buttonStyle == l_FooterCornerButtonStyle_0.Following then
        l_Color3_1 = v10.Color.ActionStandard.Foreground.Color3;
        l_joinEvent_0 = v11.unfollowEvent;
    end;
    local v15 = v8.buttonStyle == l_FooterCornerButtonStyle_0.Following;
    local v16 = v8.disabled and 0.5 or 0;
    return v1.createElement("TextButton", {
        Size = UDim2.new(1, 0, 0, v9.Global.Size_350), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        TextSize = v9.Global.Size_175, 
        Font = v9.Semantic.Typography.Header.Font, 
        BackgroundColor3 = l_Color3_0, 
        TextColor3 = l_Color3_1, 
        AutoButtonColor = false, 
        Text = l_joinEvent_0, 
        BackgroundTransparency = v15 and 1 or v16, 
        TextTransparency = v16, 
        [v1.Event.Activated] = v8.onActivated
    }, {
        EventButtonCorners = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, v9.Global.Space_100)
        }), 
        OutlineFrame = if v15 then v1.createElement("Frame", {
            Size = UDim2.new(1, -2, 1, -2), 
            Position = UDim2.new(0, 1, 0, 1), 
            BackgroundTransparency = 1
        }, {
            OutlineCorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v9.Global.Space_100 - 2)
            }), 
            OutlineStroke = v1.createElement("UIStroke", {
                Color = l_Color3_1, 
                Transparency = v16, 
                Thickness = 1
            })
        }) else nil
    });
end;