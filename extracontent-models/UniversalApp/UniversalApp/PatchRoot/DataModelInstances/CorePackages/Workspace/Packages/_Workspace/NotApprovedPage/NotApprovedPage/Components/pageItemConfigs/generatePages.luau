local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Constants_0 = require(l_script_FirstAncestor_0.Parent.NotApprovedPageState).Constants;
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v6 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_EDUCATIONAL_PAGE_PREFIXES_0 = v6.EDUCATIONAL_PAGE_PREFIXES;
local l_STATIC_PAGE_NAMES_0 = v6.STATIC_PAGE_NAMES;
local v9 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.policyEducationConfigs.policyEducationContentRegistry);
local v10 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.policyEducationConfigs.createPolicyEducationConfig);
local v11 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.BadUtterancesConfig);
local v12 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.ChargebackStepsConfig);
local v13 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.PreventionStepsConfig);
local v14 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.PunishmentDescriptionConfig);
local v15 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.RecentActivityConfig);
local v16 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.ReportMistakeConfig);
local v17 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.secondChanceConfigs.SecondChanceConclusionConfig);
local v18 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.secondChanceConfigs.SecondChanceIntroConfig);
local v19 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.SimpleModeratorNoteConfig);
local v20 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.ViolationEvidenceConfig);
local v21 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.WhatHappenedConfig);
local v22 = require(l_script_FirstAncestor_0.Components.cta.ContinueButtonCta);
local v23 = require(l_script_FirstAncestor_0.Components.cta.DeleteCta);
local v24 = require(l_script_FirstAncestor_0.Components.cta.ProceedActionsCta);
local v25 = require(l_script_FirstAncestor_0.Components.cta.SecondChanceActionsCta);
local v26 = require(l_script_FirstAncestor_0.Components.cta.UnderstandRuleContinueCta);
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
local function v28() --[[ Line: 48 ]] --[[ Name: getReviewedEvidencePageItemConfigs ]]
    -- upvalues: v20 (copy), v11 (copy), v19 (copy)
    return {
        v20, 
        v11, 
        v19
    };
end;
local function v38(_, v30, v31) --[[ Line: 61 ]] --[[ Name: getEducationalPages ]]
    -- upvalues: v27 (copy), v9 (copy), l_EDUCATIONAL_PAGE_PREFIXES_0 (copy), v10 (copy), v26 (copy), v22 (copy), v2 (copy)
    local v32 = {};
    if not v27 then
        return {
            educationalPages = v32, 
            unmappedViolationKeys = {}
        };
    else
        local v33 = {};
        local v34 = {};
        for _, v36 in ipairs(v30) do
            local v37 = v9[v36];
            if not v37 then
                v34[v36] = true;
            elseif not v33[v37.policyKey] then
                v33[v37.policyKey] = true;
                table.insert(v32, {
                    pageName = ("%*%*"):format(l_EDUCATIONAL_PAGE_PREFIXES_0.Rule, v37.policyKey), 
                    pageItems = {
                        v10({
                            title = v37.ruleTitle, 
                            subtitle = v37.ruleSubtitle, 
                            description = v37.ruleDescription, 
                            descriptionBullets = v37.ruleDescriptionBullets, 
                            policyKey = v37.policyKey
                        })
                    }, 
                    CtaComponent = if v31 then v26 else v22
                });
                table.insert(v32, {
                    pageName = ("%*%*"):format(l_EDUCATIONAL_PAGE_PREFIXES_0.Importance, v37.policyKey), 
                    pageItems = {
                        v10({
                            title = v37.importanceTitle, 
                            description = v37.importanceDescription, 
                            policyKey = v37.policyKey
                        })
                    }, 
                    CtaComponent = if v31 then v26 else v22
                });
            end;
        end;
        return {
            educationalPages = v32, 
            unmappedViolationKeys = v2.Dictionary.keys(v34)
        };
    end;
end;
return {
    generatePages = function(v39, v40, v41) --[[ Line: 149 ]] --[[ Name: generatePages ]]
        -- upvalues: l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), l_INTERVENTION_TYPES_0 (copy), l_STATIC_PAGE_NAMES_0 (copy), v14 (copy), v21 (copy), v15 (copy), v23 (copy), v22 (copy), v27 (copy), v18 (copy), v16 (copy), v38 (copy), v13 (copy), v12 (copy), v26 (copy), v24 (copy), v17 (copy), v25 (copy)
        local v42 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[v39.punishmentTypeDescription];
        local v43 = {};
        local v44 = v42 == l_INTERVENTION_TYPES_0.Deleted;
        local v45 = if v41 then v41.educational_pass_eligible else false;
        table.insert(v43, {
            pageName = l_STATIC_PAGE_NAMES_0.Intro, 
            pageItems = {
                v14, 
                v21, 
                v15
            }, 
            CtaComponent = if v44 then v23 else v22
        });
        if v44 then
            return {
                pages = v43, 
                unmappedViolationKeys = {}
            };
        else
            if v27 and v45 then
                table.insert(v43, {
                    pageName = l_STATIC_PAGE_NAMES_0.SecondChanceIntro, 
                    pageItems = {
                        v18, 
                        v16
                    }, 
                    CtaComponent = v22
                });
            end;
            local v46 = v38(v39, v40, v45);
            for _, v48 in v46.educationalPages do
                table.insert(v43, v48);
            end;
            table.insert(v43, {
                pageName = l_STATIC_PAGE_NAMES_0.Resolution, 
                pageItems = {
                    v13, 
                    v12, 
                    v16
                }, 
                CtaComponent = if v27 and v45 then v26 else v24
            });
            if v27 and v45 then
                table.insert(v43, {
                    pageName = l_STATIC_PAGE_NAMES_0.SecondChanceConclusion, 
                    pageItems = {
                        v17
                    }, 
                    CtaComponent = v25
                });
            end;
            return {
                pages = v43, 
                unmappedViolationKeys = v46.unmappedViolationKeys
            };
        end;
    end, 
    getReviewedEvidencePageItemConfigs = v28
};