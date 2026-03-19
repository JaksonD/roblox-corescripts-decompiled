local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v5 = require(l_Parent_0.UIBlox);
local l_BaseMenu_0 = v5.App.Menu.BaseMenu;
local l_useCursor_0 = v5.App.SelectionCursor.useCursor;
local v8 = require(script.Parent.PlayerContextualMenuHeader);
local v9 = {
    width = UDim.new(1, 0)
};
return function(v10) --[[ Line: 30 ]]
    -- upvalues: v2 (copy), v9 (copy), l_useCursor_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), v8 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_BaseMenu_0 (copy)
    local v11 = v2.join(v9, v10);
    local v12 = l_useCursor_0();
    local v14 = l_useDesignTokens_0(function(v13) --[[ Line: 33 ]]
        return {
            overlayBackgroundColor3 = v13.Semantic.Color.Common.Overlay.Color3, 
            overlayBackgroundTransparency = v13.Semantic.Color.Common.Overlay.Transparency, 
            backgroundColor = v13.Semantic.Color.Background.Default.Color3, 
            backgroundTransparency = v13.Semantic.Color.Background.Default.Transparency, 
            menuCornerRadius = v13.Semantic.Radius.Medium
        };
    end);
    local v15, v16 = v1.useState(0);
    local v17 = v1.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v1 (ref), v8 (ref), v2 (ref), v11 (copy), v16 (copy)
        return v1.createElement(v8, v2.join(v11.headerProps, {
            onHeaderHeightChanged = v16
        }));
    end, {
        v11.headerProps
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v14.overlayBackgroundColor3, 
        BackgroundTransparency = v14.overlayBackgroundTransparency, 
        ZIndex = -1
    }, {
        PositionFrame = v1.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            AutoButtonColor = false, 
            BackgroundColor3 = v14.backgroundColor, 
            BackgroundTransparency = v14.backgroundTransparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Selectable = if l_FFlagEnableAppChatFocusableFixes_0 then #v11.buttonProps == 0 else nil, 
            SelectionImageObject = if l_FFlagEnableAppChatFocusableFixes_0 then v12 else nil, 
            Size = UDim2.new(v11.width, UDim.new(0, 0)), 
            Text = "", 
            ZIndex = 0
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v14.menuCornerRadius)
            }), 
            BaseMenu = v1.createElement(l_BaseMenu_0, {
                topElementRounded = false, 
                buttonProps = v11.buttonProps, 
                width = v11.width, 
                enableTokenOverride = true, 
                renderHeader = v17, 
                headerHeight = v15
            })
        })
    });
end;