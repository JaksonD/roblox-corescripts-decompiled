local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.BuilderIcons);
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.Image);
local v6 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_uiblox_0 = v3.Migration.uiblox;
local v11 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local v13 = require(l_script_FirstAncestor_0.Utility.getIconScale);
local v14 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils);
local l_isMigrated_0 = v14.isMigrated;
local l_isBuilderOrMigratedIcon_0 = v14.isBuilderOrMigratedIcon;
local v17 = require(l_script_FirstAncestor_0.Constants);
local v18 = require(script.Parent.useTabItemVariants);
return v2.memo(v2.forwardRef(function(v19, v20) --[[ Line: 53 ]] --[[ Name: TabItem ]]
    -- upvalues: v9 (copy), v11 (copy), v18 (copy), v2 (copy), v3 (copy), l_isBuilderOrMigratedIcon_0 (copy), v4 (copy), l_isMigrated_0 (copy), l_uiblox_0 (copy), v13 (copy), v5 (copy), v8 (copy), v17 (copy), v6 (copy)
    local v21 = v9();
    local v22 = if v19.isActive then v21.Color.Content.Default else v21.Color.Content.Emphasis;
    local v23 = v19.fillBehavior == v11.Fill;
    local v24 = v18(v21, v19.size, v23);
    local v25 = v2.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v21 (copy)
        return {
            radius = UDim.new(0, 0), 
            offset = 0, 
            borderWidth = v21.Stroke.Thicker
        };
    end, {
        v21
    });
    local v26 = v2.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v19 (copy), v3 (ref)
        if v19.icon == nil then
            return nil;
        elseif typeof(v19.icon) == "string" then
            return {
                name = v19.icon, 
                variant = v3.IconVariant.Regular
            };
        else
            return v19.icon;
        end;
    end, {
        v19.icon
    });
    local v27 = nil;
    if v26 then
        if l_isBuilderOrMigratedIcon_0(v26.name) then
            v27 = v2.createElement(v4, {
                name = if l_isMigrated_0(v26.name) then l_uiblox_0[v26.name].name else v26.name, 
                variant = if l_isMigrated_0(v26.name) then l_uiblox_0[v26.name].variant else v26.variant, 
                size = v24.icon.size, 
                style = v22
            });
        else
            local v28, v29 = v13(v26.name, v24.icon.size);
            if v28 then
                v27 = v2.createElement(v5, {
                    Image = v26.name, 
                    Size = UDim2.fromOffset(v28.X, v28.Y), 
                    imageStyle = v22, 
                    scale = v29
                });
            end;
        end;
    end;
    local v30 = nil;
    local v31 = nil;
    if v23 then
        v30 = UDim2.fromScale(1, 1);
        v31 = nil;
    else
        local l_Size_100_0 = v21.Size.Size_100;
        v30 = UDim2.new(1, l_Size_100_0 * 2, 1, 0);
        v31 = UDim2.fromOffset(-l_Size_100_0, 0);
    end;
    return v2.createElement(v8, {
        tag = v24.container.tag, 
        GroupTransparency = if v19.isDisabled then v17.DISABLED_TRANSPARENCY else nil, 
        testId = v19.testId
    }, {
        Interactive = v2.createElement(v8, {
            LayoutOrder = 1, 
            Size = v30, 
            Position = v31, 
            onActivated = function() --[[ Line: 125 ]] --[[ Name: onActivated ]]
                -- upvalues: v19 (copy)
                v19.onActivated(v19.id);
            end, 
            selection = {
                Selectable = not v19.isDisabled
            }, 
            cursor = v25, 
            isDisabled = v19.isDisabled, 
            ref = v20
        }), 
        Content = v2.createElement(v8, {
            LayoutOrder = 2, 
            tag = v24.content.tag
        }, {
            Icon = if v19.icon then v27 else nil, 
            Text = v2.createElement(v6, {
                Text = v19.text, 
                style = v22, 
                tag = v24.text.tag, 
                LayoutOrder = 2
            })
        })
    });
end));