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
local v10 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local l_useNavigation_0 = v9.useNavigation;
local v12 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_AppSessionService_0 = v12.AppSessionService;
local l_AppEventIngestService_0 = v12.AppEventIngestService;
local l_RoactNetworking_0 = v12.RoactNetworking;
local v16 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v16.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v16.Hooks.RoactRodux.useSelector;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v20 = require(l_CorePackages_0.Workspace.Packages.Style);
local v21 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_useDesignTokens_0 = v20.useDesignTokens;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useCurrentSquadId_0 = v10.Hooks.useCurrentSquadId;
local l_SearchLandingPageSurface_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchLandingPageSurface;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchConstants_0 = l_Modules_0.Personalization.Search.SearchConstants;
local l_SearchLandingPageSession_0 = l_Modules_0.Personalization.Sessions.SearchLandingPageSession;
local l_ApiFetchSearchLandingPage_0 = l_Modules_0.LuaApp.Thunks.Search.ApiFetchSearchLandingPage;
local l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 = v21.FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v32 = require(l_Modules_1.LuaApp.Constants);
local v33 = require(l_Modules_1.LuaApp.Thunks.ConfirmSearch);
local v34 = require(l_Modules_1.LuaApp.Analytics.Events.search);
local v35 = require(l_Modules_1.LuaApp.Components.SearchBar);
local v36 = require(l_Modules_1.LuaApp.Components.SearchBarListPicker);
local v37 = require(l_Modules_1.Personalization.Search.SearchLandingPage);
local v38 = require(l_Modules_1.Personalization.Sessions.setSearchLandingPageSessionInfo);
local v39 = require(l_Modules_1.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions);
local l_FIntSearchLandingPageSideMargin_0 = l_Modules_0.Personalization.Search.FIntSearchLandingPageSideMargin;
local v41 = game:DefineFastFlag("SearchOverlayIgnoreTopGuiInset", false);
local v42 = game:DefineFastFlag("LuaAppFixSLPFocus", false);
local l_FFlagLuaAppResetSlpSessionId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppResetSlpSessionId;
local l_NAV_BAR_SIZE_0 = v32.NAV_BAR_SIZE;
SearchPageOverlay = function(v45) --[[ Line: 75 ]] --[[ Name: SearchPageOverlay ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (copy), l_useCurrentSquadId_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v41 (copy), l_SearchConstants_0 (copy), v5 (copy), l_useAnimatedBinding_0 (copy), v6 (copy), v33 (copy), l_SessionType_0 (copy), l_FFlagLuaAppResetSlpSessionId_0 (copy), v38 (copy), l_SearchLandingPageSession_0 (copy), v34 (copy), l_ApiFetchSearchLandingPage_0 (copy), l_SearchLandingPageSurface_0 (copy), v42 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_NAV_BAR_SIZE_0 (copy), v35 (copy), l_FIntSearchLandingPageSideMargin_0 (copy), v37 (copy), v36 (copy), v39 (copy)
    local v46 = l_useNavigation_0();
    local v47 = l_useDispatch_0();
    local v48 = l_useStyle_0();
    local v49 = l_useDesignTokens_0();
    local v50 = nil;
    if l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 then
        v50 = l_useCurrentSquadId_0();
    end;
    local v51 = l_useRoactService_0(l_AppEventIngestService_0);
    local v52 = l_useRoactService_0(l_AppSessionService_0);
    local v53 = l_useRoactService_0(l_RoactNetworking_0);
    local v55 = l_useSelector_0(function(v54) --[[ Line: 89 ]]
        return v54.Navigation.currentRoute.key;
    end);
    local v57 = l_useSelector_0(function(v56) --[[ Line: 92 ]]
        return v56.ScreenSize;
    end);
    local v59 = l_useSelector_0(function(v58) --[[ Line: 95 ]]
        -- upvalues: l_FormFactor_0 (ref)
        return v58.FormFactor == l_FormFactor_0.COMPACT;
    end);
    local v61 = if v41 then l_useSelector_0(function(v60) --[[ Line: 99 ]]
        return (v60.AppTopBanner.expanded and not v60.AppTopBanner.isDisabled) == true;
    end) else false;
    local v63 = if v41 then l_useSelector_0(function(v62) --[[ Line: 104 ]]
        return v62.TopBar.statusBarHeight;
    end) else 0;
    local v65 = l_useSelector_0(function(v64) --[[ Line: 108 ]]
        return v64.TopBar.topBarHeight;
    end);
    local v67 = l_useSelector_0(function(v66) --[[ Line: 111 ]]
        return v66.GlobalGuiInset or {
            left = 0, 
            top = 0, 
            right = 0, 
            bottom = 0
        };
    end);
    local v68 = l_SearchConstants_0.getSearchTokens(v49);
    local l_searchMargin_0 = v68.searchMargin;
    local l_shadowBoldness_0 = v68.backgroundContainer.shadowBoldness;
    local l_shadowTopOffset_0 = v68.backgroundContainer.shadowTopOffset;
    local l_shadowBottomOffset_0 = v68.backgroundContainer.shadowBottomOffset;
    local v73 = l_shadowBoldness_0 * 2 + l_searchMargin_0 * 2;
    local v74 = if v41 and v61 then v63 else 0;
    local v75 = if v41 and v61 then v65 - v63 else v65;
    local v76 = if v59 then UDim2.new(0, 0, 0, if v41 then v74 else 0) else UDim2.new(0.5, 0, 0, if v41 then v74 else 0);
    local v77 = if v59 then Vector2.new(0, 0) else Vector2.new(0.5, 0);
    local v78 = if v59 then UDim.new(0, l_searchMargin_0) else UDim.new(0, 0);
    local v79 = if v41 then v75 else v67.top + v65;
    local l_X_0 = v57.X;
    local v81 = if v59 then UDim.new(1, 0) else UDim.new(0, math.clamp(l_X_0 * v68.backgroundContainer.screenWidthScale, math.min(v68.backgroundContainer.minimumWidth, l_X_0 - v68.backgroundContainer.padding), v68.backgroundContainer.maximumWidth) - v73);
    local v82 = v5.useRef(v55);
    local v83 = v5.useRef(v79);
    local v84 = v5.useRef(nil);
    local v85 = v5.useRef(nil);
    local v86, v87 = l_useAnimatedBinding_0(v79);
    local v88, v89 = v5.useState(v45.initialSearchText);
    local v90, v91 = v5.useState({});
    local v92 = if not v88 or v88 == "" then l_SearchConstants_0.OverlayContentPageType.LandingPage else if #v90 > 0 then l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions else l_SearchConstants_0.OverlayContentPageType.NoResults;
    local v95 = v5.useCallback(function(v93) --[[ Line: 170 ]]
        -- upvalues: v59 (copy), v41 (ref), v57 (copy), v67 (copy), v74 (copy), v79 (copy), v87 (copy), v6 (ref)
        local v94 = v59 and (if v41 then v57.Y - v67.top - v74 else v57.Y) or math.clamp(v93, v79, if v41 then v57.Y - v67.top - v74 else v57.Y);
        v87(v6.spring(v94, {
            dampingRatio = 0.9, 
            frequency = 6
        }));
    end, {
        v59, 
        v57, 
        v79, 
        v87, 
        if v41 then v67.top else nil, 
        if v41 then v74 else nil
    });
    local v98 = v5.useCallback(function(v96, v97) --[[ Line: 196 ]]
        -- upvalues: v47 (copy), v33 (ref)
        return v47(v33(v96, v97));
    end, {
        v47
    });
    local v99 = v5.useCallback(function() --[[ Line: 200 ]]
        -- upvalues: v45 (copy), v47 (copy), v52 (copy), l_SessionType_0 (ref)
        if v45.closeCentralOverlayThunk then
            v47(v45.closeCentralOverlayThunk());
        end;
        if v52:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v52:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end, {
        v45.closeCentralOverlayThunk, 
        v47, 
        v52
    });
    local v100 = v5.useCallback(function() --[[ Line: 209 ]]
        -- upvalues: v99 (copy), v52 (copy), l_SessionType_0 (ref)
        v99();
        v52:RemoveSession(l_SessionType_0.StructuralIdentifier.SearchLandingPage);
    end, {
        v99, 
        v52
    });
    local v101 = v5.useCallback(function() --[[ Line: 214 ]]
        -- upvalues: l_FFlagLuaAppResetSlpSessionId_0 (ref), v38 (ref), v52 (copy), l_SessionType_0 (ref), l_SearchLandingPageSession_0 (ref)
        if l_FFlagLuaAppResetSlpSessionId_0 then
            v38(v52);
            return;
        else
            if not v52:SessionExists(l_SessionType_0.StructuralIdentifier.SearchLandingPage) then
                v52:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.StructuralIdentifier.SearchLandingPage);
            end;
            v52:SetMetadata(l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.Metadata.SearchLandingPage.SearchLandingPageSessionId, l_SearchLandingPageSession_0:Get());
            return;
        end;
    end, {
        v52
    });
    local v102 = v5.useCallback(function() --[[ Line: 235 ]]
        -- upvalues: v52 (copy), l_SessionType_0 (ref)
        v52:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
    end, {
        v52
    });
    local v106 = v5.useCallback(function(v103) --[[ Line: 244 ]]
        -- upvalues: v41 (ref), v75 (copy), v67 (copy), v65 (copy), v83 (copy), v95 (copy)
        if not v103 then
            return;
        else
            assert(v103 ~= nil, "onAbsoluteContentSizeChangedCallback: obj is nil");
            local l_Y_0 = v103.AbsoluteContentSize.Y;
            local v105 = if v41 then l_Y_0 + v75 else l_Y_0 + v67.top + v65;
            v83.current = v105;
            v95(v105);
            return;
        end;
    end, {
        if v41 then nil else v67.top, 
        if v41 then nil else v65, 
        v95, 
        if v41 then v75 else nil
    });
    local v107 = v5.useCallback(function() --[[ Line: 265 ]]
        -- upvalues: v34 (ref), v51 (copy), v82 (copy), v100 (copy)
        v34(v51, "searchLandingPage", "cancel", nil, true, v82.current);
        v100();
    end, {
        v100, 
        v51
    });
    local v108 = v5.useCallback(function() --[[ Line: 270 ]]
        -- upvalues: v101 (copy), v102 (copy), v34 (ref), v51 (copy), v82 (copy)
        v101();
        v102();
        v34(v51, "searchLandingPage", "open", nil, true, v82.current);
    end, {
        v51, 
        v101, 
        v102
    });
    local v113 = v5.useCallback(function(v109, v110, v111) --[[ Line: 277 ]]
        -- upvalues: v45 (copy), v46 (copy), v52 (copy), v51 (copy), v98 (copy), v100 (copy)
        local v112 = {
            isAutocompleteSuggestion = v110, 
            allAutocompleteSuggestions = v111, 
            searchType = v45.searchType, 
            isAvatarAutocompleteEnabled = false, 
            navigation = v46, 
            pageOwner = v46.state.routeName, 
            sessionService = v52, 
            eventIngest = v51
        };
        v98(v109, v112);
        v100();
    end, {
        v98, 
        v100, 
        v45.searchType, 
        v51, 
        v52, 
        v46
    });
    v5.useEffect(function() --[[ Line: 296 ]]
        -- upvalues: l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (ref), v50 (ref), v47 (copy), l_ApiFetchSearchLandingPage_0 (ref), v53 (copy), l_SearchLandingPageSession_0 (ref), l_SearchLandingPageSurface_0 (ref), v101 (copy), v100 (copy)
        if l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 and v50 ~= "" and v50 ~= nil then
            v47(l_ApiFetchSearchLandingPage_0(v53, l_SearchLandingPageSession_0:Get(), l_SearchLandingPageSurface_0.Party));
        else
            v47(l_ApiFetchSearchLandingPage_0(v53, l_SearchLandingPageSession_0:Get()));
        end;
        v101();
        return function() --[[ Line: 314 ]]
            -- upvalues: v100 (ref)
            v100();
        end;
    end, {
        v101, 
        v100, 
        v53, 
        v47, 
        v52, 
        v50
    });
    v5.useEffect(function() --[[ Line: 322 ]]
        -- upvalues: v92 (copy), l_SearchConstants_0 (ref), v95 (copy), v83 (copy), v68 (copy), v79 (copy)
        if v92 == l_SearchConstants_0.OverlayContentPageType.LandingPage then
            v95(v83.current);
            return;
        elseif v92 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then
            v95(v68.searchBarListPicker.height + v79);
            return;
        else
            if v92 == l_SearchConstants_0.OverlayContentPageType.NoResults then
                v95(v79);
            end;
            return;
        end;
    end, {
        v92, 
        v79, 
        v95
    });
    v5.useEffect(function() --[[ Line: 338 ]]
        -- upvalues: v55 (copy), v82 (copy), v99 (copy)
        if v55 ~= v82.current then
            v99();
        end;
    end, {
        v55, 
        v99
    });
    return v5.createElement(v5.Fragment, nil, {
        AbsorbInput = v5.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, if v41 then if v59 then -v74 else v67.top else 0), 
            Position = UDim2.new(0.5, 0, 0.5, if v41 then if v59 then v74 * 0.5 else -v67.top * 0.5 else 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = "", 
            TextTransparency = 1, 
            BackgroundTransparency = v49.Semantic.Color.Common.Overlay.Transparency, 
            BackgroundColor3 = v49.Semantic.Color.Common.Overlay.Color3, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            [v5.Event.Activated] = v107, 
            ZIndex = 1, 
            Selectable = not v42 and nil
        }), 
        OverlayContainer = v5.createElement("TextButton", {
            Position = v76, 
            AnchorPoint = v77, 
            Size = v86:map(function(v114) --[[ Line: 377 ]]
                -- upvalues: v59 (copy), v81 (copy)
                if v59 then
                    return UDim2.new(1, 0, 0, v114);
                else
                    return UDim2.new(v81.Scale, v81.Offset, 0, v114);
                end;
            end), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = not v42 or false, 
            ZIndex = 2, 
            ClipsDescendants = v59, 
            AutoButtonColor = false, 
            Active = true, 
            Text = ""
        }, {
            Shadow = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -l_shadowBoldness_0 - l_shadowTopOffset_0), 
                Size = UDim2.new(1, v73, 1, l_shadowBoldness_0 * 2 + l_shadowTopOffset_0 + l_shadowBottomOffset_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = -1, 
                Image = l_Images_0["component_assets/dropshadow_16_20"], 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(28, 28, 29, 29), 
                ImageColor3 = v48.Theme.DropShadow.Color, 
                ImageTransparency = v48.Theme.DropShadow.Transparency
            }, {
                Background = v5.createElement("Frame", {
                    Position = UDim2.new(0, l_shadowBoldness_0, 0, l_shadowBoldness_0), 
                    Size = UDim2.new(1, -l_shadowBoldness_0 * 2, 1, -l_shadowBoldness_0 * 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v68.backgroundContainer.backgroundColor3, 
                    BackgroundTransparency = v68.backgroundContainer.backgroundTransparency
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
                    PaddingLeft = v78, 
                    PaddingRight = v78, 
                    PaddingTop = UDim.new(0, v79 - l_NAV_BAR_SIZE_0)
                }), 
                Layout = v5.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                SearchBar = v5.createElement(v35, {
                    layoutOrder = 1, 
                    Size = UDim2.new(1, v59 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2, 0, l_NAV_BAR_SIZE_0), 
                    anchorPoint = Vector2.new(0.5, 0), 
                    cancelSearch = v107, 
                    confirmSearch = v113, 
                    onFocused = v108, 
                    isCompactView = false, 
                    placeholderText = v45.placeholderText, 
                    searchType = v45.searchType, 
                    autocomplete = true, 
                    focusController = v45.focusController, 
                    isSearching = true, 
                    animated = true, 
                    modernUI = true, 
                    initialSearchText = v45.initialSearchText, 
                    searchBarPadding = 0, 
                    disableListPicker = true, 
                    onTextChanged = v89, 
                    onPickerItemsChanged = v91, 
                    listPickerRef = v85, 
                    updateAutocompleteOnMount = true, 
                    animationSettings = if not v59 then {
                        originalWidth = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE, 
                        animationStyle = l_SearchConstants_0.SearchBarAnimationStyle.ExpandFromCenter
                    } else nil
                }), 
                Content = if v92 == l_SearchConstants_0.OverlayContentPageType.LandingPage then v5.createElement(v37, {
                    layoutOrder = 2, 
                    size = UDim2.new(1, l_searchMargin_0 * 2, 1, -v79), 
                    position = UDim2.new(0.5, 0, 0, 0), 
                    scrollingFrameRef = v84, 
                    onAbsoluteContentSizeChanged = v106, 
                    isCompactView = v59, 
                    defaultContainerSize = Vector2.new(v57.X * v81.Scale + v81.Offset + l_searchMargin_0 * 2, 0)
                }) else if v92 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then v5.createElement(v36, {
                    layoutOrder = 2, 
                    items = v90, 
                    width = UDim.new(1, v59 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2), 
                    height = UDim.new(1, -v79), 
                    BackgroundTransparency = 1, 
                    removeAdditionalMargins = true, 
                    ref = v85, 
                    currentKeyword = if v39 then v88 else nil
                }) else nil
            })
        })
    });
end;
return SearchPageOverlay;