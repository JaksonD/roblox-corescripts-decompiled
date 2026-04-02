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
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useCurrentSquadId_0 = v10.Hooks.useCurrentSquadId;
local l_SearchLandingPageSurface_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchLandingPageSurface;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchConstants_0 = l_Modules_0.Personalization.Search.SearchConstants;
local l_SearchLandingPageSession_0 = l_Modules_0.Personalization.Sessions.SearchLandingPageSession;
local l_ApiFetchSearchLandingPage_0 = l_Modules_0.LuaApp.Thunks.Search.ApiFetchSearchLandingPage;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v29 = require(l_Modules_1.LuaApp.Constants);
local v30 = require(l_Modules_1.LuaApp.Thunks.ConfirmSearch);
local v31 = require(l_Modules_1.LuaApp.Analytics.Events.search);
local v32 = require(l_Modules_1.LuaApp.Components.SearchBar);
local v33 = require(l_Modules_1.LuaApp.Components.SearchBarListPicker);
local v34 = require(l_Modules_1.Personalization.Search.SearchLandingPage);
local v35 = require(l_Modules_1.Personalization.Sessions.setSearchLandingPageSessionInfo);
local v36 = require(l_Modules_1.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions);
local l_FIntSearchLandingPageSideMargin_0 = l_Modules_0.Personalization.Search.FIntSearchLandingPageSideMargin;
local v38 = game:DefineFastFlag("SearchOverlayIgnoreTopGuiInset", false);
local l_FFlagLuaAppResetSlpSessionId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppResetSlpSessionId;
local l_NAV_BAR_SIZE_0 = v29.NAV_BAR_SIZE;
SearchPageOverlay = function(v41) --[[ Line: 70 ]] --[[ Name: SearchPageOverlay ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useCurrentSquadId_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v38 (copy), l_SearchConstants_0 (copy), v5 (copy), l_useAnimatedBinding_0 (copy), v6 (copy), v30 (copy), l_SessionType_0 (copy), l_FFlagLuaAppResetSlpSessionId_0 (copy), v35 (copy), l_SearchLandingPageSession_0 (copy), v31 (copy), l_ApiFetchSearchLandingPage_0 (copy), l_SearchLandingPageSurface_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_NAV_BAR_SIZE_0 (copy), v32 (copy), l_FIntSearchLandingPageSideMargin_0 (copy), v34 (copy), v33 (copy), v36 (copy)
    local v42 = l_useNavigation_0();
    local v43 = l_useDispatch_0();
    local v44 = l_useStyle_0();
    local v45 = l_useDesignTokens_0();
    local v46 = l_useCurrentSquadId_0();
    local v47 = l_useRoactService_0(l_AppEventIngestService_0);
    local v48 = l_useRoactService_0(l_AppSessionService_0);
    local v49 = l_useRoactService_0(l_RoactNetworking_0);
    local v51 = l_useSelector_0(function(v50) --[[ Line: 81 ]]
        return v50.Navigation.currentRoute.key;
    end);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 84 ]]
        return v52.ScreenSize;
    end);
    local v55 = l_useSelector_0(function(v54) --[[ Line: 87 ]]
        -- upvalues: l_FormFactor_0 (ref)
        return v54.FormFactor == l_FormFactor_0.COMPACT;
    end);
    local v57 = if v38 then l_useSelector_0(function(v56) --[[ Line: 91 ]]
        return (v56.AppTopBanner.expanded and not v56.AppTopBanner.isDisabled) == true;
    end) else false;
    local v59 = if v38 then l_useSelector_0(function(v58) --[[ Line: 96 ]]
        return v58.TopBar.statusBarHeight;
    end) else 0;
    local v61 = l_useSelector_0(function(v60) --[[ Line: 100 ]]
        return v60.TopBar.topBarHeight;
    end);
    local v63 = l_useSelector_0(function(v62) --[[ Line: 103 ]]
        return v62.GlobalGuiInset or {
            left = 0, 
            top = 0, 
            right = 0, 
            bottom = 0
        };
    end);
    local v64 = l_SearchConstants_0.getSearchTokens(v45);
    local l_searchMargin_0 = v64.searchMargin;
    local l_shadowBoldness_0 = v64.backgroundContainer.shadowBoldness;
    local l_shadowTopOffset_0 = v64.backgroundContainer.shadowTopOffset;
    local l_shadowBottomOffset_0 = v64.backgroundContainer.shadowBottomOffset;
    local v69 = l_shadowBoldness_0 * 2 + l_searchMargin_0 * 2;
    local v70 = if v38 and v57 then v59 else 0;
    local v71 = if v38 and v57 then v61 - v59 else v61;
    local v72 = if v55 then UDim2.new(0, 0, 0, if v38 then v70 else 0) else UDim2.new(0.5, 0, 0, if v38 then v70 else 0);
    local v73 = if v55 then Vector2.new(0, 0) else Vector2.new(0.5, 0);
    local v74 = if v55 then UDim.new(0, l_searchMargin_0) else UDim.new(0, 0);
    local v75 = if v38 then v71 else v63.top + v61;
    local l_X_0 = v53.X;
    local v77 = if v55 then UDim.new(1, 0) else UDim.new(0, math.clamp(l_X_0 * v64.backgroundContainer.screenWidthScale, math.min(v64.backgroundContainer.minimumWidth, l_X_0 - v64.backgroundContainer.padding), v64.backgroundContainer.maximumWidth) - v69);
    local v78 = v5.useRef(v51);
    local v79 = v5.useRef(v75);
    local v80 = v5.useRef(nil);
    local v81 = v5.useRef(nil);
    local v82, v83 = l_useAnimatedBinding_0(v75);
    local v84, v85 = v5.useState(v41.initialSearchText);
    local v86, v87 = v5.useState({});
    local v88 = if not v84 or v84 == "" then l_SearchConstants_0.OverlayContentPageType.LandingPage else if #v86 > 0 then l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions else l_SearchConstants_0.OverlayContentPageType.NoResults;
    local v91 = v5.useCallback(function(v89) --[[ Line: 162 ]]
        -- upvalues: v55 (copy), v38 (ref), v53 (copy), v63 (copy), v70 (copy), v75 (copy), v83 (copy), v6 (ref)
        local v90 = v55 and (if v38 then v53.Y - v63.top - v70 else v53.Y) or math.clamp(v89, v75, if v38 then v53.Y - v63.top - v70 else v53.Y);
        v83(v6.spring(v90, {
            dampingRatio = 0.9, 
            frequency = 6
        }));
    end, {
        v55, 
        v53, 
        v75, 
        v83, 
        if v38 then v63.top else nil, 
        if v38 then v70 else nil
    });
    local v94 = v5.useCallback(function(v92, v93) --[[ Line: 188 ]]
        -- upvalues: v43 (copy), v30 (ref)
        return v43(v30(v92, v93));
    end, {
        v43
    });
    local v95 = v5.useCallback(function() --[[ Line: 192 ]]
        -- upvalues: v41 (copy), v43 (copy), v48 (copy), l_SessionType_0 (ref)
        if v41.closeCentralOverlayThunk then
            v43(v41.closeCentralOverlayThunk());
        end;
        if v48:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
            v48:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end, {
        v41.closeCentralOverlayThunk, 
        v43, 
        v48
    });
    local v96 = v5.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v95 (copy), v48 (copy), l_SessionType_0 (ref)
        v95();
        v48:RemoveSession(l_SessionType_0.StructuralIdentifier.SearchLandingPage);
    end, {
        v95, 
        v48
    });
    local v97 = v5.useCallback(function() --[[ Line: 206 ]]
        -- upvalues: l_FFlagLuaAppResetSlpSessionId_0 (ref), v35 (ref), v48 (copy), l_SessionType_0 (ref), l_SearchLandingPageSession_0 (ref)
        if l_FFlagLuaAppResetSlpSessionId_0 then
            v35(v48);
            return;
        else
            if not v48:SessionExists(l_SessionType_0.StructuralIdentifier.SearchLandingPage) then
                v48:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.StructuralIdentifier.SearchLandingPage);
            end;
            v48:SetMetadata(l_SessionType_0.StructuralIdentifier.SearchLandingPage, l_SessionType_0.Metadata.SearchLandingPage.SearchLandingPageSessionId, l_SearchLandingPageSession_0:Get());
            return;
        end;
    end, {
        v48
    });
    local v98 = v5.useCallback(function() --[[ Line: 227 ]]
        -- upvalues: v48 (copy), l_SessionType_0 (ref)
        v48:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
    end, {
        v48
    });
    local v102 = v5.useCallback(function(v99) --[[ Line: 236 ]]
        -- upvalues: v38 (ref), v71 (copy), v63 (copy), v61 (copy), v79 (copy), v91 (copy)
        if not v99 then
            return;
        else
            assert(v99 ~= nil, "onAbsoluteContentSizeChangedCallback: obj is nil");
            local l_Y_0 = v99.AbsoluteContentSize.Y;
            local v101 = if v38 then l_Y_0 + v71 else l_Y_0 + v63.top + v61;
            v79.current = v101;
            v91(v101);
            return;
        end;
    end, {
        if v38 then nil else v63.top, 
        if v38 then nil else v61, 
        v91, 
        if v38 then v71 else nil
    });
    local v103 = v5.useCallback(function() --[[ Line: 257 ]]
        -- upvalues: v31 (ref), v47 (copy), v78 (copy), v96 (copy)
        v31(v47, "searchLandingPage", "cancel", nil, true, v78.current);
        v96();
    end, {
        v96, 
        v47
    });
    local v104 = v5.useCallback(function() --[[ Line: 262 ]]
        -- upvalues: v97 (copy), v98 (copy), v31 (ref), v47 (copy), v78 (copy)
        v97();
        v98();
        v31(v47, "searchLandingPage", "open", nil, true, v78.current);
    end, {
        v47, 
        v97, 
        v98
    });
    local v109 = v5.useCallback(function(v105, v106, v107) --[[ Line: 269 ]]
        -- upvalues: v41 (copy), v42 (copy), v48 (copy), v47 (copy), v94 (copy), v96 (copy)
        local v108 = {
            isAutocompleteSuggestion = v106, 
            allAutocompleteSuggestions = v107, 
            searchType = v41.searchType, 
            isAvatarAutocompleteEnabled = false, 
            navigation = v42, 
            pageOwner = v42.state.routeName, 
            sessionService = v48, 
            eventIngest = v47
        };
        v94(v105, v108);
        v96();
    end, {
        v94, 
        v96, 
        v41.searchType, 
        v47, 
        v48, 
        v42
    });
    v5.useEffect(function() --[[ Line: 288 ]]
        -- upvalues: v46 (copy), v43 (copy), l_ApiFetchSearchLandingPage_0 (ref), v49 (copy), l_SearchLandingPageSession_0 (ref), l_SearchLandingPageSurface_0 (ref), v97 (copy), v96 (copy)
        if v46 ~= "" and v46 ~= nil then
            v43(l_ApiFetchSearchLandingPage_0(v49, l_SearchLandingPageSession_0:Get(), l_SearchLandingPageSurface_0.Party));
        else
            v43(l_ApiFetchSearchLandingPage_0(v49, l_SearchLandingPageSession_0:Get()));
        end;
        v97();
        return function() --[[ Line: 302 ]]
            -- upvalues: v96 (ref)
            v96();
        end;
    end, {
        v97, 
        v96, 
        v49, 
        v43, 
        v48, 
        v46
    });
    v5.useEffect(function() --[[ Line: 310 ]]
        -- upvalues: v88 (copy), l_SearchConstants_0 (ref), v91 (copy), v79 (copy), v64 (copy), v75 (copy)
        if v88 == l_SearchConstants_0.OverlayContentPageType.LandingPage then
            v91(v79.current);
            return;
        elseif v88 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then
            v91(v64.searchBarListPicker.height + v75);
            return;
        else
            if v88 == l_SearchConstants_0.OverlayContentPageType.NoResults then
                v91(v75);
            end;
            return;
        end;
    end, {
        v88, 
        v75, 
        v91
    });
    v5.useEffect(function() --[[ Line: 326 ]]
        -- upvalues: v51 (copy), v78 (copy), v95 (copy)
        if v51 ~= v78.current then
            v95();
        end;
    end, {
        v51, 
        v95
    });
    return v5.createElement(v5.Fragment, nil, {
        AbsorbInput = v5.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, if v38 then if v55 then -v70 else v63.top else 0), 
            Position = UDim2.new(0.5, 0, 0.5, if v38 then if v55 then v70 * 0.5 else -v63.top * 0.5 else 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = "", 
            TextTransparency = 1, 
            BackgroundTransparency = v45.Semantic.Color.Common.Overlay.Transparency, 
            BackgroundColor3 = v45.Semantic.Color.Common.Overlay.Color3, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            [v5.Event.Activated] = v103, 
            ZIndex = 1, 
            Selectable = false
        }), 
        OverlayContainer = v5.createElement("TextButton", {
            Position = v72, 
            AnchorPoint = v73, 
            Size = v82:map(function(v110) --[[ Line: 365 ]]
                -- upvalues: v55 (copy), v77 (copy)
                if v55 then
                    return UDim2.new(1, 0, 0, v110);
                else
                    return UDim2.new(v77.Scale, v77.Offset, 0, v110);
                end;
            end), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            ZIndex = 2, 
            ClipsDescendants = v55, 
            AutoButtonColor = false, 
            Active = true, 
            Text = ""
        }, {
            Shadow = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -l_shadowBoldness_0 - l_shadowTopOffset_0), 
                Size = UDim2.new(1, v69, 1, l_shadowBoldness_0 * 2 + l_shadowTopOffset_0 + l_shadowBottomOffset_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = -1, 
                Image = l_Images_0["component_assets/dropshadow_16_20"], 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(28, 28, 29, 29), 
                ImageColor3 = v44.Theme.DropShadow.Color, 
                ImageTransparency = v44.Theme.DropShadow.Transparency
            }, {
                Background = v5.createElement("Frame", {
                    Position = UDim2.new(0, l_shadowBoldness_0, 0, l_shadowBoldness_0), 
                    Size = UDim2.new(1, -l_shadowBoldness_0 * 2, 1, -l_shadowBoldness_0 * 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v64.backgroundContainer.backgroundColor3, 
                    BackgroundTransparency = v64.backgroundContainer.backgroundTransparency
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
                    PaddingLeft = v74, 
                    PaddingRight = v74, 
                    PaddingTop = UDim.new(0, v75 - l_NAV_BAR_SIZE_0)
                }), 
                Layout = v5.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                SearchBar = v5.createElement(v32, {
                    layoutOrder = 1, 
                    Size = UDim2.new(1, v55 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2, 0, l_NAV_BAR_SIZE_0), 
                    anchorPoint = Vector2.new(0.5, 0), 
                    cancelSearch = v103, 
                    confirmSearch = v109, 
                    onFocused = v104, 
                    isCompactView = false, 
                    placeholderText = v41.placeholderText, 
                    searchType = v41.searchType, 
                    autocomplete = true, 
                    focusController = v41.focusController, 
                    isSearching = true, 
                    animated = true, 
                    modernUI = true, 
                    initialSearchText = v41.initialSearchText, 
                    searchBarPadding = 0, 
                    disableListPicker = true, 
                    onTextChanged = v85, 
                    onPickerItemsChanged = v87, 
                    listPickerRef = v81, 
                    updateAutocompleteOnMount = true, 
                    animationSettings = if not v55 then {
                        originalWidth = l_SearchConstants_0.NON_COMPACT_SEARCH_BAR_SIZE, 
                        animationStyle = l_SearchConstants_0.SearchBarAnimationStyle.ExpandFromCenter
                    } else nil
                }), 
                Content = if v88 == l_SearchConstants_0.OverlayContentPageType.LandingPage then v5.createElement(v34, {
                    layoutOrder = 2, 
                    size = UDim2.new(1, l_searchMargin_0 * 2, 1, -v75), 
                    position = UDim2.new(0.5, 0, 0, 0), 
                    scrollingFrameRef = v80, 
                    onAbsoluteContentSizeChanged = v102, 
                    isCompactView = v55, 
                    defaultContainerSize = Vector2.new(v53.X * v77.Scale + v77.Offset + l_searchMargin_0 * 2, 0)
                }) else if v88 == l_SearchConstants_0.OverlayContentPageType.AutocompleteSuggestions then v5.createElement(v33, {
                    layoutOrder = 2, 
                    items = v86, 
                    width = UDim.new(1, v55 and 0 or l_searchMargin_0 * 2 - l_FIntSearchLandingPageSideMargin_0 * 2), 
                    height = UDim.new(1, -v75), 
                    BackgroundTransparency = 1, 
                    removeAdditionalMargins = true, 
                    ref = v81, 
                    currentKeyword = if v36 then v84 else nil
                }) else nil
            })
        })
    });
end;
return SearchPageOverlay;