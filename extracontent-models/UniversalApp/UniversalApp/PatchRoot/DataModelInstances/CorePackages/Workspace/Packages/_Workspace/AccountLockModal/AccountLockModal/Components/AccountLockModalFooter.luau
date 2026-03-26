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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_View_0 = v16.View;
local l_Button_0 = v16.Button;
local l_ButtonVariant_0 = v16.Enums.ButtonVariant;
local l_InputSize_0 = v16.Enums.InputSize;
local l_FillBehavior_0 = v16.Enums.FillBehavior;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return v9.memo(function(v26) --[[ Line: 42 ]] --[[ Name: AccountLockModalFooter ]]
    -- upvalues: v4 (copy), l_useDispatch_0 (copy), v8 (copy), l_useState_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppLogging_0 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v6 (copy), l_AccountLockEventContextEnum_0 (copy), v7 (copy), v3 (copy), l_AppPage_0 (copy), v2 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v9 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_FillBehavior_0 (copy)
    local v27 = v4.useAccountLockContext();
    local l_state_0 = v27.state;
    local l_reducer_0 = v27.reducer;
    local v30 = l_useDispatch_0();
    local v31 = v8(v26.Logout);
    local v32, v33 = l_useState_0(false);
    local v34, v35 = l_useState_0(false);
    local v36 = l_useRoactService_0(l_RoactNetworking_0);
    local v37 = l_useRoactService_0(l_AppLogging_0);
    local v38 = l_useLocalization_0({
        signOutButton = "Feature.AccountLock.Action.Signout", 
        continueButton = "Feature.AccountLock.Action.Continue"
    });
    local v42 = l_useCallback_0(function() --[[ Line: 61 ]]
        -- upvalues: v33 (copy), v37 (copy), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v7 (ref), v36 (copy), v3 (ref), v30 (copy), v26 (copy), l_AppPage_0 (ref), l_reducer_0 (copy), v2 (ref)
        v33(true);
        v37:logRobloxTelemetryEvent(v6, {}, {
            context = l_AccountLockEventContextEnum_0.Unlock
        });
        v7(v36):andThen(function(_) --[[ Line: 67 ]]
            -- upvalues: v37 (ref), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v3 (ref), v30 (ref), v26 (ref), v36 (ref), l_AppPage_0 (ref)
            task.spawn(function() --[[ Line: 68 ]]
                -- upvalues: v37 (ref), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v3 (ref), v30 (ref), v26 (ref), v36 (ref), l_AppPage_0 (ref)
                v37:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.Success
                });
                task.wait(v3() / 1000);
                v30(v26.ApiFetchAccessStatus(v36));
                v30(v26.ResetNavigationHistory({
                    {
                        name = l_AppPage_0.Home
                    }
                }));
                v30(v26.closeCentralOverlayThunk());
            end);
        end):catch(function(v40) --[[ Line: 85 ]]
            -- upvalues: v26 (ref), l_reducer_0 (ref), v2 (ref), v37 (ref), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v33 (ref)
            local v41 = v26.ChallengeError.matchRateLimited(v40);
            if v41 then
                l_reducer_0({
                    status = v2.AccountLockStatusEnum.RateLimited, 
                    retryTime = v41
                });
                v37:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.RateLimited
                });
            elseif v26.ChallengeError.matchAbandoned(v40) then
                v37:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.Abandoned
                });
            else
                l_reducer_0({
                    status = v2.AccountLockStatusEnum.Error
                });
                v37:logRobloxTelemetryEvent(v6, {}, {
                    context = l_AccountLockEventContextEnum_0.Error
                });
            end;
            v33(false);
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36
    } else l_dependencyArray_0(v36));
    local v43 = l_useCallback_0(function() --[[ Line: 106 ]]
        -- upvalues: v35 (copy), v37 (copy), v6 (ref), l_AccountLockEventContextEnum_0 (ref), v31 (copy)
        v35(true);
        v37:logRobloxTelemetryEvent(v6, {}, {
            context = l_AccountLockEventContextEnum_0.Logout
        });
        v31();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36
    } else l_dependencyArray_0(v36));
    return v9.createElement(l_View_0, {
        tag = "row gap-small size-full-0 auto-y", 
        LayoutOrder = 3
    }, {
        LogoutButton = v9.createElement(l_Button_0, {
            text = v38.signOutButton, 
            onActivated = v43, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Medium, 
            fillBehavior = l_FillBehavior_0.Fill, 
            isLoading = v34, 
            LayoutOrder = 1
        }), 
        UnlockButton = v9.createElement(l_Button_0, {
            text = v38.continueButton, 
            onActivated = v42, 
            variant = l_ButtonVariant_0.Emphasis, 
            size = l_InputSize_0.Medium, 
            fillBehavior = l_FillBehavior_0.Fill, 
            isLoading = v32, 
            isDisabled = l_state_0.timeUntilRetry and l_state_0.timeUntilRetry > 0, 
            LayoutOrder = 2
        })
    });
end);