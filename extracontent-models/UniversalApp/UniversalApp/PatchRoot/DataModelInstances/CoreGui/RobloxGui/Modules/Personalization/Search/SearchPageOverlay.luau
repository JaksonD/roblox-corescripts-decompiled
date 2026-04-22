local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v1.App.ImageSet.Images;
local l_ImageSetLabel_0 = v1.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v1.Core.Style.useStyle;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.ReactOtter);
local l_useAnimatedBinding_0 = v6.useAnimatedBinding;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v9 = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v11 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local l_useNavigation_0 = v9.useNavigation;
local v13 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_AppSessionService_0 = v13.AppSessionService;
local l_AppEventIngestService_0 = v13.AppEventIngestService;
local l_RoactNetworking_0 = v13.RoactNetworking;
local v17 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v17.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v17.Hooks.RoactRodux.useSelector;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useCurrentSquadId_0 = v11.Hooks.useCurrentSquadId;
local l_SearchLandingPageSurface_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchLandingPageSurface;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchConstants_0 = l_Modules_0.Personalization.Search.SearchConstants;
local l_SearchLandingPageSession_0 = l_Modules_0.Personalization.Sessions.SearchLandingPageSession;
local l_ApiFetchSearchLandingPage_0 = l_Modules_0.LuaApp.Thunks.Search.ApiFetchSearchLandingPage;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v30 = require(l_Modules_1.LuaApp.Constants);
local v31 = require(l_Modules_1.LuaApp.Thunks.ConfirmSearch);
local v32 = require(l_Modules_1.LuaApp.Analytics.Events.search);
local v33 = require(l_Modules_1.LuaApp.Components.SearchBar);
local v34 = require(l_Modules_1.LuaApp.Components.SearchBarListPicker);
local v35 = require(l_Modules_1.Personalization.Search.SearchLandingPage);
local v36 = require(l_Modules_1.Personalization.Sessions.setSearchLandingPageSessionInfo);
local v37 = require(l_Modules_1.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions);
local l_FIntSearchLandingPageSideMargin_0 = l_Modules_0.Personalization.Search.FIntSearchLandingPageSideMargin;
local v39 = game:DefineFastFlag("SearchOverlayIgnoreTopGuiInset", false);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_NAV_BAR_SIZE_0 = v30.NAV_BAR_SIZE;
SearchPageOverlay = function(v42) --[[ Line: 72 ]] --[[ Name: SearchPageOverlay ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useCurrentSquadId_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_FormFactor_0 (copy), v39 (copy), l_SearchConstants_0 (copy), v5 (copy), l_useAnimatedBinding_0 (copy), v6 (copy), v31 (copy), l_SessionType_0 (copy), v36 (copy), v32 (copy), l_ApiFetchSearchLandingPage_0 (copy), l_SearchLandingPageSession_0 (copy), l_SearchLandingPageSurface_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_NAV_BAR_SIZE_0 (copy), v33 (copy), l_FIntSearchLandingPageSideMargin_0 (copy), v35 (copy), v34 (copy), v37 (copy)
    local v43 = l_useNavigation_0();
    local v44 = l_useDispatch_0();
    local v45 = l_useStyle_0();
    local v46 = l_useDesignTokens_0();
    local v47 = l_useCurrentSquadId_0();
    local v48 = l_useRoactService_0(l_AppEventIngestService_0);
    local v49 = l_useRoactService_0(l_AppSessionService_0);
    local v50 = l_useRoactService_0(l_RoactNetworking_0);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 83 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
        if l_FFlagUseNavigationSelectors_0 then
            return l_Selectors_0.selectCurrentRoactNavigationRoute(v51).key;
        else
            return v51.Navigation.currentRoute.key;
        end;
    end);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 88 ]]
        return v53.ScreenSize;
    end);
    local v56 = l_useSelector_0(function(v55) --[[ Line: 91 ]]
        -- upvalues: l_FormFactor_0 (ref)
        return v55.FormFactor == l_FormFactor_0.COMPACT;
    end);
    local v58 = if v39 then l_useSelector_0(function(v57) --[[ Line: 95 ]]
        return (v57.AppTopBanner.expanded and not v57.AppTopBanner.isDisabled) == true;
    end) else false;
    local v60 = if v39 then l_useSelector_0(function(v59) --[[ Line: 100 ]]
        return v59.TopBar.statusBarHeight;
    end) else 0;
    local v62 = l_useSelector_0(function(v61) --[[ Line: 104 ]]
        return v61.TopBar.topBarHeight;
    end);
    local v64 = l_useSelector_0(function(v63) --[[ Line: 107 ]]
        return v63.GlobalGuiInset or {
            left = 0, 
            top = 0, 
            right = 0, 
            bottom = 0
        };
    end);
    local v65 = l_SearchConstants_0.getSearchTokens(v46);
    local l_searchMargin_0 = v65.searchMargin;
    local l_shadowBoldness_0 = v65.backgroundContainer.shadowBoldness;
    local l_shadowTopOffset_0 = v65.backgroundContainer.shadowTopOffset;
    local l_shadowBottomOffset_0 = v65.backgroundContainer.shadowBottomOffset;
    local v70 = l_shadowBoldness_0 * 2 + l_searchMargin_0 * 2;
    local v71 = if v39 and v58 then v60 else 0;
    local v72 = if v39 and v58 then v62 - v60 else v62;
    local v73 = if v56 then UDim2.new(0, 0, 0, if v39 then v71 else 0) else UDim2.new(0.5, 0, 0, if v39 then v71 else 0);
    local v74 = if v56 then Vector2.new(0, 0) else Vector2.new(0.5, 0);
    local v75 = if v56 then UDim.new(0, l_searchMargin_0) else UDim.new(0, 0);
    local v76 = if v39 then v72 else v64.top + v62;
    local l_X_0 = v54.X;
    local v78 = if v56 then UDim.new(1, 0) else UDim.new(0, math.clamp(l_X_0 * v65.backgroundContainer.screenWidthScale, math.min(v65.backgroundContainer.minimumWidth, l_X_0 - v65.backgroundContainer.padding), v65.backgroundContainer.maximumWidth) - v70);
    local v79 = v5.useRef(v52);
    local v80 = v5.useRef(v76);
    local v81 = v5.useRef(nil);
    local v82 = v5.useRef(nil);
    local v83, v84 = l_useAnimatedBinding_0(v76);
    local v85, v86 = v5.useState(v42.initialSearchText);
    local v87, v88 = v5.useState({});
    local v89 = if not v85 or v85 == "" then l_SearchConstants_0.OverlayContentPageType.LandingPage else if #v87 > 0 then l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions else l_SearchConstants_0.OverlayContentPageType.NoResults;
    local v92 = v5.useCallback(function(v90) --[[ Line: 166 ]]
        -- upvalues: v56 (copy), v39 (ref), v54 (copy), v64 (copy), v71 (copy), v76 (copy), v84 (copy), v6 (ref)
        local v91 = v56 and (if v39 then v54.Y - v64.top - v71 else v54.Y) or math.clamp(v90, v76, if v39 then v54.Y - v64.top - v71 else v54.Y);
        v84(v6.spring(v91, {
            dampingRatio = 0.9, 
            frequency = 6
        }));
    end, {
        v56, 
        v54, 
        v76, 
        v84, 
        if v39 then v64.top else nil, 
        if v39 then v71 else nil
    });
    local v95 = v5.useCallback(function(v93, v94) --[[ Line: 192 ]]
        -- upvalues: v44 (copy), v31 (ref)
        return v44(v31(v93, v94));
    end, {
        v44
    });
    local v96 = v5.useCallback(function() --[[ Line: 196 ]]
        -- upvalues: v42 (copy), v44 (copy), v49 (copy), l_SessionType_0 (ref)
        if v42.closeCentralOverlayThunk then
            v44(v42.closeCentralOverlayThunk());
        end;
        if v49:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v49:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end, {
        v42.closeCentralOverlayThunk, 
        v44, 
        v49
    });
    local v97 = v5.useCallback(function() --[[ Line: 205 ]]
        -- upvalues: v96 (copy), v49 (copy), l_SessionType_0 (ref)
        v96();
        v49:RemoveSession(l_SessionType_0.StructuralIdentifier.SearchLandingPage);
    end, {
        v96, 
        v49
    });
    local v98 = v5.useCallback(function() --[[ Line: 210 ]]
        -- upvalues: v36 (ref), v49 (copy)
        v36(v49);
    end, {
        v49
    });
    local v99 = v5.useCallback(function() --[[ Line: 214 ]]
        -- upvalues: v49 (copy), l_SessionType_0 (ref)
        v49:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
    end, {
        v49
    });
    local v103 = v5.useCallback(function(v100) --[[ Line: 223 ]]
        -- upvalues: v39 (ref), v72 (copy), v64 (copy), v62 (copy), v80 (copy), v92 (copy)
        if not v100 then
            return;
        else
            assert(v100 ~= nil, "onAbsoluteContentSizeChangedCallback: obj is nil");
            local l_Y_0 = v100.AbsoluteContentSize.Y;
            local v102 = if v39 then l_Y_0 + v72 else l_Y_0 + v64.top + v62;
            v80.current = v102;
            v92(v102);
            return;
        end;
    end, {
        if v39 then nil else v64.top, 
        if v39 then nil else v62, 
        v92, 
        if v39 then v72 else nil
    });
    local v104 = v5.useCallback(function() --[[ Line: 244 ]]
        -- upvalues: v32 (ref), v48 (copy), v79 (copy), v97 (copy)
        v32(v48, "searchLandingPage", "cancel", nil, true, v79.current);
        v97();
    end, {
        v97, 
        v48
    });
    local v105 = v5.useCallback(function() --[[ Line: 249 ]]
        -- upvalues: v98 (copy), v99 (copy), v32 (ref), v48 (copy), v79 (copy)
        v98();
        v99();
        v32(v48, "searchLandingPage", "open", nil, true, v79.current);
    end, {
        v48, 
        v98, 
        v99
    });
    local v110 = v5.useCallback(function(v106, v107, v108) --[[ Line: 256 ]]
        -- upvalues: v42 (copy), v43 (copy), v49 (copy), v48 (copy), v95 (copy), v97 (copy)
        local v109 = {
            isAutocompleteSuggestion = v107, 
            allAutocompleteSuggestions = v108, 
            searchType = v42.searchType, 
            isAvatarAutocompleteEnabled = false, 
            navigation = v43, 
            pageOwner = v43.state.routeName, 
            sessionService = v49, 
            eventIngest = v48
        };
        v95(v106, v109);
        v97();
    end, {
        v95, 
        v97, 
        v42.searchType, 
        v48, 
        v49, 
        v43
    });
    v5.useEffect(function() --[[ Line: 275 ]]
        -- upvalues: v47 (copy), v44 (copy), l_ApiFetchSearchLandingPage_0 (ref), v50 (copy), l_SearchLandingPageSession_0 (ref), l_SearchLandingPageSurface_0 (ref), v98 (copy), v97 (copy)
        if v47 ~= "" and v47 ~= nil then
            v44(l_ApiFetchSearchLandingPage_0(v50, l_SearchLandingPageSession_0:Get(), l_SearchLandingPageSurface_0.Party));
        else
            v44(l_ApiFetchSearchLandingPage_0(v50, l_SearchLandingPageSession_0:Get()));
        end;
        v98();
        return function() --[[ Line: 289 ]]
            -- upvalues: v97 (ref)
            v97();
        end;
    end, {
        v98, 
        v97, 
        v50, 
        v44, 
        v49, 
        v47
    });
    v5.useEffect(function() --[[ Line: 297 ]]
        -- upvalues: v89 (copy), l_SearchConstants_0 (ref), v92 (copy), v80 (copy), v65 (copy), v76 (copy)
        if v89 == l_SearchConstants_0.OverlayContentPageType.LandingPage then
            v92(v80.current);
            return;
        elseif v89 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then
            v92(v65.searchBarListPicker.height + v76);
            return;
        else
            if v89 == l_SearchConstants_0.OverlayContentPageType.NoResults then
                v92(v76);
            end;
            return;
        end;
    end, {
        v89, 
        v76, 
        v92
    });
    v5.useEffect(function() --[[ Line: 313 ]]
        -- upvalues: v52 (copy), v79 (copy), v96 (copy)
        if v52 ~= v79.current then
            v96();
        end;
    end, {
        v52, 
        v96
    });
    return v5.createElement(v5.Fragment, nil, {
        AbsorbInput = v5.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, if v39 then if v56 then -v71 else v64.top else 0), 
            Position = UDim2.new(0.5, 0, 0.5, if v39 then if v56 then v71 * 0.5 else -v64.top * 0.5 else 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = "", 
            TextTransparency = 1, 
            BackgroundTransparency = v46.Semantic.Color.Common.Overlay.Transparency, 
            BackgroundColor3 = v46.Semantic.Color.Common.Overlay.Color3, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            [v5.Event.Activated] = v104, 
            ZIndex = 1, 
            Selectable = false
        }), 
        OverlayContainer = v5.createElement("TextButton", {
            Position = v73, 
            AnchorPoint = v74, 
            Size = v83:map(function(v111) --[[ Line: 352 ]]
                -- upvalues: v56 (copy), v78 (copy)
                if v56 then
                    return UDim2.new(1, 0, 0, v111);
                else
                    return UDim2.new(v78.Scale, v78.Offset, 0, v111);
                end;
            end), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            ZIndex = 2, 
            ClipsDescendants = v56, 
            AutoButtonColor = false, 
            Active = true, 
            Text = ""
        }, {
            Shadow = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -l_shadowBoldness_0 - l_shadowTopOffset_0), 
                Size = UDim2.new(1, v70, 1, l_shadowBoldness_0 * 2 + l_shadowTopOffset_0 + l_shadowBottomOffset_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = -1, 
                Image = l_Images_0["component_assets/dropshadow_16_20"], 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(28, 28, 29, 29), 
                ImageColor3 = v45.Theme.DropShadow.Color, 
                ImageTransparency = v45.Theme.DropShadow.Transparency
            }, {
                Background = v5.createElement("Frame", {
                    Position = UDim2.new(0, l_shadowBoldness_0, 0, l_shadowBoldness_0), 
                    Size = UDim2.new(1, -l_shadowBoldness_0 * 2, 1, -l_shadowBoldness_0 * 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v65.backgroundContainer.backgroundColor3, 
                    BackgroundTransparency = v65.backgroundContainer.backgroundTransparency
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 14)
                    })
                })
            }), 
            ContentWrapper = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingLeft = v75, 
                    PaddingRight = v75, 
                    PaddingTop = UDim.new(0, v76 - l_NAV_BAR_SIZE_0)
                }), 
                Layout = v5.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                SearchBar = v5.createElement(v33, {
                    layoutOrder = 1, 
                    Size = UDim2.new(1, v56 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2, 0, l_NAV_BAR_SIZE_0), 
                    anchorPoint = Vector2.new(0.5, 0), 
                    cancelSearch = v104, 
                    confirmSearch = v110, 
                    onFocused = v105, 
                    isCompactView = false, 
                    placeholderText = v42.placeholderText, 
                    searchType = v42.searchType, 
                    autocomplete = true, 
                    focusController = v42.focusController, 
                    isSearching = true, 
                    animated = true, 
                    modernUI = true, 
                    initialSearchText = v42.initialSearchText, 
                    searchBarPadding = 0, 
                    disableListPicker = true, 
                    onTextChanged = v86, 
                    onPickerItemsChanged = v88, 
                    listPickerRef = v82, 
                    updateAutocompleteOnMount = true, 
                    animationSettings = if not v56 then {
                        originalWidth = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE, 
                        animationStyle = l_SearchConstants_0.SearchBarAnimationStyle.ExpandFromCenter
                    } else nil
                }), 
                Content = if v89 == l_SearchConstants_0.OverlayContentPageType.LandingPage then v5.createElement(v35, {
                    layoutOrder = 2, 
                    size = UDim2.new(1, l_searchMargin_0 * 2, 1, -v76), 
                    position = UDim2.new(0.5, 0, 0, 0), 
                    scrollingFrameRef = v81, 
                    onAbsoluteContentSizeChanged = v103, 
                    isCompactView = v56, 
                    defaultContainerSize = Vector2.new(v54.X * v78.Scale + v78.Offset + l_searchMargin_0 * 2, 0)
                }) else if v89 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then v5.createElement(v34, {
                    layoutOrder = 2, 
                    items = v87, 
                    width = UDim.new(1, v56 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2), 
                    height = UDim.new(1, -v76), 
                    BackgroundTransparency = 1, 
                    removeAdditionalMargins = true, 
                    ref = v82, 
                    currentKeyword = if v37 then v85 else nil
                }) else nil
            })
        })
    });
end;
return SearchPageOverlay;