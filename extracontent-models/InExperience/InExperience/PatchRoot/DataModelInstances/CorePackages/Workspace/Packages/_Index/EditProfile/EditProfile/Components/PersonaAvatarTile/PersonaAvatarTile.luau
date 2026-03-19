local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
return function(v6) --[[ Line: 25 ]] --[[ Name: PersonaAvatarTile ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    return v1.createElement(l_View_0, {
        tag = "auto-y col gap-medium", 
        LayoutOrder = v6.layoutOrder or 1, 
        Size = UDim2.new(0, v6.width, 0, 0)
    }, {
        Button = v1.createElement(l_View_0, {
            Size = UDim2.new(0, v6.width, 0, v6.width * 1.3), 
            tag = "bg-surface-200", 
            onActivated = v6.onActivated, 
            LayoutOrder = 1
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), 
            Avatar = v1.createElement("ImageLabel", {
                Image = ("rbxthumb://type=Outfit&id=%*&w=420&h=420"):format(v6.outfitId), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ImageTransparency = 0, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Visible = v6.outfitId ~= -1
            }, {
                AspectRatio = v1.createElement("UIAspectRatioConstraint", {})
            }), 
            PlusIcon = v1.createElement(l_Image_0, {
                Image = "icons/actions/edit/add", 
                tag = "content-system-neutral", 
                Size = UDim2.fromOffset(50, 50), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Visible = v6.outfitId == -1
            }), 
            Checkmark = v1.createElement(l_View_0, {
                tag = "bg-system-contrast radius-small anchor-top-right", 
                Size = UDim2.new(0, 20, 0, 20), 
                Position = UDim2.new(1, -10, 0, 10), 
                Visible = v6.checked and v6.outfitId ~= -1
            }, {
                CheckmarkIcon = v1.createElement(l_Image_0, {
                    tag = "content-inverse-emphasis position-center-center anchor-center-center", 
                    Size = UDim2.new(1, -10, 1, -10), 
                    Image = "icons/status/success_small"
                })
            })
        }), 
        Caption = v1.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v6.caption, 
            tag = "text-label-medium text-align-x-left content-emphasis text-wrap text-align-y-top", 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            Size = UDim2.new(1, 0, 0, 40)
        })
    });
end;