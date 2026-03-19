local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local l_AvatarExperience_0 = l_Modules_0.AvatarExperience;
local l_Common_0 = l_AvatarExperience_0.Common;
local _ = require(l_Common_0.Types);
local v7 = require(l_AvatarExperience_0.Catalog.Components.LookDetails.LookDetails.LookImageFrame);
local l_FitFrameVertical_0 = v3.RoactFitComponents.FitFrameVertical;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_useStyle_0 = v9.Core.Style.useStyle;
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions);
return function(v13) --[[ Line: 39 ]] --[[ Name: LookDetailsImageAndName ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_FitFrameVertical_0 (copy), v7 (copy), v12 (copy), l_Skeleton_0 (copy)
    local v14 = l_useStyle_0();
    local l_Theme_0 = v14.Theme;
    local l_Font_0 = v14.Font;
    local l_Space_150_0 = v14.Tokens.Global.Space_150;
    local function _() --[[ Line: 46 ]]
        -- upvalues: l_Font_0 (copy)
        return l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    end;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v20 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_name_0 = v13.name;
    local l_isLoading_0 = v13.isLoading;
    return v2.createElement(l_FitFrameVertical_0, {
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, l_Space_150_0), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, {
        LookImageFrame = v2.createElement(v7, {
            width = if v12() then nil else v13.width, 
            lookId = v13.lookId, 
            lookDetails = v13.lookDetails, 
            renderViewport = v13.renderViewport
        }), 
        LookNameContainer = if v12() and (l_isLoading_0 or l_name_0) then v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v13.innerPadding), 
                PaddingRight = UDim.new(0, v13.innerPadding)
            }), 
            LookName = if l_isLoading_0 then v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v20)
            }) else v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 0), 
                Text = l_name_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_Font_1, 
                TextSize = v20, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true
            })
        }) else nil, 
        LookName = if v12() then nil else if l_isLoading_0 then v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v20), 
            LayoutOrder = 2
        }) else if l_name_0 then v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = l_name_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_Font_1, 
            TextSize = v20, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextWrapped = true, 
            LayoutOrder = 2
        }) or v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v20), 
            LayoutOrder = 2
        }) else nil
    });
end;