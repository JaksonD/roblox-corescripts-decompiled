local l_Parent_0 = script:FindFirstAncestor("AccountRecovery").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local v6 = require(l_Parent_0.Foundation);
local l_Text_0 = v6.Text;
local l_useTokens_0 = v6.Hooks.useTokens;
return function(v9) --[[ Line: 25 ]]
    -- upvalues: l_useTokens_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), l_LoadableImage_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Text_0 (copy)
    local v10 = l_useTokens_0();
    local v11 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        LayoutOrder = v9.LayoutOrder, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        VerticalLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v11.Global.Space_20)
        }), 
        AvatarImage = v1.createElement(l_LoadableImage_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, 96, 0, 96), 
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v9.userId), 
            useShimmerAnimationWhileLoading = true, 
            cornerRadius = UDim.new(0.5, 0), 
            shouldHandleReloads = true
        }), 
        AvatarImageSpacing = v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, v10.Size.Size_400), 
            BackgroundTransparency = 1
        }), 
        DisplayName = v1.createElement(l_Text_0, {
            Text = v9.displayName, 
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            fontStyle = v10.Typography.HeadingSmall, 
            textStyle = v10.Color.Content.Emphasis, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Username = v1.createElement(l_Text_0, {
            Text = ("@%*"):format(v9.username), 
            LayoutOrder = 4, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            fontStyle = v10.Typography.BodyMedium, 
            textStyle = v10.Color.Content.Default, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;