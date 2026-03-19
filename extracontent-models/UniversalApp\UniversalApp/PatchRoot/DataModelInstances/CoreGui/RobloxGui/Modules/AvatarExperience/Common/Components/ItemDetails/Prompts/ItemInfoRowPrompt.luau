local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v6 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v7 = require(l_Common_0.Components.RoactNavigation.withMappedNavigationParams);
local l_ModalWindow_0 = require(l_CorePackages_0.Packages.UIBlox).App.Dialog.Modal.ModalWindow;
local v9 = require(l_CorePackages_0.Packages.Foundation);
local l_View_0 = v9.View;
local l_Text_0 = v9.Text;
local l_Button_0 = v9.Button;
local l_InputSize_0 = v9.Enums.InputSize;
local l_FillBehavior_0 = v9.Enums.FillBehavior;
ItemInfoRowPrompt = function(v15) --[[ Line: 44 ]] --[[ Name: ItemInfoRowPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v6 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_InputSize_0 (copy), l_ModalWindow_0 (copy)
    local v16 = l_useLocalization_0({
        message = v15.message, 
        confirmButtonText = v15.confirmButtonText
    });
    local v17 = v1.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v6 (ref), v15 (copy)
        v6.closeFocusedScreen(v15.navigation);
    end, {
        v15.navigation
    });
    local function v18() --[[ Line: 54 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_Text_0 (ref), v16 (copy), l_Button_0 (ref), l_FillBehavior_0 (ref), l_InputSize_0 (ref), v17 (copy)
        return {
            container = v1.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-xlarge col gap-large"
            }, {
                Text = v1.createElement(l_Text_0, {
                    tag = "size-full-0 auto-y text-align-x-left text-body-large text-wrap", 
                    Text = v16.message, 
                    RichText = true, 
                    LayoutOrder = 2
                }), 
                Footer = v1.createElement(l_View_0, {
                    tag = "row size-full-0 auto-y", 
                    LayoutOrder = 3
                }, {
                    Button = v1.createElement(l_Button_0, {
                        tag = "size-full-0 auto-y", 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        text = v16.confirmButtonText, 
                        size = l_InputSize_0.Large, 
                        onActivated = v17
                    })
                })
            })
        };
    end;
    return v1.createElement(l_ModalWindow_0, {
        screenSize = v15.screenSize, 
        isFullHeight = false
    }, (v18()));
end;
return v7(ItemInfoRowPrompt);