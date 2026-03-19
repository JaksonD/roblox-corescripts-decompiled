local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local l_UIBlox_0 = require(l_ContactList_0.dependencies).UIBlox;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local function v12() --[[ Line: 29 ]]

end;
return function(v13) --[[ Line: 31 ]] --[[ Name: SectionHeader ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Interactable_0 (copy), v12 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_Colors_0 (copy)
    local v14 = l_useStyle_0();
    local l_Theme_0 = v14.Theme;
    local l_Font_0 = v14.Font;
    local v17, v18 = v2.useState(false);
    return v2.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 24), 
        BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
        LayoutOrder = v13.layoutOrder
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 24)
        }), 
        HeaderText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -28, 1, 0), 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Footer.Font, 
            Text = string.upper(v13.name), 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextSize = l_Font_0.Footer.RelativeSize * l_Font_0.BaseSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0)
        }), 
        Tooltip = l_withTooltip_0({
            headerText = v13.name, 
            bodyText = v13.description
        }, {
            preferredOrientation = l_TooltipOrientation_0.Right, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 100, 
            active = v17
        }, function(v19) --[[ Line: 68 ]]
            -- upvalues: v2 (ref), l_Interactable_0 (ref), v18 (copy), v17 (copy), v12 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_Colors_0 (ref)
            return v2.createElement(l_Interactable_0, {
                Position = UDim2.new(1, -28, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.fromOffset(28, 28), 
                BackgroundTransparency = 1, 
                [v2.Change.AbsolutePosition] = v19, 
                [v2.Change.AbsoluteSize] = v19, 
                [v2.Event.Activated] = function(_) --[[ Line: 76 ]]
                    -- upvalues: v18 (ref), v17 (ref)
                    v18(not v17);
                end, 
                onStateChanged = v12
            }, {
                Label = v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/actions/info"], 
                    ImageColor3 = l_Colors_0.White
                })
            });
        end)
    });
end;