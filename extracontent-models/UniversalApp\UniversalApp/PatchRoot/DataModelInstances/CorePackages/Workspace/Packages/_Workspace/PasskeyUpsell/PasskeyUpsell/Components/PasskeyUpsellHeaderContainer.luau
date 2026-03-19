local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Images_0 = v2.App.ImageSet.Images;
local l_ThemeName_0 = v2.App.Style.Constants.ThemeName;
local l_useStyleMetadata_0 = v2.Core.Style.useStyleMetadata;
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local v8 = require(l_Parent_0.Foundation);
local l_Text_0 = v8.Text;
local l_View_0 = v8.View;
local l_Image_0 = v8.Image;
local function v13(v12) --[[ Line: 30 ]] --[[ Name: checkGraphicExistence ]]
    -- upvalues: l_Images_0 (copy)
    return l_Images_0[v12].image;
end;
return function(v14) --[[ Line: 37 ]] --[[ Name: PasskeyUpsellHeaderContainer ]]
    -- upvalues: l_useStyle_0 (copy), l_useStyleMetadata_0 (copy), l_ThemeName_0 (copy), v13 (copy), v1 (copy), l_View_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), l_Text_0 (copy), l_Image_0 (copy)
    local v15 = l_useStyle_0();
    local v16 = l_useStyleMetadata_0().ThemeName == l_ThemeName_0.Dark;
    local v17 = "icons/graphic/passkey_upsell";
    local l_status_0, _ = pcall(v13, v17);
    if not l_status_0 then
        v17 = v16 and "icons/graphic/passkey_upsell_dark" or "icons/graphic/passkey_upsell_light";
    end;
    return v1.createElement(l_View_0, {
        tag = "col gap-xxlarge size-full-0 auto-y padding-bottom-xxlarge", 
        padding = {
            top = UDim.new(0, 48)
        }
    }, {
        CloseButton = v1.createElement(l_ImageSetButton_0, {
            Size = UDim2.new(0, 36, 0, 36), 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Image = l_Images_0["icons/navigation/close"], 
            [v1.Event.Activated] = v14.onCancelButtonPressed, 
            BackgroundColor3 = v15.Theme.BackgroundUIContrast.Color, 
            ImageColor3 = v15.Theme.UIEmphasis.Color, 
            LayoutOrder = 1, 
            Active = not v14.isDisabled
        }), 
        Title = v1.createElement(l_Text_0, {
            Text = v14.localizedTitleText, 
            textStyle = {
                Color3 = v15.Theme.TextEmphasis.Color
            }, 
            TextWrapped = true, 
            tag = "content-action-emphasis text-align-x-left text-heading-medium auto-xy padding-left", 
            LayoutOrder = 3
        }), 
        Graphic = v14.shouldRenderGraphic and v1.createElement(l_View_0, {
            tag = "auto-xy position-center-center grow", 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0.27, 0)
        }, {
            UpsellGraphic = v1.createElement(l_Image_0, {
                Image = v17, 
                ScaleType = Enum.ScaleType.Fit, 
                Size = UDim2.new(1, 0, 1, 0)
            })
        })
    });
end;