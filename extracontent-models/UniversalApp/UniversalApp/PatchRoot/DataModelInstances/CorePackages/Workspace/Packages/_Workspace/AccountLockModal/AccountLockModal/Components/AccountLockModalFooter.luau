local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountLockModal");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntAccountUnlockDelayMs);
local v4 = require(l_script_FirstAncestor_0.Contexts.AccountLockContext);
local l_AccountLockEventContextEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).AccountLockEventContextEnum;
local v6 = require(l_script_FirstAncestor_0.Common.AccountLockClientEvent);
local v7 = require(l_script_FirstAncestor_0.Utils.unlockAccount);
local v8 = require(l_script_FirstAncestor_0.Utils.useLogout);
local v9 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useState_0 = v9.useState;
local l_useCallback_0 = v9.useCallback;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v16 = require(l_Parent_0.Foundation);
local l_View_0 = v16.View;
local l_Button_0 = v16.Button;
local l_ButtonVariant_0 = v16.Enums.ButtonVariant;
local l_InputSize_0 = v16.Enums.InputSize;
local l_FillBehavior_0 = v16.Enums.FillBehavior;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return v9.memo(function(v25) --[[ Line: 40 ]] --[[ Name: AccountLockModalFooter ]]
    -- upvalues: v4 (copy), l_useDispatch_0 (copy), v8 (copy), l_useState_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppLogging_0 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v6 (copy), l_AccountLockEventContextEnum_0 (copy), v7 (copy), v3 (copy), l_AppPage_0 (copy), v2 (copy), l_dependencyArray_0 (copy), v9 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_FillBehavior_0 (copy)
    local v26 = v4.useAccountLockContext();
    local l_state_0 = v26.state;
    local l_reducer_0 = v26.reducer;
    local v29 = l_useDispatch_0();
    local v30 = v8(v25.Logout);
    local v31, v32 = l_useState_0(false);
    local v33, v34 = l_useState_0(false);
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    local v36 = l_useRoactService_0(l_AppLogging_0);
    local v37 = l_useLocalization_0({
        signOutButton = "Feature.AccountLock.Action.Signout", 
        continueButton = "Feature.AccountLock.Action.Continue"
    });
    local v41 = l_useCallback_0(function() --[[ Line: 59 ]]
        -- upvalues: v32 (copy), v36 (copy), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v7 (ref), v35 (copy), v3 (ref), v29 (copy), v25 (copy), l_AppPage_0 (ref), l_reducer_0 (copy), v2 (ref)
        v32(true);
        v36:logRobloxTelemetryEvent(v6, {}, {
            context = l_AccountLockEventContextEnum_0.Unlock
        });
        v7(v35):andThen(function(_) --[[ Line: 65 ]]
            -- upvalues: v36 (ref), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v3 (ref), v29 (ref), v25 (ref), v35 (ref), l_AppPage_0 (ref)
            task.spawn(function() --[[ Line: 66 ]]
                -- upvalues: v36 (ref), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v3 (ref), v29 (ref), v25 (ref), v35 (ref), l_AppPage_0 (ref)
                v36:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.Success
                });
                task.wait(v3() / 1000);
                v29(v25.ApiFetchAccessStatus(v35));
                v29(v25.ResetNavigationHistory({
                    {
                        name = l_AppPage_0.Home
                    }
                }));
                v29(v25.closeCentralOverlayThunk());
            end);
        end):catch(function(v39) --[[ Line: 83 ]]
            -- upvalues: v25 (ref), l_reducer_0 (ref), v2 (ref), v36 (ref), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v32 (ref)
            local v40 = v25.ChallengeError.matchRateLimited(v39);
            if v40 then
                l_reducer_0({
                    status = v2.AccountLockStatusEnum.RateLimited, 
                    retryTime = v40
                });
                v36:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.RateLimited
                });
            elseif v25.ChallengeError.matchAbandoned(v39) then
                v36:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.Abandoned
                });
            else
                l_reducer_0({
                    status = v2.AccountLockStatusEnum.Error
                });
                v36:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.Error
                });
            end;
            v32(false);
        end);
    end, l_dependencyArray_0(v35));
    local v42 = l_useCallback_0(function() --[[ Line: 104 ]]
        -- upvalues: v34 (copy), v36 (copy), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v30 (copy)
        v34(true);
        v36:logRobloxTelemetryEvent(v6, {}, {
            context = l_AccountLockEventContextEnum_0.Logout
        });
        v30();
    end, l_dependencyArray_0(v35));
    return v9.createElement(l_View_0, {
        tag = "row size-full-0 auto-y gap-small", 
        LayoutOrder = 3
    }, {
        LogoutButton = v9.createElement(l_Button_0, {
            text = v37.signOutButton, 
            onActivated = v42, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Medium, 
            fillBehavior = l_FillBehavior_0.Fill, 
            isLoading = v33, 
            LayoutOrder = 1
        }), 
        UnlockButton = v9.createElement(l_Button_0, {
            text = v37.continueButton, 
            onActivated = v41, 
            variant = l_ButtonVariant_0.Emphasis, 
            size = l_InputSize_0.Medium, 
            fillBehavior = l_FillBehavior_0.Fill, 
            isLoading = v31, 
            isDisabled = l_state_0.timeUntilRetry and l_state_0.timeUntilRetry > 0, 
            LayoutOrder = 2
        })
    });
end);