local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_AvatarExperience_0 = l_Modules_0.AvatarExperience;
local l_Common_0 = l_AvatarExperience_0.Common;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.Looks.LookViewport);
local _ = require(l_Common_0.Types);
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v12 = require(l_AvatarExperience_0.Catalog.Components.LookDetails.LookDetails.ModerationStatusPill);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v5.Utils.getRbxthumbWithTypeSizeAndOptions;
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions);
local v15 = game:DefineFastFlag("AXLookDetailsThumbnailStretched", false);
return function(v16) --[[ Line: 42 ]] --[[ Name: LookImageFrame ]]
    -- upvalues: l_useStyle_0 (copy), v14 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v3 (copy), v2 (copy), v8 (copy), l_LoadableImage_0 (copy), v15 (copy), v12 (copy)
    local v17 = l_useStyle_0();
    local l_Theme_0 = v17.Theme;
    local l_Space_300_0 = v17.Tokens.Global.Space_300;
    local v20 = if v14() then nil else v16.width * 9 / 16;
    local l_lookId_0 = v16.lookId;
    local v22 = l_getRbxthumbWithTypeSizeAndOptions_0(l_lookId_0, "Look", 420);
    local v23 = v16.lookDetails and v16.lookDetails.displayProperties;
    local v24 = if v16.lookDetails then v16.lookDetails.moderationStatus else nil;
    local v25 = if v23 and v23.backgroundType == "Hex" and v23.backgroundValue then Color3.fromHex(v23.backgroundValue) else l_Theme_0.PlaceHolder.Color;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = if v14() then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, v20), 
        SizeConstraint = if v14() then Enum.SizeConstraint.RelativeXY else nil, 
        LayoutOrder = 1, 
        ZIndex = 0
    }, {
        AspectRatio = if v14() then v3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.5
        }) else nil, 
        ItemBackground = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.new(1, v14() and 0 or l_Space_300_0 * 2, 1, 0), 
            ZIndex = 0, 
            BackgroundColor3 = v25, 
            BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
            BorderSizePixel = 0
        }), 
        LookViewport = v16.renderViewport and v3.createElement(v8, {
            lookDetails = v16.lookDetails
        }), 
        Image = if not not v14() or v16.renderViewport then nil else v2.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            Image = v22, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromOffset(v20, v20), 
            useShimmerAnimationWhileLoading = true, 
            ScaleType = if v15 then Enum.ScaleType.Fit else nil
        }), 
        ImageFrame = if not v14() or v16.renderViewport then nil else v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0)
        }, {
            AspectRatio = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), 
            Image = v2.createElement(l_LoadableImage_0, {
                BackgroundTransparency = 1, 
                Image = v22, 
                Size = UDim2.new(1, 0, 1, 0), 
                useShimmerAnimationWhileLoading = true, 
                ScaleType = if v15 then Enum.ScaleType.Fit else nil
            })
        }), 
        ModerationStatus = v2.createElement(v12, {
            moderationStatus = v24
        })
    });
end;