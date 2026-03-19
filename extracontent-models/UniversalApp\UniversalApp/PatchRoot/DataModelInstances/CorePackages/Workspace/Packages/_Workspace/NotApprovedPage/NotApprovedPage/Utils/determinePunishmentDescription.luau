local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local l_INTERVENTION_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.INTERVENTION_TYPES;
return function(v5, v6, v7) --[[ Line: 23 ]] --[[ Name: determinePunishmentDescription ]]
    -- upvalues: l_INTERVENTION_TYPES_0 (copy), v3 (copy)
    if v6 == l_INTERVENTION_TYPES_0.Deleted then
        return v3:Format("Feature.NotApproved.Description.BrokeRulesBanned");
    elseif #v7 > 0 then
        if v5 and v5 ~= "" then
            return v3:Format("Feature.NotApproved.Description.BrokeRulesTypePolicy.V2", {
                type = v5, 
                policy = string.lower(table.concat(v7, ", "))
            });
        else
            return v3:Format("Feature.NotApproved.Description.BrokeRulesPolicy.V2", {
                policy = string.lower(table.concat(v7, ", "))
            });
        end;
    elseif v5 and v5 ~= "" then
        return v3:Format("Feature.NotApproved.Description.BrokeRulesType", {
            type = v5
        });
    else
        return v3:Format("Feature.NotApproved.Description.BrokeRulesGeneric");
    end;
end;