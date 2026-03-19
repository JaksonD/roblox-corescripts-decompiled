local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_isBuilderOrMigratedIcon_0 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils).isBuilderOrMigratedIcon;
local v5 = require(l_script_FirstAncestor_0.Utility.Logger);
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(l_script_FirstAncestor_0.Components.Icon);
local v8 = require(l_script_FirstAncestor_0.Components.Image);
local v9 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Components.View);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local v17 = require(script.Parent.BaseMenuContext);
local v18 = require(script.Parent.useBaseMenuItemVariants);
local v19 = {
    isChecked = false
};
return v3.memo(v3.forwardRef(function(v20, v21) --[[ Line: 47 ]] --[[ Name: BaseMenuItem ]]
    -- upvalues: v14 (copy), v19 (copy), v3 (copy), v17 (copy), v12 (copy), v18 (copy), v5 (copy), v2 (copy), v11 (copy), v13 (copy), v6 (copy), l_isBuilderOrMigratedIcon_0 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v22 = v14(v20, v19);
    local v23 = v3.useContext(v17);
    local l_hasLeading_0 = v23.hasLeading;
    local v25 = v12();
    local v26 = v22.size or v23.size;
    local v27 = v18(v25, v26, v22.isChecked);
    v3.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v22 (copy), v23 (copy)
        if v22.icon and v23.setHasLeading then
            v23.setHasLeading();
        end;
    end, {
        v22.icon, 
        v23.setHasLeading
    });
    local v30 = v3.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v22 (copy), v23 (copy), v5 (ref)
        local v28 = if v22.onActivated then v22.onActivated else v23.onActivated;
        if not v28 then
            v5:warning("Menu should have either onActivated on itself or on all of its children");
            v28 = function(_) --[[ Line: 67 ]]

            end;
        end;
        v28(v22.id);
    end, {
        v22.onActivated, 
        v23.onActivated
    });
    local v31 = v3.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v25 (copy)
        return {
            radius = UDim.new(0, v25.Radius.Small), 
            offset = v25.Size.Size_200, 
            borderWidth = v25.Stroke.Thicker
        };
    end, {
        v25
    });
    local v32 = v3.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v2 (ref), v22 (copy)
        return v2.Migration.uiblox[v22.icon];
    end, {
        v22.icon
    });
    return v3.createElement(v11, v13(v22, {
        GroupTransparency = if v22.isDisabled then v6.DISABLED_TRANSPARENCY else nil, 
        isDisabled = v22.isDisabled, 
        onActivated = v30, 
        selection = {
            Selectable = not v22.isDisabled
        }, 
        cursor = v31, 
        tag = v27.container.tag, 
        ref = v21
    }), {
        Icon = if not not v22.icon or l_hasLeading_0 then if v22.icon and l_isBuilderOrMigratedIcon_0(v22.icon) then v3.createElement(v11, {
            LayoutOrder = 1, 
            tag = ("%* align-x-center align-y-center"):format(v27.icon.tag)
        }, {
            Icon = v3.createElement(v7, {
                name = if v32 then v32.name else v22.icon, 
                style = v27.icon.style, 
                size = v27.icon.size
            })
        }) else v3.createElement(v8, {
            LayoutOrder = 1, 
            Image = v22.icon, 
            tag = v27.icon.tag
        }) else nil, 
        Text = v3.createElement(v9, {
            LayoutOrder = 2, 
            Text = v22.text, 
            tag = v27.text.tag
        }), 
        Check = if v22.isChecked then v3.createElement(v7, {
            LayoutOrder = 3, 
            name = v2.Icon.Check, 
            style = v27.check.style, 
            size = v27.check.size, 
            testId = ("%*--checkmark"):format(v22.testId)
        }) else nil
    });
end));