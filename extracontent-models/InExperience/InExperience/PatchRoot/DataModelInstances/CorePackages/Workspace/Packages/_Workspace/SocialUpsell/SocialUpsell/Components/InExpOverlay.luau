local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.InputHandlers);
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_Parent_0.ReactRoblox);
local v9 = require(l_Parent_0.RoactRodux);
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v13 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local v14 = require(l_script_FirstAncestor_0.Store.getOverlayStore);
local v15 = require(l_Parent_0.ReactFocusNavigation);
local v16 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v16.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
local l_Provider_0 = v16.FocusNavigableSurfaceRegistry.Provider;
local l_FocusNavigationEventNameEnum_0 = v16.FocusNavigationEventNameEnum;
local l_FoundationProvider_0 = v5.FoundationProvider;
local l_useOverlay_0 = v5.Hooks.useOverlay;
local l_OVERLAY_TYPES_0 = require(l_script_FirstAncestor_0.Constants).OVERLAY_TYPES;
local _ = require(l_script_FirstAncestor_0.Types);
local v25 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
OverlayContent = function(_) --[[ Line: 52 ]] --[[ Name: OverlayContent ]]
    -- upvalues: l_useOverlay_0 (copy), v7 (copy), v14 (copy), v3 (copy), l_OVERLAY_TYPES_0 (copy), l_createLazyComponent_0 (copy), l_script_FirstAncestor_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v6 (copy), v8 (copy), l_FocusRoot_0 (copy), v25 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v27 = l_useOverlay_0();
    local v28 = v7.useSignalState(v14(false).getCurrentOverlay);
    local v29 = v3.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: l_OVERLAY_TYPES_0 (ref), l_createLazyComponent_0 (ref), l_script_FirstAncestor_0 (ref)
        return {
            [l_OVERLAY_TYPES_0.SocialUpsell] = {
                Component = l_createLazyComponent_0(function() --[[ Line: 60 ]]
                    -- upvalues: l_script_FirstAncestor_0 (ref)
                    return require(l_script_FirstAncestor_0.Components.InAppSocialUpsellOverlayWrapper);
                end)
            }
        };
    end, {});
    local v31 = v3.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v6 (ref), v14 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v6.onRelease(function(v30) --[[ Line: 70 ]]
                    -- upvalues: v14 (ref)
                    v14(false).dismissCurrentOverlay();
                    v30:cancel();
                end)
            }
        };
    end, {});
    if v27 and v28 and v28.overlayType and v29[v28.overlayType] then
        return v8.createPortal(v3.createElement(l_FocusRoot_0, {
            eventHandlers = v31, 
            eventMap = v25, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            shouldRestoreFocus = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            Content = v3.createElement(v29[v28.overlayType].Component, v28.overlayProps or {})
        }), v27);
    else
        return nil;
    end;
end;
return function(_) --[[ Line: 99 ]]
    -- upvalues: v3 (copy), v15 (copy), v9 (copy), v4 (copy), l_LocalizationProvider_0 (copy), v13 (copy), l_FoundationProvider_0 (copy), l_Provider_0 (copy)
    local v33 = v3.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v15 (ref)
        return v15.FocusNavigationService.new(v15.EngineInterface.CoreGui);
    end, {});
    v3.useEffect(function() --[[ Line: 112 ]]
        -- upvalues: v33 (copy)
        return function() --[[ Line: 113 ]]
            -- upvalues: v33 (ref)
            if v33 then
                v33:teardown();
            end;
        end;
    end, {
        v33
    });
    return v3.createElement(v9.StoreProvider, {
        store = v4.Store.new(v4.createReducer({}, {}), nil, {
            v4.thunkMiddleware
        })
    }, {
        LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
            localization = v13
        }, {
            FoundationProvider = v3.createElement(l_FoundationProvider_0, nil, {
                FocusProvider = v3.createElement(v15.FocusNavigationContext.Provider, {
                    value = v33
                }, {
                    FocusNavigationRegistryProvider = v3.createElement(l_Provider_0, nil, {
                        Content = v3.createElement(OverlayContent)
                    })
                })
            })
        })
    });
end;