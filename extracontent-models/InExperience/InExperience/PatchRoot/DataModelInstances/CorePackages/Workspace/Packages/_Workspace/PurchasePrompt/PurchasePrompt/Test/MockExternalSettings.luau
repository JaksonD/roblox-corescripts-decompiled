local _ = script.Parent.Parent;
local l_Parent_1 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_Cryo_0 = require(l_Parent_1.PurchasePromptDeps).Cryo;
local v3 = {
    RestrictSales2 = false, 
    Order66 = false
};
return {
    new = function(v4, v5, v6, v7) --[[ Line: 23 ]] --[[ Name: new ]]
        -- upvalues: l_Cryo_0 (copy), v3 (copy)
        local v8 = {};
        v6 = l_Cryo_0.Dictionary.join(v3, v6 or {});
        local function _(v9, v10) --[[ Line: 34 ]] --[[ Name: getMockFlag ]]
            if v9 ~= nil then
                return v9;
            else
                return v10;
            end;
        end;
        v8.getPlatform = function() --[[ Line: 41 ]] --[[ Name: getPlatform ]]
            -- upvalues: v7 (copy)
            return v7 or Enum.Platform.Windows;
        end;
        v8.isStudio = function() --[[ Line: 45 ]] --[[ Name: isStudio ]]
            -- upvalues: v4 (copy)
            return v4 or false;
        end;
        v8.isThirdPartyPurchaseAllowed = function() --[[ Line: 49 ]] --[[ Name: isThirdPartyPurchaseAllowed ]]
            -- upvalues: v6 (ref)
            return v6.PermissionsServiceIsThirdPartyPurchaseAllowed;
        end;
        v8.getLuaUseThirdPartyPermissions = function() --[[ Line: 53 ]] --[[ Name: getLuaUseThirdPartyPermissions ]]
            -- upvalues: v6 (ref)
            local l_LuaUseThirdPartyPermissions_0 = v6.LuaUseThirdPartyPermissions;
            if l_LuaUseThirdPartyPermissions_0 ~= nil then
                return l_LuaUseThirdPartyPermissions_0;
            else
                return true;
            end;
        end;
        v8.getFlagBypassThirdPartySettingForRobloxPurchase = function() --[[ Line: 57 ]] --[[ Name: getFlagBypassThirdPartySettingForRobloxPurchase ]]
            -- upvalues: v6 (ref)
            return v6.BypassThirdPartySettingForRobloxPurchase;
        end;
        v8.getFlagRestrictSales2 = function() --[[ Line: 62 ]] --[[ Name: getFlagRestrictSales2 ]]
            -- upvalues: v6 (ref)
            return v6.RestrictSales2;
        end;
        v8.getFlagOrder66 = function() --[[ Line: 66 ]] --[[ Name: getFlagOrder66 ]]
            -- upvalues: v6 (ref)
            return v6.Order66;
        end;
        v8.isTenFootInterface = function() --[[ Line: 70 ]] --[[ Name: isTenFootInterface ]]
            -- upvalues: v5 (copy)
            return v5;
        end;
        v8.getFFlagDisableRobuxUpsell = function() --[[ Line: 74 ]] --[[ Name: getFFlagDisableRobuxUpsell ]]
            -- upvalues: v6 (ref)
            return v6.DisableRobuxUpsell;
        end;
        v8.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt = function() --[[ Line: 78 ]] --[[ Name: GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt ]]
            -- upvalues: v6 (ref)
            return v6.EnableRestrictedAssetSaleLocationPurchasePrompt;
        end;
        return v8;
    end
};