local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Radius_0 = v4.Enums.Radius;
local l_Skeleton_0 = v4.Skeleton;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
return function(v13) --[[ Line: 37 ]] --[[ Name: EditTextButton ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), l_StyledTextLabel_0 (copy), v12 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v14 = l_useStyle_0();
    local l_Font_0 = v14.Font;
    local l_Theme_0 = v14.Theme;
    return v2.createElement("Frame", {
        LayoutOrder = v13.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 1, 0), 
        Size = UDim2.new(1, 0, 0, 0), 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        Title = if not (l_FFlagMoveInExperienceModeToEditProfile_0 and v13.title) and l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v2.createElement(l_StyledTextLabel_0, {
            layoutOrder = 1, 
            text = v13.title, 
            fontStyle = l_Font_0.Header2, 
            colorStyle = l_Theme_0.TextEmphasis
        }), 
        Description = v2.createElement(l_StyledTextLabel_0, {
            layoutOrder = 2, 
            text = v13.description, 
            fontStyle = l_Font_0.CaptionBody, 
            colorStyle = l_Theme_0.TextDefault, 
            automaticSize = Enum.AutomaticSize.Y, 
            size = UDim2.new(1, 0, 0, 0), 
            lineHeight = 1
        }), 
        EditButton = if not v13.shouldShimmerName then v2.createElement("ImageButton", {
            AutomaticSize = if v13.expandSizing then Enum.AutomaticSize.Y else nil, 
            LayoutOrder = 3, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 0, 52), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            [v2.Event.Activated] = v13.onActivated, 
            ref = if v12 then v13.forwardRef else nil
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            InititialTextContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -40, 0, 28), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                InitialText = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v13.placeHolderText, 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    TextTransparency = v13.transparentText and 0.5 or nil
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(1e999, 60)
                    })
                })
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12)
            }), 
            Icon = if not (l_FFlagMoveInExperienceModeToEditProfile_0 and v13.onActivated) and l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Image = l_Images_0["icons/actions/edit/edit"], 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 28, 0, 28), 
                Position = UDim2.new(1, 0, 0, 12)
            })
        }) else nil, 
        ShimmerButton = if v13.shouldShimmerName then v2.createElement(l_Skeleton_0, {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 52), 
            radius = l_Radius_0.Medium
        }) else nil
    });
end;