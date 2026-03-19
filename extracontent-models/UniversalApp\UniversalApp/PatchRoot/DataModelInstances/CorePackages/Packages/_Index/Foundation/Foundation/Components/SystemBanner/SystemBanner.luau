local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Enums.AlertSeverity);
local v6 = require(l_script_FirstAncestor_0.Enums.AlertVariant);
local v7 = require(l_script_FirstAncestor_0.Components.Button);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v9 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v10 = require(l_script_FirstAncestor_0.Components.Icon);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local v12 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v14 = require(l_script_FirstAncestor_0.Components.View);
local v15 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v16 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v17 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v18 = require(l_Parent_0.BuilderIcons);
local v19 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v20 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v21 = require(l_script_FirstAncestor_0.Enums.InputSize);
local l_IconVariant_0 = v18.IconVariant;
local v23 = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v24 = require(l_script_FirstAncestor_0.Utility.Logger);
local v25 = require(l_script_FirstAncestor_0.Providers.Responsive.Hooks.useBreakpoint);
local v26 = require(script.Parent.useSystemBannerVariants);
local v27 = {
    variant = v6.Standard, 
    testId = "--foundation-system-banner"
};
local v28 = {
    [v5.Info] = "circle-i", 
    [v5.Warning] = "triangle-exclamation", 
    [v5.Success] = "circle-check", 
    [v5.Error] = "circle-x"
};
return v3.memo(v3.forwardRef(function(v29, v30) --[[ Line: 68 ]] --[[ Name: SystemBanner ]]
    -- upvalues: v17 (copy), v27 (copy), v15 (copy), v26 (copy), v3 (copy), v4 (copy), v25 (copy), v23 (copy), v24 (copy), v2 (copy), v21 (copy), v7 (copy), v14 (copy), v16 (copy), v11 (copy), v10 (copy), v28 (copy), v20 (copy), l_IconVariant_0 (copy), v12 (copy), v9 (copy), v19 (copy)
    local v31 = v17(v29, v27);
    local v32 = v15();
    local v33 = v26(v32, v31.variant, v31.severity);
    local v34, v35 = v3.useState(nil);
    local v36 = v4.useComposedRef(v30, v35);
    local v37 = v25(v34);
    local v38 = true;
    if v37 ~= v23.XSmall then
        v38 = v37 == v23.Small;
    end;
    local v43 = v3.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: v31 (copy), v24 (ref), v2 (ref), v21 (ref), v3 (ref), v7 (ref)
        local v39 = nil;
        if v31.actions and #v31.actions > 0 then
            v39 = {};
            for v40, v41 in v31.actions do
                if v40 > 3 then
                    v24:warning((("SystemBanner only supports up to %* actions"):format(3)));
                    return v39;
                else
                    local v42 = v2.join(v41, {
                        LayoutOrder = v40, 
                        size = v21.Small, 
                        testId = ("%*--action-%*"):format(v31.testId, v40)
                    });
                    v39["ActionButton" .. v40] = v3.createElement(v7, v42);
                end;
            end;
        end;
        return v39;
    end, {
        v31.actions
    });
    local v44 = if v43 then v3.createElement(v14, {
        tag = {
            ["auto-xy row gap-small"] = true, 
            ["align-x-left"] = v38, 
            ["align-x-right"] = not v38
        }, 
        padding = if v38 then {
            top = UDim.new(0, v32.Gap.Small)
        } else nil, 
        LayoutOrder = 3, 
        testId = ("%*--actions"):format(v31.testId)
    }, v43) else nil;
    return v3.createElement(v14, v16(v31, {
        tag = {
            [v33.container.tag] = true, 
            ["align-y-center"] = v31.description == nil, 
            ["align-y-top"] = v31.description ~= nil
        }, 
        ref = v36
    }), v3.createElement(v11.Provider, {
        value = {
            colorMode = v33.container.colorMode
        }
    }, {
        Icon = v3.createElement(v10, {
            LayoutOrder = 1, 
            name = v28[v31.severity], 
            size = v20.Large, 
            variant = l_IconVariant_0.Filled, 
            style = v33.icon.style, 
            testId = ("%*--icon"):format(v31.testId)
        }), 
        Content = v3.createElement(v14, {
            LayoutOrder = 2, 
            tag = {
                ["auto-xy fill"] = true, 
                col = v38, 
                row = not v38
            }, 
            testId = ("%*--content"):format(v31.testId)
        }, {
            Text = v3.createElement(v14, {
                LayoutOrder = 2, 
                tag = "auto-xy col"
            }, {
                Title = v3.createElement(v12, {
                    Text = v31.title, 
                    textStyle = v33.title.style, 
                    tag = v33.title.tag, 
                    LayoutOrder = 1, 
                    testId = ("%*--title"):format(v31.testId)
                }), 
                Description = if v31.description then v3.createElement(v12, {
                    Text = v31.description, 
                    textStyle = v33.description.style, 
                    tag = v33.description.tag, 
                    LayoutOrder = 2, 
                    testId = ("%*--description"):format(v31.testId)
                }) else nil, 
                Actions = if v38 then v44 else nil
            })
        }), 
        Actions = if not v38 then v44 else nil, 
        Close = if v31.onClose ~= nil then v3.createElement(v9, {
            onActivated = v31.onClose, 
            size = v21.Small, 
            variant = v19.Utility, 
            LayoutOrder = 4, 
            testId = ("%*--close"):format(v31.testId)
        }) else nil
    }));
end));