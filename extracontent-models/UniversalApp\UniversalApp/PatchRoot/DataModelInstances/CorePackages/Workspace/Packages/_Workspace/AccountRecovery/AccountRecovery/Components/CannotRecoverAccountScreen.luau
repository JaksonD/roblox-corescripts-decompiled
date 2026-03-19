local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.AppBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v4.FullscreenPageWithSafeArea;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v11 = require(l_Parent_0.Foundation);
local l_Text_0 = v11.Text;
local l_Button_0 = v11.Button;
local l_ButtonVariant_0 = v11.Enums.ButtonVariant;
local l_InputSize_0 = v11.Enums.InputSize;
local l_useTokens_0 = v11.Hooks.useTokens;
local l_ScrollView_0 = v11.ScrollView;
local l_Visibility_0 = v11.Enums.Visibility;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_GetUserById_0 = require(l_Parent_0.AuthCommon).Thunks.GetUserById;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local v22 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v23 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v24 = require(l_script_FirstAncestor_0.Components.UserHeader);
return function(v25) --[[ Line: 44 ]]
    -- upvalues: v2 (copy), v22 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useClearFocusOnUnmount_0 (copy), l_GetUserById_0 (copy), l_Logger_0 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v23 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v24 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v26 = v2.useContext(v22);
    local v27 = l_useStyle_0();
    local v28 = l_useTokens_0();
    local v29 = l_useDesignTokens_0();
    local v30 = l_useRoactService_0(l_RoactNetworking_0);
    local v31 = v25.navigation.getParam("userID");
    local v32, v33 = v2.useState("");
    local v34, v35 = v2.useState("");
    local v36, v37 = v2.useState(Vector2.new(0, 0));
    l_useClearFocusOnUnmount_0();
    v2.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v31 (copy), l_GetUserById_0 (ref), v30 (copy), v35 (copy), v33 (copy), l_Logger_0 (ref)
        if v31 and v31 ~= 0 then
            l_GetUserById_0(v30, (("%*"):format(v31))):andThen(function(v38) --[[ Line: 62 ]]
                -- upvalues: v35 (ref), v33 (ref)
                v35(v38.name);
                v33(v38.displayName);
            end):catch(function(v39) --[[ Line: 65 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error getting user info: {}", v39);
            end);
        end;
    end, {});
    local function v41(v40) --[[ Line: 71 ]]
        -- upvalues: v36 (copy), v37 (copy)
        if v36 ~= v40.AbsoluteSize then
            v37(v40.AbsoluteSize);
        end;
    end;
    local v42 = l_useLocalization_0({
        cannotRecoverAccountHeadingText = "Authentication.AccountRecovery.Heading.CannotRecoverAccount", 
        bodyText = "Authentication.AccountRecovery.Description.CannotRecoverAccount", 
        okButtonText = "Authentication.AccountRecovery.Action.Ok"
    });
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v27.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v29.Global.Space_100), 
            PaddingLeft = UDim.new(0, v29.Global.Space_150), 
            PaddingRight = UDim.new(0, v29.Global.Space_150), 
            PaddingBottom = UDim.new(0, v29.Global.Space_100)
        }), 
        Wrapper = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v29.Global.Space_250)
            }), 
            PreScrollContent = v2.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                [v2.Change.AbsoluteSize] = v41
            }, {
                Header = v2.createElement(v23, {
                    LayoutOrder = 1, 
                    recoveryHeadingText = v42.cannotRecoverAccountHeadingText, 
                    currentComponent = "cannotRecoverAccount", 
                    recoverySessionId = v26.state.recoverySessionId
                })
            }), 
            ContentScrollView = v2.createElement(l_ScrollView_0, {
                LayoutOrder = 2, 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    scrollBarVisibility = l_Visibility_0.Auto
                }, 
                Size = UDim2.new(1, 0, 1, -v36.Y)
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v29.Global.Space_100), 
                    PaddingRight = UDim.new(0, v29.Global.Space_100)
                }), 
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v29.Global.Space_20)
                }), 
                UserHeader = v2.createElement(v24, {
                    LayoutOrder = 1, 
                    userId = ("%*"):format(v31), 
                    displayName = v32, 
                    username = v34
                }), 
                Body = v2.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v42.bodyText, 
                    TextWrapped = true, 
                    fontStyle = v28.Typography.BodyMedium, 
                    textStyle = v28.Color.Content.Default, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    padding = {
                        top = UDim.new(0, v28.Size.Size_300), 
                        bottom = UDim.new(0, v28.Size.Size_300)
                    }
                }), 
                OkButton = v2.createElement(l_Button_0, {
                    LayoutOrder = 3, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = l_InputSize_0.Medium, 
                    text = v42.okButtonText, 
                    width = UDim.new(1, 0), 
                    onActivated = function() --[[ Line: 163 ]] --[[ Name: onActivated ]]
                        -- upvalues: v26 (copy)
                        v26.parentNavigation.goBack();
                    end
                })
            })
        })
    });
end;