local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = v6.App.Dialog.TooltipV2.withTooltip;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v14 = require(l_Common_0.Components.TopBar.useCommunityAvatarEntryButtonTooltip);
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v17 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_FFlagEnableAppNavGamepadRemoval_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAppNavGamepadRemoval;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
return function(v21) --[[ Line: 43 ]] --[[ Name: CommunityAvatarEntryButton ]]
    -- upvalues: v17 (copy), l_useStyle_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), v4 (copy), v14 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy), l_useLocalization_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), l_withTooltip_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), v5 (copy)
    local v22 = v17.getIconButtonSize(v21.formFactor);
    local v23 = l_useStyle_0();
    local v24 = l_useNavigation_0();
    local v25 = l_useDispatch_0();
    local l_Theme_0 = v23.Theme;
    local v27 = if l_FFlagEnableAppNavGamepadRemoval_0 then v4.useRef(nil) else nil;
    local v28, v29 = v14({});
    local v34 = if l_FFlagEnableAppNavGamepadRemoval_0 then v4.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v27 (copy), v29 (copy), v24 (copy), l_AvatarScreen_0 (ref), v25 (copy), l_NavigateWithLock_0 (ref)
        if not v27 or not v27.current then
            return;
        else
            v29({
                saveDismissTime = true
            });
            local l_current_0 = v27.current;
            local v31 = l_current_0.AbsolutePosition + l_current_0.AbsoluteSize * Vector2.new(0.5, 0.5);
            v25(l_NavigateWithLock_0(function() --[[ Line: 68 ]]
                -- upvalues: v24 (ref), l_AvatarScreen_0 (ref), v31 (copy)
                v24.navigate(l_AvatarScreen_0.CommunityAvatarEntryMenu, {
                    entryButtonPosition = v31
                });
            end));
            return;
        end;
    end, {
        v27, 
        v29
    }) else v4.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v21 (copy), v29 (copy), v24 (copy), l_AvatarScreen_0 (ref), v25 (copy), l_NavigateWithLock_0 (ref)
        if not v21.buttonRef or not v21.buttonRef.current then
            return;
        else
            v29({
                saveDismissTime = true
            });
            local l_current_1 = v21.buttonRef.current;
            local v33 = l_current_1.AbsolutePosition + l_current_1.AbsoluteSize * Vector2.new(0.5, 0.5);
            v25(l_NavigateWithLock_0(function() --[[ Line: 92 ]]
                -- upvalues: v24 (ref), l_AvatarScreen_0 (ref), v33 (copy)
                v24.navigate(l_AvatarScreen_0.CommunityAvatarEntryMenu, {
                    entryButtonPosition = v33
                });
            end));
            return;
        end;
    end, {
        v21.buttonRef, 
        v29
    });
    local v35 = l_useLocalization_0({
        sharePublicAvatarTooltip = "Feature.Avatar.Label.SharePublicAvatar.Tooltip"
    });
    local v36 = {
        guiTarget = l_CoreGui_0, 
        active = v28, 
        DisplayOrder = 10, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    };
    return l_withTooltip_0({
        bodyText = v35.sharePublicAvatarTooltip, 
        useLargeDropShadow = true
    }, v36, function(v37) --[[ Line: 122 ]]
        -- upvalues: v4 (ref), l_IconButton_0 (ref), v22 (copy), l_Images_0 (ref), l_IconSize_0 (ref), l_Theme_0 (copy), v5 (ref), v34 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (ref), v27 (copy), v21 (copy)
        return v4.createElement(l_IconButton_0, {
            size = UDim2.new(0, v22, 1, 0), 
            icon = l_Images_0["icons/actions/edit/add"], 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            onAbsolutePositionChanged = v37, 
            [v5.Change.AbsoluteSize] = v37, 
            onActivated = v34, 
            buttonRef = if l_FFlagEnableAppNavGamepadRemoval_0 then v27 else v21.buttonRef
        });
    end);
end;