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
local v11 = v5.createContext({});
return {
    NotApprovedPageProvider = function(v12) --[[ Line: 53 ]] --[[ Name: NotApprovedPageProvider ]]
        -- upvalues: v10 (copy), l_useMemo_0 (copy), v8 (copy), v9 (copy), l_dependencyArray_0 (copy), v5 (copy), v11 (copy)
        local l_translations_0 = v12.translations;
        local l_badUtterances_0 = v12.moderationDetail.badUtterances;
        local l_violation_0 = v12.moderationDetail.violation;
        local v16 = if v10 then v12.commutationEligibility else nil;
        local v22 = l_useMemo_0(function() --[[ Line: 59 ]]
            -- upvalues: l_violation_0 (copy), v8 (ref), v9 (ref), l_translations_0 (copy), l_badUtterances_0 (copy), v10 (ref), v16 (copy)
            local v17 = {};
            local v18 = {};
            if l_violation_0 and v8.isVisibleInView(l_violation_0) then
                v17 = v9(l_violation_0.abuseTypeTranslationKeys, l_translations_0);
                v18 = v9(l_violation_0.abuseTypeTranslationKeys, nil);
            elseif l_badUtterances_0 then
                local v19 = {};
                for _, v21 in l_badUtterances_0 do
                    table.insert(v19, v21.labelTranslationKey);
                end;
                v17 = v9(v19, l_translations_0);
                v18 = v9(v19, nil);
            end;
            if v10 then
                return {
                    translations = l_translations_0, 
                    violationReasons = {
                        translatedReasons = v17, 
                        untranslatedReasons = v18
                    }, 
                    commutationEligibility = v16
                };
            else
                return {
                    translations = l_translations_0, 
                    violationReasons = {
                        translatedReasons = v17, 
                        untranslatedReasons = v18
                    }
                };
            end;
        end, l_dependencyArray_0(l_badUtterances_0, l_violation_0, l_translations_0, v16));
        return v5.createElement(v11.Provider, {
            value = v22
        }, v12.children);
    end, 
    useNotApprovedPageContext = function() --[[ Line: 101 ]] --[[ Name: useNotApprovedPageContext ]]
        -- upvalues: l_useContext_0 (copy), v11 (copy), v3 (copy), v10 (copy)
        local v23 = l_useContext_0(v11);
        v3.assert(v23 and v23.translations, "useNotApprovedPageContext returned invalid context, usually this means the NotApprovedPageProvider is not present in the tree");
        if v10 then
            return {
                translations = v23.translations, 
                violationReasons = v23.violationReasons, 
                commutationEligibility = v23.commutationEligibility
            };
        else
            return {
                translations = v23.translations, 
                violationReasons = v23.violationReasons
            };
        end;
    end
};