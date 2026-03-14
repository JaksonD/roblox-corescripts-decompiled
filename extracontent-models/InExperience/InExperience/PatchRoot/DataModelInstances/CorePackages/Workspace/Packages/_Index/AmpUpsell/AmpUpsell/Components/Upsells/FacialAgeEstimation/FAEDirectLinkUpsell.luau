local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.React);
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.UIBlox);
local l_PartialPageModal_0 = v6.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Images_0 = v6.App.ImageSet.Images;
local v10 = require(l_Parent_0.Foundation);
local l_Text_0 = v10.Text;
local l_useTokens_0 = v10.Hooks.useTokens;
local l_authButtonClick_0 = require(l_Parent_0.AuthAnalytics).Events.authButtonClick;
return function(v14) --[[ Line: 30 ]] --[[ Name: FAEDirectLinkUpsell ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useTokens_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_authButtonClick_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_Images_0 (copy), l_Text_0 (copy)
    local l_webLink_0 = v14.webLink;
    local l_onCancel_0 = v14.onCancel;
    local l_sessionId_0 = v14.sessionId;
    local l_entryPointEventCtx_0 = v14.entryPointEventCtx;
    local v19 = l_useScreenSize_0();
    local v20 = l_useTokens_0();
    local v21 = l_useRoactService_0(l_AppLinking_0);
    local v22 = l_useLocalization_0({
        title = "Amp.FAEUpsell.Modal.ExternalLink.Title", 
        bodyText = "Amp.FAEUpsell.Modal.ExternalLink.Text", 
        startBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonStart", 
        cancelBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonCancel"
    });
    local v23 = v1.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_entryPointEventCtx_0 (copy), l_sessionId_0 (copy), v21 (copy), l_webLink_0 (copy)
        l_authButtonClick_0(l_entryPointEventCtx_0, "startFaeNonNative", l_sessionId_0);
        v21:openURL(l_webLink_0);
    end, {
        v21, 
        l_webLink_0, 
        l_sessionId_0, 
        l_entryPointEventCtx_0
    });
    local v24 = v1.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_entryPointEventCtx_0 (copy), l_sessionId_0 (copy), l_onCancel_0 (copy)
        l_authButtonClick_0(l_entryPointEventCtx_0, "cancelFaeNonNative", l_sessionId_0);
        l_onCancel_0();
    end, {
        l_onCancel_0, 
        l_sessionId_0, 
        l_entryPointEventCtx_0
    });
    return v1.createElement(l_PartialPageModal_0, {
        title = v22.title, 
        screenSize = v19, 
        onCloseClicked = v24, 
        buttonStackProps = {
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v24, 
                        text = v22.cancelBtn
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        icon = l_Images_0["icons/navigation/externallink_medium"], 
                        onActivated = v23, 
                        text = v22.startBtn
                    }
                }
            }
        }
    }, {
        ViewFrame = v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0)
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            OuterPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v20.Padding.XXLarge), 
                PaddingBottom = UDim.new(0, v20.Padding.XXLarge)
            }), 
            BodyText = v1.createElement(l_Text_0, {
                tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
                Text = v22.bodyText, 
                LayoutOrder = 1
            })
        })
    });
end;