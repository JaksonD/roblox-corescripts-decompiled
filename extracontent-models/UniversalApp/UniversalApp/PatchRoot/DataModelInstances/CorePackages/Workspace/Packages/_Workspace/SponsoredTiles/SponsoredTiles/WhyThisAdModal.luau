local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SponsoredTiles");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v9 = require(l_Parent_0.CentralOverlay);
local v10 = require(l_Parent_0.Foundation);
local v11 = require(l_Parent_0.GameDetailRodux);
local v12 = require(l_Parent_0.Http);
local v13 = require(l_Parent_0.Loggers);
local v14 = require(l_Parent_0.Localization);
local v15 = require(l_Parent_0.NavigationRodux);
local v16 = require(l_Parent_0.React);
local v17 = require(l_Parent_0.RobloxAppEnums);
local v18 = require(l_Parent_0.RobloxAppHooks);
local v19 = require(l_Parent_0.RoactServiceTags);
local v20 = require(l_Parent_0.RoactUtils);
local l_AppPage_0 = v17.AppPage;
local l_CloseCentralOverlay_0 = v9.Thunks.CloseCentralOverlay;
local l_Dialog_0 = v10.Dialog;
local l_View_0 = v10.View;
local l_Button_0 = v10.Button;
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local l_NavigateDown_0 = v15.Thunks.NavigateDown;
local l_useDispatch_0 = v20.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v20.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = v14.Hooks.useLocalization;
local l_useRoactService_0 = v18.useRoactService;
local l_flaggedMutedError_0 = v13.flaggedMutedError;
local l_RoactNetworking_0 = v19.RoactNetworking;
local l_ApiFetchGameDetails_0 = v11.GameDetails.ApiFetchGameDetails;
local l_RetrievalStatus_0 = v12.Enum.RetrievalStatus;
local v36 = require(l_script_FirstAncestor_0.Enums.SponsoredUserCohort);
local l_FStringLuaAppAdPreferencesUrl_0 = require(l_Parent_0.SharedFlags).FStringLuaAppAdPreferencesUrl;
local function v45(v38) --[[ Line: 42 ]] --[[ Name: useCreatorName ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_ApiFetchGameDetails_0 (copy), v16 (copy), l_RetrievalStatus_0 (copy)
    local v39 = l_useDispatch_0();
    local v40 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = l_useSelector_0(function(v41) --[[ Line: 46 ]]
        -- upvalues: v38 (copy), l_ApiFetchGameDetails_0 (ref)
        return v38 and l_ApiFetchGameDetails_0.GetFetchingStatus(v41, v38) or nil;
    end);
    local v44 = l_useSelector_0(function(v43) --[[ Line: 50 ]]
        -- upvalues: v38 (copy)
        return v38 and v43.GameDetails[v38] or nil;
    end);
    v16.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v38 (copy), v44 (copy), v42 (copy), l_RetrievalStatus_0 (ref), v39 (copy), l_ApiFetchGameDetails_0 (ref), v40 (copy)
        if v38 and not v44 and v42 ~= l_RetrievalStatus_0.Fetching then
            v39(l_ApiFetchGameDetails_0.Fetch(v40, {
                v38
            }));
        end;
    end, {
        v38, 
        v44, 
        v42, 
        v39, 
        v40
    });
    return v44 and v44.creator and v44.creator.name or nil, v42;
end;
local function _(v46) --[[ Line: 64 ]] --[[ Name: getSponsoredDisclosureTranslationKey ]]
    -- upvalues: v36 (copy)
    if v46 == v36.UnderEighteen then
        return "Feature.GameDetails.Message.SponsoredDisclosure.U18";
    elseif v46 == v36.EighteenPlusPersonalized then
        return "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink";
    elseif v46 == v36.EighteenPlusNonPersonalized then
        return "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink";
    else
        return "Feature.GameDetails.Message.SponsoredDisclosure.U18";
    end;
end;
return function(v48) --[[ Line: 76 ]] --[[ Name: WhyThisAdModal ]]
    -- upvalues: l_useDispatch_0 (copy), v45 (copy), l_useLocalization_0 (copy), v36 (copy), v16 (copy), l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FStringLuaAppAdPreferencesUrl_0 (copy), l_RetrievalStatus_0 (copy), l_flaggedMutedError_0 (copy), l_Dialog_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
    local v49 = l_useDispatch_0();
    local v50, v51 = v45(v48.universeId);
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v53 = {};
    local v54 = {};
    local l_sponsoredUserCohort_0 = v48.sponsoredUserCohort;
    local v56 = l_sponsoredUserCohort_0 == v36.UnderEighteen and "Feature.GameDetails.Message.SponsoredDisclosure.U18" or l_sponsoredUserCohort_0 == v36.EighteenPlusPersonalized and "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" or l_sponsoredUserCohort_0 == v36.EighteenPlusNonPersonalized and "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" or "Feature.GameDetails.Message.SponsoredDisclosure.U18";
    v6(v54, 1, v56);
    v54.CreatorName = v50;
    v54.PayerName = v48.payerName;
    v53.sponsoredDisclosure = v54;
    v53.sponsoredDisclosureError = "Feature.GameDetails.Message.SponsoredDisclosure.Error";
    v53.whyThisAd = "Feature.GameDetails.Label.WhyThisAd";
    v53.adPreferences = "Feature.GameDetails.Message.AdPreferences";
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v53);
    v53 = v16.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v49 (copy), l_CloseCentralOverlay_0 (ref)
        v49(l_CloseCentralOverlay_0());
    end, {
        v49
    });
    v54 = v16.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v49 (copy), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_FStringLuaAppAdPreferencesUrl_0 (ref), l_l_useLocalization_0_0 (copy)
        v49(l_CloseCentralOverlay_0());
        v49(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = l_FStringLuaAppAdPreferencesUrl_0, 
            extraProps = {
                title = l_l_useLocalization_0_0.adPreferences
            }
        }));
    end, {
        v49, 
        l_l_useLocalization_0_0.adPreferences
    });
    if v51 == l_RetrievalStatus_0.NotStarted or v51 == l_RetrievalStatus_0.Fetching then
        return nil;
    else
        v56 = nil;
        l_sponsoredUserCohort_0 = nil;
        if v50 and v48.payerName then
            l_sponsoredUserCohort_0 = l_l_useLocalization_0_0.sponsoredDisclosure;
            local v57 = true;
            if v48.sponsoredUserCohort ~= v36.EighteenPlusPersonalized then
                v57 = v48.sponsoredUserCohort == v36.EighteenPlusNonPersonalized;
            end;
            v56 = v57;
        else
            l_flaggedMutedError_0("WhyThisAdDisclosureError", "Missing creatorName or payerName in WhyThisAdModal");
            l_sponsoredUserCohort_0 = l_l_useLocalization_0_0.sponsoredDisclosureError;
        end;
        return v16.createElement(l_Dialog_0.Root, {
            onClose = v53, 
            hasBackdrop = true
        }, {
            DialogTitle = v16.createElement(l_Dialog_0.Title, {
                text = l_l_useLocalization_0_0.whyThisAd
            }), 
            DialogContent = v16.createElement(l_Dialog_0.Content, {
                LayoutOrder = 1
            }, {
                ContentView = v16.createElement(l_View_0, {
                    tag = "col auto-xy gap-small"
                }, {
                    DialogText = v16.createElement(l_Dialog_0.Text, {
                        Text = l_sponsoredUserCohort_0, 
                        LayoutOrder = 1
                    }), 
                    AdPreferences = if v56 then v16.createElement(l_Button_0, {
                        text = l_l_useLocalization_0_0.adPreferences, 
                        variant = l_ButtonVariant_0.Text, 
                        onActivated = v54, 
                        LayoutOrder = 2
                    }) else nil
                })
            })
        });
    end;
end;