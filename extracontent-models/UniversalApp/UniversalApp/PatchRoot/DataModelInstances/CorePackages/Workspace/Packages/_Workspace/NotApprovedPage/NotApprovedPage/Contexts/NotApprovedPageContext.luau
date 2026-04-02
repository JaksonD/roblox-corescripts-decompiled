local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ArgCheck);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v5 = require(l_Parent_0.React);
local l_useMemo_0 = v5.useMemo;
local l_useContext_0 = v5.useContext;
local v8 = require(l_script_FirstAncestor_0.Utils.platformEvidence);
local v9 = require(l_script_FirstAncestor_0.Utils.collectUniqueTranslations);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v12 = v5.createContext({});
return {
    NotApprovedPageProvider = function(v13) --[[ Line: 55 ]] --[[ Name: NotApprovedPageProvider ]]
        -- upvalues: v10 (copy), l_useMemo_0 (copy), v8 (copy), v9 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v5 (copy), v12 (copy)
        local l_translations_0 = v13.translations;
        local l_badUtterances_0 = v13.moderationDetail.badUtterances;
        local l_violation_0 = v13.moderationDetail.violation;
        local v17 = if v10 then v13.commutationEligibility else nil;
        local v23 = l_useMemo_0(function() --[[ Line: 62 ]]
            -- upvalues: l_violation_0 (copy), v8 (ref), v9 (ref), l_translations_0 (copy), l_badUtterances_0 (copy), v10 (ref), v17 (copy)
            local v18 = {};
            local v19 = {};
            if l_violation_0 and v8.isVisibleInView(l_violation_0) then
                v18 = v9(l_violation_0.abuseTypeTranslationKeys, l_translations_0);
                v19 = v9(l_violation_0.abuseTypeTranslationKeys, nil);
            elseif l_badUtterances_0 then
                local v20 = {};
                for _, v22 in l_badUtterances_0 do
                    table.insert(v20, v22.labelTranslationKey);
                end;
                v18 = v9(v20, l_translations_0);
                v19 = v9(v20, nil);
            end;
            if v10 then
                return {
                    translations = l_translations_0, 
                    violationReasons = {
                        translatedReasons = v18, 
                        untranslatedReasons = v19
                    }, 
                    commutationEligibility = v17
                };
            else
                return {
                    translations = l_translations_0, 
                    violationReasons = {
                        translatedReasons = v18, 
                        untranslatedReasons = v19
                    }
                };
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            l_badUtterances_0, 
            l_violation_0, 
            l_translations_0, 
            v17
        } else l_dependencyArray_0(l_badUtterances_0, l_violation_0, l_translations_0, v17));
        return v5.createElement(v12.Provider, {
            value = v23
        }, v13.children);
    end, 
    useNotApprovedPageContext = function() --[[ Line: 108 ]] --[[ Name: useNotApprovedPageContext ]]
        -- upvalues: l_useContext_0 (copy), v12 (copy), v3 (copy), v10 (copy)
        local v24 = l_useContext_0(v12);
        v3.assert(v24 and v24.translations, "useNotApprovedPageContext returned invalid context, usually this means the NotApprovedPageProvider is not present in the tree");
        if v10 then
            return {
                translations = v24.translations, 
                violationReasons = v24.violationReasons, 
                commutationEligibility = v24.commutationEligibility
            };
        else
            return {
                translations = v24.translations, 
                violationReasons = v24.violationReasons
            };
        end;
    end
};