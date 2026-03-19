local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountLockModal");
local v1 = require(l_script_FirstAncestor_0.Components.AccountLockModalTitle);
local v2 = require(l_script_FirstAncestor_0.Components.AccountLockModalContent);
local v3 = require(l_script_FirstAncestor_0.Components.AccountLockModalFooter);
local v4 = require(l_script_FirstAncestor_0.Contexts.AccountLockContext);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.React);
local l_useEffect_0 = v6.useEffect;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local v10 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v10.Dialog;
local l_DialogSize_0 = v10.Enums.DialogSize;
local l_View_0 = v10.View;
return v6.memo(function(v14) --[[ Line: 29 ]] --[[ Name: AccountLockModal ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLogging_0 (copy), l_script_FirstAncestor_0 (copy), l_useEffect_0 (copy), v6 (copy), v4 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v1 (copy), l_View_0 (copy), v2 (copy), v3 (copy)
    local v15 = l_useRoactService_0(l_AppLogging_0);
    local v16 = require(l_script_FirstAncestor_0.Common.AccountLockClientEvent);
    local l_AccountLockEventContextEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).AccountLockEventContextEnum;
    l_useEffect_0(function() --[[ Line: 34 ]]
        -- upvalues: v15 (copy), v16 (copy), l_AccountLockEventContextEnum_0 (copy)
        v15:logRobloxTelemetryEvent(v16, {}, {
            context = l_AccountLockEventContextEnum_0.Init
        });
    end, nil);
    return v6.createElement(v4.Provider, {}, {
        children = v6.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Medium
        }, {
            DialogTitle = v6.createElement(v1, {}), 
            DialogContent = v6.createElement(l_Dialog_0.Content, nil, {
                DialogView = v6.createElement(l_View_0, {
                    tag = "col fill auto-xy items-start gap-medium"
                }, {
                    DialogContentText = v6.createElement(v2, {}), 
                    DialogFooter = v6.createElement(v3, {
                        Logout = v14.Logout, 
                        ResetNavigationHistory = v14.ResetNavigationHistory, 
                        ApiFetchAccessStatus = v14.ApiFetchAccessStatus, 
                        ChallengeError = v14.ChallengeError, 
                        closeCentralOverlayThunk = v14.closeCentralOverlayThunk
                    })
                })
            })
        })
    });
end);