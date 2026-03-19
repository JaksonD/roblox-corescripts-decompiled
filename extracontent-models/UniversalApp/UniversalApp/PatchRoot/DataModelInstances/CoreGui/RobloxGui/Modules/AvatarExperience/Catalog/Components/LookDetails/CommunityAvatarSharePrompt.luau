local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v5 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withClosableOverlayBackdrop);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v14 = require(l_Modules_0.AvatarExperience.Common.Hooks.useShareButton);
local v15 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v15.App.ImageSet.Images;
local l_IconSize_0 = v15.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v15.App.ImageSet.getIconSize;
local l_ImageSetLabel_0 = v15.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v15.Core.Style.useStyle;
local l_ButtonType_0 = v15.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v15.App.Dialog.Modal.PartialPageModal;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.CommunityAvatarLookImageFrame);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXShareAvatarPromptEasyDismiss);
local function v26(v25) --[[ Line: 42 ]]
    return v25.ScreenSize;
end;
local v41 = v8((v9(function(v27) --[[ Line: 46 ]] --[[ Name: CommunityAvatarSharePrompt ]]
    -- upvalues: l_useNavigation_0 (copy), v12 (copy), v4 (copy), v5 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), v14 (copy), v6 (copy), l_useSelector_0 (copy), v26 (copy), v2 (copy), v11 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), v23 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v28 = l_useNavigation_0();
    local v29 = v12(v4);
    local v30 = v5({
        titleText = "Feature.Avatar.Heading.SharePublicAvatar", 
        messageText = "Feature.Avatar.Message.SharePublicAvatar", 
        disclaimerText = "Feature.Avatar.Message.ShareAvatarWithCommunityDisclaimer"
    });
    local v31 = l_useStyle_0();
    local v32 = l_useDesignTokens_0();
    local l_Theme_0 = v31.Theme;
    local l_Font_0 = v31.Font;
    local v35 = l_getIconSize_0(l_IconSize_0.Small);
    local l_lookId_0 = v27.lookId;
    local v37 = v14(l_lookId_0, v6.ItemType.Look, true, nil, nil);
    local v38 = l_useSelector_0(v26);
    local v39 = v2.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v11 (ref), v28 (copy)
        v11.closeOverlay(v28);
    end, {
        v28
    });
    v2.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v37 (copy), v39 (copy)
        if v37 == nil then
            v39();
        end;
    end, {
        v37, 
        v39
    });
    local v40 = v2.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v37 (copy)
        v37.onActivated();
    end, {
        l_lookId_0, 
        v29, 
        v37
    });
    return v2.createElement(l_PartialPageModal_0, {
        title = v30.titleText, 
        screenSize = v38, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v40, 
                        text = v37.text
                    }
                }
            }
        }, 
        onCloseClicked = v39
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        CommunityAvatarSharePromptBodyText = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = v30.messageText, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextWrapped = true, 
            LayoutOrder = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v32.Global.Space_200)
            })
        }), 
        AvatarImage = v2.createElement(v23, {
            size = 300, 
            lookId = v27.lookId, 
            layoutOrder = 2
        }), 
        CommunityAvatarSharePromptDisclaimer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, v32.Global.Space_75), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v32.Global.Space_200)
            }), 
            CommunityAvatarSharePromptDisclaimerIcon = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(v35, v35), 
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/actions/info_small"], 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency
            }), 
            CommunityAvatarSharePromptDisclaimerText = v2.createElement("TextLabel", {
                Text = v30.disclaimerText, 
                BackgroundTransparency = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_Font_0.Footer.Font, 
                TextSize = l_Font_0.Footer.RelativeSize * l_Font_0.BaseSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextWrapped = true
            })
        })
    });
end)));
if v24() then
    v41 = v10(v41);
end;
return v41;