local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local v5 = {
    [v4.DisabledReasons.BannedFromCommunity] = v3.BannedFromGroup, 
    [v4.DisabledReasons.CommunityIsClosed] = v3.GroupClosed, 
    [v4.DisabledReasons.MaxCommunitiesJoined] = v3.PremiumMaxGroups, 
    [v4.DisabledReasons.AccountCreatedLessThanOneDay] = v3.RequiresAccountTenureTooltipOneDay, 
    [v4.DisabledReasons.AccountCreatedLessThanThreeDays] = v3.RequiresAccountTenureTooltipThreeDays, 
    [v4.DisabledReasons.AccountCreatedLessThanOneWeek] = v3.RequiresAccountTenureTooltipOneWeek, 
    [v4.DisabledReasons.AccountCreatedLessThanOneMonth] = v3.RequiresAccountTenureTooltipOneMonth, 
    [v4.DisabledReasons.AccountCreatedLessThanThreeMonths] = v3.RequiresAccountTenureTooltipThreeMonths, 
    [v4.DisabledReasons.InsufficientVerificationLevelHigh] = nil, 
    [v4.DisabledReasons.InsufficientVerificationLevelMedium] = nil, 
    [v4.DisabledReasons.InsufficientVerificationLevelLow] = nil
};
return function(v6) --[[ Line: 24 ]]
    -- upvalues: v5 (copy), l_useLocalization_0 (copy)
    local v7 = if v6 then v5[v6] else nil;
    return l_useLocalization_0({
        disabledReasonText = v7
    }).disabledReasonText;
end;