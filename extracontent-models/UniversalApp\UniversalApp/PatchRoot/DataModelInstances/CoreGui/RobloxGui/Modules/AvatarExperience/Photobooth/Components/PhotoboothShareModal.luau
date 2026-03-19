local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
return function(v7) --[[ Line: 23 ]] --[[ Name: PhotoboothShareModal ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_default_0 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v8 = l_useLocalization_0({
        title = "Feature.Captures.Title.ShareCapturePrompt", 
        bodyText = "Feature.Captures.Body.ShareCapturePrompt", 
        shareButton = "Feature.Captures.Action.Share", 
        cancelButton = "Feature.Captures.Action.NoThanks", 
        shareSheetTitle = "Feature.Captures.Action.ShareYourCapture"
    });
    local v9 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v7 (copy), l_default_0 (ref), v8 (copy)
        if v7.screenshotPath and l_default_0 then
            l_default_0:shareImage({
                context = "Photobooth", 
                image = v7.screenshotPath, 
                shareSheetTitle = v8.shareSheetTitle
            });
        end;
        v7.onClose();
    end, {
        v7.screenshotPath, 
        v7.onClose
    });
    local v10 = v1.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v7 (copy)
        v7.onClose();
    end, {
        v7.onClose
    });
    local v11 = v1.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v10 (copy), v8 (copy), l_ButtonType_0 (ref), v9 (copy)
        return {
            buttons = {
                {
                    props = {
                        onActivated = v10, 
                        text = v8.cancelButton
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v9, 
                        text = v8.shareButton
                    }, 
                    isDefaultChild = false
                }
            }
        };
    end, {
        v8, 
        v9, 
        v10
    });
    if not v7.isVisible then
        return nil;
    else
        return v1.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = "", 
            AutoButtonColor = false, 
            [v1.Event.Activated] = v10, 
            ZIndex = 9999
        }, {
            Modal = v1.createElement(l_InteractiveAlert_0, {
                title = v8.title, 
                bodyText = v8.bodyText, 
                buttonStackInfo = v11, 
                screenSize = Vector2.new(1000, 1000)
            })
        });
    end;
end;