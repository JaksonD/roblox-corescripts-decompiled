local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.AccountInfoReceived);
local v4 = require(l_script_FirstAncestor_0.Actions.BalanceInfoRecieved);
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(v5, v6) --[[ Line: 11 ]]
        local l_accountInfo_0 = v6.accountInfo;
        return {
            balance = v5.balance, 
            membershipType = l_accountInfo_0.isPremium and 4 or 0
        };
    end, 
    [v4.name] = function(v8, v9) --[[ Line: 23 ]]
        local l_balanceInfo_0 = v9.balanceInfo;
        return {
            balance = l_balanceInfo_0.robux, 
            hasFailed = l_balanceInfo_0.hasFailed, 
            membershipType = v8.membershipType
        };
    end
}));