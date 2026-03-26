local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local v10 = require(l_Parent_0.CentralOverlay);
local l_SetCentralOverlay_0 = v10.Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = v10.Thunks.CloseCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_extractAndStyleRichTextLinks_0 = require(l_Parent_0.DiscoveryUtils).extractAndStyleRichTextLinks;
return function(v15) --[[ Line: 37 ]] --[[ Name: PlayButtonUpsellDialog ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), v1 (copy), l_extractAndStyleRichTextLinks_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_CloseCentralOverlay_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v16 = l_useTokens_0();
    local v17 = l_useDispatch_0();
    local v18 = l_useRoactService_0(l_AppLinking_0);
    local v21 = v1.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: l_extractAndStyleRichTextLinks_0 (ref), v15 (copy)
        local v19, v20 = l_extractAndStyleRichTextLinks_0(v15.bodyText);
        return {
            link = if #v19 > 0 then v19[1] else nil, 
            styledText = v20
        };
    end, {
        v15.bodyText
    });
    local v22 = v1.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v21 (copy), v15 (copy), v17 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v18 (copy), l_CloseCentralOverlay_0 (ref)
        if not v21.link then
            return;
        else
            v15.onCloseModal();
            v17(l_SetCentralOverlay_0(l_CentralOverlayType_0.LeaveRobloxAlert, {
                continueFunc = function() --[[ Line: 61 ]] --[[ Name: continueFunc ]]
                    -- upvalues: v18 (ref), v21 (ref), v17 (ref), l_CloseCentralOverlay_0 (ref)
                    v18:openURL(v21.link);
                    v17(l_CloseCentralOverlay_0());
                end
            }));
            return;
        end;
    end, {
        v15.onCloseModal, 
        v21.link, 
        v17, 
        v18
    });
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        hasBackdrop = false, 
        onClose = v15.onCloseModal
    }, {
        Title = v1.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v15.titleText
        }), 
        Content = v1.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            BodyText = v1.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                RichText = true, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v21.styledText, 
                TextSize = v16.Typography.BodyLarge.FontSize, 
                Font = v16.Typography.BodyLarge.Font, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextColor3 = v16.Color.Content.Emphasis.Color3, 
                Active = v21.link ~= nil, 
                Selectable = v21.link ~= nil, 
                [v1.Event.Activated] = if v21.link then v22 else nil
            })
        }), 
        Actions = v1.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v15.cancelButtonText, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v15.onCancelButtonClick
                }, 
                {
                    text = v15.actionButtonText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v15.onActionButtonClick
                }
            }
        })
    });
end;