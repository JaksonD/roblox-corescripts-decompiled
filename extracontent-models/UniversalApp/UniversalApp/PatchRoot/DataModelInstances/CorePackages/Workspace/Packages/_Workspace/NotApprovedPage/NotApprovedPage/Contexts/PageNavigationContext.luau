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
local v16 = l_createContext_0({});
return {
    PageNavigationProvider = function(v17) --[[ Line: 82 ]] --[[ Name: PageNavigationProvider ]]
        -- upvalues: l_useState_0 (copy), l_useNotApprovedPageContext_0 (copy), l_useMemo_0 (copy), l_generatePages_0 (copy), l_dependencyArray_0 (copy), l_STATIC_PAGE_NAMES_0 (copy), l_useCallback_0 (copy), v15 (copy), v5 (copy), v9 (copy), v16 (copy)
        local v18, v19 = l_useState_0(1);
        local l_untranslatedReasons_0 = l_useNotApprovedPageContext_0().violationReasons.untranslatedReasons;
        local l_commutationEligibility_0 = l_useNotApprovedPageContext_0().commutationEligibility;
        local v22 = l_useMemo_0(function() --[[ Line: 88 ]]
            -- upvalues: l_generatePages_0 (ref), v17 (copy), l_untranslatedReasons_0 (copy), l_commutationEligibility_0 (copy)
            return l_generatePages_0(v17.moderationDetail, l_untranslatedReasons_0, l_commutationEligibility_0);
        end, l_dependencyArray_0(v17.moderationDetail, l_untranslatedReasons_0, l_commutationEligibility_0));
        local l_pages_0 = v22.pages;
        local l_unmappedViolationKeys_0 = v22.unmappedViolationKeys;
        local v25 = #l_pages_0;
        local v26 = l_pages_0[v18];
        local v27 = if v26 then v26.pageName else l_STATIC_PAGE_NAMES_0.Unknown;
        local v28 = if l_commutationEligibility_0 then l_commutationEligibility_0.educational_pass_eligible else false;
        local v30 = l_useCallback_0(function() --[[ Line: 103 ]]
            -- upvalues: v18 (copy), v25 (copy), v19 (copy)
            if v18 < v25 then
                v19(function(v29) --[[ Line: 105 ]]
                    return v29 + 1;
                end);
            end;
        end, l_dependencyArray_0(v18, v25));
        local v32 = l_useCallback_0(function() --[[ Line: 111 ]]
            -- upvalues: v18 (copy), v19 (copy)
            if v18 > 1 then
                v19(function(v31) --[[ Line: 113 ]]
                    return v31 - 1;
                end);
            end;
        end, l_dependencyArray_0(v18));
        local v33 = v18 == 1;
        local v34 = v18 == v25;
        local v37 = l_useCallback_0(function() --[[ Line: 124 ]]
            -- upvalues: v25 (copy), v27 (copy), l_STATIC_PAGE_NAMES_0 (ref), v18 (copy), v15 (ref), v28 (copy)
            if v25 <= 1 or v27 == l_STATIC_PAGE_NAMES_0.Intro or v27 == l_STATIC_PAGE_NAMES_0.SecondChanceIntro then
                return 0;
            else
                local v35 = v25 - 1;
                local v36 = v18 - 1;
                if v15 and v28 then
                    v35 = v35 - 1;
                    v36 = v36 - 1;
                end;
                if v35 <= 0 then
                    return 0;
                else
                    return (math.round(v36 / v35 * 100));
                end;
            end;
        end, l_dependencyArray_0(v18, v25, v27));
        local v40 = l_useMemo_0(function() --[[ Line: 152 ]]
            -- upvalues: v15 (ref), l_untranslatedReasons_0 (copy), v5 (ref)
            if not v15 then
                return false;
            else
                for _, v39 in l_untranslatedReasons_0 do
                    if v5[v39] then
                        return true;
                    end;
                end;
                return false;
            end;
        end, l_dependencyArray_0(l_untranslatedReasons_0));
        local v41 = l_useMemo_0(function() --[[ Line: 166 ]]
            -- upvalues: v18 (copy), v27 (copy), v25 (copy), v30 (copy), v32 (copy), v33 (copy), v34 (copy), v37 (copy), v40 (copy), v26 (copy), l_unmappedViolationKeys_0 (copy)
            return {
                currentPage = v18, 
                currentPageName = v27, 
                totalPages = v25, 
                goToNextPage = v30, 
                goToPreviousPage = v32, 
                isFirstPage = v33, 
                isLastPage = v34, 
                getProgress = v37, 
                hasEducationalPages = v40, 
                currentPageConfigs = if v26 then v26.pageItems else {}, 
                CurrentCtaComponent = if v26 then v26.CtaComponent else nil, 
                unmappedViolationKeys = l_unmappedViolationKeys_0
            };
        end, l_dependencyArray_0(v18, v25, v27, v30, v32, v33, v34, v37, l_pages_0, v40, l_unmappedViolationKeys_0));
        return v9.createElement(v16.Provider, {
            value = v41
        }, v17.children);
    end, 
    usePageNavigation = function() --[[ Line: 204 ]] --[[ Name: usePageNavigation ]]
        -- upvalues: l_useContext_0 (copy), v16 (copy), v7 (copy)
        local v42 = l_useContext_0(v16);
        v7.assert(v42 and v42.currentPage ~= nil, "usePageNavigation must be used within PageNavigationProvider");
        return v42;
    end
};