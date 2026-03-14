local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.InlineLayout);
local l_TextElement_0 = v3.Components.InlineLayoutElements.TextElement;
local l_LinkElement_0 = v3.Components.InlineLayoutElements.LinkElement;
local v6 = require(l_script_FirstAncestor_0.Enums.LinkBehavior);
local v7 = require(l_script_FirstAncestor_0.Renderer.NodeRenderers.InlineCustomRenderer);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v9, v10) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v6 (copy), v7 (copy), l_TextElement_0 (copy), l_LinkElement_0 (copy)
    local v11 = {
        textStyle = v10.styles.textStyle, 
        showUnderline = true
    };
    local v12 = v2.Dictionary.union(v11, v10.nodeProps or {});
    local v13 = v9.attributes.href or "";
    local v14 = v10.linker.evaluateLinkBehavior(v13);
    if v14 == v6.Hide then
        return {};
    elseif v14 == v6.Disable then
        return v7(v2.Dictionary.join(v9, {
            name = "TEXT_SPAN"
        }), v10);
    else
        local v15 = v10.processChildren(v9, v10);
        local v18 = v2.List.map(v15, function(v16, v17) --[[ Line: 30 ]]
            -- upvalues: l_TextElement_0 (ref), v12 (copy), v2 (ref), v10 (copy), v11 (copy)
            return l_TextElement_0.new({
                LayoutOrder = v17, 
                EngineTags = if v12.showUnderline then v2.List.join({
                    {
                        name = "u", 
                        attributes = {}
                    }
                }, v16.engineTags) else v16.engineTags, 
                Text = v16.text, 
                fontStyle = v10.styles.fontStyle, 
                textStyle = v2.Dictionary.union(v11.textStyle, v12.textStyle)
            });
        end);
        if #v18 > 0 then
            return {
                l_LinkElement_0.new(v18, {
                    onActivated = function() --[[ Line: 44 ]] --[[ Name: onActivated ]]
                        -- upvalues: v10 (copy), v13 (copy), v14 (copy)
                        v10.linker.onActivated({
                            url = v13, 
                            linkBehavior = v14
                        });
                    end
                })
            };
        else
            return {};
        end;
    end;
end;