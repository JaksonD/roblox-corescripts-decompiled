local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.PlayButtonStates);
local _ = require(l_Parent_0.PlayabilityRodux);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_LaunchErrorLocalizationKeys_0 = require(l_Parent_0.GameLaunch).LaunchErrorLocalizationKeys;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useGameInfosSelector_0 = require(l_Parent_0.GameInfosRodux).useGameInfosSelector;
local l_useGameProductInfoSelector_0 = require(l_Parent_0.GameProductInfoRodux).useGameProductInfoSelector;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_ExperienceDetailsNoticeType_0 = require(l_Parent_0.DiscoveryTypes).ExperienceDetailsNoticeType;
local l_FFlagLuaAppShowNoticeOnEdp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppShowNoticeOnEdp;
local l_FFlagLuaAppUnplayableDisplayText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnplayableDisplayText;
local v16 = game:DefineFastFlag("LuaAppEmptyUnplayableDisplayText", false);
local v17 = nil;
local v18 = "";
local function _(v19, v20) --[[ Line: 27 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), v17 (ref), l_Localization_0 (copy), v18 (ref)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if v17 == nil then
        v17 = l_Localization_0.new(l_RobloxLocaleId_0);
        v18 = l_RobloxLocaleId_0;
    end;
    if v18 ~= l_RobloxLocaleId_0 then
        v17:SetLocale(l_RobloxLocaleId_0);
        v18 = l_RobloxLocaleId_0;
    end;
    return v17:Format(v19, v20);
end;
local function v27(v23, v24, v25) --[[ Line: 40 ]]
    -- upvalues: l_PlayabilityStatusEnum_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LaunchErrorLocalizationKeys_0 (copy)
    if v24 then
        if v23 == nil or (v24.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired or v24.playabilityStatus == l_PlayabilityStatusEnum_0.FiatPurchaseRequired) and (v25 == nil or v25.isForSale == false) then
            return "Feature.ExperienceDetails.UnplayableError.UnplayableOther";
        else
            if v24.playabilityStatus == l_PlayabilityStatusEnum_0.DeviceRestricted then
                local v26 = l_getAppFeaturePolicies_0().getPlatformDisplayName() or "";
                if v26 ~= "" then
                    return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", {
                        device = v26
                    };
                end;
            end;
            return l_LaunchErrorLocalizationKeys_0[v24.playabilityStatus];
        end;
    else
        return nil;
    end;
end;
return function(v28, v29, v30) --[[ Line: 75 ]]
    -- upvalues: l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_useAppPolicy_0 (copy), l_FFlagLuaAppUnplayableDisplayText_0 (copy), l_useSelector_0 (copy), l_useGameInfosSelector_0 (copy), l_useGameProductInfoSelector_0 (copy), v3 (copy), v16 (copy), v27 (copy), l_ExperienceDetailsNoticeType_0 (copy), l_LocalizationService_0 (copy), v17 (ref), l_Localization_0 (copy), v18 (ref)
    local v31 = false;
    local v32 = nil;
    if l_FFlagLuaAppShowNoticeOnEdp_0 then
        v32 = l_useAppPolicy_0(function(v33) --[[ Line: 78 ]]
            return {
                experienceDetailsNoticeType = v33.getExperienceDetailsNoticeType()
            };
        end);
    end;
    local v34 = nil;
    if l_FFlagLuaAppUnplayableDisplayText_0 then
        v34 = l_useSelector_0(function(v35) --[[ Line: 87 ]]
            -- upvalues: v28 (copy)
            return v35.PlayabilityStatus and v35.PlayabilityStatus[v28] and v35.PlayabilityStatus[v28].unplayableDisplayText or nil;
        end);
    end;
    local v37 = l_useSelector_0(function(v36) --[[ Line: 95 ]]
        -- upvalues: v28 (copy)
        return v36.GameDetails[v28];
    end);
    local v38 = l_useGameInfosSelector_0(v28);
    local v39 = v37 and v37.rootPlaceId or v38 and v38.placeId or nil;
    local v40 = l_useGameProductInfoSelector_0(v28);
    local v41 = nil;
    local v42 = nil;
    if v29 == v3.UnplayableOther then
        if l_FFlagLuaAppUnplayableDisplayText_0 and v34 and (not v16 or v34 ~= "") then
            return v34;
        else
            local v43, v44 = v27(v39, v30, v40);
            v41 = v43;
            v42 = v44;
        end;
    elseif l_FFlagLuaAppShowNoticeOnEdp_0 and (v29 == v3.Playable or v29 == v3.PlayableWithParty or v29 == v3.WaitingForParty) and v32.experienceDetailsNoticeType == l_ExperienceDetailsNoticeType_0.InExperiencePurchase then
        v41 = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice";
    end;
    local v45;
    if v41 then
        local l_v41_0 = v41;
        local l_v42_0 = v42;
        local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
        if v17 == nil then
            v17 = l_Localization_0.new(l_RobloxLocaleId_1);
            v18 = l_RobloxLocaleId_1;
        end;
        if v18 ~= l_RobloxLocaleId_1 then
            v17:SetLocale(l_RobloxLocaleId_1);
            v18 = l_RobloxLocaleId_1;
        end;
        v45 = v17:Format(l_v41_0, l_v42_0);
        v31 = v45;
    end;
    if not v31 then
        v45 = nil;
    end;
    v31 = false;
    return v45;
end;