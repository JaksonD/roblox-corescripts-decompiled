local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.UIBlox);
local _ = require(script.Parent.Parent.Models.CommunityInfo);
local v5 = require(script.Parent.Parent.Utils.getCommunityUrl);
local v6 = require(script.Parent.Parent.Requests.GetCommunityInviteUrl);
local l_GuildedLogoAsset2x_0 = require(script.Parent.Parent.constants).GuildedLogoAsset2x;
local v8 = require(script.Parent.Parent.Analytics.constants);
local l_clickCommunityLinkEvent_0 = require(script.Parent.Parent.Analytics).Events.clickCommunityLinkEvent;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v24 = require(script.Parent.Parent.Flags.GetFFlagLuaAppFixCommunityLinksRedirect);
return function(v25) --[[ Line: 56 ]] --[[ Name: CommunityLinkBanner ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_AppEventIngestService_0 (copy), l_RoactNetworking_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_useDispatch_0 (copy), v1 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v24 (copy), v6 (copy), v5 (copy), l_clickCommunityLinkEvent_0 (copy), v8 (copy), l_dependencyArray_0 (copy), l_Interactable_0 (copy), v2 (copy), l_GuildedLogoAsset2x_0 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v26 = l_useRoactService_0(l_AppLinking_0);
    local v27 = l_useRoactService_0(l_AppEventIngestService_0);
    local v28 = l_useRoactService_0(l_RoactNetworking_0);
    local v29 = l_useStyle_0();
    local v30 = l_useLocalization_0({
        ViewLabel = "Feature.CommunityLinks.Label.ViewButton", 
        DescriptionCommunityDefault = "Feature.CommunityLinks.Description.CommunityDefault"
    });
    local v31 = l_useDispatch_0();
    local v33 = v1.useCallback(function(v32) --[[ Line: 69 ]]
        -- upvalues: v31 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v31(l_SetCentralOverlay_0(l_CentralOverlayType_0.LeaveRobloxAlert, {
            continueFunc = v32
        }));
    end, {
        v31
    });
    local v34 = v1.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v31 (copy), l_SetCentralOverlay_0 (ref)
        v31(l_SetCentralOverlay_0());
    end, {
        v31
    });
    local l_communityId_0 = v25.communityInfo.communityId;
    local v39 = v1.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v24 (ref), v6 (ref), v28 (copy), l_communityId_0 (copy), v26 (copy), v5 (ref), v34 (copy), l_clickCommunityLinkEvent_0 (ref), v27 (copy), v8 (ref), v25 (copy)
        if v24() then
            v6(v28, l_communityId_0):andThen(function(v36) --[[ Line: 81 ]]
                -- upvalues: v26 (ref)
                local l_responseBody_0 = v36.responseBody;
                v26:openURL(l_responseBody_0);
            end);
        else
            local v38 = v5(l_communityId_0);
            v26:openURL(v38);
        end;
        v34();
        l_clickCommunityLinkEvent_0(v27, v8.Context.CommunityLinkBanner, {
            guildedServerId = l_communityId_0, 
            entityType = "universe", 
            entityId = v25.universeId
        });
    end, l_dependencyArray_0(l_communityId_0, v26));
    local v40 = v1.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v33 (copy), v39 (copy)
        v33(v39);
    end, {
        v33, 
        v39
    });
    local v41, v42 = v1.useState(false);
    local v44 = v1.useCallback(function(v43) --[[ Line: 103 ]]
        -- upvalues: v42 (copy)
        v42(v43.AbsoluteSize.X < 600);
    end, {});
    local v45 = v41 and 64 or 72;
    local v46 = not v41;
    local v47 = -(v45 + 16 + (v46 and 136 or 0));
    return v1.createElement(l_Interactable_0, {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v29.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v29.Theme.BackgroundUIDefault.Transparency, 
        ClipsDescendants = true, 
        [v1.Change.AbsoluteSize] = v44, 
        [v1.Event.Activated] = v40, 
        onStateChanged = v2.noop, 
        LayoutOrder = v25.layoutOrder
    }, {
        BorderRadius = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 16), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Icon = v1.createElement("ImageLabel", {
            Size = UDim2.fromOffset(v45, v45), 
            BackgroundTransparency = 1, 
            Image = l_GuildedLogoAsset2x_0, 
            LayoutOrder = 1
        }, {
            BorderRadius = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        }), 
        Info = v1.createElement("Frame", {
            Size = UDim2.new(1, v47, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 8), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Name = v1.createElement(l_StyledTextLabel_0, {
                text = v25.communityInfo.name, 
                size = UDim2.new(1, 0, 0, 18), 
                textYAlignment = Enum.TextYAlignment.Top, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                fontStyle = v29.Font.Header2, 
                colorStyle = v29.Theme.TextEmphasis, 
                richText = true, 
                fluidSizing = false, 
                layoutOrder = 1
            }), 
            Description = v1.createElement(l_StyledTextLabel_0, {
                text = v25.communityInfo.description or v30.DescriptionCommunityDefault:gsub("{experienceName}", v25.linkedEntityName), 
                size = UDim2.new(1, 0, 0, 44), 
                lineHeight = 1.15, 
                textYAlignment = Enum.TextYAlignment.Center, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                fontStyle = v29.Font.Body, 
                colorStyle = v29.Theme.TextDefault, 
                richText = false, 
                fluidSizing = false, 
                layoutOrder = 2
            })
        }), 
        ViewButton = if v46 then v1.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.fromOffset(120, 28), 
            text = v30.ViewLabel, 
            onActivated = v40, 
            layoutOrder = 3
        }) else nil
    });
end;