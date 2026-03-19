local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Parent_0.Utils.getPaymentPlatform);
local v8 = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local v9 = require(l_Parent_0.Flags.GetFFlagUsePlatformNameForUnknown);
local v10 = require(l_Parent_0.Flags.GetFFlagEnableQuestIAPAnalytics);
return {
    new = function() --[[ Line: 18 ]] --[[ Name: new ]]
        -- upvalues: l_UserInputService_0 (copy), v9 (copy), l_HttpService_0 (copy), v10 (copy), v8 (copy), l_RunService_0 (copy), l_RbxAnalyticsService_0 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy)
        local v11 = {};
        setmetatable(v11, {
            __tostring = function() --[[ Line: 22 ]] --[[ Name: __tostring ]]
                return "Service(Analytics)";
            end
        });
        local function v15() --[[ Line: 27 ]] --[[ Name: GetPlatformString ]]
            -- upvalues: l_UserInputService_0 (ref), v9 (ref), l_HttpService_0 (ref), v10 (ref), v8 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v13 = "UNKNOWN";
            if v9() then
                v13 = tostring(l_l_UserInputService_0_Platform_0);
            end;
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
                v13 = "Windows";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                v13 = "OSX";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
                v13 = "IOS";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
                local l_l_HttpService_0_UserAgent_0 = l_HttpService_0:GetUserAgent();
                v13 = string.find(l_l_HttpService_0_UserAgent_0, "AmazonAppStore") and "Amazon" or "Android";
                if v10() and string.find(l_l_HttpService_0_UserAgent_0, "OculusQuest3Store") then
                    v13 = "Quest";
                end;
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
                v13 = "XBoxOne";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                v13 = "UWP";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 then
                v13 = "PlayStation";
            end;
            if v8() then
                v13 = v13 + "-Luobu";
            end;
            return v13;
        end;
        local function _(v16) --[[ Line: 65 ]] --[[ Name: ReportPlatformCounter ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter(v16 .. v15());
                return;
            end;
        end;
        v11.sendCounter = function(v18) --[[ Line: 72 ]] --[[ Name: sendCounter ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref)
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter(v18);
                return;
            end;
        end;
        local function _(v19, v20) --[[ Line: 79 ]] --[[ Name: ReportEvent ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref)
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", v19, v20 or {});
                return;
            end;
        end;
        v11.signalEvent = function(v22, v23) --[[ Line: 86 ]] --[[ Name: signalEvent ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref)
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", v22, v23 or {});
                return;
            end;
        end;
        v11.reportRobuxUpsellStarted = function() --[[ Line: 90 ]] --[[ Name: reportRobuxUpsellStarted ]]
            -- upvalues: l_MarketplaceService_0 (ref)
            return l_MarketplaceService_0:ReportRobuxUpsellStarted();
        end;
        v11.signalPurchaseSuccess = function(v24, v25, v26, v27) --[[ Line: 94 ]] --[[ Name: signalPurchaseSuccess ]]
            -- upvalues: l_MarketplaceService_0 (ref), l_Players_0 (ref)
            if v25 == Enum.InfoType.Product then
                l_MarketplaceService_0:SignalClientPurchaseSuccess(v27.receipt, l_Players_0.LocalPlayer.UserId, v24);
                return;
            else
                l_MarketplaceService_0:ReportAssetSale(v24, v26);
                return;
            end;
        end;
        v11.signalPremiumUpsellShownPremium = function() --[[ Line: 102 ]] --[[ Name: signalPremiumUpsellShownPremium ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_RunService_0 (ref), v15 (copy)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownPremium", {
                gameID = game.GameId
            });
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellShownPremium" .. v15());
                return;
            end;
        end;
        v11.signalPremiumUpsellShownNonPremium = function() --[[ Line: 107 ]] --[[ Name: signalPremiumUpsellShownNonPremium ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_RunService_0 (ref), v15 (copy)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownNonPremium", {
                gameID = game.GameId
            });
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellShownNonPremium" .. v15());
                return;
            end;
        end;
        v11.signalPremiumUpsellConfirmed = function() --[[ Line: 112 ]] --[[ Name: signalPremiumUpsellConfirmed ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_RunService_0 (ref), v15 (copy)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellConfirmed", {
                gameID = game.GameId
            });
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellConfirmed" .. v15());
                return;
            end;
        end;
        v11.signalPremiumUpsellPrecheckFail = function() --[[ Line: 117 ]] --[[ Name: signalPremiumUpsellPrecheckFail ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_RunService_0 (ref), v15 (copy)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellPrecheckFail", {
                gameID = game.GameId
            });
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellPrecheckFail" .. v15());
                return;
            end;
        end;
        v11.signalPremiumUpsellInvalidProducts = function() --[[ Line: 122 ]] --[[ Name: signalPremiumUpsellInvalidProducts ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_RunService_0 (ref), v15 (copy)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidProducts", {
                gameID = game.GameId
            });
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellInvalidProducts" .. v15());
                return;
            end;
        end;
        v11.signalPremiumUpsellInvalidPlatform = function() --[[ Line: 127 ]] --[[ Name: signalPremiumUpsellInvalidPlatform ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_RunService_0 (ref), v15 (copy)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidPlatform", {
                gameID = game.GameId
            });
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellInvalidPlatform" .. v15());
                return;
            end;
        end;
        v11.signalAdultLegalTextShown = function() --[[ Line: 132 ]] --[[ Name: signalAdultLegalTextShown ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "AdultLegalTextShown", {
                gameID = game.GameId
            });
        end;
        v11.signalFailedPurchasePostUpsell = function() --[[ Line: 136 ]] --[[ Name: signalFailedPurchasePostUpsell ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("FailedBalanceCheckPostUpsell" .. v15());
                return;
            end;
        end;
        v11.signalProductPurchaseShown = function(v28, v29) --[[ Line: 140 ]] --[[ Name: signalProductPurchaseShown ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v30 = {
                gameID = game.GameId, 
                productId = v28, 
                requestType = tostring(v29)
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseShown", v30 or {});
            end;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseShown" .. v15());
                return;
            end;
        end;
        v11.signalProductPurchaseUpsellShown = function(v31, v32, v33) --[[ Line: 149 ]] --[[ Name: signalProductPurchaseUpsellShown ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v34 = {
                gameID = game.GameId, 
                productId = v31, 
                requestType = tostring(v32), 
                iapProductId = v33
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellShown", v34 or {});
            end;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseUpsellShown" .. v15());
                return;
            end;
        end;
        v11.signalProductPurchaseConfirmed = function(v35, v36) --[[ Line: 159 ]] --[[ Name: signalProductPurchaseConfirmed ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v37 = {
                gameID = game.GameId, 
                productId = v35, 
                requestType = tostring(v36)
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseConfirmed", v37 or {});
            end;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseConfirmed" .. v15());
                return;
            end;
        end;
        v11.signalProductPurchaseUpsellConfirmed = function(v38, v39, v40) --[[ Line: 168 ]] --[[ Name: signalProductPurchaseUpsellConfirmed ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v41 = {
                gameID = game.GameId, 
                productId = v38, 
                requestType = tostring(v39), 
                iapProductId = v40
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellConfirmed", v41 or {});
            end;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseUpsellConfirmed" .. v15());
                return;
            end;
        end;
        v11.signalScaryModalShown = function(v42, v43, v44) --[[ Line: 178 ]] --[[ Name: signalScaryModalShown ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v45 = {
                gameID = game.GameId, 
                productId = v42, 
                requestType = v43, 
                iapProductId = v44 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ScaryModalShown", v45 or {});
            end;
            v45 = "ScaryModalShown" .. v43;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter(v45 .. v15());
                return;
            end;
        end;
        v11.signalScaryModalConfirmed = function(v46, v47, v48) --[[ Line: 188 ]] --[[ Name: signalScaryModalConfirmed ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v49 = {
                gameID = game.GameId, 
                productId = v46, 
                requestType = v47, 
                iapProductId = v48 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ScaryModalConfirmed", v49 or {});
            end;
            v49 = "ScaryModalConfirmed" .. v47;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter(v49 .. v15());
                return;
            end;
        end;
        v11.signalScaryModalCanceled = function(v50, v51, v52) --[[ Line: 198 ]] --[[ Name: signalScaryModalCanceled ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v53 = {
                gameID = game.GameId, 
                productId = v50, 
                requestType = v51, 
                iapProductId = v52 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ScaryModalCanceled", v53 or {});
            end;
            v53 = "ScaryModalCanceled" .. v51;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter(v53 .. v15());
                return;
            end;
        end;
        v11.signalXboxInGamePurchaseCanceled = function(v54, v55, v56) --[[ Line: 208 ]] --[[ Name: signalXboxInGamePurchaseCanceled ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref)
            local v57 = {
                gameID = game.GameId, 
                productId = v54, 
                requestType = v55, 
                iapProductId = v56 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseCanceled", v57 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("XboxPaymentsInGamePurchaseCanceled");
            end;
        end;
        v11.signalXboxInGamePurchaseSuccess = function(v58, v59, v60) --[[ Line: 220 ]] --[[ Name: signalXboxInGamePurchaseSuccess ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref)
            local v61 = {
                gameID = game.GameId, 
                productId = v58, 
                requestType = v59, 
                iapProductId = v60 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseSuccess", v61 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("XboxPaymentsInGamePurchaseSuccess");
            end;
        end;
        v11.signalXboxInGamePurchaseFailure = function(v62, v63, v64) --[[ Line: 232 ]] --[[ Name: signalXboxInGamePurchaseFailure ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref)
            local v65 = {
                gameID = game.GameId, 
                productId = v62, 
                requestType = v63, 
                iapProductId = v64 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseFailure", v65 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("XboxPaymentsInGamePurchaseFailure");
            end;
        end;
        v11.signalTwoSVSettingsErrorShown = function(v66, v67) --[[ Line: 244 ]] --[[ Name: signalTwoSVSettingsErrorShown ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v68 = {
                gameID = game.GameId, 
                productId = v66, 
                requestType = v67
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorShown", v68 or {});
            end;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("2SVSettingsErrorShown" .. v15());
                return;
            end;
        end;
        v11.signalTwoSVSettingsErrorConfirmed = function(v69, v70) --[[ Line: 253 ]] --[[ Name: signalTwoSVSettingsErrorConfirmed ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v71 = {
                gameID = game.GameId, 
                productId = v69, 
                requestType = v70
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorConfirmed", v71 or {});
            end;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("2SVSettingsErrorConfirmed" .. v15());
                return;
            end;
        end;
        v11.signalRobuxUpsellInGameIXP = function(v72) --[[ Line: 262 ]] --[[ Name: signalRobuxUpsellInGameIXP ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v73 = {};
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "RobuxUpsellInGameIXP", v73 or {});
            end;
            if v72 then
                if l_RunService_0:IsStudio() then
                    return;
                else
                    l_RbxAnalyticsService_0:ReportCounter("RobuxUpsellInGameIXP" .. v15());
                end;
            end;
        end;
        v11.signalAvatarCreationPurchaseSubmit = function() --[[ Line: 269 ]] --[[ Name: signalAvatarCreationPurchaseSubmit ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_RunService_0 (ref), v15 (copy)
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "AvatarCreationPurchaseSubmit", {
                gameID = game.GameId
            });
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("AvatarCreationPurchaseSubmit" .. v15());
                return;
            end;
        end;
        v11.signalUserSettingEligibilityModal = function(v74) --[[ Line: 274 ]] --[[ Name: signalUserSettingEligibilityModal ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v15 (copy)
            local v75 = {
                gameID = game.GameId, 
                requestType = v74
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "UserSettingEligibilityModalShown", v75 or {});
            end;
            v75 = "UserSettingEligibilityModalShown" .. v74;
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter(v75 .. v15());
                return;
            end;
        end;
        v11.signalEconomicRestrictionError = function(v76, v77) --[[ Line: 282 ]] --[[ Name: signalEconomicRestrictionError ]]
            -- upvalues: l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref)
            local v78 = {
                gameID = game.GameId, 
                violationType = v76, 
                timeoutMinutes = v77
            };
            if l_RunService_0:IsStudio() then
                return;
            else
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "EconomicRestrictionErrorShown", v78 or {});
                return;
            end;
        end;
        return v11;
    end
};