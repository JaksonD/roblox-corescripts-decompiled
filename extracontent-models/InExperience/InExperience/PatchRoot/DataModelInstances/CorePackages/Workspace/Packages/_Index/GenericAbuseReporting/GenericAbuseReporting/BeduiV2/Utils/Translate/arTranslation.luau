local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.translate);
local l_useTokens_0 = v1.Hooks.useTokens;
local l_translateIntoString_0 = v3.translateIntoString;
local l_translateIntoRichTextString_0 = v3.translateIntoRichTextString;
local v7 = v2.createContext(nil);
return {
    ArTranslationContext = v7, 
    ArTranslationProvider = function(v8) --[[ Line: 27 ]] --[[ Name: ArTranslationProvider ]]
        -- upvalues: l_useTokens_0 (copy), v2 (copy), l_translateIntoString_0 (copy), l_translateIntoRichTextString_0 (copy), v7 (copy)
        local l_Color3_0 = l_useTokens_0().Color.Content.Link.Color3;
        local v14 = v2.useMemo(function() --[[ Line: 31 ]]
            -- upvalues: l_translateIntoString_0 (ref), v8 (copy), l_translateIntoRichTextString_0 (ref), l_Color3_0 (copy)
            local function v11(v10) --[[ Line: 32 ]]
                -- upvalues: l_translateIntoString_0 (ref), v8 (ref)
                return l_translateIntoString_0(v8.translations, v10);
            end;
            local function v13(v12) --[[ Line: 36 ]]
                -- upvalues: l_translateIntoRichTextString_0 (ref), v8 (ref), l_Color3_0 (ref)
                return l_translateIntoRichTextString_0(v8.translations, v12, l_Color3_0);
            end;
            return {
                translateIntoString = v11, 
                translateIntoRichTextString = v13
            };
        end, {
            v8.translations, 
            l_Color3_0
        });
        return v2.createElement(v7.Provider, {
            value = v14
        }, v8.children);
    end, 
    useArTranslation = function() --[[ Line: 51 ]] --[[ Name: useArTranslation ]]
        -- upvalues: v2 (copy), v7 (copy)
        local v15 = v2.useContext(v7);
        if not v15 then
            error("Invalid use of `useArTranslation` hook. Ensure your component has an ancestor wrapped in `ArTranslationProvider`");
        end;
        return v15;
    end
};