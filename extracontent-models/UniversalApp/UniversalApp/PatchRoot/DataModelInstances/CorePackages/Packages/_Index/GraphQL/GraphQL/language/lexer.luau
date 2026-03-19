local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.LuauPolyfill);
local l_Number_0 = v3.Number;
local l_String_0 = v3.String;
local l_isNaN_0 = l_Number_0.isNaN;
local l_HttpService_0 = game:GetService("HttpService");
local l_syntaxError_0 = require(l_Parent_1.error.syntaxError).syntaxError;
local _ = require(script.Parent.source);
local v10 = require(l_Parent_0.tokenKind);
local l_Token_0 = require(l_Parent_0.ast).Token;
local l_TokenKind_0 = v10.TokenKind;
local v13 = require(l_Parent_1.luaUtils.toUnicodeString);
local l_dedentBlockStringValue_0 = require(l_Parent_0.blockString).dedentBlockStringValue;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
v17 = function(v19, v20, v21, v22) --[[ Line: 88 ]] --[[ Name: uniCharCode ]]
    -- upvalues: v18 (ref)
    local v23 = v18(v19);
    local v24 = v18(v20);
    local v25 = v18(v21);
    local v26 = v18(v22);
    if v23 < 0 or v24 < 0 or v25 < 0 or v26 < 0 then
        return -1;
    else
        return (bit32.bor(bit32.lshift(v23, 12), bit32.lshift(v24, 8), bit32.lshift(v25, 4), v26));
    end;
end;
v18 = function(v27) --[[ Line: 108 ]] --[[ Name: char2hex ]]
    if v27 >= 48 and v27 <= 57 then
        return v27 - 48;
    elseif v27 >= 65 and v27 <= 70 then
        return v27 - 55;
    elseif v27 >= 97 and v27 <= 102 then
        return v27 - 87;
    else
        return -1;
    end;
end;
local function v49(v28, v29, v30, v31, v32) --[[ Line: 126 ]] --[[ Name: readName ]]
    -- upvalues: l_String_0 (copy), l_isNaN_0 (copy), l_Token_0 (copy), l_TokenKind_0 (copy)
    local l_body_0 = v28.body;
    local v34 = string.len(l_body_0);
    local v35 = v29 + 1;
    local v36 = 0;
    local function _() --[[ Line: 132 ]]
        -- upvalues: v35 (ref), v34 (copy)
        return v35 ~= v34 + 1;
    end;
    local function _() --[[ Line: 135 ]]
        -- upvalues: v36 (ref), l_String_0 (ref), l_body_0 (copy), v35 (ref), l_isNaN_0 (ref)
        v36 = l_String_0.charCodeAt(l_body_0, v35);
        return not l_isNaN_0(v36);
    end;
    local function _() --[[ Line: 139 ]]
        -- upvalues: v36 (ref)
        return v36 == 95;
    end;
    local function _() --[[ Line: 142 ]]
        -- upvalues: v36 (ref)
        local v40 = false;
        if v36 >= 48 then
            v40 = v36 <= 57;
        end;
        return v40;
    end;
    local function _() --[[ Line: 145 ]]
        -- upvalues: v36 (ref)
        local v42 = false;
        if v36 >= 65 then
            v42 = v36 <= 90;
        end;
        return v42;
    end;
    local function _() --[[ Line: 148 ]]
        -- upvalues: v36 (ref)
        local v44 = false;
        if v36 >= 97 then
            v44 = v36 <= 122;
        end;
        return v44;
    end;
    local function _() --[[ Line: 151 ]]
        -- upvalues: v36 (ref)
        local v46 = v36 == 95;
        if not v46 then
            v46 = false;
            if v36 >= 48 then
                v46 = v36 <= 57;
            end;
            if not v46 then
                v46 = false;
                if v36 >= 65 then
                    v46 = v36 <= 90;
                end;
                if not v46 then
                    v46 = false;
                    if v36 >= 97 then
                        v46 = v36 <= 122;
                    end;
                end;
            end;
        end;
        return v46;
    end;
    while v34 + 1 ~= v35 do
        v36 = l_String_0.charCodeAt(l_body_0, v35);
        if not l_isNaN_0(v36) then
            local v48 = v36 == 95;
            if not v48 then
                v48 = false;
                if v36 >= 48 then
                    v48 = v36 <= 57;
                end;
                if not v48 then
                    v48 = false;
                    if v36 >= 65 then
                        v48 = v36 <= 90;
                    end;
                    if not v48 then
                        v48 = false;
                        if v36 >= 97 then
                            v48 = v36 <= 122;
                        end;
                    end;
                end;
            end;
            if v48 then
                v35 = v35 + 1;
            else
                break;
            end;
        else
            break;
        end;
    end;
    return l_Token_0.new(l_TokenKind_0.NAME, v29, v35, v30, v31, v32, l_String_0.slice(l_body_0, v29, v35));
end;
local function v58(v50, v51, v52, v53, v54) --[[ Line: 179 ]] --[[ Name: readComment ]]
    -- upvalues: l_String_0 (copy), l_isNaN_0 (copy), l_Token_0 (copy), l_TokenKind_0 (copy)
    local l_body_1 = v50.body;
    local v56 = nil;
    local l_v51_0 = v51;
    repeat
        l_v51_0 = l_v51_0 + 1;
        v56 = l_String_0.charCodeAt(l_body_1, l_v51_0);
    until l_isNaN_0(v56) or v56 <= 31 and v56 ~= 9;
    return l_Token_0.new(l_TokenKind_0.COMMENT, v51, l_v51_0, v52, v53, v54, l_String_0.slice(l_body_1, v51 + 1, l_v51_0));
end;
printCharCode = function(v59) --[[ Line: 201 ]] --[[ Name: printCharCode ]]
    -- upvalues: l_isNaN_0 (copy), l_TokenKind_0 (copy), l_HttpService_0 (copy), v13 (copy)
    if l_isNaN_0(v59) then
        return l_TokenKind_0.EOF;
    elseif v59 < 127 then
        return l_HttpService_0:JSONEncode((string.char(v59)));
    else
        return v13(v59);
    end;
end;
readDigits = function(v60, v61, v62) --[[ Line: 220 ]] --[[ Name: readDigits ]]
    -- upvalues: l_String_0 (copy), l_syntaxError_0 (copy)
    local l_body_2 = v60.body;
    local l_v61_0 = v61;
    local l_v62_0 = v62;
    if l_v62_0 >= 48 and l_v62_0 <= 57 then
        repeat
            l_v61_0 = l_v61_0 + 1;
            l_v62_0 = l_String_0.charCodeAt(l_body_2, l_v61_0);
        until l_v62_0 < 48 or l_v62_0 > 57;
        return l_v61_0;
    else
        error(l_syntaxError_0(v60, l_v61_0, "Invalid number, expected digit but got: " .. printCharCode(l_v62_0) .. "."));
        return;
    end;
end;
unexpectedCharacterMessage = function(v66) --[[ Line: 245 ]] --[[ Name: unexpectedCharacterMessage ]]
    if v66 < 32 and v66 ~= 9 and v66 ~= 10 and v66 ~= 13 then
        return "Cannot contain the invalid character " .. printCharCode(v66) .. ".";
    elseif v66 == 39 then
        return "Unexpected single quote character ('), did you mean to use a double quote (\")?";
    else
        return "Cannot parse the unexpected character " .. printCharCode(v66) .. ".";
    end;
end;
isNameStart = function(v67) --[[ Line: 259 ]] --[[ Name: isNameStart ]]
    local v68 = v67 == 95;
    local v69 = false;
    if v67 >= 65 then
        v69 = v67 <= 90;
    end;
    local v70 = false;
    if v67 >= 97 then
        v70 = v67 <= 122;
    end;
    return v68 or v69 or v70;
end;
readNumber = function(v71, v72, v73, v74, v75, v76) --[[ Line: 274 ]] --[[ Name: readNumber ]]
    -- upvalues: l_String_0 (copy), l_syntaxError_0 (copy), l_Token_0 (copy), l_TokenKind_0 (copy)
    local l_body_3 = v71.body;
    local l_v73_0 = v73;
    local l_v72_0 = v72;
    local v80 = false;
    if l_v73_0 == 45 then
        l_v72_0 = l_v72_0 + 1;
        l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
    end;
    if l_v73_0 == 48 then
        l_v72_0 = l_v72_0 + 1;
        l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
        if l_v73_0 >= 48 and l_v73_0 <= 57 then
            error(l_syntaxError_0(v71, l_v72_0, "Invalid number, unexpected digit after 0: " .. printCharCode(l_v73_0) .. "."));
        end;
    else
        l_v72_0 = readDigits(v71, l_v72_0, l_v73_0);
        l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
    end;
    if l_v73_0 == 46 then
        v80 = true;
        l_v72_0 = l_v72_0 + 1;
        l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
        l_v72_0 = readDigits(v71, l_v72_0, l_v73_0);
        l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
    end;
    if l_v73_0 == 69 or l_v73_0 == 101 then
        v80 = true;
        l_v72_0 = l_v72_0 + 1;
        l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
        if l_v73_0 == 43 or l_v73_0 == 45 then
            l_v72_0 = l_v72_0 + 1;
            l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
        end;
        l_v72_0 = readDigits(v71, l_v72_0, l_v73_0);
        l_v73_0 = l_String_0.charCodeAt(l_body_3, l_v72_0);
    end;
    if l_v73_0 == 46 or isNameStart(l_v73_0) then
        error(l_syntaxError_0(v71, l_v72_0, "Invalid number, expected digit but got: " .. printCharCode(l_v73_0) .. "."));
    end;
    return l_Token_0.new(v80 and l_TokenKind_0.FLOAT or l_TokenKind_0.INT, v72, l_v72_0, v74, v75, v76, l_String_0.slice(l_body_3, v72, l_v72_0));
end;
local function v92(v81, v82) --[[ Line: 359 ]] --[[ Name: readToken ]]
    -- upvalues: l_String_0 (copy), l_Token_0 (copy), l_TokenKind_0 (copy), v58 (copy), v15 (ref), v16 (ref), v49 (copy), l_syntaxError_0 (copy)
    local l_source_0 = v81.source;
    local l_body_4 = l_source_0.body;
    local v85 = utf8.len(l_body_4);
    assert(v85 ~= nil, "invalid utf8 supplied for token");
    local l__end_0 = v82._end;
    while true do
        if l__end_0 <= v85 then
            local v87 = l_String_0.charCodeAt(l_body_4, l__end_0);
            local l_line_0 = v81.line;
            local v89 = l__end_0 - v81.lineStart;
            if v87 == 65279 or v87 == 9 or v87 == 32 or v87 == 44 then
                l__end_0 = l__end_0 + 1;
            elseif v87 == 10 then
                l__end_0 = l__end_0 + 1;
                v81.line = v81.line + 1;
                v81.lineStart = l__end_0 - 1;
            elseif v87 == 13 then
                if l_String_0.charCodeAt(l_body_4, l__end_0 + 1) == 10 then
                    l__end_0 = l__end_0 + 2;
                else
                    l__end_0 = l__end_0 + 1;
                end;
                v81.line = v81.line + 1;
                v81.lineStart = l__end_0 - 1;
            elseif v87 == 33 then
                return l_Token_0.new(l_TokenKind_0.BANG, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
            elseif v87 == 35 then
                return v58(l_source_0, l__end_0, l_line_0, v89, v82);
            elseif v87 == 36 then
                return l_Token_0.new(l_TokenKind_0.DOLLAR, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
            elseif v87 == 38 then
                return l_Token_0.new(l_TokenKind_0.AMP, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
            elseif v87 == 40 then
                return l_Token_0.new(l_TokenKind_0.PAREN_L, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
            elseif v87 == 41 then
                return l_Token_0.new(l_TokenKind_0.PAREN_R, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
            else
                if v87 == 46 then
                    if l_String_0.charCodeAt(l_body_4, l__end_0 + 1) == 46 and l_String_0.charCodeAt(l_body_4, l__end_0 + 2) == 46 then
                        return l_Token_0.new(l_TokenKind_0.SPREAD, l__end_0, l__end_0 + 3, l_line_0, v89, v82);
                    end;
                elseif v87 == 58 then
                    return l_Token_0.new(l_TokenKind_0.COLON, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 61 then
                    return l_Token_0.new(l_TokenKind_0.EQUALS, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 64 then
                    return l_Token_0.new(l_TokenKind_0.AT, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 91 then
                    return l_Token_0.new(l_TokenKind_0.BRACKET_L, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 93 then
                    return l_Token_0.new(l_TokenKind_0.BRACKET_R, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 123 then
                    return l_Token_0.new(l_TokenKind_0.BRACE_L, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 124 then
                    return l_Token_0.new(l_TokenKind_0.PIPE, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 125 then
                    return l_Token_0.new(l_TokenKind_0.BRACE_R, l__end_0, l__end_0 + 1, l_line_0, v89, v82);
                elseif v87 == 34 then
                    if l_String_0.charCodeAt(l_body_4, l__end_0 + 1) == 34 and l_String_0.charCodeAt(l_body_4, l__end_0 + 2) == 34 then
                        return v15(l_source_0, l__end_0, l_line_0, v89, v82, v81);
                    else
                        return v16(l_source_0, l__end_0, l_line_0, v89, v82);
                    end;
                elseif v87 == 45 or v87 == 48 or v87 == 49 or v87 == 50 or v87 == 51 or v87 == 52 or v87 == 53 or v87 == 54 or v87 == 55 or v87 == 56 or v87 == 57 then
                    return readNumber(l_source_0, l__end_0, v87, l_line_0, v89, v82);
                elseif v87 == 65 or v87 == 66 or v87 == 67 or v87 == 68 or v87 == 69 or v87 == 70 or v87 == 71 or v87 == 72 or v87 == 73 or v87 == 74 or v87 == 75 or v87 == 76 or v87 == 77 or v87 == 78 or v87 == 79 or v87 == 80 or v87 == 81 or v87 == 82 or v87 == 83 or v87 == 84 or v87 == 85 or v87 == 86 or v87 == 87 or v87 == 88 or v87 == 89 or v87 == 90 or v87 == 95 or v87 == 97 or v87 == 98 or v87 == 99 or v87 == 100 or v87 == 101 or v87 == 102 or v87 == 103 or v87 == 104 or v87 == 105 or v87 == 106 or v87 == 107 or v87 == 108 or v87 == 109 or v87 == 110 or v87 == 111 or v87 == 112 or v87 == 113 or v87 == 114 or v87 == 115 or v87 == 116 or v87 == 117 or v87 == 118 or v87 == 119 or v87 == 120 or v87 == 121 or v87 == 122 then
                    return v49(l_source_0, l__end_0, l_line_0, v89, v82);
                end;
                error(l_syntaxError_0(l_source_0, l__end_0, unexpectedCharacterMessage(v87)));
            end;
        else
            local l_line_1 = v81.line;
            local v91 = l__end_0 - v81.lineStart;
            return l_Token_0.new(l_TokenKind_0.EOF, v85 + 1, v85 + 1, l_line_1, v91, v82);
        end;
    end;
end;
local v93 = {};
v93.__index = v93;
v93.new = function(v94) --[[ Line: 558 ]] --[[ Name: new ]]
    -- upvalues: l_Token_0 (copy), l_TokenKind_0 (copy), v93 (copy)
    local v95 = l_Token_0.new(l_TokenKind_0.SOF, 1, 1, 0, 0, nil);
    return (setmetatable({
        source = v94, 
        lastToken = v95, 
        token = v95, 
        line = 1, 
        lineStart = 0
    }, v93));
end;
v93.advance = function(v96) --[[ Line: 571 ]] --[[ Name: advance ]]
    v96.lastToken = v96.token;
    v96.token = v96:lookahead();
    return v96.token;
end;
v93.lookahead = function(v97) --[[ Line: 577 ]] --[[ Name: lookahead ]]
    -- upvalues: l_TokenKind_0 (copy), v92 (copy)
    local l_token_0 = v97.token;
    if l_token_0.kind ~= l_TokenKind_0.EOF then
        repeat
            if l_token_0.next then
                l_token_0 = l_token_0.next;
            else
                local v99 = v92(v97, l_token_0);
                l_token_0.next = v99;
                v99.prev = l_token_0;
                l_token_0 = v99;
            end;
        until l_token_0.kind ~= l_TokenKind_0.COMMENT;
    end;
    return l_token_0;
end;
local function v102(v100) --[[ Line: 600 ]] --[[ Name: isPunctuatorTokenKind ]]
    -- upvalues: l_TokenKind_0 (copy)
    local v101 = true;
    if v100 ~= l_TokenKind_0.BANG then
        v101 = true;
        if v100 ~= l_TokenKind_0.DOLLAR then
            v101 = true;
            if v100 ~= l_TokenKind_0.AMP then
                v101 = true;
                if v100 ~= l_TokenKind_0.PAREN_L then
                    v101 = true;
                    if v100 ~= l_TokenKind_0.PAREN_R then
                        v101 = true;
                        if v100 ~= l_TokenKind_0.SPREAD then
                            v101 = true;
                            if v100 ~= l_TokenKind_0.COLON then
                                v101 = true;
                                if v100 ~= l_TokenKind_0.EQUALS then
                                    v101 = true;
                                    if v100 ~= l_TokenKind_0.AT then
                                        v101 = true;
                                        if v100 ~= l_TokenKind_0.BRACKET_L then
                                            v101 = true;
                                            if v100 ~= l_TokenKind_0.BRACKET_R then
                                                v101 = true;
                                                if v100 ~= l_TokenKind_0.BRACE_L then
                                                    v101 = true;
                                                    if v100 ~= l_TokenKind_0.PIPE then
                                                        v101 = v100 == l_TokenKind_0.BRACE_R;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v101;
end;
v15 = function(v103, v104, v105, v106, v107, v108) --[[ Line: 623 ]] --[[ Name: readBlockString ]]
    -- upvalues: l_isNaN_0 (copy), l_String_0 (copy), l_Token_0 (copy), l_TokenKind_0 (copy), l_dedentBlockStringValue_0 (copy), l_syntaxError_0 (copy)
    local l_body_5 = v103.body;
    local v110 = v104 + 3;
    local l_v110_0 = v110;
    local v112 = 0;
    local v113 = "";
    while true do
        if v110 <= string.len(l_body_5) and not l_isNaN_0(l_String_0.charCodeAt(l_body_5, v110)) then
            v112 = l_String_0.charCodeAt(l_body_5, v110);
            if v112 == 34 and l_String_0.charCodeAt(l_body_5, v110 + 1) == 34 and l_String_0.charCodeAt(l_body_5, v110 + 2) == 34 then
                v113 = v113 .. l_String_0.slice(l_body_5, l_v110_0, v110);
                return l_Token_0.new(l_TokenKind_0.BLOCK_STRING, v104, v110 + 3, v105, v106, v107, l_dedentBlockStringValue_0(v113));
            else
                if v112 < 32 and v112 ~= 9 and v112 ~= 10 and v112 ~= 13 then
                    error(l_syntaxError_0(v103, v110, "Invalid character within String: " .. printCharCode(v112) .. "."));
                end;
                if v112 == 10 then
                    v110 = v110 + 1;
                    v108.line = v108.line + 1;
                    v108.lineStart = v110 - 1;
                elseif v112 == 13 then
                    if l_String_0.charCodeAt(l_body_5, v110 + 1) == 10 then
                        v110 = v110 + 2;
                    else
                        v110 = v110 + 1;
                    end;
                    v108.line = v108.line + 1;
                    v108.lineStart = v110 - 1;
                elseif v112 == 92 and l_String_0.charCodeAt(l_body_5, v110 + 1) == 34 and l_String_0.charCodeAt(l_body_5, v110 + 2) == 34 and l_String_0.charCodeAt(l_body_5, v110 + 3) == 34 then
                    v113 = v113 .. l_String_0.slice(l_body_5, l_v110_0, v110) .. "\"\"\"";
                    v110 = v110 + 4;
                    l_v110_0 = v110;
                else
                    v110 = v110 + 1;
                end;
            end;
        else
            error(l_syntaxError_0(v103, v110, "Unterminated string."));
            return;
        end;
    end;
end;
v16 = function(v114, v115, v116, v117, v118) --[[ Line: 697 ]] --[[ Name: readString ]]
    -- upvalues: l_String_0 (copy), l_isNaN_0 (copy), l_Token_0 (copy), l_TokenKind_0 (copy), l_syntaxError_0 (copy), v17 (ref)
    local l_body_6 = v114.body;
    local v120 = utf8.len(l_body_6);
    assert(v120 ~= nil, "invalid utf8 sequence detected");
    local v121 = v115 + 1;
    local l_v121_0 = v121;
    local v123 = "";
    while v121 <= v120 do
        local v124 = l_String_0.charCodeAt(l_body_6, v121);
        if not l_isNaN_0(v124) then
            if v124 == 34 then
                v123 = v123 .. l_String_0.slice(l_body_6, l_v121_0, v121);
                return l_Token_0.new(l_TokenKind_0.STRING, v115, v121 + 1, v116, v117, v118, v123);
            elseif v124 ~= 10 and v124 ~= 13 then
                if v124 < 32 and v124 ~= 9 then
                    error(l_syntaxError_0(v114, v121, "Invalid character within String: " .. printCharCode(v124) .. "."));
                end;
                v121 = v121 + 1;
                if v124 == 92 then
                    v123 = v123 .. l_String_0.slice(l_body_6, l_v121_0, v121 - 1);
                    v124 = l_String_0.charCodeAt(l_body_6, v121);
                    if v124 == 34 then
                        v123 = v123 .. "\"";
                    elseif v124 == 47 then
                        v123 = v123 .. "/";
                    elseif v124 == 92 then
                        v123 = v123 .. "\\";
                    elseif v124 == 98 then
                        v123 = v123 .. "\b";
                    elseif v124 == 102 then
                        v123 = v123 .. "\f";
                    elseif v124 == 110 then
                        v123 = v123 .. "\n";
                    elseif v124 == 114 then
                        v123 = v123 .. "\r";
                    elseif v124 == 116 then
                        v123 = v123 .. "\t";
                    elseif v124 == 117 then
                        local v125 = v17(l_String_0.charCodeAt(l_body_6, v121 + 1), l_String_0.charCodeAt(l_body_6, v121 + 2), l_String_0.charCodeAt(l_body_6, v121 + 3), l_String_0.charCodeAt(l_body_6, v121 + 4));
                        if v125 < 0 then
                            local v126 = l_String_0.slice(l_body_6, v121 + 1, v121 + 5);
                            error(l_syntaxError_0(v114, v121, "Invalid character escape sequence: \\u" .. v126 .. "."));
                        end;
                        v123 = v123 .. utf8.char(v125);
                        v121 = v121 + 4;
                    else
                        error(l_syntaxError_0(v114, v121, "Invalid character escape sequence: \\" .. utf8.char(v124) .. "."));
                    end;
                    v121 = v121 + 1;
                    l_v121_0 = v121;
                end;
            else
                break;
            end;
        else
            break;
        end;
    end;
    error(l_syntaxError_0(v114, v121, "Unterminated string."));
end;
return {
    Lexer = v93, 
    isPunctuatorTokenKind = v102
};