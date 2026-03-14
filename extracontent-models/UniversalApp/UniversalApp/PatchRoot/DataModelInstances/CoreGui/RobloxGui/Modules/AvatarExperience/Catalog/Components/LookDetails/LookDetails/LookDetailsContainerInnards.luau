local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemStatistics);
local l_AvatarExperience_0 = l_Modules_0.AvatarExperience;
local l_Common_0 = l_AvatarExperience_0.Common;
local _ = require(l_Common_0.Types);
local v10 = require(l_Common_0.Constants);
local v11 = require(l_AvatarExperience_0.Catalog.Components.LookDetails.LookDetails.LookDescription);
local v12 = require(l_AvatarExperience_0.Catalog.Components.LookDetails.LookDetails.LookInfo.LookInfoList);
local v13 = require(l_AvatarExperience_0.Catalog.Components.LookDetails.LookDetails.LookDetailsImageAndName);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableLookFavoriting);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_RoactFitComponents_0 = v4.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
return function(v19) --[[ Line: 55 ]] --[[ Name: LookDetailsContainerInnards ]]
    -- upvalues: l_useStyle_0 (copy), l_RoactFitComponents_0 (copy), v10 (copy), v3 (copy), l_FitFrameVertical_0 (copy), v14 (copy), v2 (copy), v13 (copy), v11 (copy), v15 (copy), v6 (copy), v12 (copy)
    local v20 = l_useStyle_0();
    local l_Space_300_0 = v20.Tokens.Global.Space_300;
    local l_Space_150_0 = v20.Tokens.Global.Space_150;
    local l_Theme_0 = v20.Theme;
    local l_lookDetails_0 = v19.lookDetails;
    local l_lookId_0 = v19.lookId;
    local v26 = nil;
    if l_lookDetails_0 and l_lookDetails_0.name then
        v26 = l_lookDetails_0.name;
    end;
    local v27 = nil;
    if l_lookDetails_0 and l_lookDetails_0.description then
        v27 = l_lookDetails_0.description;
    end;
    local v28 = v19.listPadding or l_Space_150_0;
    local v29 = l_RoactFitComponents_0.Rect.square(l_Space_300_0);
    v29.top = 0;
    local v30 = false;
    if l_lookId_0 ~= nil then
        v30 = l_lookDetails_0 == nil;
    end;
    local v31 = v19.lookId == v10.DraftLookId;
    local v32 = if v19.width then v19.width else v20.Tokens.Global.Space_300;
    return v3.createElement(l_FitFrameVertical_0, {
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, v28), 
        margin = if v14() then nil else v29, 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        LookDetailsImageAndName = v2.createElement(v13, {
            name = v26, 
            lookId = v19.lookId, 
            lookDetails = l_lookDetails_0, 
            isLoading = v30, 
            width = if v14() then nil else v32, 
            innerPadding = if v14() then l_Space_300_0 else nil, 
            renderViewport = v31
        }), 
        LookDescription = if not not v30 or v27 and v27 ~= "" then v2.createElement(v11, {
            compactNumberOfLines = 3, 
            isLoading = v30, 
            descriptionText = v27, 
            LayoutOrder = 4
        }) else nil, 
        ItemStatistics = if not v15() or v30 then nil else v2.createElement(v6, {
            favoritesCount = if l_lookDetails_0 then l_lookDetails_0.favoriteCount else 0, 
            LayoutOrder = 5, 
            listPadding = v28, 
            width = v32 - l_Space_300_0 * 2
        }), 
        LookInfoList = if v30 then nil else v2.createElement(v12, {
            lookId = v19.lookId, 
            lookDetails = l_lookDetails_0, 
            LayoutOrder = v15() and 6 or 5, 
            innerPadding = if v14() then l_Space_300_0 else nil, 
            disableInteractions = v31, 
            isTryOn = v19.isTryOn
        })
    });
end;