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
local v17 = l_createContext_0({});
return {
    PageNavigationProvider = function(v18) --[[ Line: 86 ]] --[[ Name: PageNavigationProvider ]]
        -- upvalues: l_useState_0 (copy), l_useNotApprovedPageContext_0 (copy), l_useMemo_0 (copy), l_generatePages_0 (copy), l_dependencyArray_0 (copy), l_STATIC_PAGE_NAMES_0 (copy), l_useCallback_0 (copy), v16 (copy), v15 (copy), v5 (copy), v9 (copy), v17 (copy)
        local v19, v20 = l_useState_0(1);
        local v21, v22 = l_useState_0(false);
        local l_untranslatedReasons_0 = l_useNotApprovedPageContext_0().violationReasons.untranslatedReasons;
        local l_commutationEligibility_0 = l_useNotApprovedPageContext_0().commutationEligibility;
        local v25 = l_useMemo_0(function() --[[ Line: 93 ]]
            -- upvalues: l_generatePages_0 (ref), v18 (copy), l_untranslatedReasons_0 (copy), l_commutationEligibility_0 (copy)
            return l_generatePages_0(v18.moderationDetail, l_untranslatedReasons_0, l_commutationEligibility_0);
        end, l_dependencyArray_0(v18.moderationDetail, l_untranslatedReasons_0, l_commutationEligibility_0));
        local l_pages_0 = v25.pages;
        local l_unmappedViolationKeys_0 = v25.unmappedViolationKeys;
        local v28 = #l_pages_0;
        local v29 = l_pages_0[v19];
        local v30 = if v29 then v29.pageName else l_STATIC_PAGE_NAMES_0.Unknown;
        local v31 = if l_commutationEligibility_0 then l_commutationEligibility_0.educational_pass_eligible else false;
        local v33 = l_useCallback_0(function() --[[ Line: 108 ]]
            -- upvalues: v19 (copy), v28 (copy), v16 (ref), v22 (copy), v20 (copy)
            if v19 < v28 then
                if v16 then
                    v22(true);
                end;
                v20(function(v32) --[[ Line: 113 ]]
                    return v32 + 1;
                end);
            end;
        end, l_dependencyArray_0(v19, v28));
        local v35 = l_useCallback_0(function() --[[ Line: 119 ]]
            -- upvalues: v19 (copy), v20 (copy)
            if v19 > 1 then
                v20(function(v34) --[[ Line: 121 ]]
                    return v34 - 1;
                end);
            end;
        end, l_dependencyArray_0(v19));
        local v36 = v19 == 1;
        local v37 = v19 == v28;
        local v40 = l_useCallback_0(function() --[[ Line: 132 ]]
            -- upvalues: v28 (copy), v30 (copy), l_STATIC_PAGE_NAMES_0 (ref), v19 (copy), v15 (ref), v31 (copy)
            if v28 <= 1 or v30 == l_STATIC_PAGE_NAMES_0.Intro or v30 == l_STATIC_PAGE_NAMES_0.SecondChanceIntro then
                return 0;
            else
                local v38 = v28 - 1;
                local v39 = v19 - 1;
                if v15 and v31 then
                    v38 = v38 - 1;
                    v39 = v39 - 1;
                end;
                if v38 <= 0 then
                    return 0;
                else
                    return (math.round(v39 / v38 * 100));
                end;
            end;
        end, l_dependencyArray_0(v19, v28, v30));
        local v43 = l_useMemo_0(function() --[[ Line: 160 ]]
            -- upvalues: v15 (ref), l_untranslatedReasons_0 (copy), v5 (ref)
            if not v15 then
                return false;
            else
                for _, v42 in l_untranslatedReasons_0 do
                    if v5[v42] then
                        return true;
                    end;
                end;
                return false;
            end;
        end, l_dependencyArray_0(l_untranslatedReasons_0));
        local v44 = l_useMemo_0(function() --[[ Line: 174 ]]
            -- upvalues: v19 (copy), v30 (copy), v28 (copy), v33 (copy), v35 (copy), v36 (copy), v37 (copy), v40 (copy), v43 (copy), v16 (ref), v21 (copy), v29 (copy), l_unmappedViolationKeys_0 (copy)
            return {
                currentPage = v19, 
                currentPageName = v30, 
                totalPages = v28, 
                goToNextPage = v33, 
                goToPreviousPage = v35, 
                isFirstPage = v36, 
                isLastPage = v37, 
                getProgress = v40, 
                hasEducationalPages = v43, 
                hasNavigatedForward = if v16 then v21 else false, 
                currentPageConfigs = if v29 then v29.pageItems else {}, 
                CurrentCtaComponent = if v29 then v29.CtaComponent else nil, 
                unmappedViolationKeys = l_unmappedViolationKeys_0
            };
        end, l_dependencyArray_0(v19, v28, v30, v33, v35, v36, v37, v40, l_pages_0, v43, v21, l_unmappedViolationKeys_0));
        return v9.createElement(v17.Provider, {
            value = v44
        }, v18.children);
    end, 
    usePageNavigation = function() --[[ Line: 214 ]] --[[ Name: usePageNavigation ]]
        -- upvalues: l_useContext_0 (copy), v17 (copy), v7 (copy)
        local v45 = l_useContext_0(v17);
        v7.assert(v45 and v45.currentPage ~= nil, "usePageNavigation must be used within PageNavigationProvider");
        return v45;
    end
};