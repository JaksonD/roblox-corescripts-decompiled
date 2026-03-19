local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Result);
local l_FFlagEnableDeactivatedUserReactivation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDeactivatedUserReactivation;
local l_GetFFlagEnablePlatformEvidence_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePlatformEvidence;
local v7 = {
    new = function() --[[ Line: 70 ]] --[[ Name: new ]]
        return {};
    end
};
if l_GetFFlagEnablePlatformEvidence_0() then
    v7.validateJson = v2.interface({
        punishedUserId = v2.number, 
        messageToUser = v2.string, 
        punishmentTypeDescription = v2.string, 
        punishmentId = v2.number, 
        beginDate = v2.string, 
        endDate = v2.string, 
        badUtterances = v2.table, 
        verificationCategory = v2.string, 
        interventionId = v2.string, 
        isForeshadowingConsequenceEnabled = v2.optional(v2.boolean), 
        agreedCheckBoxExperimentVariant = v2.optional(v2.string), 
        context = v2.optional(v2.table), 
        violation = v2.optional(v2.table)
    });
else
    v7.validateJson = v2.interface({
        punishedUserId = v2.number, 
        messageToUser = v2.string, 
        punishmentTypeDescription = v2.string, 
        punishmentId = v2.number, 
        beginDate = v2.string, 
        endDate = v2.string, 
        badUtterances = v2.table, 
        verificationCategory = v2.string, 
        interventionId = v2.string, 
        isForeshadowingConsequenceEnabled = v2.optional(v2.boolean), 
        agreedCheckBoxExperimentVariant = v2.optional(v2.string), 
        context = v2.optional(v2.table)
    });
end;
if l_GetFFlagEnablePlatformEvidence_0() then
    v7.validateModel = v2.interface({
        punishedUserId = v2.number, 
        messageToUser = v2.string, 
        punishmentTypeDescription = v2.string, 
        punishmentId = v2.number, 
        beginDate = v2.string, 
        endDate = v2.string, 
        badUtterances = v2.table, 
        verificationCategory = v2.string, 
        interventionId = v2.string, 
        showAppealsProcessLink = v2.boolean, 
        consequenceTransparencyMessage = v2.string, 
        agreedCheckBoxExperimentVariant = v2.optional(v2.string), 
        selfServiceDeactivated = v2.optional(v2.boolean), 
        isForeshadowingConsequenceEnabled = v2.optional(v2.boolean), 
        nextConsequenceType = v2.optional(v2.string), 
        nextConsequenceDuration = v2.optional(v2.number), 
        violation = v2.optional(v2.interface({
            evidence = v2.optional(v2.interface({
                type = v2.string, 
                elements = v2.optional(v2.table), 
                elementsObj = v2.optional(v2.map(v2.string, v2.any)), 
                displayMeta = v2.optional(v2.interface({
                    lowercaseKey = v2.string, 
                    capitalizedKey = v2.string, 
                    icon = v2.string
                }))
            })), 
            abuseTypeTranslationKeys = v2.table, 
            uid = v2.string
        }))
    });
else
    v7.validateModel = v2.interface({
        punishedUserId = v2.number, 
        messageToUser = v2.string, 
        punishmentTypeDescription = v2.string, 
        punishmentId = v2.number, 
        beginDate = v2.string, 
        endDate = v2.string, 
        badUtterances = v2.table, 
        verificationCategory = v2.string, 
        interventionId = v2.string, 
        showAppealsProcessLink = v2.boolean, 
        consequenceTransparencyMessage = v2.string, 
        agreedCheckBoxExperimentVariant = v2.optional(v2.string), 
        selfServiceDeactivated = v2.optional(v2.boolean), 
        isForeshadowingConsequenceEnabled = v2.optional(v2.boolean), 
        nextConsequenceType = v2.optional(v2.string), 
        nextConsequenceDuration = v2.optional(v2.number)
    });
end;
v7.mock = function(v8) --[[ Line: 186 ]] --[[ Name: mock ]]
    -- upvalues: v7 (copy), v1 (copy)
    v8 = v8 or {};
    local v9 = v7.new();
    v9.punishedUserId = 1137965296;
    v9.messageToUser = "Mock Message";
    v9.punishmentTypeDescription = "Warn";
    v9.punishmentId = 2148187493;
    v9.beginDate = "2021-03-10T20:14:00.0000000Z";
    v9.endDate = "2021-03-10T20:22:00.0000000Z";
    v9.badUtterances = {
        {
            labelTranslationKey = "Label.AbuseType.Harassment", 
            utteranceText = "fvg behavior", 
            imageUrl = ""
        }
    };
    v9.verificationCategory = "Email";
    v9.interventionId = "aaaa1aa1-aaa1-111a-aa11-aa1aaaa1aa11";
    v9.agreedCheckBoxExperimentVariant = "control";
    v9.isForeshadowingConsequenceEnabled = false;
    v9.nextConsequenceType = "BAN";
    v9.nextConsequenceDuration = 1;
    return v1.Dictionary.join(v9, v8);
end;
v7.fromJsonData = function(v10) --[[ Line: 211 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v7 (copy), v4 (copy), l_GetFFlagEnablePlatformEvidence_0 (copy), l_FFlagEnableDeactivatedUserReactivation_0 (copy)
    if not v7.validateJson(v10) then
        return v4.error("ModerationDetail.fromJsonData expects a valid moderation JSON response");
    else
        local v11 = v7.new();
        v11.punishedUserId = v10.punishedUserId;
        v11.messageToUser = v10.messageToUser;
        v11.punishmentTypeDescription = v10.punishmentTypeDescription;
        v11.punishmentId = v10.punishmentId;
        v11.beginDate = v10.beginDate;
        v11.endDate = v10.endDate;
        v11.badUtterances = {};
        v11.verificationCategory = v10.verificationCategory;
        v11.interventionId = v10.interventionId;
        v11.consequenceTransparencyMessage = v10.consequenceTransparencyMessage;
        v11.showAppealsProcessLink = v10.showAppealsProcessLink;
        v11.agreedCheckBoxExperimentVariant = v10.agreedCheckBoxExperimentVariant;
        v11.isForeshadowingConsequenceEnabled = v10.isForeshadowingConsequenceEnabled;
        for _, v13 in pairs(v10.badUtterances) do
            local v14 = {
                labelTranslationKey = v13.labelTranslationKey, 
                utteranceText = v13.utteranceText, 
                imageUrl = v13.imageUrl
            };
            table.insert(v11.badUtterances, v14);
        end;
        if l_GetFFlagEnablePlatformEvidence_0() and v10.violation then
            local v15 = {};
            if v10.violation.evidence then
                v15.evidence = {
                    type = v10.violation.evidence.type, 
                    elements = v10.violation.evidence.elements, 
                    elementsObj = v10.violation.evidence.elementsObj, 
                    displayMeta = v10.violation.evidence.displayMeta
                };
            end;
            v15.abuseTypeTranslationKeys = v10.violation.abuseTypeTranslationKeys;
            v15.uid = v10.violation.uid;
            v11.violation = v15;
        end;
        if v10.context then
            for v16, v17 in pairs(v10.context) do
                if v16 == "SelfServiceDeactivated" and l_FFlagEnableDeactivatedUserReactivation_0 then
                    v11.selfServiceDeactivated = v17;
                elseif v16 == "NEXT_CONSEQUENCE_TYPE" then
                    v11.nextConsequenceType = v17;
                elseif v16 == "NEXT_CONSEQUENCE_DURATION" then
                    v11.nextConsequenceDuration = v17;
                end;
            end;
        end;
        return v4.success(v11);
    end;
end;
return v7;