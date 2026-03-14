local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RoactUtils);
local l_screenSizeSelector_0 = require(l_script_FirstAncestor_0.Common.Utils).screenSizeSelector;
local l_getMiddleContentWidth_0 = require(l_script_FirstAncestor_0.Common.Utils).getMiddleContentWidth;
local l_getAdjustedTitleToScreenString_0 = require(l_script_FirstAncestor_0.Common.Utils).getAdjustedTitleToScreenString;
local l_DEFAULT_PADDING_0 = require(l_script_FirstAncestor_0.Common.Constants).DEFAULT_PADDING;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_FullPageModal_0 = v4.App.Dialog.Modal.FullPageModal;
return function(v13) --[[ Line: 27 ]]
    -- upvalues: l_useSelector_0 (copy), l_screenSizeSelector_0 (copy), l_getMiddleContentWidth_0 (copy), l_UserInputService_0 (copy), l_withStyle_0 (copy), l_getAdjustedTitleToScreenString_0 (copy), v3 (copy), l_FullPageModal_0 (copy), l_DEFAULT_PADDING_0 (copy)
    local v14 = l_useSelector_0(l_screenSizeSelector_0);
    local v15 = l_getMiddleContentWidth_0(v14.X);
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local l_buttonConfig_0 = v13.buttonConfig;
    local l_makeBodyFragment_0 = v13.makeBodyFragment;
    local l_footerContent_0 = v13.footerContent;
    local v20 = not v13.hideCloseButton;
    local l_title_0 = v13.title;
    return l_withStyle_0(function(v22) --[[ Line: 38 ]]
        -- upvalues: l_getAdjustedTitleToScreenString_0 (ref), l_title_0 (copy), v15 (copy), v3 (ref), l_FullPageModal_0 (ref), v14 (copy), l_buttonConfig_0 (copy), v20 (copy), v13 (copy), l_Y_0 (copy), l_footerContent_0 (copy), l_DEFAULT_PADDING_0 (ref), l_makeBodyFragment_0 (copy)
        local v23 = l_getAdjustedTitleToScreenString_0(l_title_0, v15, v22);
        return v3.createElement(l_FullPageModal_0, {
            title = v23, 
            screenSize = v14, 
            buttonStackProps = l_buttonConfig_0, 
            onCloseClicked = v20 and v13.closeModal, 
            distanceFromTop = l_Y_0, 
            footerContent = l_footerContent_0
        }, {
            Middle = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ContentPadding = v3.createElement("UIPadding", {
                    PaddingBottom = l_buttonConfig_0 and UDim.new(0, l_DEFAULT_PADDING_0), 
                    PaddingTop = UDim.new(0, l_DEFAULT_PADDING_0)
                }), 
                ListLayout = v3.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, l_DEFAULT_PADDING_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                BodyFragment = l_makeBodyFragment_0(v15)
            })
        });
    end);
end;