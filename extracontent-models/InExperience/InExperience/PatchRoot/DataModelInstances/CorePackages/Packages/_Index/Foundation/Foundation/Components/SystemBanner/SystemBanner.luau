local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Components.AlertActions);
local v6 = require(l_script_FirstAncestor_0.Components.AlertActions.AlertConstants);
local v7 = require(l_script_FirstAncestor_0.Enums.AlertSeverity);
local v8 = require(l_script_FirstAncestor_0.Enums.AlertVariant);
local v9 = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v10 = require(l_Parent_0.BuilderIcons);
local v11 = require(l_script_FirstAncestor_0.Components.Button);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v13 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v14 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v15 = require(l_script_FirstAncestor_0.Utility.Flags);
local v16 = require(l_script_FirstAncestor_0.Components.Icon);
local v17 = require(l_script_FirstAncestor_0.Enums.IconSize);
local l_IconVariant_0 = v10.IconVariant;
local v19 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v20 = require(l_script_FirstAncestor_0.Utility.Logger);
local v21 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local v22 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v24 = require(l_script_FirstAncestor_0.Components.View);
local v25 = require(l_script_FirstAncestor_0.Providers.Responsive.Hooks.useBreakpoint);
local v26 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v27 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v28 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v29 = require(script.Parent.useSystemBannerVariants);
local v30 = if v15.FoundationSystemBannerUseSharedAlertActions then v6.SEVERITY_TO_ICON else {
    [v7.Info] = "circle-i", 
    [v7.Warning] = "triangle-exclamation", 
    [v7.Success] = "circle-check", 
    [v7.Error] = "circle-x"
};
local v31 = {
    variant = v8.Standard, 
    testId = "--foundation-system-banner"
};
return v3.memo(v3.forwardRef(function(v32, v33) --[[ Line: 68 ]] --[[ Name: SystemBanner ]]
    -- upvalues: v28 (copy), v31 (copy), v26 (copy), v29 (copy), v3 (copy), v4 (copy), v25 (copy), v9 (copy), v15 (copy), v5 (copy), v20 (copy), v2 (copy), v19 (copy), v11 (copy), v24 (copy), v27 (copy), v21 (copy), v16 (copy), v30 (copy), v17 (copy), l_IconVariant_0 (copy), v22 (copy), v13 (copy), v14 (copy)
    local v34 = v28(v32, v31);
    local v35 = v26();
    local v36 = v29(v35, v34.variant, v34.severity);
    local v37, v38 = v3.useState(nil);
    local v39 = v4.useComposedRef(v33, v38);
    local v40 = v25(v37);
    local v41 = true;
    if v40 ~= v9.XSmall then
        v41 = v40 == v9.Small;
    end;
    local v46 = v3.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: v15 (ref), v3 (ref), v5 (ref), v34 (copy), v41 (copy), v35 (copy), v20 (ref), v2 (ref), v19 (ref), v11 (ref)
        if v15.FoundationSystemBannerUseSharedAlertActions then
            return (v3.createElement(v5, {
                actions = v34.actions, 
                testId = ("%*--actions"):format(v34.testId), 
                LayoutOrder = 3, 
                tag = {
                    ["row gap-small auto-xy"] = true, 
                    ["align-x-left"] = v41, 
                    ["align-x-right"] = not v41
                }, 
                padding = if v41 then {
                    top = UDim.new(0, v35.Gap.Small)
                } else nil
            }));
        else
            local v42 = nil;
            if v34.actions and #v34.actions > 0 then
                v42 = {};
                for v43, v44 in v34.actions do
                    if v43 > 3 then
                        v20:warning((("SystemBanner only supports up to %* actions"):format(3)));
                        return v42;
                    else
                        local v45 = v2.join(v44, {
                            LayoutOrder = v43, 
                            size = v19.Small, 
                            testId = ("%*--action-%*"):format(v34.testId, v43)
                        });
                        v42["ActionButton" .. v43] = v3.createElement(v11, v45);
                    end;
                end;
            end;
            return v42;
        end;
    end, {
        v34.actions, 
        v34.testId, 
        v41, 
        v35.Gap.Small
    });
    local v47 = if not v15.FoundationSystemBannerUseSharedAlertActions and v46 then v3.createElement(v24, {
        tag = {
            ["auto-xy row gap-small"] = true, 
            ["align-x-left"] = v41, 
            ["align-x-right"] = not v41
        }, 
        padding = if v41 then {
            top = UDim.new(0, v35.Gap.Small)
        } else nil, 
        LayoutOrder = 3, 
        testId = ("%*--actions"):format(v34.testId)
    }, v46) else nil;
    return v3.createElement(v24, v27(v34, {
        tag = {
            [v36.container.tag] = true, 
            ["align-y-center"] = v34.description == nil, 
            ["align-y-top"] = v34.description ~= nil
        }, 
        ref = v39
    }), v3.createElement(v21.Provider, {
        value = {
            colorMode = v36.container.colorMode
        }
    }, {
        Icon = v3.createElement(v16, {
            LayoutOrder = 1, 
            name = v30[v34.severity], 
            size = v17.Large, 
            variant = l_IconVariant_0.Filled, 
            style = v36.icon.style, 
            testId = ("%*--icon"):format(v34.testId)
        }), 
        Content = v3.createElement(v24, {
            LayoutOrder = 2, 
            tag = {
                ["auto-xy fill"] = true, 
                col = v41, 
                row = not v41
            }, 
            testId = ("%*--content"):format(v34.testId)
        }, {
            Text = v3.createElement(v24, {
                LayoutOrder = 2, 
                tag = "auto-xy col"
            }, {
                Title = v3.createElement(v22, {
                    Text = v34.title, 
                    textStyle = v36.title.style, 
                    tag = v36.title.tag, 
                    LayoutOrder = 1, 
                    testId = ("%*--title"):format(v34.testId)
                }), 
                Description = if v34.description then v3.createElement(v22, {
                    Text = v34.description, 
                    textStyle = v36.description.style, 
                    tag = v36.description.tag, 
                    LayoutOrder = 2, 
                    testId = ("%*--description"):format(v34.testId)
                }) else nil, 
                Actions = if v41 then if v15.FoundationSystemBannerUseSharedAlertActions then v46 else v47 else nil
            })
        }), 
        Actions = if not v41 then if v15.FoundationSystemBannerUseSharedAlertActions then v46 else v47 else nil, 
        Close = if v34.onClose ~= nil then v3.createElement(v13, {
            onActivated = v34.onClose, 
            size = v19.Small, 
            variant = v14.Utility, 
            LayoutOrder = 4, 
            testId = ("%*--close"):format(v34.testId)
        }) else nil
    }));
end));