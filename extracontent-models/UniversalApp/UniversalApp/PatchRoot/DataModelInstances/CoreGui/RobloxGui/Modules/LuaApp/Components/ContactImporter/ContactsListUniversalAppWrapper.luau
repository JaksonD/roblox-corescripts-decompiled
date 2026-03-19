local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_ContactsList_0 = require(l_Modules_0.LuaApp.Components.ContactImporter.api).ContactsList;
local v5 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Dash);
local l_OpenAmpWizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer;
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
return function(v11) --[[ Line: 13 ]] --[[ Name: ContactsListUniversalAppWrapper ]]
    -- upvalues: l_useDispatch_0 (copy), v5 (copy), v2 (copy), v3 (copy), l_OpenAmpWizardContainer_0 (copy), v10 (copy), v7 (copy), l_ContactsList_0 (copy), v8 (copy)
    local v12 = l_useDispatch_0();
    local function v14(v13) --[[ Line: 16 ]]
        -- upvalues: v12 (copy), v5 (ref)
        v12(v5({
            toastMessage = v13
        }));
    end;
    local function v17(v15, v16) --[[ Line: 22 ]]
        -- upvalues: v12 (copy), v2 (ref)
        v12(v2(v15, v16));
    end;
    local function v19(v18) --[[ Line: 26 ]]
        -- upvalues: v12 (copy), v3 (ref)
        v12(v3(v18));
    end;
    local function v22(v20, v21) --[[ Line: 30 ]]
        -- upvalues: v12 (copy), l_OpenAmpWizardContainer_0 (ref)
        v12(l_OpenAmpWizardContainer_0(v20, v21));
    end;
    local function v23() --[[ Line: 34 ]]
        -- upvalues: v12 (copy), v10 (ref)
        v12(v10());
    end;
    return v7.createElement(l_ContactsList_0, v8.join(v11, {
        showToast = v14, 
        onClose = v19, 
        openProfilePeekView = v17, 
        openAmpUpsell = v22, 
        openLearnMoreLink = v23
    }));
end;