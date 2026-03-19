local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v9 = require(script.Parent.MoreText);
local l_SubheaderText_0 = v9.SubheaderText;
local l_BodyText_0 = v9.BodyText;
return (v2.forwardRef(function(v12, v13) --[[ Line: 24 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v2 (copy), l_Interactable_0 (copy), v1 (copy), l_SubheaderText_0 (copy), l_ImageSetLabel_0 (copy), l_BodyText_0 (copy)
    local v14 = l_useDesignTokens_0();
    local l_Space_300_0 = v14.Global.Space_300;
    local l_Size_400_0 = v14.Global.Size_400;
    local v17 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    return v2.createElement(l_Interactable_0, {
        ref = v13, 
        LayoutOrder = v12.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v14.Global.Size_700), 
        BackgroundTransparency = 1, 
        SelectionImageObject = v17, 
        [v2.Event.Activated] = v12.onActivated, 
        onStateChanged = v1.noop
    }, {
        TitleFrame = v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            Title = v2.createElement(l_SubheaderText_0, {
                layoutOrder = 1, 
                text = v12.title
            })
        }), 
        StatusFrame = v2.createElement("Frame", {
            Position = UDim2.new(1, -l_Space_300_0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            Icon = if v12.icon then v2.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v12.icon, 
                ImageColor3 = v14.Semantic.Color.Icon.Default.Color3, 
                ImageTransparency = v14.Semantic.Color.Icon.Default.Transparency, 
                Size = UDim2.fromOffset(l_Size_400_0, l_Size_400_0)
            }) else nil, 
            Status = if v12.status then v2.createElement(l_BodyText_0, {
                text = v12.status, 
                TextXAlignment = Enum.TextXAlignment.Right
            }) else nil
        })
    });
end));