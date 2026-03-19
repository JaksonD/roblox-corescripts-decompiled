local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v4 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v5 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell);
local v6 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local v8 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_CorePackages_0.Packages.Dash);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ContactImporterManager_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).ContactImporterManager;
local l_OpenAmpWizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer;
local l_SetHomePageUpsellCardVariation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.SetHomePageUpsellCardVariation;
local v15 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
return function() --[[ Line: 21 ]] --[[ Name: ContactImporterManagerWrapper ]]
    -- upvalues: l_useDispatch_0 (copy), l_OpenAmpWizardContainer_0 (copy), v3 (copy), v10 (copy), v5 (copy), v4 (copy), l_SetHomePageUpsellCardVariation_0 (copy), v15 (copy), l_IXPService_0 (copy), v9 (copy), l_ContactImporterManager_0 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v16 = l_useDispatch_0();
    local function v19(v17, v18) --[[ Line: 24 ]]
        -- upvalues: v16 (copy), l_OpenAmpWizardContainer_0 (ref)
        v16(l_OpenAmpWizardContainer_0(v17, v18));
    end;
    local function v22(v20, v21) --[[ Line: 28 ]]
        -- upvalues: v16 (copy), v3 (ref), v10 (ref)
        v16(v3({
            v10.join({
                name = v20
            }, v21)
        }));
    end;
    local function v24(v23) --[[ Line: 32 ]]
        -- upvalues: v16 (copy), v5 (ref)
        v16(v5(v23));
    end;
    local function v25() --[[ Line: 36 ]]
        -- upvalues: v16 (copy), v4 (ref)
        v16(v4());
    end;
    local function v26() --[[ Line: 40 ]]
        -- upvalues: v16 (copy), l_SetHomePageUpsellCardVariation_0 (ref)
        v16(l_SetHomePageUpsellCardVariation_0("", "", ""));
    end;
    local function v28(v27) --[[ Line: 44 ]]
        -- upvalues: v16 (copy), v15 (ref), l_IXPService_0 (ref)
        return v16(v15(l_IXPService_0, v27));
    end;
    return v9.createElement(l_ContactImporterManager_0, {
        openAmpUpsell = v19, 
        navigate = v22, 
        openDiscoverabilityModal = v24, 
        onCloseDiscoverabilityModal = v25, 
        openPhoneUpsellModal = v6, 
        closeCentralOverlay = v4, 
        openContactImporterLearnMoreLink = v7, 
        openProfilePeekView = v8, 
        hideUpsellCard = v26, 
        waitUntilIXPUserInit = v28
    });
end;