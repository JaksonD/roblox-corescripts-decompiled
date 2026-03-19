local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local v8 = require(l_ShareGame_0.Constants);
local v9 = require(l_ShareGame_0.Components.ShareButton);
local v10 = require(l_ShareGame_0.getTranslator)();
local v11 = require(l_ShareGame_0.Components.ShareInviteLinkMapDispatchToProps);
local v12 = require(l_ShareGame_0.Components.ShareInviteLinkMapStateToProps);
local l_ShareLinksRodux_0 = l_ReducerDependencies_0.ShareLinksRodux;
local l_NetworkStatus_0 = l_ReducerDependencies_0.RoduxNetworking.Enum.NetworkStatus;
local v15 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v16 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableNewInviteMenu);
local v17 = v4.PureComponent:extend("ShareInviteLink");
local v18 = 12;
local v19 = 8;
local v20 = 69;
if v16() then
    v18 = 16;
    v19 = 12;
    v20 = 66;
end;
local v21 = Color3.fromRGB(79, 84, 95);
local v22 = v10:FormatByKey("Feature.SocialShare.Action.Share");
local v23 = v10:FormatByKey("Feature.SocialShare.Label.Copied");
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v25 = {
    externalContentSharingProtocol = l_default_0
};
local v26 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v26 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v26 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
    end;
end;
v25.isDesktopClient = v26;
v17.defaultProps = v25;
v17.init = function(v27) --[[ Line: 66 ]] --[[ Name: init ]]
    v27.state = {
        showCopiedText = false
    };
    v27.displayShareSheet = function(v28) --[[ Line: 71 ]]
        -- upvalues: v27 (copy)
        local l_props_0 = v27.props;
        if l_props_0.externalContentSharingProtocol then
            l_props_0.externalContentSharingProtocol:shareUrl({
                url = v28.shortUrl, 
                context = "V1Menu"
            });
            if l_props_0.isDesktopClient then
                v27:setState({
                    showCopiedText = true
                });
                task.delay(1, function() --[[ Line: 82 ]]
                    -- upvalues: v27 (ref)
                    v27:setState({
                        showCopiedText = false
                    });
                end);
            end;
        end;
    end;
end;
v17.didUpdate = function(v30, v31) --[[ Line: 90 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ShareLinksRodux_0 (copy)
    local l_props_1 = v30.props;
    if v31.shareInviteLink == nil and v30.props.shareInviteLink ~= nil then
        local v33 = l_ShareLinksRodux_0.Enums.LinkType.ExperienceInvite.rawValue();
        local l_linkId_0 = v30.props.shareInviteLink.linkId;
        v30.props.analytics:linkGenerated({
            linkType = v33, 
            linkId = l_linkId_0
        });
        v30.displayShareSheet(l_props_1.shareInviteLink);
    end;
end;
v17.render = function(v35) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v4 (copy), v15 (copy), v21 (copy), v18 (ref), v19 (ref), v10 (copy), v20 (ref), v9 (copy), v23 (copy), v22 (copy), l_NetworkStatus_0 (copy)
    local l_size_0 = v35.props.size;
    local l_layoutOrder_0 = v35.props.layoutOrder;
    local l_deviceLayout_0 = v35.props.deviceLayout;
    local l_zIndex_0 = v35.props.zIndex;
    local v40 = v8.LayoutSpecific[l_deviceLayout_0];
    local function v42() --[[ Line: 110 ]]
        -- upvalues: v35 (copy)
        local l_props_2 = v35.props;
        v35.props.analytics:onShareButtonClick();
        if v35.props.shareInviteLink == nil then
            v35.props.fetchShareInviteLink();
            return;
        else
            v35.displayShareSheet(l_props_2.shareInviteLink);
            return;
        end;
    end;
    local l_createElement_0 = v4.createElement;
    local v44 = "Frame";
    local v45 = {
        Size = l_size_0, 
        Position = v35.props.position, 
        LayoutOrder = l_layoutOrder_0, 
        BackgroundColor3 = v15.color("PlayerRowFrame", v21), 
        BackgroundTransparency = v15.transparency("PlayerRowFrame", 0), 
        ZIndex = l_zIndex_0, 
        BorderSizePixel = 0
    };
    local v46 = {
        Corner = v4.createElement("UICorner", {
            CornerRadius = v15.MenuContainerCornerRadius
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v18), 
            PaddingRight = UDim.new(0, v18), 
            PaddingTop = UDim.new(0, v19), 
            PaddingBottom = UDim.new(0, v19)
        }), 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 0, 
            Text = v10:FormatByKey("Feature.SocialShare.Label.ShareServerLink"), 
            Size = UDim2.new(1, -v20, 1, 0), 
            TextSize = v15.textSize(v40.PAGE_TITLE_TEXT_SIZE, "ShareLinkTitle"), 
            TextColor3 = v8.Color.WHITE, 
            Font = v15.font(Enum.Font.SourceSansSemibold, "Semibold")
        })
    };
    local l_createElement_1 = v4.createElement;
    local l_v9_0 = v9;
    local v49 = {
        size = UDim2.new(0, v20, 1, 0), 
        layoutOrder = 1, 
        onShare = v42, 
        text = if v35.state.showCopiedText then v23 else v22
    };
    local v50 = false;
    if v35.props.fetchShareInviteLinkNetworkStatus ~= l_NetworkStatus_0.Fetching then
        v50 = not v35.state.showCopiedText;
    end;
    v49.isEnabled = v50;
    v46.ShareButton = l_createElement_1(l_v9_0, v49);
    return l_createElement_0(v44, v45, v46);
end;
return (v5.connect(v12, v11)(v17));