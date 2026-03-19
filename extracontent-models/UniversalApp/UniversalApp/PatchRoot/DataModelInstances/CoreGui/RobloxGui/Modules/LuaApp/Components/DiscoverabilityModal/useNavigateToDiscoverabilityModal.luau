local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Promise);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v8 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local l_dependencies_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).dependencies;
local l_getContactImporterParams_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.getContactImporterParams;
local l_EnumScreens_0 = require(l_CorePackages_0.Workspace.Packages.SocialModalsCommon).EnumScreens;
return function() --[[ Line: 17 ]]
    -- upvalues: l_useSelector_0 (copy), l_getContactImporterParams_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v7 (copy), v8 (copy), l_dependencies_0 (copy), v4 (copy), v5 (copy), l_EnumScreens_0 (copy)
    local v12 = l_useSelector_0(l_getContactImporterParams_0);
    local l_isDiscoverabilityUnset_0 = v12.isDiscoverabilityUnset;
    local l_isPhoneVerified_0 = v12.isPhoneVerified;
    local v15 = l_useDispatch_0();
    local v16 = l_useNavigation_0();
    local function v18(v17) --[[ Line: 23 ]]
        -- upvalues: v15 (copy), v7 (ref)
        v15(v7({
            toastMessage = v17
        }));
    end;
    local function v19() --[[ Line: 28 ]]
        -- upvalues: v15 (copy), v8 (ref)
        v15(v8());
    end;
    local function _() --[[ Line: 31 ]]
        -- upvalues: v15 (copy), l_dependencies_0 (ref)
        return v15(l_dependencies_0.NetworkingUserSettings.GetUserSettingsMetadata.API());
    end;
    v4.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v15 (copy), l_dependencies_0 (ref), v5 (ref)
        v15(l_dependencies_0.NetworkingUserSettings.GetUserSettingsMetadata.API()):catch(function() --[[ Line: 36 ]]
            -- upvalues: v5 (ref)
            v5.reject();
        end);
    end, {});
    return function(v21) --[[ Line: 41 ]]
        -- upvalues: l_isDiscoverabilityUnset_0 (copy), l_isPhoneVerified_0 (copy), v16 (copy), l_EnumScreens_0 (ref), v18 (copy), v19 (copy)
        if l_isDiscoverabilityUnset_0 and l_isPhoneVerified_0 then
            v16.navigate(l_EnumScreens_0.DiscoverabilityOverlay, {
                showToast = v18, 
                openLearnMoreLink = v19, 
                isStandaloneDiscoverabilityModal = v21.isStandaloneDiscoverabilityModal, 
                navigateOnActivated = v21.navigateOnActivated, 
                entryPoint = v21.entryPoint
            });
            return;
        else
            v21.navigateOnActivated();
            return;
        end;
    end;
end;