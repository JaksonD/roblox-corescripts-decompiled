local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToFriendRequests);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenProfilePeekView);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateToUserInfo);
local v5 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local v6 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForPlayerContextualMenu);
local v7 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local l_OpenAmpWizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer;
return function(v9) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v4 (copy), v5 (copy), v7 (copy), l_OpenAmpWizardContainer_0 (copy)
    return {
        navigateDownToFriendRequests = function() --[[ Line: 16 ]] --[[ Name: navigateDownToFriendRequests ]]
            -- upvalues: v9 (copy), v2 (ref)
            v9(v2());
        end, 
        openProfilePeekView = function(v10, v11) --[[ Line: 19 ]] --[[ Name: openProfilePeekView ]]
            -- upvalues: v9 (copy), v3 (ref)
            assert(type(v10) == "string", "Expected userId to be a string");
            v9(v3(v10, v11));
        end, 
        openPlayerContextualMenu = function(v12) --[[ Line: 23 ]] --[[ Name: openPlayerContextualMenu ]]
            -- upvalues: v9 (copy), v6 (ref)
            v9(v6(v12));
        end, 
        navigateToUserInfo = function(v13, v14) --[[ Line: 26 ]] --[[ Name: navigateToUserInfo ]]
            -- upvalues: v9 (copy), v4 (ref)
            assert(type(v13) == "string", "Expected userId to be a string");
            v9(v4(v13, v14));
        end, 
        openLearnMoreLink = function() --[[ Line: 30 ]] --[[ Name: openLearnMoreLink ]]
            -- upvalues: v9 (copy), v5 (ref)
            v9(v5());
        end, 
        navigateTo3DQRCodePage = function(v15) --[[ Line: 33 ]] --[[ Name: navigateTo3DQRCodePage ]]
            -- upvalues: v9 (copy), v7 (ref)
            v9(v7(v15));
        end, 
        openAmpWizardContainer = function(v16, v17) --[[ Line: 36 ]] --[[ Name: openAmpWizardContainer ]]
            -- upvalues: v9 (copy), l_OpenAmpWizardContainer_0 (ref)
            v9(l_OpenAmpWizardContainer_0(v16, v17));
        end
    };
end;