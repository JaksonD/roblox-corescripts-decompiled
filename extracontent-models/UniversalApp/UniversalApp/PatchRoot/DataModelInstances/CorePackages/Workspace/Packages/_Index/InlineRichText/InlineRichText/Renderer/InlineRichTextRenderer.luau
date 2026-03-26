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
local l_FFlagInlineRichTextVerticalPaddingFix_0 = require(l_Parent_0.SharedFlags).FFlagInlineRichTextVerticalPaddingFix;
local function v21(v20) --[[ Line: 51 ]] --[[ Name: createDefaultRootNode ]]
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
                        text = v20, 
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
local v22 = {
    TEXT_SPAN = v11, 
    LINK = v12, 
    ICON = v13, 
    BREAK = v14
};
local v23 = {
    [v16.Http] = v17.Webview, 
    [v16.LinkingProtocolRegistered] = v17.LinkingProtocol, 
    [v16.Default] = v17.ErrorToast
};
local v26 = {
    evaluateLinkBehavior = function(_, v25) --[[ Line: 92 ]] --[[ Name: evaluateLinkBehavior ]]
        -- upvalues: v23 (copy), v17 (copy)
        return v23[v25] or v17.ErrorToast;
    end, 
    errorToastText = nil
};
return function(v27) --[[ Line: 98 ]] --[[ Name: InlineRichTextRenderer ]]
    -- upvalues: v5 (copy), v9 (copy), v2 (copy), v21 (copy), v4 (copy), v3 (copy), v26 (copy), v15 (copy), v18 (copy), v22 (copy), v10 (copy), l_InlineLayout_0 (copy), l_FFlagInlineRichTextVerticalPaddingFix_0 (copy)
    local l_ast_0 = v27.ast;
    local l_text_0 = v27.text;
    local v32 = v5.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: l_ast_0 (copy), v9 (ref), l_text_0 (copy), v27 (copy), v2 (ref), v21 (ref)
        if l_ast_0 then
            return l_ast_0;
        else
            local v30, v31 = v9(l_text_0, v27.parserOptions);
            if not v30 then
                v2:warning((("Error parsing XML input into AST: %*"):format(v31)));
                return (v21(l_text_0));
            else
                return v31;
            end;
        end;
    end, {
        l_text_0, 
        l_ast_0
    });
    local v33 = v4.Hooks.useTokens();
    local l_Default_0 = v33.Color.Content.Default;
    local v35 = {
        Font = Enum.Font.BuilderSans, 
        FontSize = v33.FontSize.FontSize_400, 
        LineHeight = v33.LineHeight.LineHeight_140
    };
    local v36 = v3.Dictionary.union(v26, v27.linkerOptions or {});
    local v37 = v15({
        errorToastTextOverride = v36.errorToastText
    });
    local v39 = v5.useCallback(function(v38) --[[ Line: 125 ]]
        -- upvalues: v36 (copy), v18 (ref)
        return v36.evaluateLinkBehavior(v38, v18(v38));
    end, {
        v36.evaluateLinkBehavior
    });
    local v40 = v5.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v3 (ref), v22 (ref), v27 (copy), v10 (ref), l_Default_0 (copy), v35 (copy), v33 (copy), v37 (copy), v39 (copy)
        return {
            inlineCustomRenderers = v3.Dictionary.join(v22, v27.renderers or {}), 
            processChildren = v10, 
            nodeProps = v27.nodeProps or {}, 
            styles = {
                textStyle = v3.Dictionary.union(l_Default_0, v27.textStyle or {}), 
                fontStyle = v3.Dictionary.union(v35, v27.fontStyle or {})
            }, 
            tokens = v33, 
            linker = {
                onActivated = v37, 
                evaluateLinkBehavior = v39
            }
        };
    end, {
        v27.renderers, 
        v27.nodeProps, 
        v27.textStyle, 
        v27.fontStyle, 
        v37, 
        v39
    });
    local v41 = v5.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v10 (ref), v32 (copy), v40 (copy)
        return v10(v32, v40);
    end, {
        v32 and v32.children, 
        v40
    });
    return v5.createElement(v4.View, v27.wrapperProps, {
        RichTextRoot = v5.createElement(l_InlineLayout_0, {
            Elements = v41, 
            HorizontalAlignment = v27.HorizontalAlignment, 
            VerticalPadding = if l_FFlagInlineRichTextVerticalPaddingFix_0 then UDim.new(0, v40.styles.fontStyle.FontSize * (v40.styles.fontStyle.LineHeight - 1) / 2) else UDim.new((v40.styles.fontStyle.LineHeight - 1) / 2, 0)
        })
    });
end;