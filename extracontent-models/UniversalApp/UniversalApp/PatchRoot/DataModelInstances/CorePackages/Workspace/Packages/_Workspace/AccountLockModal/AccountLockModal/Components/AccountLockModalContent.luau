local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountLockModal");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.Contexts.AccountLockContext);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Dialog_0 = require(l_Parent_0.Foundation).Dialog;
return v4.memo(function(_) --[[ Line: 16 ]] --[[ Name: AccountLockModalContent ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v1 (copy), v4 (copy), l_Dialog_0 (copy)
    local l_state_0 = v2.useAccountLockContext().state;
    local v9 = l_useLocalization_0({
        continueBtn = "Feature.AccountLock.Action.Continue"
    });
    local v10 = l_useLocalization_0({
        lockedDialog = "Feature.AccountLock.Content.LockedDialog", 
        errorDialog = {
            "Feature.AccountLock.Content.ErrorDialog"; 
            continue = "<b>" .. v9.continueBtn .. "</b>"
        }, 
        rateLimitedDialog = "Feature.AccountLock.Content.RateLimitDialog"
    });
    if l_state_0.status == v1.AccountLockStatusEnum.Locked then
        return v4.createElement(l_Dialog_0.Text, {
            Text = v10.lockedDialog, 
            LayoutOrder = 2
        });
    elseif l_state_0.status == v1.AccountLockStatusEnum.RateLimited then
        return v4.createElement(l_Dialog_0.Text, {
            Text = v10.rateLimitedDialog, 
            LayoutOrder = 2
        });
    else
        return v4.createElement(l_Dialog_0.Text, {
            Text = v10.errorDialog, 
            LayoutOrder = 2
        });
    end;
end);