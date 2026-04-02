local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_Loading_0 = v5.Loading;
local l_useTokens_0 = v5.Hooks.useTokens;
local v8 = require(l_Parent_0.DataHydration);
local v9 = require(l_Parent_0.ReactFocusNavigation);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_useCloseWithBackButton_0 = require(l_Parent_0.AppBlox).useCloseWithBackButton;
local v13 = require(l_Parent_0.SignalsReact);
local v14 = require(l_Parent_0.CollectionViews);
local l_CollectionItemSize_0 = v14.CollectionViewTypes.CollectionItemSize;
local l_getSduiComponentWrapper_0 = require(l_Parent_0.SduiCoreSystem).getSduiComponentWrapper;
local v17 = require(l_script_FirstAncestor_0.getSduiApiStore);
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
local v19 = require(l_script_FirstAncestor_0.SduiPageNavigationHeader);
local v20 = require(l_script_FirstAncestor_0.useCreateClientBindingSduiContext);
local l_NavButtonType_0 = require(l_script_FirstAncestor_0.SduiIntegrationTypes).NavButtonType;
local v22 = require(l_script_FirstAncestor_0.SduiPageErrorState);
local l_DataHydrationTypes_0 = v8.DataHydrationTypes;
local l_usePageSideMargin_0 = v14.usePageSideMargin;
local v25 = require(l_script_FirstAncestor_0.usePageEntrySnackbar);
local v26 = require(l_script_FirstAncestor_0.hooks.useComponentLifecycleTiming);
local v27 = require(l_script_FirstAncestor_0.hooks.useLocalAnalyticsData);
local v28 = require(l_script_FirstAncestor_0.hooks.useStatefulRef);
local v29 = require(l_script_FirstAncestor_0.hooks.useComponentConfig);
local l_Snackbar_0 = v5.Snackbar;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = require(l_Parent_0.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix;
local l_FFlagLuaAppSduiPageEntryPointSnackbar_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiPageEntryPointSnackbar;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiPageEntryUseSharedHooks_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryUseSharedHooks;
local function v76(v37, v38) --[[ Line: 101 ]] --[[ Name: SduiPageEntryPoint ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), v29 (copy), v4 (copy), v17 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), v13 (copy), l_DataHydrationTypes_0 (copy), v26 (copy), v27 (copy), v28 (copy), l_NavigateBack_0 (copy), v9 (copy), l_useCloseWithBackButton_0 (copy), l_FFlagLuaAppSduiPageEntryPointSnackbar_0 (copy), v25 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v20 (copy), l_usePageSideMargin_0 (copy), l_CollectionItemSize_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v19 (copy), l_NavButtonType_0 (copy), v5 (copy), l_Loading_0 (copy), v22 (copy), v3 (copy), l_Snackbar_0 (copy), l_CoreGui_0 (copy)
    local l_appPage_0 = v37.appPage;
    local v40 = v37.configKey or l_appPage_0;
    local v41 = ("SduiPageEntryPoint-%*"):format(v40);
    local l_pageTimer_0 = v37.pageTimer;
    local v43 = l_useTokens_0();
    local v44 = l_useDispatch_0();
    local v45 = nil;
    if l_FFlagSduiPageEntryUseSharedHooks_0 then
        v45 = v29(v40, v37.identifier);
    else
        local v47 = v4.useCallback(function(v46) --[[ Line: 115 ]]
            -- upvalues: v17 (ref), v40 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (ref), v37 (copy)
            return v17().getRootConfig(v40, v46, if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v37.identifier else nil);
        end, {
            v40, 
            if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v37.identifier else nil
        });
        v45 = v13.useSignalState(v47);
    end;
    local v49 = v4.useCallback(function(v48) --[[ Line: 126 ]]
        -- upvalues: v17 (ref), v40 (copy)
        return v17().getTitle(v40, v48);
    end, {
        v40
    });
    local v50 = v13.useSignalState(v49) or v37.pageTitle;
    local v51 = v13.useSignalState(v17().getData(v40).status);
    local v52 = v51 == l_DataHydrationTypes_0.DataStatus.NotReady;
    local v53 = v51 == l_DataHydrationTypes_0.DataStatus.Failed;
    if l_FFlagSduiPageEntryUseSharedHooks_0 then
        v26(l_pageTimer_0, typeof(v45) == "table");
    else
        v4.useEffect(function() --[[ Line: 139 ]]
            -- upvalues: l_pageTimer_0 (copy)
            if l_pageTimer_0 then
                l_pageTimer_0.logComponentMounted();
            end;
        end, {
            l_pageTimer_0
        });
        v4.useEffect(function() --[[ Line: 145 ]]
            -- upvalues: l_pageTimer_0 (copy), v45 (ref)
            if l_pageTimer_0 and v45 then
                l_pageTimer_0.logComponentReady();
            end;
        end, {
            l_pageTimer_0, 
            v45
        });
    end;
    local v54 = if l_FFlagSduiPageEntryUseSharedHooks_0 then v27(v40, l_appPage_0, v37.additionalAnalyticsData) else v4.useMemo(function() --[[ Line: 154 ]]
        -- upvalues: v40 (copy), l_appPage_0 (copy)
        return {
            configKey = v40, 
            appPage = l_appPage_0
        };
    end, {
        v40, 
        l_appPage_0
    });
    local v55 = nil;
    local v56 = nil;
    if l_FFlagSduiPageEntryUseSharedHooks_0 then
        local v57, v58 = v28(v38);
        v55 = v57;
        v56 = v58;
    else
        local v59, v60 = v4.useState(nil);
        v55 = v59;
        v56 = v60;
        v4.useRef(v55).current = v55;
    end;
    local v61 = v4.useCallback(function() --[[ Line: 171 ]]
        -- upvalues: v37 (copy), v44 (copy), l_NavigateBack_0 (ref)
        if v37.onCloseActivated then
            v37.onCloseActivated();
            return;
        else
            v44(l_NavigateBack_0());
            return;
        end;
    end, {
        v44, 
        v37.onCloseActivated
    });
    local _, v63 = v9.useMostRecentOrDefaultFocusBehavior(v56);
    local v64 = l_useCloseWithBackButton_0(v63, v61);
    local v65 = if l_FFlagLuaAppSduiPageEntryPointSnackbar_0 then v25(v40) else nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    if l_FFlagSduiCoreBadgeDetailsSupport_0 then
        local v71, v72 = v4.useState(nil);
        v66 = v71;
        v67 = v72;
        v68 = v20(l_appPage_0, v66, 0);
        v69 = v55 == nil;
        v70 = l_usePageSideMargin_0(v55);
    else
        v68 = v20(l_appPage_0, v55);
        v70 = v13.useSignalState(v68.getPageLayoutConfig(l_CollectionItemSize_0.Small)).sideMargin;
    end;
    local v74 = v4.useMemo(function() --[[ Line: 207 ]]
        -- upvalues: v45 (ref), l_getSduiComponentWrapper_0 (ref), v4 (ref), v41 (copy), v68 (ref), v54 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (ref), v37 (copy)
        if v45 == nil then
            return nil;
        else
            local v73 = l_getSduiComponentWrapper_0(v45);
            return v4.createElement(v73, {
                debugName = v41, 
                componentConfig = v45, 
                sduiContext = v68, 
                localAnalyticsData = v54, 
                extraLocalProps = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then {
                    pageBottomPadding = v37.pageBottomPadding, 
                    scrollingFrameRef = v37.scrollingFrameRef
                } else nil
            });
        end;
    end, {
        v45, 
        v41, 
        v68, 
        v54
    });
    local v75 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v37.scrollingFrameRef ~= nil else nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, v75 and 0 or 1, 0), 
        AutomaticSize = if v75 then Enum.AutomaticSize.Y else nil, 
        BorderSizePixel = 0, 
        BackgroundTransparency = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v37.backgroundStyle then v37.backgroundStyle.Transparency else 0, 
        BackgroundColor3 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v37.backgroundStyle then v37.backgroundStyle.Color3 else v43.Color.Surface.Surface_0.Color3, 
        ref = v64, 
        ClipsDescendants = if l_FFlagSduiExperienceDetailsSupport_0 and v37.clipsDescendantsOverride ~= nil then v37.clipsDescendantsOverride else l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = if l_FFlagSduiCoreBadgeDetailsSupport_0 then Enum.HorizontalAlignment.Center else nil
        }), 
        PageHeader = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v69 then nil else if v37.includeNavigationHeaderBar then v4.createElement(v19, {
            title = v50, 
            pageSideMargin = v70, 
            layoutOrder = 1, 
            renderUtilities = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v37.renderUtilities else nil, 
            navButtonType = v37.navButtonType or l_NavButtonType_0.back, 
            closeCallback = v61
        }) else nil, 
        PageBody = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v52 then v4.createElement(v5.View, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v4.createElement(l_Loading_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        })) else if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v53 then v4.createElement(v22, {
            refresh = v37.refresh
        }) else v4.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, (not l_FFlagSduiCoreBadgeDetailsSupport_0 or v37.disableRootPadding) and 0 or -2 * v70, v75 and 0 or 1, 0), 
            AutomaticSize = if v75 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ref = if l_FFlagSduiCoreBadgeDetailsSupport_0 then v67 else nil
        }, {
            UIFlexItem = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v75 then nil else v4.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            Content = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v69 then nil else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v52 then v4.createElement(l_Loading_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            }) else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v53 then v4.createElement(v22, {
                refresh = v37.refresh
            }) else v74
        }), 
        SnackbarPortal = if v65 and v65.snackbarConfig then v3.createPortal({
            SduiSnackbarScreenGui = v4.createElement("ScreenGui", {
                DisplayOrder = v37.snackbarPortalLayoutOrder, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                IgnoreGuiInset = true
            }, {
                Snackbar = v4.createElement(l_Snackbar_0, {
                    title = v65.snackbarConfig.title, 
                    icon = v65.snackbarConfig.icon, 
                    Position = UDim2.new(0.5, 0, 1, -v43.Padding.XLarge), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    onClose = v65.onDismiss
                })
            })
        }, l_CoreGui_0) else nil
    });
end;
if l_FFlagSduiPageEntryUseSharedHooks_0 then
    return v4.memo(v4.forwardRef(v76));
else
    return v4.memo(v76);
end;