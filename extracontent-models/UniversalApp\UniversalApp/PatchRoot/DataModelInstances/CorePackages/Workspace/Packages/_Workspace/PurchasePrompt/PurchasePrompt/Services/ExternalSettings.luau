local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_0.Flags.GetFFlagDisableRobuxUpsell);
local v5 = require(l_Parent_0.Flags.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt);
return {
    new = function() --[[ Line: 12 ]] --[[ Name: new ]]
        -- upvalues: l_UserInputService_0 (copy), l_RunService_0 (copy), l_GuiService_0 (copy), v4 (copy), v5 (copy)
        local v6 = {};
        setmetatable(v6, {
            __tostring = function() --[[ Line: 16 ]] --[[ Name: __tostring ]]
                return "Service(ExternalSettings)";
            end
        });
        v6.getPlatform = function() --[[ Line: 21 ]] --[[ Name: getPlatform ]]
            -- upvalues: l_UserInputService_0 (ref)
            return l_UserInputService_0:GetPlatform();
        end;
        v6.isStudio = function() --[[ Line: 25 ]] --[[ Name: isStudio ]]
            -- upvalues: l_RunService_0 (ref)
            return l_RunService_0:IsStudio();
        end;
        v6.isThirdPartyPurchaseAllowed = function() --[[ Line: 29 ]] --[[ Name: isThirdPartyPurchaseAllowed ]]
            local v7 = true;
            pcall(function() --[[ Line: 32 ]]
                -- upvalues: v7 (ref)
                v7 = game:GetService("PermissionsService"):GetIsThirdPartyPurchaseAllowed();
            end);
            return v7;
        end;
        v6.getLuaUseThirdPartyPermissions = function() --[[ Line: 38 ]] --[[ Name: getLuaUseThirdPartyPermissions ]]
            return true;
        end;
        v6.getFlagBypassThirdPartySettingForRobloxPurchase = function() --[[ Line: 42 ]] --[[ Name: getFlagBypassThirdPartySettingForRobloxPurchase ]]
            return true;
        end;
        v6.getFlagRestrictSales2 = function() --[[ Line: 47 ]] --[[ Name: getFlagRestrictSales2 ]]
            return settings():GetFFlag("RestrictSales2");
        end;
        v6.getFlagOrder66 = function() --[[ Line: 51 ]] --[[ Name: getFlagOrder66 ]]
            return settings():GetFFlag("Order66");
        end;
        v6.isTenFootInterface = function() --[[ Line: 55 ]] --[[ Name: isTenFootInterface ]]
            -- upvalues: l_GuiService_0 (ref)
            return l_GuiService_0:IsTenFootInterface();
        end;
        v6.getFFlagDisableRobuxUpsell = function() --[[ Line: 59 ]] --[[ Name: getFFlagDisableRobuxUpsell ]]
            -- upvalues: v4 (ref)
            return v4();
        end;
        v6.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt = function() --[[ Line: 63 ]] --[[ Name: GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt ]]
            -- upvalues: v5 (ref)
            return v5();
        end;
        return v6;
    end
};