local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v18 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v18 = l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX;
end;
local v19 = l_Images_0["icons/navigation/close"];
local v20 = v18 and 0.5 or 0;
return function(v21) --[[ Line: 43 ]] --[[ Name: FiltersTopBar ]]
    -- upvalues: l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v14 (copy), l_useNavigation_0 (copy), v4 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_Focusable_0 (copy), v20 (copy), l_ImageSetLabel_0 (copy), v19 (copy)
    local v23 = l_useSelector_0(function(v22) --[[ Line: 44 ]]
        return v22.TopBar.statusBarHeight;
    end, l_getUseSelectorDeepEquals_0());
    local v24 = l_useSelector_0(v14.getTopBarHeightAvatarScene, l_getUseSelectorDeepEquals_0());
    local v25 = l_useNavigation_0();
    local v26 = v4.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v21 (copy)
        v21.closePeekViewSignal:fire();
    end, {
        v25, 
        v21.closePeekViewSignal
    });
    local v27 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset);
    return v4.createElement("Frame", {
        Active = true, 
        Size = UDim2.new(1, 0, 0, v24), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        TouchFriendlyNavigationButton = v4.createElement(l_Focusable_0.TextButton, {
            AnchorPoint = Vector2.new(0, v20), 
            Position = UDim2.new(0, 15, v20, v23), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v4.Event.Activated] = v26, 
            ref = v21.buttonRef, 
            NextSelectionLeft = v21.NextSelectionLeft, 
            NextSelectionRight = v21.NextSelectionRight, 
            NextSelectionUp = v21.NextSelectionUp, 
            NextSelectionDown = v21.NextSelectionDown, 
            SelectionImageObject = v27
        }, {
            CloseButton = v4.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v19, 
                ImageColor3 = Color3.new(1, 1, 1)
            })
        })
    });
end;