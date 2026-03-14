local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.FullPageNavigationHeader);
local v4 = require(l_script_FirstAncestor_0.Components.FullPageNavigationFooter);
local _ = require(l_script_FirstAncestor_0.Components.ActivationFrameworkTokenMapper);
local _ = require(l_script_FirstAncestor_0.Types);
local v7 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v8 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v10 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v10.EventStreamConstants;
local l_authButtonClick_0 = v10.Events.authButtonClick;
local l_authPageload_0 = v10.Events.authPageload;
local _ = require(l_script_FirstAncestor_0.Enums.Namespace);
local v15 = require(l_script_FirstAncestor_0.Hooks.useUpdateActivationWorkflowAndNavigate);
return function(v16) --[[ Line: 48 ]] --[[ Name: ActivationFrameworkWrapper ]]
    -- upvalues: v2 (copy), v7 (copy), l_useDesignTokens_0 (copy), l_authPageload_0 (copy), v15 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), v8 (copy), v3 (copy), v4 (copy)
    local l_activationFrameworkState_0 = v2.useContext(v7).activationFrameworkState;
    local v18, v19 = v2.useState(0);
    local v20, v21 = v2.useState(0);
    local v22, v23 = v2.useState(0);
    local v24, v25 = v2.useState(0);
    local v26, v27 = v2.useState(0);
    local v28, v29 = v2.useState(0);
    local v30, v31 = v2.useState(0);
    local v32, v33 = v2.useState(0);
    local l_ActivationFramework_0 = l_useDesignTokens_0().LuaApps.ActivationFramework;
    local v35 = not v16.shouldExpandMiddleContent;
    v2.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: l_authPageload_0 (ref), v16 (copy), l_activationFrameworkState_0 (copy)
        l_authPageload_0(v16.namespace, l_activationFrameworkState_0.currentState);
    end, {});
    local v36 = nil;
    v36 = v15(v16.navigation);
    local function v37() --[[ Line: 75 ]]
        -- upvalues: l_authButtonClick_0 (ref), v16 (copy), l_EventStreamConstants_0 (ref), l_activationFrameworkState_0 (copy), v36 (ref), v8 (ref)
        l_authButtonClick_0(v16.namespace, l_EventStreamConstants_0.Button.Back, l_activationFrameworkState_0.currentState);
        v36(v8.Back);
    end;
    local function v38() --[[ Line: 80 ]]
        -- upvalues: l_authButtonClick_0 (ref), v16 (copy), l_EventStreamConstants_0 (ref), l_activationFrameworkState_0 (copy), v36 (ref), v8 (ref)
        l_authButtonClick_0(v16.namespace, l_EventStreamConstants_0.Button.Skip, l_activationFrameworkState_0.currentState);
        v36(v8.Skip);
    end;
    local v39, v40 = v2.useState({
        shouldShowBackButton = false, 
        icon = "icons/actions/cycleLeft", 
        onBack = v37
    });
    local v41, v42 = v2.useState({
        shouldShowSkipButton = false, 
        skipButtonTextKey = "Authentication.SignUp.Label.Skip", 
        onSkip = v38
    });
    v2.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v39 (copy), v41 (copy), l_activationFrameworkState_0 (copy), v8 (ref), v40 (copy), v42 (copy)
        local v43 = table.clone(v39);
        local v44 = table.clone(v41);
        v44.shouldShowSkipButton = table.find(l_activationFrameworkState_0.availableActions, v8.Skip) ~= nil;
        v43.shouldShowBackButton = false;
        if table.find(l_activationFrameworkState_0.availableActions, v8.Back) then
            v43.shouldShowBackButton = true;
            v43.icon = "icons/actions/cycleLeft";
        elseif table.find(l_activationFrameworkState_0.availableActions, v8.Close) then
            v43.shouldShowBackButton = true;
            v43.icon = "icons/navigation/close";
        end;
        v40(v43);
        v42(v44);
    end, {
        l_activationFrameworkState_0.availableActions
    });
    local l_verticalPaddingPx_0 = l_ActivationFramework_0.verticalPaddingPx;
    local l_verticalPaddingPx_1 = l_ActivationFramework_0.verticalPaddingPx;
    v2.useLayoutEffect(function() --[[ Line: 117 ]]
        -- upvalues: v22 (copy), l_ActivationFramework_0 (copy), v27 (copy), v31 (copy)
        if v22 > 0 then
            local v47 = v22 - l_ActivationFramework_0.horizontalPaddingPx * 2;
            v27(v47);
            v31(v47);
        end;
    end, {
        v22
    });
    v2.useLayoutEffect(function() --[[ Line: 127 ]]
        -- upvalues: v35 (copy), v18 (copy), v20 (copy), v24 (copy), v28 (copy), l_verticalPaddingPx_0 (copy), l_verticalPaddingPx_1 (copy), v33 (copy)
        if v35 and v18 > 0 and v20 > 0 and v24 > 0 and v28 > 0 then
            local v48 = v24 - v18 - v20 - l_verticalPaddingPx_0 - l_verticalPaddingPx_1 - v28;
            v33(v48);
        end;
    end, {
        v18, 
        v20, 
        v24, 
        v28
    });
    v2.useLayoutEffect(function() --[[ Line: 144 ]]
        -- upvalues: v16 (copy), v18 (copy), v20 (copy), v24 (copy), l_verticalPaddingPx_0 (copy), l_verticalPaddingPx_1 (copy), v32 (copy), v29 (copy)
        if v16.shouldExpandMiddleContent and v18 > 0 and v20 > 0 and v24 > 0 then
            local v49 = v24 - v18 - v20 - l_verticalPaddingPx_0 - l_verticalPaddingPx_1 - v32;
            v29(v49);
        end;
    end, {
        v18, 
        v20, 
        v24, 
        v32
    });
    local v50 = {
        primaryButton = v16.primaryButton, 
        secondaryButton = v16.secondaryButton, 
        shouldShowButtonDivider = v16.shouldShowButtonDivider, 
        navigation = v16.navigation
    };
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = function(v51) --[[ Line: 164 ]]
            -- upvalues: v23 (copy), v25 (copy)
            v23(v51.AbsoluteSize.X);
            v25(v51.AbsoluteSize.Y);
        end, 
        BorderSizePixel = 0
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_ActivationFramework_0.verticalPaddingPx), 
            PaddingTop = UDim.new(0, l_ActivationFramework_0.verticalPaddingPx), 
            PaddingLeft = UDim.new(0, l_ActivationFramework_0.horizontalPaddingPx), 
            PaddingRight = UDim.new(0, l_ActivationFramework_0.horizontalPaddingPx)
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Header = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            [v2.Change.AbsoluteSize] = function(v52) --[[ Line: 187 ]]
                -- upvalues: v19 (copy)
                v19(v52.AbsoluteSize.Y);
            end, 
            LayoutOrder = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_ActivationFramework_0.headerTopPadding)
            }), 
            HeaderContent = v2.createElement(v3, {
                skipProps = v41, 
                backProps = v39, 
                titleTextKey = v16.titleTextKey, 
                bodyTextKey = v16.bodyTextKey, 
                headingTextKey = v16.headingTextKey, 
                ixpTitleTextKey = v16.ixpTitleTextKey, 
                ixpBodyTextKey = v16.ixpBodyTextKey
            })
        }), 
        Content = v2.createElement("Frame", {
            Size = if v16.shouldExpandMiddleContent then UDim2.new(0, v26, 0, v28) else UDim2.new(0, v26, 0, 0), 
            AutomaticSize = if not v16.shouldExpandMiddleContent then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v2.Change.AbsoluteSize] = function(v53) --[[ Line: 212 ]]
                -- upvalues: v16 (copy), v29 (copy)
                if not v16.shouldExpandMiddleContent then
                    v29(v53.AbsoluteSize.Y);
                end;
            end
        }, {
            v16.children
        }), 
        Footer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v2.Change.AbsoluteSize] = function(v54) --[[ Line: 223 ]]
                -- upvalues: v21 (copy)
                v21(v54.AbsoluteSize.Y);
            end, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_ActivationFramework_0.footerTopPaddingPx)
            }), 
            FooterContent = v2.createElement(v4, v50)
        }), 
        SubFooterContent = if v16.subFooterContent then v2.createElement("Frame", {
            Size = if v35 then UDim2.new(0, v30, 0, v32) else UDim2.new(0, v30, 0, 0), 
            AutomaticSize = if not v35 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 4, 
            [v2.Change.AbsoluteSize] = function(v55) --[[ Line: 242 ]]
                -- upvalues: v35 (copy), v33 (copy)
                if not v35 then
                    v33(v55.AbsoluteSize.Y);
                end;
            end
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_ActivationFramework_0.subfooterTopPaddingPx), 
                PaddingBottom = UDim.new(0, l_ActivationFramework_0.subfooterBottomPaddingPx)
            }); 
            v16.subFooterContent
        }) else nil
    });
end;