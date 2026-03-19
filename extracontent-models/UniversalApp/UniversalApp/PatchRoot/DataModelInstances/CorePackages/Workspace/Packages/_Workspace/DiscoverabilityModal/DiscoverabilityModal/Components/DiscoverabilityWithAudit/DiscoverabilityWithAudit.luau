local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoverabilityModal");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Analytics_0 = l_script_FirstAncestor_0.Analytics;
local v4 = require(l_Analytics_0.useAnalytics);
local v5 = require(l_Analytics_0.Enums.EventNames);
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local v7 = require(l_Parent_0.LegallySensitiveContent);
local l_useLegallySensitiveContentAndActions_0 = v7.useLegallySensitiveContentAndActions;
local l_ConsentName_0 = v7.ConsentName;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_UpdateIsDiscoverabilityUnset_0 = require(l_Parent_0.SocialModalsCommon).Actions.UpdateIsDiscoverabilityUnset;
local v13 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v13.Dialog;
local l_DialogSize_0 = v13.Enums.DialogSize;
local l_ButtonVariant_0 = v13.Enums.ButtonVariant;
return function(_) --[[ Line: 24 ]] --[[ Name: DiscoverabilityWithAudit ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_useLegallySensitiveContentAndActions_0 (copy), l_ConsentName_0 (copy), v2 (copy), v5 (copy), v6 (copy), l_UpdateIsDiscoverabilityUnset_0 (copy), l_ButtonVariant_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy)
    local v18 = l_useNavigation_0();
    local v19 = l_useDispatch_0();
    local v20 = v4();
    local v21, v22 = l_useLegallySensitiveContentAndActions_0(l_ConsentName_0.phoneNumberDiscoverabilityUpsell, "generic-lua-discoverability-setting-upsell");
    local l_wordsOfConsent_0 = v21.wordsOfConsent;
    local l_updateSettingWithAuditing_0 = v22.updateSettingWithAuditing;
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v20 (copy), v5 (ref), v6 (ref)
        v20.fireAnalyticsEvent(v5.DiscoverabilityModalLoad, {
            version = "audit_version", 
            wordingVersion = v6.WORDING_VERSION_1
        });
    end, {});
    local v25 = v2.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v19 (copy), l_UpdateIsDiscoverabilityUnset_0 (ref)
        v19(l_UpdateIsDiscoverabilityUnset_0({
            isDiscoverabilityUnset = false
        }));
    end, {});
    local v26 = v18.getParam(v6.NAVIGATE_ON_ACTIVATED);
    local v27 = {
        {
            text = l_wordsOfConsent_0.notNow, 
            variant = l_ButtonVariant_0.Standard, 
            onActivated = function() --[[ Line: 56 ]] --[[ Name: onActivated ]]
                -- upvalues: v20 (copy), v5 (ref), v6 (ref), v25 (copy), v18 (copy), v26 (copy)
                v20.fireAnalyticsEvent(v5.DiscoverabilityModalClose, {
                    selected = v6.UNSET
                });
                v25();
                v18.pop();
                v26();
            end
        }, 
        {
            text = l_wordsOfConsent_0.turnOn, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = function() --[[ Line: 68 ]] --[[ Name: onActivated ]]
                -- upvalues: v20 (copy), v5 (ref), v6 (ref), l_updateSettingWithAuditing_0 (copy), v25 (copy), v18 (copy), v26 (copy)
                v20.fireAnalyticsEvent(v5.DiscoverabilityModalContinue, {
                    selected = v6.DISCOVERABLE
                });
                l_updateSettingWithAuditing_0("phoneNumberDiscoverability", "Discoverable");
                v25();
                v18.pop();
                v26();
            end
        }
    };
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        hasBackdrop = true
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = l_wordsOfConsent_0.title
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            DialogView = v2.createElement(l_Dialog_0.Text, {
                Text = l_wordsOfConsent_0.content
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = v27
        })
    });
end;