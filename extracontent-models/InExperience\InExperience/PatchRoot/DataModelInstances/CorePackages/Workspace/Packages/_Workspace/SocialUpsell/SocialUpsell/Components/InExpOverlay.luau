local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.InputHandlers);
local v7 = require(l_Parent_0.SharedFlags);
local v8 = require(l_Parent_0.SignalsReact);
local v9 = require(l_Parent_0.ReactRoblox);
local v10 = require(l_Parent_0.RoactRodux);
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v14 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local v15 = require(l_script_FirstAncestor_0.Store.getOverlayStore);
local v16 = require(l_Parent_0.ReactFocusNavigation);
local v17 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v17.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v17.FocusNavigableSurfaceIdentifierEnum;
local l_Provider_0 = v17.FocusNavigableSurfaceRegistry.Provider;
local l_FFlagEnableSocialUpsellFocusFixes_0 = v7.FFlagEnableSocialUpsellFocusFixes;
local l_FocusNavigationEventNameEnum_0 = v17.FocusNavigationEventNameEnum;
local l_FoundationProvider_0 = v5.FoundationProvider;
local l_useOverlay_0 = v5.Hooks.useOverlay;
local l_OVERLAY_TYPES_0 = require(l_script_FirstAncestor_0.Constants).OVERLAY_TYPES;
local _ = require(l_script_FirstAncestor_0.Types);
local v27 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
OverlayContent = function(_) --[[ Line: 55 ]] --[[ Name: OverlayContent ]]
    -- upvalues: l_useOverlay_0 (copy), v8 (copy), v15 (copy), v3 (copy), l_OVERLAY_TYPES_0 (copy), l_createLazyComponent_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagEnableSocialUpsellFocusFixes_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v6 (copy), v9 (copy), l_FocusRoot_0 (copy), v27 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v29 = l_useOverlay_0();
    local v30 = v8.useSignalState(v15(false).getCurrentOverlay);
    local v31 = v3.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: l_OVERLAY_TYPES_0 (ref), l_createLazyComponent_0 (ref), l_script_FirstAncestor_0 (ref)
        return {
            [l_OVERLAY_TYPES_0.SocialUpsell] = {
                Component = l_createLazyComponent_0(function() --[[ Line: 63 ]]
                    -- upvalues: l_script_FirstAncestor_0 (ref)
                    return require(l_script_FirstAncestor_0.Components.InAppSocialUpsellOverlayWrapper);
                end)
            }
        };
    end, {});
    local v32 = nil;
    if l_FFlagEnableSocialUpsellFocusFixes_0 then
        v32 = v3.useMemo(function() --[[ Line: 72 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v6 (ref), v15 (ref)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v6.onRelease(function(v33) --[[ Line: 75 ]]
                        -- upvalues: v15 (ref)
                        v15(false).dismissCurrentOverlay();
                        v33:cancel();
                    end)
                }
            };
        end, {});
    end;
    if v29 and v30 and v30.overlayType and v31[v30.overlayType] then
        return v9.createPortal(if l_FFlagEnableSocialUpsellFocusFixes_0 then v3.createElement(l_FocusRoot_0, {
            eventHandlers = v32, 
            eventMap = v27, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            shouldRestoreFocus = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            Content = v3.createElement(v31[v30.overlayType].Component, v30.overlayProps or {})
        }) else v3.createElement(v31[v30.overlayType].Component, v30.overlayProps), v29);
    else
        return nil;
    end;
end;
return function(_) --[[ Line: 110 ]]
    -- upvalues: l_FFlagEnableSocialUpsellFocusFixes_0 (copy), v3 (copy), v16 (copy), v10 (copy), v4 (copy), l_LocalizationProvider_0 (copy), v14 (copy), l_FoundationProvider_0 (copy), l_Provider_0 (copy)
    if l_FFlagEnableSocialUpsellFocusFixes_0 then
        local v35 = v3.useMemo(function() --[[ Line: 120 ]]
            -- upvalues: v16 (ref)
            return v16.FocusNavigationService.new(v16.EngineInterface.CoreGui);
        end, {});
        v3.useEffect(function() --[[ Line: 124 ]]
            -- upvalues: v35 (copy)
            return function() --[[ Line: 125 ]]
                -- upvalues: v35 (ref)
                if v35 then
                    v35:teardown();
                end;
            end;
        end, {
            v35
        });
        return v3.createElement(v10.StoreProvider, {
            store = v4.Store.new(v4.createReducer({}, {}), nil, {
                v4.thunkMiddleware
            })
        }, {
            LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
                localization = v14
            }, {
                FoundationProvider = v3.createElement(l_FoundationProvider_0, nil, {
                    FocusProvider = v3.createElement(v16.FocusNavigationContext.Provider, {
                        value = v35
                    }, {
                        FocusNavigationRegistryProvider = v3.createElement(l_Provider_0, nil, {
                            Content = v3.createElement(OverlayContent)
                        })
                    })
                })
            })
        });
    else
        return v3.createElement(v10.StoreProvider, {
            store = v4.Store.new(v4.createReducer({}, {}), nil, {
                v4.thunkMiddleware
            })
        }, {
            LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
                localization = v14
            }, {
                FoundationProvider = v3.createElement(l_FoundationProvider_0, nil, {
                    Content = v3.createElement(OverlayContent)
                })
            })
        });
    end;
end;