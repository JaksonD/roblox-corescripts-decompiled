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
local l_Text_0 = v10.Text;
local l_View_0 = v10.View;
local l_Button_0 = v10.Button;
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local l_NavigateDown_0 = v15.Thunks.NavigateDown;
local l_useDispatch_0 = v20.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v20.Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v10.Hooks.useTokens;
local l_useLocalization_0 = v14.Hooks.useLocalization;
local l_useRoactService_0 = v18.useRoactService;
local l_flaggedMutedError_0 = v13.flaggedMutedError;
local l_RoactNetworking_0 = v19.RoactNetworking;
local l_ApiFetchGameDetails_0 = v11.GameDetails.ApiFetchGameDetails;
local l_RetrievalStatus_0 = v12.Enum.RetrievalStatus;
local v38 = require(l_script_FirstAncestor_0.Enums.SponsoredUserCohort);
local l_FStringLuaAppAdPreferencesUrl_0 = require(l_Parent_0.SharedFlags).FStringLuaAppAdPreferencesUrl;
local v40 = game:DefineFastFlag("LuaAppUpdateAdPreferencesButtonStyle", false);
local function v48(v41) --[[ Line: 45 ]] --[[ Name: useCreatorName ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_ApiFetchGameDetails_0 (copy), v16 (copy), l_RetrievalStatus_0 (copy)
    local v42 = l_useDispatch_0();
    local v43 = l_useRoactService_0(l_RoactNetworking_0);
    local v45 = l_useSelector_0(function(v44) --[[ Line: 49 ]]
        -- upvalues: v41 (copy), l_ApiFetchGameDetails_0 (ref)
        return v41 and l_ApiFetchGameDetails_0.GetFetchingStatus(v44, v41) or nil;
    end);
    local v47 = l_useSelector_0(function(v46) --[[ Line: 53 ]]
        -- upvalues: v41 (copy)
        return v41 and v46.GameDetails[v41] or nil;
    end);
    v16.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v41 (copy), v47 (copy), v45 (copy), l_RetrievalStatus_0 (ref), v42 (copy), l_ApiFetchGameDetails_0 (ref), v43 (copy)
        if v41 and not v47 and v45 ~= l_RetrievalStatus_0.Fetching then
            v42(l_ApiFetchGameDetails_0.Fetch(v43, {
                v41
            }));
        end;
    end, {
        v41, 
        v47, 
        v45, 
        v42, 
        v43
    });
    return v47 and v47.creator and v47.creator.name or nil, v45;
end;
local function _(v49) --[[ Line: 67 ]] --[[ Name: getSponsoredDisclosureTranslationKey ]]
    -- upvalues: v38 (copy)
    if v49 == v38.UnderEighteen then
        return "Feature.GameDetails.Message.SponsoredDisclosure.U18";
    elseif v49 == v38.EighteenPlusPersonalized then
        return "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink";
    elseif v49 == v38.EighteenPlusNonPersonalized then
        return "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink";
    else
        return "Feature.GameDetails.Message.SponsoredDisclosure.U18";
    end;
end;
return function(v51) --[[ Line: 79 ]] --[[ Name: WhyThisAdModal ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v48 (copy), l_useLocalization_0 (copy), v38 (copy), v16 (copy), l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FStringLuaAppAdPreferencesUrl_0 (copy), l_RetrievalStatus_0 (copy), l_flaggedMutedError_0 (copy), l_Dialog_0 (copy), l_View_0 (copy), v40 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_Text_0 (copy)
    local v52 = l_useTokens_0();
    local v53 = l_useDispatch_0();
    local v54, v55 = v48(v51.universeId);
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v57 = {};
    local v58 = {};
    local l_sponsoredUserCohort_0 = v51.sponsoredUserCohort;
    local v60 = l_sponsoredUserCohort_0 == v38.UnderEighteen and "Feature.GameDetails.Message.SponsoredDisclosure.U18" or l_sponsoredUserCohort_0 == v38.EighteenPlusPersonalized and "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" or l_sponsoredUserCohort_0 == v38.EighteenPlusNonPersonalized and "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" or "Feature.GameDetails.Message.SponsoredDisclosure.U18";
    v6(v58, 1, v60);
    v58.CreatorName = v54;
    v58.PayerName = v51.payerName;
    v57.sponsoredDisclosure = v58;
    v57.sponsoredDisclosureError = "Feature.GameDetails.Message.SponsoredDisclosure.Error";
    v57.whyThisAd = "Feature.GameDetails.Label.WhyThisAd";
    v57.adPreferences = "Feature.GameDetails.Message.AdPreferences";
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v57);
    v57 = v16.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v53 (copy), l_CloseCentralOverlay_0 (ref)
        v53(l_CloseCentralOverlay_0());
    end, {
        v53
    });
    v58 = v16.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: v53 (copy), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_FStringLuaAppAdPreferencesUrl_0 (ref), l_l_useLocalization_0_0 (copy)
        v53(l_CloseCentralOverlay_0());
        v53(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = l_FStringLuaAppAdPreferencesUrl_0, 
            extraProps = {
                title = l_l_useLocalization_0_0.adPreferences
            }
        }));
    end, {
        v53, 
        l_l_useLocalization_0_0.adPreferences
    });
    if v55 == l_RetrievalStatus_0.NotStarted or v55 == l_RetrievalStatus_0.Fetching then
        return nil;
    else
        v60 = nil;
        l_sponsoredUserCohort_0 = nil;
        if v54 and v51.payerName then
            l_sponsoredUserCohort_0 = l_l_useLocalization_0_0.sponsoredDisclosure;
            local v61 = true;
            if v51.sponsoredUserCohort ~= v38.EighteenPlusPersonalized then
                v61 = v51.sponsoredUserCohort == v38.EighteenPlusNonPersonalized;
            end;
            v60 = v61;
        else
            l_flaggedMutedError_0("WhyThisAdDisclosureError", "Missing creatorName or payerName in WhyThisAdModal");
            l_sponsoredUserCohort_0 = l_l_useLocalization_0_0.sponsoredDisclosureError;
        end;
        return v16.createElement(l_Dialog_0.Root, {
            onClose = v57, 
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
                    AdPreferences = if v60 then if v40 then v16.createElement(l_Button_0, {
                        text = l_l_useLocalization_0_0.adPreferences, 
                        variant = l_ButtonVariant_0.Text, 
                        onActivated = v58, 
                        LayoutOrder = 2
                    }) else v16.createElement(l_Text_0, {
                        Text = l_l_useLocalization_0_0.adPreferences, 
                        textStyle = v52.Color.Content.Link, 
                        fontStyle = v52.Typography.BodyMedium, 
                        tag = "auto-xy", 
                        onActivated = v58, 
                        LayoutOrder = 2
                    }) else nil
                })
            })
        });
    end;
end;