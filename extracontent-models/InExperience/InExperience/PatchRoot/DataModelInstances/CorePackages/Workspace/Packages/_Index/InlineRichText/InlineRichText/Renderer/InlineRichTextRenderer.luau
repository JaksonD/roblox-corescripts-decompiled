local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Types);
local l_InlineLayout_0 = require(l_Parent_0.InlineLayout).Components.InlineLayout;
local v8 = require(l_script_FirstAncestor_0.Enums.NodeType);
local v9 = require(l_script_FirstAncestor_0.Parser.parseXml);
local v10 = require(l_script_FirstAncestor_0.Renderer.processChildren);
local v11 = require(l_script_FirstAncestor_0.Renderer.NodeRenderers.TextSpanRenderer);
local v12 = require(l_script_FirstAncestor_0.Renderer.NodeRenderers.LinkRenderer);
local v13 = require(l_script_FirstAncestor_0.Renderer.NodeRenderers.IconRenderer);
local v14 = require(l_script_FirstAncestor_0.Renderer.NodeRenderers.HardbreakRenderer);
local v15 = require(l_script_FirstAncestor_0.Linker.useLinkerOnActivated);
local v16 = require(l_script_FirstAncestor_0.Enums.LinkType);
local v17 = require(l_script_FirstAncestor_0.Enums.LinkBehavior);
local v18 = require(l_script_FirstAncestor_0.Linker.getLinkType);
local function v20(v19) --[[ Line: 49 ]] --[[ Name: createDefaultRootNode ]]
    -- upvalues: v8 (copy)
    return {
        name = "ROOT", 
        text = "", 
        type = v8.Root, 
        children = {
            {
                name = "TEXT", 
                text = "", 
                type = v8.InlineCustom, 
                children = {
                    {
                        name = "PLAINTEXT", 
                        text = v19, 
                        type = v8.Plaintext, 
                        children = {}, 
                        attributes = {}, 
                        index = 2
                    }
                }, 
                attributes = {}, 
                index = 1
            }
        }, 
        attributes = {}, 
        index = 0
    };
end;
local v21 = {
    TEXT_SPAN = v11, 
    LINK = v12, 
    ICON = v13, 
    BREAK = v14
};
local v22 = {
    [v16.Http] = v17.Webview, 
    [v16.LinkingProtocolRegistered] = v17.LinkingProtocol, 
    [v16.Default] = v17.ErrorToast
};
local v25 = {
    evaluateLinkBehavior = function(_, v24) --[[ Line: 90 ]] --[[ Name: evaluateLinkBehavior ]]
        -- upvalues: v22 (copy), v17 (copy)
        return v22[v24] or v17.ErrorToast;
    end, 
    errorToastText = nil
};
return function(v26) --[[ Line: 96 ]] --[[ Name: InlineRichTextRenderer ]]
    -- upvalues: v5 (copy), v9 (copy), v2 (copy), v20 (copy), v4 (copy), v3 (copy), v25 (copy), v15 (copy), v18 (copy), v21 (copy), v10 (copy), l_InlineLayout_0 (copy)
    local l_ast_0 = v26.ast;
    local l_text_0 = v26.text;
    local v31 = v5.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: l_ast_0 (copy), v9 (ref), l_text_0 (copy), v26 (copy), v2 (ref), v20 (ref)
        if l_ast_0 then
            return l_ast_0;
        else
            local v29, v30 = v9(l_text_0, v26.parserOptions);
            if not v29 then
                v2:warning((("Error parsing XML input into AST: %*"):format(v30)));
                return (v20(l_text_0));
            else
                return v30;
            end;
        end;
    end, {
        l_text_0, 
        l_ast_0
    });
    local v32 = v4.Hooks.useTokens();
    local l_Default_0 = v32.Color.Content.Default;
    local v34 = {
        Font = Enum.Font.BuilderSans, 
        FontSize = v32.FontSize.FontSize_400, 
        LineHeight = v32.LineHeight.LineHeight_140
    };
    local v35 = v3.Dictionary.union(v25, v26.linkerOptions or {});
    local v36 = v15({
        errorToastTextOverride = v35.errorToastText
    });
    local v38 = v5.useCallback(function(v37) --[[ Line: 123 ]]
        -- upvalues: v35 (copy), v18 (ref)
        return v35.evaluateLinkBehavior(v37, v18(v37));
    end, {
        v35.evaluateLinkBehavior
    });
    local v39 = v5.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: v3 (ref), v21 (ref), v26 (copy), v10 (ref), l_Default_0 (copy), v34 (copy), v32 (copy), v36 (copy), v38 (copy)
        return {
            inlineCustomRenderers = v3.Dictionary.join(v21, v26.renderers or {}), 
            processChildren = v10, 
            nodeProps = v26.nodeProps or {}, 
            styles = {
                textStyle = v3.Dictionary.union(l_Default_0, v26.textStyle or {}), 
                fontStyle = v3.Dictionary.union(v34, v26.fontStyle or {})
            }, 
            tokens = v32, 
            linker = {
                onActivated = v36, 
                evaluateLinkBehavior = v38
            }
        };
    end, {
        v26.renderers, 
        v26.nodeProps, 
        v26.textStyle, 
        v26.fontStyle, 
        v36, 
        v38
    });
    local v40 = v5.useMemo(function() --[[ Line: 153 ]]
        -- upvalues: v10 (ref), v31 (copy), v39 (copy)
        return v10(v31, v39);
    end, {
        v31 and v31.children, 
        v39
    });
    return v5.createElement(v4.View, v26.wrapperProps, {
        RichTextRoot = v5.createElement(l_InlineLayout_0, {
            Elements = v40, 
            HorizontalAlignment = v26.HorizontalAlignment, 
            VerticalPadding = UDim.new((v39.styles.fontStyle.LineHeight - 1) / 2, 0)
        })
    });
end;