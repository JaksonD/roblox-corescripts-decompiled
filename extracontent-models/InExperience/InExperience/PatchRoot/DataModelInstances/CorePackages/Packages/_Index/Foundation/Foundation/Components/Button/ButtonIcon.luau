local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local l_uiblox_0 = v2.Migration.uiblox;
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(script.Parent.Types);
local v7 = require(l_script_FirstAncestor_0.Components.Image);
local v8 = require(l_script_FirstAncestor_0.Components.Text);
local v9 = require(l_script_FirstAncestor_0.Utility.getIconScale);
local v10 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils);
local l_isMigrated_0 = v10.isMigrated;
local l_isBuilderOrMigratedIcon_0 = v10.isBuilderOrMigratedIcon;
local v13 = require(script.Parent.useButtonVariants);
local v14 = require(l_script_FirstAncestor_0.Providers.Style.useTextSizeOffset);
local v15 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
return function(v17) --[[ Line: 38 ]] --[[ Name: ButtonIcon ]]
    -- upvalues: v15 (copy), v14 (copy), v9 (copy), l_usePresentationContext_0 (copy), v13 (copy), l_isBuilderOrMigratedIcon_0 (copy), v4 (copy), v8 (copy), l_isMigrated_0 (copy), l_uiblox_0 (copy), v2 (copy), v7 (copy)
    local l_disabledTransparencyBinding_0 = v17.disabledTransparencyBinding;
    local l_textTransparencyBinding_0 = v17.textTransparencyBinding;
    local v20 = v15();
    local v21 = v14();
    local v22, v23 = v9(v17.icon, v17.size);
    local v24 = l_usePresentationContext_0();
    local v25 = v13(v20, v17.size, v17.variant, if v24 then v24.colorMode else nil);
    if not v17.icon then
        return nil;
    elseif l_isBuilderOrMigratedIcon_0(v17.icon) then
        return v4.createElement(v8, {
            Text = if l_isMigrated_0(v17.icon) then l_uiblox_0[v17.icon].name else v17.icon, 
            fontStyle = {
                Font = v2.Font[if l_isMigrated_0(v17.icon) then l_uiblox_0[v17.icon].variant else v2.IconVariant.Regular], 
                FontSize = v25.icon.size.Y.Offset
            }, 
            tag = "anchor-center-center position-center-center", 
            Size = v25.icon.size, 
            textStyle = v4.joinBindings({
                l_disabledTransparencyBinding_0, 
                l_textTransparencyBinding_0
            }):map(function(v26) --[[ Line: 71 ]]
                -- upvalues: v25 (copy)
                local v27 = v26[1];
                local v28 = v26[2];
                return {
                    Color3 = v25.content.style.Color3, 
                    Transparency = v28 + v27
                };
            end), 
            testId = ("%*--icon"):format(v17.testId)
        }, {
            UITextSizeConstraint = if v21 > 0 then v4.createElement("UITextSizeConstraint", {
                MaxTextSize = v25.icon.size.Y.Offset
            }) else nil
        });
    else
        return v4.createElement(v7, {
            tag = "anchor-center-center position-center-center", 
            Image = v17.icon, 
            Size = if v22 then UDim2.fromOffset(v22.X, v22.Y) else v25.icon.size, 
            imageStyle = v4.joinBindings({
                l_disabledTransparencyBinding_0, 
                l_textTransparencyBinding_0
            }):map(function(v29) --[[ Line: 97 ]]
                -- upvalues: v25 (copy)
                local v30 = v29[1];
                local v31 = v29[2];
                return {
                    Color3 = v25.content.style.Color3, 
                    Transparency = v31 + v30
                };
            end), 
            scale = v23, 
            testId = ("%*--icon"):format(v17.testId)
        });
    end;
end;