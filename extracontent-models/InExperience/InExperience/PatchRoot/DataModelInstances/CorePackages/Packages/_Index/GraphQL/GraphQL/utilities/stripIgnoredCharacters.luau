local l_Parent_0 = script.Parent.Parent;
local l_language_0 = l_Parent_0.language;
local l_Parent_1 = l_Parent_0.Parent;
local l_String_0 = require(l_Parent_1.LuauPolyfill).String;
local v4 = require(l_language_0.source);
local l_Source_0 = v4.Source;
local l_isSource_0 = v4.isSource;
local l_TokenKind_0 = require(l_language_0.tokenKind).TokenKind;
local v8 = require(l_language_0.lexer);
local l_Lexer_0 = v8.Lexer;
local l_isPunctuatorTokenKind_0 = v8.isPunctuatorTokenKind;
local v11 = require(l_language_0.blockString);
local l_dedentBlockStringValue_0 = v11.dedentBlockStringValue;
local l_getBlockStringIndentation_0 = v11.getBlockStringIndentation;
local v14 = nil;
local function v25(v15) --[[ Line: 81 ]] --[[ Name: stripIgnoredCharacters ]]
    -- upvalues: l_isSource_0 (copy), l_Source_0 (copy), l_Lexer_0 (copy), l_TokenKind_0 (copy), l_isPunctuatorTokenKind_0 (copy), l_String_0 (copy), v14 (ref)
    local v16 = if l_isSource_0(v15) then v15 else l_Source_0.new(v15);
    local l_body_0 = v16.body;
    local v18 = l_Lexer_0.new(v16);
    local v19 = "";
    local v20 = false;
    while v18:advance().kind ~= l_TokenKind_0.EOF do
        local l_token_0 = v18.token;
        local l_kind_0 = l_token_0.kind;
        local v23 = not l_isPunctuatorTokenKind_0(l_token_0.kind);
        if v20 and (v23 or l_token_0.kind == l_TokenKind_0.SPREAD) then
            v19 = v19 .. " ";
        end;
        local v24 = l_String_0.slice(l_body_0, l_token_0.start, l_token_0._end);
        if l_kind_0 == l_TokenKind_0.BLOCK_STRING then
            v19 = v19 .. v14(v24);
        else
            v19 = v19 .. v24;
        end;
        v20 = v23;
    end;
    return v19;
end;
v14 = function(v26) --[[ Line: 118 ]] --[[ Name: dedentBlockString ]]
    -- upvalues: l_String_0 (copy), l_dedentBlockStringValue_0 (copy), l_getBlockStringIndentation_0 (copy)
    local v27 = l_String_0.slice(v26, 4, -3);
    local v28 = l_dedentBlockStringValue_0(v27);
    if l_getBlockStringIndentation_0(v28) > 0 then
        v28 = "\n" .. v28;
    end;
    local v29 = utf8.len(v28);
    assert(v29 ~= nil, "invalid utf8 detected: " .. v28);
    local v30 = l_String_0.slice(v28, v29);
    local v31 = false;
    if v30 == "\"" then
        v31 = l_String_0.slice(v28, -4) ~= "\\\"\"\"";
    end;
    if v31 or v30 == "\\" then
        v28 = v28 .. "\n";
    end;
    return "\"\"\"" .. v28 .. "\"\"\"";
end;
return {
    stripIgnoredCharacters = v25
};