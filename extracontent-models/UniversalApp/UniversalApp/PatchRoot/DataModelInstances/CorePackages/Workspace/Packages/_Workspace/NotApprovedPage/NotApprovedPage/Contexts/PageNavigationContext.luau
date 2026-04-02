local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_STATIC_PAGE_NAMES_0 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils).STATIC_PAGE_NAMES;
local l_generatePages_0 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.generatePages).generatePages;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v5 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.policyEducationConfigs.policyEducationContentRegistry);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.ArgCheck);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v9 = require(l_Parent_0.React);
local l_useMemo_0 = v9.useMemo;
local l_useState_0 = v9.useState;
local l_useCallback_0 = v9.useCallback;
local l_useContext_0 = v9.useContext;
local l_createContext_0 = v9.createContext;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapReactivationNotice);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v18 = l_createContext_0({});
return {
    PageNavigationProvider = function(v19) --[[ Line: 88 ]] --[[ Name: PageNavigationProvider ]]
        -- upvalues: l_useState_0 (copy), l_useNotApprovedPageContext_0 (copy), l_useMemo_0 (copy), l_generatePages_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_STATIC_PAGE_NAMES_0 (copy), l_useCallback_0 (copy), v16 (copy), v15 (copy), v5 (copy), v9 (copy), v18 (copy)
        local v20, v21 = l_useState_0(1);
        local v22, v23 = l_useState_0(false);
        local l_untranslatedReasons_0 = l_useNotApprovedPageContext_0().violationReasons.untranslatedReasons;
        local l_commutationEligibility_0 = l_useNotApprovedPageContext_0().commutationEligibility;
        local v26 = l_useMemo_0(function() --[[ Line: 96 ]]
            -- upvalues: l_generatePages_0 (ref), v19 (copy), l_untranslatedReasons_0 (copy), l_commutationEligibility_0 (copy)
            return l_generatePages_0(v19.moderationDetail, l_untranslatedReasons_0, l_commutationEligibility_0);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v19.moderationDetail, 
            l_untranslatedReasons_0, 
            l_commutationEligibility_0
        } else l_dependencyArray_0(v19.moderationDetail, l_untranslatedReasons_0, l_commutationEligibility_0));
        local l_pages_0 = v26.pages;
        local l_unmappedViolationKeys_0 = v26.unmappedViolationKeys;
        local v29 = #l_pages_0;
        local v30 = l_pages_0[v20];
        local v31 = if v30 then v30.pageName else l_STATIC_PAGE_NAMES_0.Unknown;
        local v32 = if l_commutationEligibility_0 then l_commutationEligibility_0.educational_pass_eligible else false;
        local v34 = l_useCallback_0(function() --[[ Line: 116 ]]
            -- upvalues: v20 (copy), v29 (copy), v16 (ref), v23 (copy), v21 (copy)
            if v20 < v29 then
                if v16 then
                    v23(true);
                end;
                v21(function(v33) --[[ Line: 121 ]]
                    return v33 + 1;
                end);
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v20, 
            v29
        } else l_dependencyArray_0(v20, v29));
        local v36 = l_useCallback_0(function() --[[ Line: 129 ]]
            -- upvalues: v20 (copy), v21 (copy)
            if v20 > 1 then
                v21(function(v35) --[[ Line: 131 ]]
                    return v35 - 1;
                end);
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v20
        } else l_dependencyArray_0(v20));
        local v37 = v20 == 1;
        local v38 = v20 == v29;
        local v41 = l_useCallback_0(function() --[[ Line: 143 ]]
            -- upvalues: v29 (copy), v31 (copy), l_STATIC_PAGE_NAMES_0 (ref), v20 (copy), v15 (ref), v32 (copy)
            if v29 <= 1 or v31 == l_STATIC_PAGE_NAMES_0.Intro or v31 == l_STATIC_PAGE_NAMES_0.SecondChanceIntro then
                return 0;
            else
                local v39 = v29 - 1;
                local v40 = v20 - 1;
                if v15 and v32 then
                    v39 = v39 - 1;
                    v40 = v40 - 1;
                end;
                if v39 <= 0 then
                    return 0;
                else
                    return (math.round(v40 / v39 * 100));
                end;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v20, 
            v29, 
            v31
        } else l_dependencyArray_0(v20, v29, v31));
        local v44 = l_useMemo_0(function() --[[ Line: 175 ]]
            -- upvalues: v15 (ref), l_untranslatedReasons_0 (copy), v5 (ref)
            if not v15 then
                return false;
            else
                for _, v43 in l_untranslatedReasons_0 do
                    if v5[v43] then
                        return true;
                    end;
                end;
                return false;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            l_untranslatedReasons_0
        } else l_dependencyArray_0(l_untranslatedReasons_0));
        local v45 = l_useMemo_0(function() --[[ Line: 189 ]]
            -- upvalues: v20 (copy), v31 (copy), v29 (copy), v34 (copy), v36 (copy), v37 (copy), v38 (copy), v41 (copy), v44 (copy), v16 (ref), v22 (copy), v30 (copy), l_unmappedViolationKeys_0 (copy)
            return {
                currentPage = v20, 
                currentPageName = v31, 
                totalPages = v29, 
                goToNextPage = v34, 
                goToPreviousPage = v36, 
                isFirstPage = v37, 
                isLastPage = v38, 
                getProgress = v41, 
                hasEducationalPages = v44, 
                hasNavigatedForward = if v16 then v22 else false, 
                currentPageConfigs = if v30 then v30.pageItems else {}, 
                CurrentCtaComponent = if v30 then v30.CtaComponent else nil, 
                unmappedViolationKeys = l_unmappedViolationKeys_0
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v20, 
            v29, 
            v31, 
            v34, 
            v36, 
            v37, 
            v38, 
            v41, 
            l_pages_0, 
            v44, 
            v22, 
            l_unmappedViolationKeys_0
        } else l_dependencyArray_0(v20, v29, v31, v34, v36, v37, v38, v41, l_pages_0, v44, v22, l_unmappedViolationKeys_0));
        return v9.createElement(v18.Provider, {
            value = v45
        }, v19.children);
    end, 
    usePageNavigation = function() --[[ Line: 244 ]] --[[ Name: usePageNavigation ]]
        -- upvalues: l_useContext_0 (copy), v18 (copy), v7 (copy)
        local v46 = l_useContext_0(v18);
        v7.assert(v46 and v46.currentPage ~= nil, "usePageNavigation must be used within PageNavigationProvider");
        return v46;
    end
};