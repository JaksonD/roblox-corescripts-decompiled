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
local l_Snackbar_0 = v5.Snackbar;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = require(l_Parent_0.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix;
local l_FFlagLuaAppSduiPageEntryPointSnackbar_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiPageEntryPointSnackbar;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
return v4.memo(function(v32) --[[ Line: 93 ]] --[[ Name: SduiPageEntryPoint ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v4 (copy), v17 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), v13 (copy), l_DataHydrationTypes_0 (copy), l_NavigateBack_0 (copy), v9 (copy), l_useCloseWithBackButton_0 (copy), l_FFlagLuaAppSduiPageEntryPointSnackbar_0 (copy), v25 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v20 (copy), l_usePageSideMargin_0 (copy), l_CollectionItemSize_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v19 (copy), l_NavButtonType_0 (copy), v5 (copy), l_Loading_0 (copy), v22 (copy), v3 (copy), l_Snackbar_0 (copy), l_CoreGui_0 (copy)
    local l_appPage_0 = v32.appPage;
    local v34 = v32.configKey or l_appPage_0;
    local v35 = ("SduiPageEntryPoint-%*"):format(v34);
    local l_pageTimer_0 = v32.pageTimer;
    local v37 = l_useTokens_0();
    local v38 = l_useDispatch_0();
    local v40 = v4.useCallback(function(v39) --[[ Line: 103 ]]
        -- upvalues: v17 (ref), v34 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (ref), v32 (copy)
        return v17().getRootConfig(v34, v39, if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v32.identifier else nil);
    end, {
        v34, 
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v32.identifier else nil
    });
    local v41 = v13.useSignalState(v40);
    local v43 = v4.useCallback(function(v42) --[[ Line: 113 ]]
        -- upvalues: v17 (ref), v34 (copy)
        return v17().getTitle(v34, v42);
    end, {
        v34
    });
    local v44 = v13.useSignalState(v43) or v32.pageTitle;
    local v45 = v13.useSignalState(v17().getData(v34).status);
    local v46 = v45 == l_DataHydrationTypes_0.DataStatus.NotReady;
    local v47 = v45 == l_DataHydrationTypes_0.DataStatus.Failed;
    v4.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: l_pageTimer_0 (copy)
        if l_pageTimer_0 then
            l_pageTimer_0.logComponentMounted();
        end;
    end, {
        l_pageTimer_0
    });
    v4.useEffect(function() --[[ Line: 129 ]]
        -- upvalues: l_pageTimer_0 (copy), v41 (copy)
        if l_pageTimer_0 and v41 then
            l_pageTimer_0.logComponentReady();
        end;
    end, {
        l_pageTimer_0, 
        v41
    });
    local v48 = v4.useMemo(function() --[[ Line: 135 ]]
        -- upvalues: v34 (copy), l_appPage_0 (copy)
        return {
            configKey = v34, 
            appPage = l_appPage_0
        };
    end, {
        v34, 
        l_appPage_0
    });
    local v49, v50 = v4.useState(nil);
    v4.useRef(v49).current = v49;
    local v51 = v4.useCallback(function() --[[ Line: 147 ]]
        -- upvalues: v32 (copy), v38 (copy), l_NavigateBack_0 (ref)
        if v32.onCloseActivated then
            v32.onCloseActivated();
            return;
        else
            v38(l_NavigateBack_0());
            return;
        end;
    end, {
        v38, 
        v32.onCloseActivated
    });
    local _, v53 = v9.useMostRecentOrDefaultFocusBehavior(v50);
    local v54 = l_useCloseWithBackButton_0(v53, v51);
    local v55 = if l_FFlagLuaAppSduiPageEntryPointSnackbar_0 then v25(v34) else nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    if l_FFlagSduiCoreBadgeDetailsSupport_0 then
        local v61, v62 = v4.useState(nil);
        v56 = v61;
        v57 = v62;
        v58 = v20(l_appPage_0, v56, 0);
        v59 = v49 == nil;
        v60 = l_usePageSideMargin_0(v49);
    else
        v58 = v20(l_appPage_0, v49);
        v60 = v13.useSignalState(v58.getPageLayoutConfig(l_CollectionItemSize_0.Small)).sideMargin;
    end;
    local v64 = v4.useMemo(function() --[[ Line: 183 ]]
        -- upvalues: v41 (copy), l_getSduiComponentWrapper_0 (ref), v4 (ref), v35 (copy), v58 (ref), v48 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (ref), v32 (copy)
        if v41 == nil then
            return nil;
        else
            local v63 = l_getSduiComponentWrapper_0(v41);
            return v4.createElement(v63, {
                debugName = v35, 
                componentConfig = v41, 
                sduiContext = v58, 
                localAnalyticsData = v48, 
                extraLocalProps = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then {
                    pageBottomPadding = v32.pageBottomPadding, 
                    scrollingFrameRef = v32.scrollingFrameRef
                } else nil
            });
        end;
    end, {
        v41, 
        v35, 
        v58, 
        v48
    });
    local v65 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v32.scrollingFrameRef ~= nil else nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, v65 and 0 or 1, 0), 
        AutomaticSize = if v65 then Enum.AutomaticSize.Y else nil, 
        BorderSizePixel = 0, 
        BackgroundTransparency = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v32.backgroundStyle then v32.backgroundStyle.Transparency else 0, 
        BackgroundColor3 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v32.backgroundStyle then v32.backgroundStyle.Color3 else v37.Color.Surface.Surface_0.Color3, 
        ref = v54, 
        ClipsDescendants = if l_FFlagSduiExperienceDetailsSupport_0 and v32.clipsDescendantsOverride ~= nil then v32.clipsDescendantsOverride else l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = if l_FFlagSduiCoreBadgeDetailsSupport_0 then Enum.HorizontalAlignment.Center else nil
        }), 
        PageHeader = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v59 then nil else if v32.includeNavigationHeaderBar then v4.createElement(v19, {
            title = v44, 
            pageSideMargin = v60, 
            layoutOrder = 1, 
            renderUtilities = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v32.renderUtilities else nil, 
            navButtonType = v32.navButtonType or l_NavButtonType_0.back, 
            closeCallback = v51
        }) else nil, 
        PageBody = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v46 then v4.createElement(v5.View, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v4.createElement(l_Loading_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        })) else if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v47 then v4.createElement(v22, {
            refresh = v32.refresh
        }) else v4.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, (not l_FFlagSduiCoreBadgeDetailsSupport_0 or v32.disableRootPadding) and 0 or -2 * v60, v65 and 0 or 1, 0), 
            AutomaticSize = if v65 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ref = if l_FFlagSduiCoreBadgeDetailsSupport_0 then v57 else nil
        }, {
            UIFlexItem = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v65 then nil else v4.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            Content = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v59 then nil else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v46 then v4.createElement(l_Loading_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            }) else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v47 then v4.createElement(v22, {
                refresh = v32.refresh
            }) else v64
        }), 
        SnackbarPortal = if v55 and v55.snackbarConfig then v3.createPortal({
            SduiSnackbarScreenGui = v4.createElement("ScreenGui", {
                DisplayOrder = v32.snackbarPortalLayoutOrder, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                IgnoreGuiInset = true
            }, {
                Snackbar = v4.createElement(l_Snackbar_0, {
                    title = v55.snackbarConfig.title, 
                    icon = v55.snackbarConfig.icon, 
                    Position = UDim2.new(0.5, 0, 1, -v37.Padding.XLarge), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    onClose = v55.onDismiss
                })
            })
        }, l_CoreGui_0) else nil
    });
end);