local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountLockModal");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.Contexts.AccountLockContext);
local v4 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Dialog_0 = require(l_Parent_0.Foundation).Dialog;
return v4.memo(function(_) --[[ Line: 15 ]] --[[ Name: AccountLockModalTitle ]]
    -- upvalues: v3 (copy), l_useLocalization_0 (copy), v2 (copy), v4 (copy), l_Dialog_0 (copy)
    local l_state_0 = v3.useAccountLockContext().state;
    local l_status_0 = l_state_0.status;
    local l_timeUntilRetry_0 = l_state_0.timeUntilRetry;
    local v11 = l_timeUntilRetry_0 and string.format("%02d", (math.floor(l_timeUntilRetry_0 / 3600))) or "";
    local v12 = l_timeUntilRetry_0 and string.format("%02d", (math.floor(l_timeUntilRetry_0 % 3600 / 60))) or "";
    local v13 = l_useLocalization_0({
        accountLocked = "Feature.AccountLock.Title.AccountLocked", 
        tryAgain = "Feature.AccountLock.Title.TryAgain", 
        rateLimit = {
            "Feature.AccountLock.Title.RateLimit"; 
            hh = v11, 
            mm = v12
        }
    });
    if l_status_0 == v2.AccountLockStatusEnum.Locked then
        return v4.createElement(l_Dialog_0.Title, {
            text = v13.accountLocked, 
            LayoutOrder = 1
        });
    elseif l_status_0 == v2.AccountLockStatusEnum.RateLimited then
        return v4.createElement(l_Dialog_0.Title, {
            text = v13.rateLimit, 
            LayoutOrder = 1
        });
    else
        return v4.createElement(l_Dialog_0.Title, {
            text = v13.tryAgain, 
            LayoutOrder = 1
        });
    end;
end);