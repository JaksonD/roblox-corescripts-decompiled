local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local _ = game:GetService("AppStorageService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_Badge_0 = v7.App.Indicator.Badge;
local l_BadgeStates_0 = v7.App.Indicator.Enum.BadgeStates;
local l_Images_0 = v7.App.ImageSet.Images;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v14 = require(l_RobloxGui_0.Modules.ChatSelector);
local v15 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v16 = require(script.Parent.IconButton);
local l_Parent_0 = script.Parent.Parent.Parent;
local v18 = require(l_Parent_0.Analytics);
local v19 = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v20 = require(l_Parent_0.Actions.SetKeepOutArea);
local v21 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v22 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v22.Flags.FFlagTopBarSignalizeKeepOutAreas;
local v24 = require(l_Parent_0.Constants);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local _ = require(script.Parent.ChatIconFtuxTooltip);
local l_getExperienceChatVisualConfig_0 = require(l_CorePackages_0.Workspace.Packages.ExpChat).getExperienceChatVisualConfig;
local _ = game:DefineFastInt("InExperienceChatTooltipShowDelayMs", 1000);
local _ = game:DefineFastInt("InExperienceChatTooltipDismissDelayMs", 7000);
local v30 = game:DefineFastFlag("UnibarHoldoutChatIconUseNewIconSize", false);
local l_GameSettings_0 = UserSettings().GameSettings;
local function _() --[[ Line: 43 ]] --[[ Name: shouldShowEmptyBadge ]]
    return game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService;
end;
local v33 = v4.PureComponent:extend("ChatIcon");
v33.validateProps = v6.strictInterface({
    layoutOrder = v6.integer, 
    chatVisible = v6.boolean, 
    unreadMessages = v6.integer, 
    topBarEnabled = v6.boolean, 
    chatEnabled = v6.boolean, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v6.callback, 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v6.callback
});
v33.init = function(v34) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v14 (copy), l_GameSettings_0 (copy), v19 (copy), v18 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v22 (copy)
    v34.buttonRef = v4.createRef();
    v34.chatIconActivated = function() --[[ Line: 72 ]]
        -- upvalues: v14 (ref), l_GameSettings_0 (ref), v19 (ref), v18 (ref)
        v14:ToggleVisibility();
        l_GameSettings_0.ChatVisible = v14:GetVisibility();
        if v19 then
            v18.default:onChatButtonActivated(l_GameSettings_0.ChatVisible);
        end;
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v34.keepOutAreasStore = v22.Stores.GetKeepOutAreasStore(false);
    end;
end;
v33.render = function(v35) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v15 (copy), l_VRService_0 (copy), l_getExperienceChatVisualConfig_0 (copy), l_Images_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v24 (copy), v4 (copy), v16 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v30 (copy), l_Badge_0 (copy), l_BadgeStates_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 86 ]]
        -- upvalues: v35 (copy), v15 (ref), l_VRService_0 (ref), l_getExperienceChatVisualConfig_0 (ref), l_Images_0 (ref), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v24 (ref), v4 (ref), v16 (ref), l_GetFFlagEnableAppChatInExperience_0 (ref), v30 (ref), l_Badge_0 (ref), l_BadgeStates_0 (ref)
        local v37 = v35.props.topBarEnabled and v35.props.chatEnabled and not v15:IsEnabled() and not l_VRService_0.VREnabled;
        local v38 = nil;
        local v39 = nil;
        local v40 = l_getExperienceChatVisualConfig_0();
        v38 = v40.iconSize;
        v39 = l_Images_0[v40.icon.on];
        if not v35.props.chatVisible then
            v39 = l_Images_0[v40.icon.off];
        end;
        local function v42(v41) --[[ Line: 102 ]]
            -- upvalues: v37 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v35 (ref), v24 (ref)
            if v37 and v41 then
                if l_FFlagTopBarSignalizeKeepOutAreas_0 then
                    v35.keepOutAreasStore.setKeepOutArea(v24.ChatIconKeepOutAreaId, v41.AbsolutePosition, v41.AbsoluteSize);
                    return;
                else
                    v35.props.setKeepOutArea(v24.ChatIconKeepOutAreaId, v41.AbsolutePosition, v41.AbsoluteSize);
                    return;
                end;
            elseif l_FFlagTopBarSignalizeKeepOutAreas_0 then
                v35.keepOutAreasStore.removeKeepOutArea(v24.ChatIconKeepOutAreaId);
                return;
            else
                v35.props.removeKeepOutArea(v24.ChatIconKeepOutAreaId);
                return;
            end;
        end;
        local function v44(v43) --[[ Line: 118 ]]
            -- upvalues: v35 (ref), v42 (copy)
            if v43 then
                v35.buttonRef.current = v43;
                v42(v35.buttonRef.current);
            end;
        end;
        if v35.buttonRef.current then
            v42(v35.buttonRef.current);
        end;
        local v45 = v4.createElement(v16, {
            icon = v39, 
            iconSize = if not not l_GetFFlagEnableAppChatInExperience_0() or v30 then v38 else 20, 
            onActivated = v35.chatIconActivated, 
            [v4.Change.AbsoluteSize] = v42, 
            [v4.Change.AbsolutePosition] = v42, 
            [v4.Ref] = v44
        });
        local l_createElement_0 = v4.createElement;
        local v47 = "TextButton";
        local v48 = {
            Text = "", 
            Visible = v37, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 44, 1, 0), 
            LayoutOrder = v35.props.layoutOrder, 
            Selectable = false
        };
        local v49 = {
            Background = v45
        };
        local l_createElement_1 = v4.createElement;
        local v51 = "Frame";
        local v52 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        };
        local v53 = {};
        local v54 = false;
        if v35.props.unreadMessages > 0 then
            v54 = v4.createElement(l_Badge_0, {
                position = UDim2.fromOffset(18, game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService and 6 or 2), 
                anchorPoint = Vector2.new(0, 0), 
                hasShadow = false, 
                value = game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService and l_BadgeStates_0.isEmpty or v35.props.unreadMessages
            });
        end;
        v53.Badge = v54;
        v49.BadgeContainer = l_createElement_1(v51, v52, v53);
        return l_createElement_0(v47, v48, v49);
    end);
end;
local function v56(v55) --[[ Line: 167 ]] --[[ Name: mapStateToProps ]]
    return {
        chatVisible = v55.chat.visible, 
        unreadMessages = v55.chat.unreadMessages, 
        topBarEnabled = v55.displayOptions.topbarEnabled, 
        chatEnabled = v55.coreGuiEnabled[Enum.CoreGuiType.Chat]
    };
end;
local function v62(v57) --[[ Line: 177 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v20 (copy), v21 (copy)
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        return {};
    else
        return {
            setKeepOutArea = function(v58, v59, v60) --[[ Line: 182 ]] --[[ Name: setKeepOutArea ]]
                -- upvalues: v57 (copy), v20 (ref)
                return v57(v20(v58, v59, v60));
            end, 
            removeKeepOutArea = function(v61) --[[ Line: 185 ]] --[[ Name: removeKeepOutArea ]]
                -- upvalues: v57 (copy), v21 (ref)
                return v57(v21(v61));
            end
        };
    end;
end;
return v5.UNSTABLE_connect2(v56, if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v62)(v33);