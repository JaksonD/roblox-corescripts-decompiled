local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v8 = require(l_Parent_0.Components.AssetImage);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v10 = require(l_Parent_0.Components.getGameIconRequestSize);
local v11 = l_Roact_0.PureComponent:extend("GameIcon");
v11.validateProps = l_t_0.strictInterface({
    gameId = l_t_0.number, 
    iconSize = l_t_0.numberMin(0), 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    cornerRadius = l_t_0.optional(l_t_0.UDim), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2)
});
v11.render = function(v12) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), v8 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local l_iconSize_0 = v12.props.iconSize;
    local v14 = v10(l_iconSize_0);
    local l_gameId_0 = v12.props.gameId;
    local l_cornerRadius_0 = v12.props.cornerRadius;
    local v17 = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(l_gameId_0, v14, v14);
    if l_gameId_0 == 0 then
        local v18 = 44;
        if l_iconSize_0 <= 44 then
            v18 = l_iconSize_0;
        end;
        return l_withStyle_0(function(v19) --[[ Line: 49 ]]
            -- upvalues: l_Roact_0 (ref), v8 (ref), l_iconSize_0 (copy), v12 (copy), l_ImageSetLabel_0 (ref), v18 (ref), l_Images_0 (ref), l_cornerRadius_0 (copy)
            return l_Roact_0.createElement(v8.Label, {
                imageKey = "RoundedRect", 
                Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
                ImageColor3 = v19.Theme.PlaceHolder.Color, 
                ImageTransparency = v19.Theme.PlaceHolder.Transparency, 
                LayoutOrder = v12.props.layoutOrder, 
                Position = v12.props.Position, 
                AnchorPoint = v12.props.AnchorPoint
            }, {
                PlaceholderIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(v18, v18), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = l_Images_0["icons/imageUnavailable"], 
                    ImageColor3 = v19.Theme.UIDefault.Color, 
                    ImageTransparency = v19.Theme.UIDefault.Transparency, 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, {
                    UICorner = l_cornerRadius_0 and l_cornerRadius_0 ~= UDim.new(0, 0) and l_Roact_0.createElement("UICorner", {
                        CornerRadius = l_cornerRadius_0
                    }) or nil
                })
            });
        end);
    else
        return l_Roact_0.createElement("ImageLabel", {
            Image = v17, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v12.props.layoutOrder, 
            Position = v12.props.Position, 
            AnchorPoint = v12.props.AnchorPoint
        }, {
            UICorner = l_cornerRadius_0 and l_cornerRadius_0 ~= UDim.new(0, 0) and l_Roact_0.createElement("UICorner", {
                CornerRadius = l_cornerRadius_0
            }) or nil
        });
    end;
end;
return v11;