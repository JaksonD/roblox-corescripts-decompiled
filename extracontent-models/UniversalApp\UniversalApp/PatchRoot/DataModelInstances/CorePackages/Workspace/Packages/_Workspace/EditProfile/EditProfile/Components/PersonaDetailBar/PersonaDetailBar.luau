local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Image_0 = v3.Image;
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
return function(v11) --[[ Line: 32 ]] --[[ Name: PersonaDetailBar ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v10 (copy), v2 (copy), l_Image_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = l_useLocalization_0({
        personaNamePlaceholder = v10.PersonaNamePlaceholder, 
        personaChange = v10.PersonaChange
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 100), 
        LayoutOrder = v11.layoutOrder or 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v12.Color.Surface.Surface_100.Color3, 
        Visible = v11.visible
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 16)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 20)
        }), 
        List = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalFlex = Enum.UIFlexAlignment.None, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            PersonaAvatarIcon = v2.createElement(l_Image_0, {
                LayoutOrder = 0, 
                tag = "bg-surface-300", 
                Size = UDim2.new(0, 60, 0, 60), 
                Image = ("rbxthumb://type=Outfit&id=%*&w=150&h=150"):format(v11.personaOutfit)
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }), 
            PersonaNameTextBox = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = if v11.personaName == "" then v13.personaNamePlaceholder else v11.personaName, 
                tag = "auto-xy " .. (v11.personaName == "" and "content-inverse-muted" or "content-emphasis"), 
                textTransparency = 1, 
                onActivated = v11.onNameActivated
            }), 
            EditIcon = v2.createElement(l_Image_0, {
                LayoutOrder = 2, 
                Image = "icons/actions/edit/edit", 
                Size = UDim2.new(0, 30, 0, 30), 
                onActivated = v11.onNameActivated
            })
        }), 
        ChangeButton = v2.createElement(l_Button_0, {
            LayoutOrder = 2, 
            text = v13.personaChange, 
            variant = l_ButtonVariant_0.Standard, 
            isDisabled = false, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            onActivated = v11.onChooseActivated
        })
    });
end;