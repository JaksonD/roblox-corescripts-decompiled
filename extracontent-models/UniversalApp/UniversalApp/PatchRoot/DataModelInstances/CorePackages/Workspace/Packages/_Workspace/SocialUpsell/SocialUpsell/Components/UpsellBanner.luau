local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local l_useEffect_0 = v3.useEffect;
local v5 = require(l_Parent_0.AppBlox);
local v6 = require(l_Parent_0.Foundation);
local v7 = require(l_Parent_0.SharedFlags);
local l_useCallback_0 = v3.useCallback;
local v9 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Types);
local v11 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v13 = require(l_script_FirstAncestor_0.Utils.isCompactUpsellBanner);
local v14 = require(l_script_FirstAncestor_0.SignalStores.getUpsellSignalStore);
local v15 = require(l_script_FirstAncestor_0.Analytics.SocialUpsellAnalytics);
local v16 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellComponent);
local l_EventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.EventTypes;
local l_FFlagEnableSocialUpsellUIFixes_0 = v7.FFlagEnableSocialUpsellUIFixes;
local v19 = require(l_script_FirstAncestor_0.Flag.FFlagAddUpsellEntryComponentToAnalytics);
local l_UPSELL_BUTTON_ACTION_0 = v11.UPSELL_BUTTON_ACTION;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_Banner_0 = v5.Banner;
local v23 = {
    isContained = true
};
local function _(v24, v25) --[[ Line: 73 ]] --[[ Name: getButtonVariant ]]
    -- upvalues: v13 (copy), l_UPSELL_BUTTON_ACTION_0 (copy), l_ButtonVariant_0 (copy)
    local v26 = v13(v25);
    if v24.action then
        if v24.action == l_UPSELL_BUTTON_ACTION_0.Primary then
            if v26 then
                return l_ButtonVariant_0.SoftEmphasis;
            else
                return l_ButtonVariant_0.Emphasis;
            end;
        elseif v24.action == l_UPSELL_BUTTON_ACTION_0.Secondary then
            return l_ButtonVariant_0.Utility;
        end;
    end;
    return nil;
end;
local function v38(v28, v29) --[[ Line: 86 ]] --[[ Name: getBannerPropsFromConfig ]]
    -- upvalues: v13 (copy), l_UPSELL_BUTTON_ACTION_0 (copy), l_ButtonVariant_0 (copy), v11 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v6 (copy)
    local v30 = {};
    local v31 = {};
    if v28.buttons then
        for _, v33 in v28.buttons do
            local v34 = {
                text = v33.text
            };
            local v35 = v13(v28);
            v34.variant = if v33.action then if v33.action == l_UPSELL_BUTTON_ACTION_0.Primary then if v35 then l_ButtonVariant_0.SoftEmphasis else l_ButtonVariant_0.Emphasis else if v33.action == l_UPSELL_BUTTON_ACTION_0.Secondary then l_ButtonVariant_0.Utility else nil else nil;
            v34.onActivated = v29[v33.action];
            table.insert(v31, v34);
        end;
    end;
    if v28.labelItems then
        for _, v37 in v28.labelItems do
            if v37.type == v11.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN then
                table.insert(v30, {
                    text = v37.text, 
                    icon = if l_FFlagEnableSocialUpsellUIFixes_0 then {
                        variant = v6.Enums.IconVariant.Filled, 
                        position = v6.Enums.IconPosition.Left, 
                        name = v6.Enums.IconName.Clock
                    } else v6.Enums.IconName.Clock, 
                    variant = v6.Enums.BadgeVariant.Neutral
                });
            end;
        end;
    end;
    return {
        title = v28.title, 
        body = v28.body, 
        badges = v30, 
        buttons = v31, 
        onDismiss = if v28.isDismissable then v29[l_UPSELL_BUTTON_ACTION_0.Dismiss] else nil, 
        image = v28.image, 
        icon = if v28.image then nil else v28.icon
    };
end;
return function(v39) --[[ Line: 129 ]] --[[ Name: UpsellBanner ]]
    -- upvalues: v9 (copy), v23 (copy), v3 (copy), l_HttpService_0 (copy), v14 (copy), v15 (copy), v16 (copy), l_useEffect_0 (copy), l_EventTypes_0 (copy), v19 (copy), l_useCallback_0 (copy), l_UPSELL_BUTTON_ACTION_0 (copy), v38 (copy), l_Banner_0 (copy)
    local v40 = v9.Dictionary.union(v23, v39);
    local v41 = v3.useMemo(function() --[[ Line: 132 ]]
        -- upvalues: v40 (copy), l_HttpService_0 (ref)
        return v40.impressionId or l_HttpService_0:GenerateGUID(false);
    end, {
        v40.impressionId, 
        v40.config.type
    });
    local v42 = v3.useRef(nil);
    local v43 = v14();
    local v44 = v3.useMemo(function() --[[ Line: 139 ]]
        -- upvalues: v15 (ref), v40 (copy), v16 (ref)
        return v15.evaluateUpsellStage(v40.upsellEntrySurface, v16.Banner, v40.upsellEntryComponent);
    end, {
        v40.upsellEntrySurface, 
        v40.upsellEntryComponent
    });
    l_useEffect_0(function() --[[ Line: 148 ]]
        -- upvalues: v41 (copy), v42 (copy), v15 (ref), l_EventTypes_0 (ref), v40 (copy), v44 (copy), v16 (ref), v19 (ref)
        if v41 and v42.current ~= v41 then
            v15.logUpsellEvent(l_EventTypes_0.SocialUpsellShown, {
                upsellPurpose = v40.config.type, 
                upsellEntrySurface = v40.upsellEntrySurface, 
                upsellStage = v44, 
                upsellImpressionId = v41, 
                upsellComponent = v16.Banner, 
                conversationId = v40.conversationId, 
                upsellEntryComponent = if v19 then v40.upsellEntryComponent else nil
            });
            v42.current = v41;
        end;
    end, {
        v40.config.type, 
        v40.upsellEntrySurface, 
        v44, 
        v41, 
        if v19 then v40.upsellEntryComponent else nil
    });
    l_useEffect_0(function() --[[ Line: 174 ]]
        -- upvalues: v40 (copy), v43 (copy)
        local l_type_0 = v40.config.type;
        local l_upsellEntrySurface_0 = v40.upsellEntrySurface;
        v43.setUpsellBannerData(l_type_0, l_upsellEntrySurface_0, v40.config);
        return function() --[[ Line: 179 ]]
            -- upvalues: v43 (ref), l_type_0 (copy), l_upsellEntrySurface_0 (copy)
            v43.setUpsellBannerData(l_type_0, l_upsellEntrySurface_0, nil);
        end;
    end, {
        v40.upsellEntrySurface, 
        v40.config, 
        v43
    });
    local v49 = l_useCallback_0(function(v47, v48) --[[ Line: 186 ]]
        -- upvalues: v15 (ref), l_EventTypes_0 (ref), v40 (copy), v44 (copy), v41 (copy), v16 (ref), v19 (ref)
        return function() --[[ Line: 187 ]]
            -- upvalues: v15 (ref), l_EventTypes_0 (ref), v40 (ref), v44 (ref), v41 (ref), v16 (ref), v48 (copy), v19 (ref), v47 (copy)
            v15.logUpsellEvent(l_EventTypes_0.SocialUpsellButtonClick, {
                upsellPurpose = v40.config.type, 
                upsellEntrySurface = v40.upsellEntrySurface, 
                upsellStage = v44, 
                upsellImpressionId = v41, 
                upsellComponent = v16.Banner, 
                btn = v48, 
                conversationId = v40.conversationId, 
                upsellEntryComponent = if v19 then v40.upsellEntryComponent else nil
            });
            v47(v41);
        end;
    end, {
        v40.upsellEntrySurface, 
        v40.config.type, 
        v44, 
        v41, 
        if v19 then v40.upsellEntryComponent else nil
    });
    local v50 = l_useCallback_0(v49(v40.onPrimaryAction, l_UPSELL_BUTTON_ACTION_0.Primary), {
        v49, 
        v40.onPrimaryAction
    });
    local v51 = l_useCallback_0(v49(v40.onSecondaryAction, l_UPSELL_BUTTON_ACTION_0.Secondary), {
        v49, 
        v40.onSecondaryAction
    });
    local v52 = l_useCallback_0(v49(v40.onDismiss, "Dismiss"), {
        v49, 
        v40.onDismiss
    });
    local v53 = v3.useMemo(function() --[[ Line: 229 ]]
        -- upvalues: v38 (ref), v40 (copy), l_UPSELL_BUTTON_ACTION_0 (ref), v50 (copy), v51 (copy), v52 (copy)
        return (v38(v40.config, {
            [l_UPSELL_BUTTON_ACTION_0.Primary] = v50, 
            [l_UPSELL_BUTTON_ACTION_0.Secondary] = v51, 
            [l_UPSELL_BUTTON_ACTION_0.Dismiss] = v52
        }));
    end, {
        v40.config, 
        v50, 
        v51, 
        v52
    });
    return v3.createElement(l_Banner_0, v9.Dictionary.join(v53, {
        isContained = v40.isContained
    }));
end;