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
local v18 = require(l_script_FirstAncestor_0.Flag.FFlagAddSurfaceTypeToAnalytics);
local v19 = require(l_script_FirstAncestor_0.Flag.FFlagAddMinorFixesToUpsellAnalytics);
local l_FFlagEnableSocialUpsellUIFixes_0 = v7.FFlagEnableSocialUpsellUIFixes;
local v21 = require(l_script_FirstAncestor_0.Flag.FFlagAddUpsellEntryComponentToAnalytics);
local l_UPSELL_BUTTON_ACTION_0 = v11.UPSELL_BUTTON_ACTION;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_Banner_0 = v5.Banner;
local v25 = {
    isContained = true
};
local function _(v26, v27) --[[ Line: 75 ]] --[[ Name: getButtonVariant ]]
    -- upvalues: v13 (copy), l_UPSELL_BUTTON_ACTION_0 (copy), l_ButtonVariant_0 (copy)
    local v28 = v13(v27);
    if v26.action then
        if v26.action == l_UPSELL_BUTTON_ACTION_0.Primary then
            if v28 then
                return l_ButtonVariant_0.SoftEmphasis;
            else
                return l_ButtonVariant_0.Emphasis;
            end;
        elseif v26.action == l_UPSELL_BUTTON_ACTION_0.Secondary then
            return l_ButtonVariant_0.Utility;
        end;
    end;
    return nil;
end;
local function v40(v30, v31) --[[ Line: 88 ]] --[[ Name: getBannerPropsFromConfig ]]
    -- upvalues: v13 (copy), l_UPSELL_BUTTON_ACTION_0 (copy), l_ButtonVariant_0 (copy), v11 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v6 (copy)
    local v32 = {};
    local v33 = {};
    if v30.buttons then
        for _, v35 in v30.buttons do
            local v36 = {
                text = v35.text
            };
            local v37 = v13(v30);
            v36.variant = if v35.action then if v35.action == l_UPSELL_BUTTON_ACTION_0.Primary then if v37 then l_ButtonVariant_0.SoftEmphasis else l_ButtonVariant_0.Emphasis else if v35.action == l_UPSELL_BUTTON_ACTION_0.Secondary then l_ButtonVariant_0.Utility else nil else nil;
            v36.onActivated = v31[v35.action];
            table.insert(v33, v36);
        end;
    end;
    if v30.labelItems then
        for _, v39 in v30.labelItems do
            if v39.type == v11.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN then
                table.insert(v32, {
                    text = v39.text, 
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
        title = v30.title, 
        body = v30.body, 
        badges = v32, 
        buttons = v33, 
        onDismiss = if v30.isDismissable then v31[l_UPSELL_BUTTON_ACTION_0.Dismiss] else nil, 
        image = v30.image, 
        icon = if v30.image then nil else v30.icon
    };
end;
return function(v41) --[[ Line: 131 ]] --[[ Name: UpsellBanner ]]
    -- upvalues: v9 (copy), v25 (copy), v3 (copy), l_HttpService_0 (copy), v14 (copy), v15 (copy), v16 (copy), v19 (copy), l_useEffect_0 (copy), l_EventTypes_0 (copy), v18 (copy), v21 (copy), l_useCallback_0 (copy), l_UPSELL_BUTTON_ACTION_0 (copy), v40 (copy), l_Banner_0 (copy)
    local v42 = v9.Dictionary.union(v25, v41);
    local v43 = v3.useMemo(function() --[[ Line: 134 ]]
        -- upvalues: v42 (copy), l_HttpService_0 (ref)
        return v42.impressionId or l_HttpService_0:GenerateGUID(false);
    end, {
        v42.impressionId, 
        v42.config.type
    });
    local v44 = v3.useRef(nil);
    local v45 = v14();
    local v46 = v3.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: v15 (ref), v42 (copy), v16 (ref), v19 (ref)
        return v15.evaluateUpsellStage(v42.upsellEntrySurface, v16.Banner, if v19 then v42.upsellEntryComponent else nil);
    end, {
        v42.upsellEntrySurface, 
        if v19 then v42.upsellEntryComponent else nil
    });
    l_useEffect_0(function() --[[ Line: 153 ]]
        -- upvalues: v43 (copy), v44 (copy), v15 (ref), l_EventTypes_0 (ref), v19 (ref), v42 (copy), v46 (copy), v18 (ref), v16 (ref), v21 (ref)
        if v43 and v44.current ~= v43 then
            v15.logUpsellEvent(l_EventTypes_0.SocialUpsellShown, {
                upsellPurpose = if v19 then v42.config.type else nil, 
                upsellEntrySurface = v42.upsellEntrySurface, 
                upsellStage = v46, 
                upsellImpressionId = v43, 
                upsellComponent = if v18 then v16.Banner else nil, 
                conversationId = v42.conversationId, 
                upsellEntryComponent = if v21 then v42.upsellEntryComponent else nil
            });
            v44.current = v43;
        end;
    end, {
        v42.config.type, 
        v42.upsellEntrySurface, 
        v46, 
        v43, 
        if v21 then v42.upsellEntryComponent else nil
    });
    l_useEffect_0(function() --[[ Line: 179 ]]
        -- upvalues: v42 (copy), v45 (copy)
        local l_type_0 = v42.config.type;
        local l_upsellEntrySurface_0 = v42.upsellEntrySurface;
        v45.setUpsellBannerData(l_type_0, l_upsellEntrySurface_0, v42.config);
        return function() --[[ Line: 184 ]]
            -- upvalues: v45 (ref), l_type_0 (copy), l_upsellEntrySurface_0 (copy)
            v45.setUpsellBannerData(l_type_0, l_upsellEntrySurface_0, nil);
        end;
    end, {
        v42.upsellEntrySurface, 
        v42.config, 
        v45
    });
    local v51 = l_useCallback_0(function(v49, v50) --[[ Line: 191 ]]
        -- upvalues: v15 (ref), l_EventTypes_0 (ref), v19 (ref), v42 (copy), v46 (copy), v43 (copy), v18 (ref), v16 (ref), v21 (ref)
        return function() --[[ Line: 192 ]]
            -- upvalues: v15 (ref), l_EventTypes_0 (ref), v19 (ref), v42 (ref), v46 (ref), v43 (ref), v18 (ref), v16 (ref), v50 (copy), v21 (ref), v49 (copy)
            v15.logUpsellEvent(l_EventTypes_0.SocialUpsellButtonClick, {
                upsellPurpose = if v19 then v42.config.type else nil, 
                upsellEntrySurface = v42.upsellEntrySurface, 
                upsellStage = v46, 
                upsellImpressionId = v43, 
                upsellComponent = if v18 then v16.Banner else nil, 
                btn = v50, 
                conversationId = v42.conversationId, 
                upsellEntryComponent = if v21 then v42.upsellEntryComponent else nil
            });
            v49(v43);
        end;
    end, {
        v42.upsellEntrySurface, 
        if v19 then v42.config.type else nil, 
        v46, 
        v43, 
        if v21 then v42.upsellEntryComponent else nil
    });
    local v52 = l_useCallback_0(v51(v42.onPrimaryAction, l_UPSELL_BUTTON_ACTION_0.Primary), {
        v51, 
        v42.onPrimaryAction
    });
    local v53 = l_useCallback_0(v51(v42.onSecondaryAction, l_UPSELL_BUTTON_ACTION_0.Secondary), {
        v51, 
        v42.onSecondaryAction
    });
    local v54 = l_useCallback_0(v51(v42.onDismiss, "Dismiss"), {
        v51, 
        v42.onDismiss
    });
    local v55 = v3.useMemo(function() --[[ Line: 234 ]]
        -- upvalues: v40 (ref), v42 (copy), l_UPSELL_BUTTON_ACTION_0 (ref), v52 (copy), v53 (copy), v54 (copy)
        return (v40(v42.config, {
            [l_UPSELL_BUTTON_ACTION_0.Primary] = v52, 
            [l_UPSELL_BUTTON_ACTION_0.Secondary] = v53, 
            [l_UPSELL_BUTTON_ACTION_0.Dismiss] = v54
        }));
    end, {
        v42.config, 
        v52, 
        v53, 
        v54
    });
    return v3.createElement(l_Banner_0, v9.Dictionary.join(v55, {
        isContained = v42.isContained
    }));
end;