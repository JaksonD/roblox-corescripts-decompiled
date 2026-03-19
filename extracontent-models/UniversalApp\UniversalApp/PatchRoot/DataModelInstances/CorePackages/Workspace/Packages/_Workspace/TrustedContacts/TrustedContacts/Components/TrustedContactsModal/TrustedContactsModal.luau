local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_FullPageModal_0 = v3.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLayerCollector_0 = v3.Core.Layout.LayerCollector.useLayerCollector;
local l_LoadingSpinner_0 = v3.App.Loading.LoadingSpinner;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v10 = require(l_Parent_0.Responsive);
local v11 = require(l_Parent_0.Foundation);
local l_Text_0 = v11.Text;
local l_useTokens_0 = v11.Hooks.useTokens;
local l_View_0 = v11.View;
local l_ScrollView_0 = v11.ScrollView;
local l_ButtonVariant_0 = v11.Enums.ButtonVariant;
local l_Dialog_0 = v11.Dialog;
local l_DialogSize_0 = v11.Enums.DialogSize;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v20 = require(l_script_FirstAncestor_0.Components.SocialMetadataSection);
local v21 = game:DefineFastInt("TCMountMinLoadingTimeMs", 0);
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local v23 = game:DefineFastFlag("TCFixNotifBackground", false);
local v24 = game:DefineFastFlag("TCDialogCloseBtn", false);
return function(v25) --[[ Line: 51 ]]
    -- upvalues: l_useLayerCollector_0 (copy), l_useScreenSize_0 (copy), v10 (copy), v2 (copy), v21 (copy), l_useTokens_0 (copy), l_LoadingSpinner_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v24 (copy), l_Text_0 (copy), v20 (copy), l_ButtonVariant_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FullPageModal_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_ScrollView_0 (copy), l_View_0 (copy), v11 (copy), l_Sources_0 (copy), v23 (copy)
    local l_isVerticallyConstrained_0 = v25.isVerticallyConstrained;
    local v27 = l_useLayerCollector_0();
    local v28 = l_useScreenSize_0();
    local v29 = v10.useOrientation();
    local v30 = v29 == v10.DefaultKey;
    local v31, v32 = v2.useState(v30);
    local v33 = v2.useRef(os.clock());
    v2.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v30 (copy), v33 (copy), v21 (ref), v32 (copy)
        if not v30 then
            local v34 = os.clock() - v33.current;
            local v35 = v21 / 1000;
            if v34 < v35 then
                delay(v35 - v34, function() --[[ Line: 67 ]]
                    -- upvalues: v32 (ref)
                    v32(false);
                end);
                return;
            else
                v32(false);
            end;
        end;
    end, {
        v30, 
        v32
    });
    if v27 and v27.absoluteSize and v27.absoluteSize ~= Vector2.new(0, 0) then
        v28 = v27.absoluteSize;
    end;
    local v36 = v29 == v10.BreakpointConfig.Enum.Landscape;
    local v37 = l_useTokens_0();
    if v31 then
        return v2.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(50, 50), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5)
        });
    else
        local v38 = if v36 then v2.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Medium, 
            onClose = if v24 then v25.onCloseModal else nil
        }, {
            Title = v2.createElement(l_Dialog_0.Title, {
                LayoutOrder = 1, 
                text = v25.headerText
            }), 
            Contents = v2.createElement("ScrollingFrame", {
                LayoutOrder = 2, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = l_isVerticallyConstrained_0 and UDim2.new(1, -4, 0.3, 0) or UDim2.fromScale(1, 0), 
                AutomaticSize = not l_isVerticallyConstrained_0 and Enum.AutomaticSize.Y or nil, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromScale(0, 0), 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollingEnabled = l_isVerticallyConstrained_0
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TextIntro = v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    tag = "auto-y size-full-0 text-align-x-left text-wrap padding-bottom-large", 
                    Text = v25.descriptionText
                }), 
                Insights = v2.createElement(v20, {
                    userId = v25.userId, 
                    layoutOrder = 2
                })
            }), 
            DialogActions = v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 4, 
                actions = {
                    {
                        text = v25.primaryButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        onActivated = v25.onPrimaryButtonPress
                    }, 
                    if l_FFlagTCShareLinkSenderUI_0 then if v25.secondaryButtonText then {
                        text = v25.secondaryButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v25.onSecondaryButtonPress
                    } else nil else {
                        text = v25.secondaryButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v25.onSecondaryButtonPress
                    }
                }
            })
        }) else v2.createElement(l_isVerticallyConstrained_0 and l_FullPageModal_0 or l_PartialPageModal_0, {
            title = v25.headerText, 
            screenSize = v28, 
            onCloseClicked = v25.onCloseModal, 
            buttonStackProps = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        props = {
                            onActivated = v25.onPrimaryButtonPress, 
                            text = v25.primaryButtonText
                        }
                    }, 
                    if l_FFlagTCShareLinkSenderUI_0 then if v25.secondaryButtonText then {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v25.onSecondaryButtonPress, 
                            text = v25.secondaryButtonText
                        }
                    } else nil else {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v25.onSecondaryButtonPress, 
                            text = v25.secondaryButtonText
                        }
                    }
                }, 
                forcedFillDirection = Enum.FillDirection.Horizontal
            }
        }, {
            Contents = v2.createElement(l_isVerticallyConstrained_0 and l_ScrollView_0 or l_View_0, {
                tag = {
                    ["col size-full-0 auto-y align-x-center"] = true, 
                    ["gap-medium shrink"] = l_isVerticallyConstrained_0, 
                    ["gap-large"] = not l_isVerticallyConstrained_0
                }, 
                scroll = l_isVerticallyConstrained_0 and {
                    scrollBarVisibility = v11.Enums.ScrollBarVisibility.Always, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }
            }, {
                OuterPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_isVerticallyConstrained_0 and v37.Padding.XSmall or v37.Padding.Large), 
                    PaddingBottom = UDim.new(0, l_isVerticallyConstrained_0 and v37.Padding.Small or v37.Padding.XXLarge)
                }), 
                TextIntro = v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    tag = {
                        ["auto-y size-full-0 text-align-x-left text-wrap"] = true, 
                        grow = not l_isVerticallyConstrained_0
                    }, 
                    Text = v25.descriptionText
                }), 
                Insights = v2.createElement(v20, {
                    userId = v25.userId, 
                    layoutOrder = 2, 
                    isVerticallyConstrained = l_isVerticallyConstrained_0
                })
            })
        });
        if v25.source == l_Sources_0.StreamNotification then
            return v2.createElement("TextButton", {
                Selectable = false, 
                AutoButtonColor = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v37.Color.Common.Scrim.Color3, 
                BackgroundTransparency = v37.Color.Common.Scrim.Transparency, 
                Text = v23 and "" or nil
            }, {
                TrustedContactModalComponent = v38
            });
        else
            return v38;
        end;
    end;
end;