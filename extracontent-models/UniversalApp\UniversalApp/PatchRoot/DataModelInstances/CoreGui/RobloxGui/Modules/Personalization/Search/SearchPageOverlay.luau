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
local l_FFlagLuaAppResetSlpSessionId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppResetSlpSessionId;
local l_NAV_BAR_SIZE_0 = v32.NAV_BAR_SIZE;
SearchPageOverlay = function(v44) --[[ Line: 74 ]] --[[ Name: SearchPageOverlay ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (copy), l_useCurrentSquadId_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v41 (copy), l_SearchConstants_0 (copy), v5 (copy), l_useAnimatedBinding_0 (copy), v6 (copy), v33 (copy), l_SessionType_0 (copy), l_FFlagLuaAppResetSlpSessionId_0 (copy), v38 (copy), l_SearchLandingPageSession_0 (copy), v34 (copy), l_ApiFetchSearchLandingPage_0 (copy), l_SearchLandingPageSurface_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_NAV_BAR_SIZE_0 (copy), v35 (copy), l_FIntSearchLandingPageSideMargin_0 (copy), v37 (copy), v36 (copy), v39 (copy)
    local v45 = l_useNavigation_0();
    local v46 = l_useDispatch_0();
    local v47 = l_useStyle_0();
    local v48 = l_useDesignTokens_0();
    local v49 = nil;
    if l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 then
        v49 = l_useCurrentSquadId_0();
    end;
    local v50 = l_useRoactService_0(l_AppEventIngestService_0);
    local v51 = l_useRoactService_0(l_AppSessionService_0);
    local v52 = l_useRoactService_0(l_RoactNetworking_0);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 88 ]]
        return v53.Navigation.currentRoute.key;
    end);
    local v56 = l_useSelector_0(function(v55) --[[ Line: 91 ]]
        return v55.ScreenSize;
    end);
    local v58 = l_useSelector_0(function(v57) --[[ Line: 94 ]]
        -- upvalues: l_FormFactor_0 (ref)
        return v57.FormFactor == l_FormFactor_0.COMPACT;
    end);
    local v60 = if v41 then l_useSelector_0(function(v59) --[[ Line: 98 ]]
        return (v59.AppTopBanner.expanded and not v59.AppTopBanner.isDisabled) == true;
    end) else false;
    local v62 = if v41 then l_useSelector_0(function(v61) --[[ Line: 103 ]]
        return v61.TopBar.statusBarHeight;
    end) else 0;
    local v64 = l_useSelector_0(function(v63) --[[ Line: 107 ]]
        return v63.TopBar.topBarHeight;
    end);
    local v66 = l_useSelector_0(function(v65) --[[ Line: 110 ]]
        return v65.GlobalGuiInset or {
            left = 0, 
            top = 0, 
            right = 0, 
            bottom = 0
        };
    end);
    local v67 = l_SearchConstants_0.getSearchTokens(v48);
    local l_searchMargin_0 = v67.searchMargin;
    local l_shadowBoldness_0 = v67.backgroundContainer.shadowBoldness;
    local l_shadowTopOffset_0 = v67.backgroundContainer.shadowTopOffset;
    local l_shadowBottomOffset_0 = v67.backgroundContainer.shadowBottomOffset;
    local v72 = l_shadowBoldness_0 * 2 + l_searchMargin_0 * 2;
    local v73 = if v41 and v60 then v62 else 0;
    local v74 = if v41 and v60 then v64 - v62 else v64;
    local v75 = if v58 then UDim2.new(0, 0, 0, if v41 then v73 else 0) else UDim2.new(0.5, 0, 0, if v41 then v73 else 0);
    local v76 = if v58 then Vector2.new(0, 0) else Vector2.new(0.5, 0);
    local v77 = if v58 then UDim.new(0, l_searchMargin_0) else UDim.new(0, 0);
    local v78 = if v41 then v74 else v66.top + v64;
    local l_X_0 = v56.X;
    local v80 = if v58 then UDim.new(1, 0) else UDim.new(0, math.clamp(l_X_0 * v67.backgroundContainer.screenWidthScale, math.min(v67.backgroundContainer.minimumWidth, l_X_0 - v67.backgroundContainer.padding), v67.backgroundContainer.maximumWidth) - v72);
    local v81 = v5.useRef(v54);
    local v82 = v5.useRef(v78);
    local v83 = v5.useRef(nil);
    local v84 = v5.useRef(nil);
    local v85, v86 = l_useAnimatedBinding_0(v78);
    local v87, v88 = v5.useState(v44.initialSearchText);
    local v89, v90 = v5.useState({});
    local v91 = if not v87 or v87 == "" then l_SearchConstants_0.OverlayContentPageType.LandingPage else if #v89 > 0 then l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions else l_SearchConstants_0.OverlayContentPageType.NoResults;
    local v94 = v5.useCallback(function(v92) --[[ Line: 169 ]]
        -- upvalues: v58 (copy), v41 (ref), v56 (copy), v66 (copy), v73 (copy), v78 (copy), v86 (copy), v6 (ref)
        local v93 = v58 and (if v41 then v56.Y - v66.top - v73 else v56.Y) or math.clamp(v92, v78, if v41 then v56.Y - v66.top - v73 else v56.Y);
        v86(v6.spring(v93, {
            dampingRatio = 0.9, 
            frequency = 6
        }));
    end, {
        v58, 
        v56, 
        v78, 
        v86, 
        if v41 then v66.top else nil, 
        if v41 then v73 else nil
    });
    local v97 = v5.useCallback(function(v95, v96) --[[ Line: 195 ]]
        -- upvalues: v46 (copy), v33 (ref)
        return v46(v33(v95, v96));
    end, {
        v46
    });
    local v98 = v5.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: v44 (copy), v46 (copy), v51 (copy), l_SessionType_0 (ref)
        if v44.closeCentralOverlayThunk then
            v46(v44.closeCentralOverlayThunk());
        end;
        if v51:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v51:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end, {
        v44.closeCentralOverlayThunk, 
        v46, 
        v51
    });
    local v99 = v5.useCallback(function() --[[ Line: 208 ]]
        -- upvalues: v98 (copy), v51 (copy), l_SessionType_0 (ref)
        v98();
        v51:RemoveSession(l_SessionType_0.StructuralIdentifier.SearchLandingPage);
    end, {
        v98, 
        v51
    });
    local v100 = v5.useCallback(function() --[[ Line: 213 ]]
        -- upvalues: l_FFlagLuaAppResetSlpSessionId_0 (ref), v38 (ref), v51 (copy), l_SessionType_0 (ref), l_SearchLandingPageSession_0 (ref)
        if l_FFlagLuaAppResetSlpSessionId_0 then
            v38(v51);
            return;
        else
            if not v51:SessionExists(l_SessionType_0.StructuralIdentifier.SearchLandingPage) then
                v51:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.StructuralIdentifier.SearchLandingPage);
            end;
            v51:SetMetadata(l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.Metadata.SearchLandingPage.SearchLandingPageSessionId, l_SearchLandingPageSession_0:Get());
            return;
        end;
    end, {
        v51
    });
    local v101 = v5.useCallback(function() --[[ Line: 234 ]]
        -- upvalues: v51 (copy), l_SessionType_0 (ref)
        v51:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
    end, {
        v51
    });
    local v105 = v5.useCallback(function(v102) --[[ Line: 243 ]]
        -- upvalues: v41 (ref), v74 (copy), v66 (copy), v64 (copy), v82 (copy), v94 (copy)
        if not v102 then
            return;
        else
            assert(v102 ~= nil, "onAbsoluteContentSizeChangedCallback: obj is nil");
            local l_Y_0 = v102.AbsoluteContentSize.Y;
            local v104 = if v41 then l_Y_0 + v74 else l_Y_0 + v66.top + v64;
            v82.current = v104;
            v94(v104);
            return;
        end;
    end, {
        if v41 then nil else v66.top, 
        if v41 then nil else v64, 
        v94, 
        if v41 then v74 else nil
    });
    local v106 = v5.useCallback(function() --[[ Line: 264 ]]
        -- upvalues: v34 (ref), v50 (copy), v81 (copy), v99 (copy)
        v34(v50, "searchLandingPage", "cancel", nil, true, v81.current);
        v99();
    end, {
        v99, 
        v50
    });
    local v107 = v5.useCallback(function() --[[ Line: 269 ]]
        -- upvalues: v100 (copy), v101 (copy), v34 (ref), v50 (copy), v81 (copy)
        v100();
        v101();
        v34(v50, "searchLandingPage", "open", nil, true, v81.current);
    end, {
        v50, 
        v100, 
        v101
    });
    local v112 = v5.useCallback(function(v108, v109, v110) --[[ Line: 276 ]]
        -- upvalues: v44 (copy), v45 (copy), v51 (copy), v50 (copy), v97 (copy), v99 (copy)
        local v111 = {
            isAutocompleteSuggestion = v109, 
            allAutocompleteSuggestions = v110, 
            searchType = v44.searchType, 
            isAvatarAutocompleteEnabled = false, 
            navigation = v45, 
            pageOwner = v45.state.routeName, 
            sessionService = v51, 
            eventIngest = v50
        };
        v97(v108, v111);
        v99();
    end, {
        v97, 
        v99, 
        v44.searchType, 
        v50, 
        v51, 
        v45
    });
    v5.useEffect(function() --[[ Line: 295 ]]
        -- upvalues: l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (ref), v49 (ref), v46 (copy), l_ApiFetchSearchLandingPage_0 (ref), v52 (copy), l_SearchLandingPageSession_0 (ref), l_SearchLandingPageSurface_0 (ref), v100 (copy), v99 (copy)
        if l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 and v49 ~= "" and v49 ~= nil then
            v46(l_ApiFetchSearchLandingPage_0(v52, l_SearchLandingPageSession_0:Get(), l_SearchLandingPageSurface_0.Party));
        else
            v46(l_ApiFetchSearchLandingPage_0(v52, l_SearchLandingPageSession_0:Get()));
        end;
        v100();
        return function() --[[ Line: 313 ]]
            -- upvalues: v99 (ref)
            v99();
        end;
    end, {
        v100, 
        v99, 
        v52, 
        v46, 
        v51, 
        v49
    });
    v5.useEffect(function() --[[ Line: 321 ]]
        -- upvalues: v91 (copy), l_SearchConstants_0 (ref), v94 (copy), v82 (copy), v67 (copy), v78 (copy)
        if v91 == l_SearchConstants_0.OverlayContentPageType.LandingPage then
            v94(v82.current);
            return;
        elseif v91 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then
            v94(v67.searchBarListPicker.height + v78);
            return;
        else
            if v91 == l_SearchConstants_0.OverlayContentPageType.NoResults then
                v94(v78);
            end;
            return;
        end;
    end, {
        v91, 
        v78, 
        v94
    });
    v5.useEffect(function() --[[ Line: 337 ]]
        -- upvalues: v54 (copy), v81 (copy), v98 (copy)
        if v54 ~= v81.current then
            v98();
        end;
    end, {
        v54, 
        v98
    });
    return v5.createElement(v5.Fragment, nil, {
        AbsorbInput = v5.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, if v41 then if v58 then -v73 else v66.top else 0), 
            Position = UDim2.new(0.5, 0, 0.5, if v41 then if v58 then v73 * 0.5 else -v66.top * 0.5 else 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = "", 
            TextTransparency = 1, 
            BackgroundTransparency = v48.Semantic.Color.Common.Overlay.Transparency, 
            BackgroundColor3 = v48.Semantic.Color.Common.Overlay.Color3, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            [v5.Event.Activated] = v106, 
            ZIndex = 1, 
            Selectable = false
        }), 
        OverlayContainer = v5.createElement("TextButton", {
            Position = v75, 
            AnchorPoint = v76, 
            Size = v85:map(function(v113) --[[ Line: 376 ]]
                -- upvalues: v58 (copy), v80 (copy)
                if v58 then
                    return UDim2.new(1, 0, 0, v113);
                else
                    return UDim2.new(v80.Scale, v80.Offset, 0, v113);
                end;
            end), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            ZIndex = 2, 
            ClipsDescendants = v58, 
            AutoButtonColor = false, 
            Active = true, 
            Text = ""
        }, {
            Shadow = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -l_shadowBoldness_0 - l_shadowTopOffset_0), 
                Size = UDim2.new(1, v72, 1, l_shadowBoldness_0 * 2 + l_shadowTopOffset_0 + l_shadowBottomOffset_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = -1, 
                Image = l_Images_0["component_assets/dropshadow_16_20"], 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(28, 28, 29, 29), 
                ImageColor3 = v47.Theme.DropShadow.Color, 
                ImageTransparency = v47.Theme.DropShadow.Transparency
            }, {
                Background = v5.createElement("Frame", {
                    Position = UDim2.new(0, l_shadowBoldness_0, 0, l_shadowBoldness_0), 
                    Size = UDim2.new(1, -l_shadowBoldness_0 * 2, 1, -l_shadowBoldness_0 * 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v67.backgroundContainer.backgroundColor3, 
                    BackgroundTransparency = v67.backgroundContainer.backgroundTransparency
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
                    PaddingLeft = v77, 
                    PaddingRight = v77, 
                    PaddingTop = UDim.new(0, v78 - l_NAV_BAR_SIZE_0)
                }), 
                Layout = v5.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                SearchBar = v5.createElement(v35, {
                    layoutOrder = 1, 
                    Size = UDim2.new(1, v58 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2, 0, l_NAV_BAR_SIZE_0), 
                    anchorPoint = Vector2.new(0.5, 0), 
                    cancelSearch = v106, 
                    confirmSearch = v112, 
                    onFocused = v107, 
                    isCompactView = false, 
                    placeholderText = v44.placeholderText, 
                    searchType = v44.searchType, 
                    autocomplete = true, 
                    focusController = v44.focusController, 
                    isSearching = true, 
                    animated = true, 
                    modernUI = true, 
                    initialSearchText = v44.initialSearchText, 
                    searchBarPadding = 0, 
                    disableListPicker = true, 
                    onTextChanged = v88, 
                    onPickerItemsChanged = v90, 
                    listPickerRef = v84, 
                    updateAutocompleteOnMount = true, 
                    animationSettings = if not v58 then {
                        originalWidth = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE, 
                        animationStyle = l_SearchConstants_0.SearchBarAnimationStyle.ExpandFromCenter
                    } else nil
                }), 
                Content = if v91 == l_SearchConstants_0.OverlayContentPageType.LandingPage then v5.createElement(v37, {
                    layoutOrder = 2, 
                    size = UDim2.new(1, l_searchMargin_0 * 2, 1, -v78), 
                    position = UDim2.new(0.5, 0, 0, 0), 
                    scrollingFrameRef = v83, 
                    onAbsoluteContentSizeChanged = v105, 
                    isCompactView = v58, 
                    defaultContainerSize = Vector2.new(v56.X * v80.Scale + v80.Offset + l_searchMargin_0 * 2, 0)
                }) else if v91 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then v5.createElement(v36, {
                    layoutOrder = 2, 
                    items = v89, 
                    width = UDim.new(1, v58 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2), 
                    height = UDim.new(1, -v78), 
                    BackgroundTransparency = 1, 
                    removeAdditionalMargins = true, 
                    ref = v84, 
                    currentKeyword = if v39 then v87 else nil
                }) else nil
            })
        })
    });
end;
return SearchPageOverlay;