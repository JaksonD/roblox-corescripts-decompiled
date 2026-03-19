local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_UpdateContactImporterModalLogic_0 = v1.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
local l_AppPage_0 = require(l_Parent_1.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_1.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_Parent_1.ToastRodux);
return function(v8) --[[ Line: 15 ]]
    -- upvalues: l_UpdateContactImporterModalLogic_0 (copy), l_NetworkingUserSettings_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v7 (copy)
    return {
        hideContactImporterModal = function() --[[ Line: 17 ]] --[[ Name: hideContactImporterModal ]]
            -- upvalues: v8 (copy), l_UpdateContactImporterModalLogic_0 (ref)
            return v8(l_UpdateContactImporterModalLogic_0({
                hasOSPermissions = true, 
                shouldShowContactImporterUpsellModal = false
            }));
        end, 
        getUserSettingsMetadata = function() --[[ Line: 23 ]] --[[ Name: getUserSettingsMetadata ]]
            -- upvalues: v8 (copy), l_NetworkingUserSettings_0 (ref)
            return v8(l_NetworkingUserSettings_0.GetUserSettingsMetadata.API());
        end, 
        openLearnMoreLink = function() --[[ Line: 26 ]] --[[ Name: openLearnMoreLink ]]
            -- upvalues: v8 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v8(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = "https://en.help.roblox.com/hc/articles/7416652004884", 
                extraProps = {
                    title = ""
                }
            }, nil));
        end, 
        showToast = function(v9) --[[ Line: 35 ]] --[[ Name: showToast ]]
            -- upvalues: v8 (copy), v7 (ref)
            v8(v7.Actions.SetCurrentToastMessage({
                toastMessage = v9
            }));
        end
    };
end;