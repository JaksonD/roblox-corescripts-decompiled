local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local _ = require(l_Parent_2.LuauPolyfill);
local _ = require(l_Parent_1.error);
local v5 = require(l_Parent_0.tokenKind);
local l_Location_0 = require(l_Parent_0.ast).Location;
local l_Source_0 = require(l_Parent_0.source).Source;
local v8 = require(l_Parent_0.lexer);
local l_Lexer_0 = v8.Lexer;
local l_isPunctuatorTokenKind_0 = v8.isPunctuatorTokenKind;
local l_TokenKind_0 = v5.TokenKind;
local l_DirectiveLocation_0 = require(l_Parent_0.directiveLocation).DirectiveLocation;
local l_Kind_0 = require(l_Parent_0.kinds).Kind;
local l_syntaxError_0 = require(script.Parent.Parent.error.syntaxError).syntaxError;
local v15 = nil;
local v16 = nil;
local v17 = {};
v17.__index = v17;
local function v20(v18, v19) --[[ Line: 221 ]] --[[ Name: parse ]]
    -- upvalues: v17 (copy)
    return v17.new(v18, v19):parseDocument();
end;
local function v25(v21, v22) --[[ Line: 236 ]] --[[ Name: parseValue ]]
    -- upvalues: v17 (copy), l_TokenKind_0 (copy)
    local v23 = v17.new(v21, v22);
    v23:expectToken(l_TokenKind_0.SOF);
    local v24 = v23:parseValueLiteral(false);
    v23:expectToken(l_TokenKind_0.EOF);
    return v24;
end;
local function v30(v26, v27) --[[ Line: 254 ]] --[[ Name: parseType ]]
    -- upvalues: v17 (copy), l_TokenKind_0 (copy)
    local v28 = v17.new(v26, v27);
    v28:expectToken(l_TokenKind_0.SOF);
    local v29 = v28:parseTypeReference();
    v28:expectToken(l_TokenKind_0.EOF);
    return v29;
end;
v17.new = function(v31, v32) --[[ Line: 262 ]] --[[ Name: new ]]
    -- upvalues: l_Source_0 (copy), l_Lexer_0 (copy), v17 (copy)
    local v33 = nil;
    v33 = if typeof(v31) == "string" then l_Source_0.new(v31) else v31;
    return (setmetatable({
        _lexer = l_Lexer_0.new(v33), 
        _options = v32
    }, v17));
end;
v17.parseName = function(v34) --[[ Line: 280 ]] --[[ Name: parseName ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local v35 = v34:expectToken(l_TokenKind_0.NAME);
    return {
        kind = l_Kind_0.NAME, 
        value = v35.value, 
        loc = v34:loc(v35)
    };
end;
v17.parseDocument = function(v36) --[[ Line: 294 ]] --[[ Name: parseDocument ]]
    -- upvalues: l_Kind_0 (copy), l_TokenKind_0 (copy)
    local l_token_0 = v36._lexer.token;
    return {
        kind = l_Kind_0.DOCUMENT, 
        definitions = v36:many(l_TokenKind_0.SOF, v36.parseDefinition, l_TokenKind_0.EOF), 
        loc = v36:loc(l_token_0)
    };
end;
v17.parseDefinition = function(v38) --[[ Line: 314 ]] --[[ Name: parseDefinition ]]
    -- upvalues: l_TokenKind_0 (copy)
    if v38:peek(l_TokenKind_0.NAME) then
        local l_value_0 = v38._lexer.token.value;
        if l_value_0 == "query" or l_value_0 == "mutation" or l_value_0 == "subscription" then
            return v38:parseOperationDefinition();
        elseif l_value_0 == "fragment" then
            return v38:parseFragmentDefinition();
        elseif l_value_0 == "schema" or l_value_0 == "scalar" or l_value_0 == "type" or l_value_0 == "interface" or l_value_0 == "union" or l_value_0 == "enum" or l_value_0 == "input" or l_value_0 == "directive" then
            return v38:parseTypeSystemDefinition();
        elseif l_value_0 == "extend" then
            return v38:parseTypeSystemExtension();
        end;
    elseif v38:peek(l_TokenKind_0.BRACE_L) then
        return v38:parseOperationDefinition();
    elseif v38:peekDescription() then
        return v38:parseTypeSystemDefinition();
    end;
    error(v38:unexpected());
end;
v17.parseOperationDefinition = function(v40) --[[ Line: 351 ]] --[[ Name: parseOperationDefinition ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_1 = v40._lexer.token;
    if v40:peek(l_TokenKind_0.BRACE_L) then
        return {
            kind = l_Kind_0.OPERATION_DEFINITION, 
            operation = "query", 
            name = nil, 
            variableDefinitions = {}, 
            directives = {}, 
            selectionSet = v40:parseSelectionSet(), 
            loc = v40:loc(l_token_1)
        };
    else
        local v42 = v40:parseOperationType();
        local v43 = nil;
        if v40:peek(l_TokenKind_0.NAME) then
            v43 = v40:parseName();
        end;
        return {
            kind = l_Kind_0.OPERATION_DEFINITION, 
            operation = v42, 
            name = v43, 
            variableDefinitions = v40:parseVariableDefinitions(), 
            directives = v40:parseDirectives(false), 
            selectionSet = v40:parseSelectionSet(), 
            loc = v40:loc(l_token_1)
        };
    end;
end;
v17.parseOperationType = function(v44) --[[ Line: 384 ]] --[[ Name: parseOperationType ]]
    -- upvalues: l_TokenKind_0 (copy)
    local v45 = v44:expectToken(l_TokenKind_0.NAME);
    if v45.value == "query" then
        return "query";
    elseif v45.value == "mutation" then
        return "mutation";
    elseif v45.value == "subscription" then
        return "subscription";
    else
        error(v44:unexpected(v45));
        return;
    end;
end;
v17.parseVariableDefinitions = function(v46) --[[ Line: 401 ]] --[[ Name: parseVariableDefinitions ]]
    -- upvalues: l_TokenKind_0 (copy)
    return v46:optionalMany(l_TokenKind_0.PAREN_L, v46.parseVariableDefinition, l_TokenKind_0.PAREN_R);
end;
v17.parseVariableDefinition = function(v47) --[[ Line: 408 ]] --[[ Name: parseVariableDefinition ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_2 = v47._lexer.token;
    local v49 = v47:parseVariable();
    v47:expectToken(l_TokenKind_0.COLON);
    local v50 = v47:parseTypeReference();
    return {
        kind = l_Kind_0.VARIABLE_DEFINITION, 
        variable = v49, 
        type = v50, 
        defaultValue = if v47:expectOptionalToken(l_TokenKind_0.EQUALS) then v47:parseValueLiteral(true) else nil, 
        directives = v47:parseDirectives(true), 
        loc = v47:loc(l_token_2)
    };
end;
v17.parseVariable = function(v51) --[[ Line: 428 ]] --[[ Name: parseVariable ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_3 = v51._lexer.token;
    v51:expectToken(l_TokenKind_0.DOLLAR);
    return {
        kind = l_Kind_0.VARIABLE, 
        name = v51:parseName(), 
        loc = v51:loc(l_token_3)
    };
end;
v17.parseSelectionSet = function(v53) --[[ Line: 441 ]] --[[ Name: parseSelectionSet ]]
    -- upvalues: l_Kind_0 (copy), l_TokenKind_0 (copy)
    local l_token_4 = v53._lexer.token;
    return {
        kind = l_Kind_0.SELECTION_SET, 
        selections = v53:many(l_TokenKind_0.BRACE_L, v53.parseSelection, l_TokenKind_0.BRACE_R), 
        loc = v53:loc(l_token_4)
    };
end;
v17.parseSelection = function(v55) --[[ Line: 456 ]] --[[ Name: parseSelection ]]
    -- upvalues: l_TokenKind_0 (copy)
    if v55:peek(l_TokenKind_0.SPREAD) then
        return v55:parseFragment();
    else
        return v55:parseField();
    end;
end;
v17.parseField = function(v56) --[[ Line: 469 ]] --[[ Name: parseField ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_5 = v56._lexer.token;
    local v58 = v56:parseName();
    local v59 = nil;
    local v60 = nil;
    if v56:expectOptionalToken(l_TokenKind_0.COLON) then
        v59 = v58;
        v60 = v56:parseName();
    else
        v60 = v58;
    end;
    return {
        kind = l_Kind_0.FIELD, 
        alias = v59, 
        name = v60, 
        arguments = v56:parseArguments(false), 
        directives = v56:parseDirectives(false), 
        selectionSet = v56:peek(l_TokenKind_0.BRACE_L) and v56:parseSelectionSet() or nil, 
        loc = v56:loc(l_token_5)
    };
end;
v17.parseArguments = function(v61, v62) --[[ Line: 497 ]] --[[ Name: parseArguments ]]
    -- upvalues: l_TokenKind_0 (copy)
    local v63 = nil;
    v63 = if v62 then v61.parseConstArgument else v61.parseArgument;
    return v61:optionalMany(l_TokenKind_0.PAREN_L, v63, l_TokenKind_0.PAREN_R);
end;
v17.parseArgument = function(v64) --[[ Line: 510 ]] --[[ Name: parseArgument ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_6 = v64._lexer.token;
    local v66 = v64:parseName();
    v64:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.ARGUMENT, 
        name = v66, 
        value = v64:parseValueLiteral(false), 
        loc = v64:loc(l_token_6)
    };
end;
v17.parseConstArgument = function(v67) --[[ Line: 523 ]] --[[ Name: parseConstArgument ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_7 = v67._lexer.token;
    local v69 = v67:parseName();
    v67:expectToken(l_TokenKind_0.COLON);
    local v70 = v67:parseValueLiteral(true);
    return {
        kind = l_Kind_0.ARGUMENT, 
        name = v69, 
        value = v70, 
        loc = v67:loc(l_token_7)
    };
end;
v17.parseFragment = function(v71) --[[ Line: 545 ]] --[[ Name: parseFragment ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_8 = v71._lexer.token;
    v71:expectToken(l_TokenKind_0.SPREAD);
    local v73 = v71:expectOptionalKeyword("on");
    if not v73 and v71:peek(l_TokenKind_0.NAME) then
        return {
            kind = l_Kind_0.FRAGMENT_SPREAD, 
            name = v71:parseFragmentName(), 
            directives = v71:parseDirectives(false), 
            loc = v71:loc(l_token_8)
        };
    else
        return {
            kind = l_Kind_0.INLINE_FRAGMENT, 
            typeCondition = if v73 then v71:parseNamedType() else nil, 
            directives = v71:parseDirectives(false), 
            selectionSet = v71:parseSelectionSet(), 
            loc = v71:loc(l_token_8)
        };
    end;
end;
v17.parseFragmentDefinition = function(v74) --[[ Line: 573 ]] --[[ Name: parseFragmentDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_9 = v74._lexer.token;
    v74:expectKeyword("fragment");
    if (v74._options and v74._options.experimentalFragmentVariables) == true then
        local v76 = v74:parseFragmentName();
        local v77 = v74:parseVariableDefinitions();
        v74:expectKeyword("on");
        local v78 = v74:parseNamedType();
        local v79 = v74:parseDirectives(false);
        local v80 = v74:parseSelectionSet();
        local v81 = v74:loc(l_token_9);
        return {
            kind = l_Kind_0.FRAGMENT_DEFINITION, 
            name = v76, 
            variableDefinitions = v77, 
            typeCondition = v78, 
            directives = v79, 
            selectionSet = v80, 
            loc = v81
        };
    else
        local v82 = v74:parseFragmentName();
        v74:expectKeyword("on");
        local v83 = v74:parseNamedType();
        local v84 = v74:parseDirectives(false);
        local v85 = v74:parseSelectionSet();
        local v86 = v74:loc(l_token_9);
        return {
            kind = l_Kind_0.FRAGMENT_DEFINITION, 
            name = v82, 
            typeCondition = v83, 
            directives = v84, 
            selectionSet = v85, 
            loc = v86
        };
    end;
end;
v17.parseFragmentName = function(v87) --[[ Line: 616 ]] --[[ Name: parseFragmentName ]]
    if v87._lexer.token.value == "on" then
        error(v87:unexpected());
    end;
    return v87:parseName();
end;
v17.parseValueLiteral = function(v88, v89) --[[ Line: 643 ]] --[[ Name: parseValueLiteral ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_10 = v88._lexer.token;
    local l_kind_0 = l_token_10.kind;
    if l_kind_0 == l_TokenKind_0.BRACKET_L then
        return v88:parseList(v89);
    elseif l_kind_0 == l_TokenKind_0.BRACE_L then
        return v88:parseObject(v89);
    elseif l_kind_0 == l_TokenKind_0.INT then
        v88._lexer:advance();
        return {
            kind = l_Kind_0.INT, 
            value = l_token_10.value, 
            loc = v88:loc(l_token_10)
        };
    elseif l_kind_0 == l_TokenKind_0.FLOAT then
        v88._lexer:advance();
        return {
            kind = l_Kind_0.FLOAT, 
            value = l_token_10.value, 
            loc = v88:loc(l_token_10)
        };
    elseif l_kind_0 == l_TokenKind_0.STRING or l_kind_0 == l_TokenKind_0.BLOCK_STRING then
        return v88:parseStringLiteral();
    elseif l_kind_0 == l_TokenKind_0.NAME then
        v88._lexer:advance();
        local l_value_1 = l_token_10.value;
        if l_value_1 == "true" then
            return {
                kind = l_Kind_0.BOOLEAN, 
                value = true, 
                loc = v88:loc(l_token_10)
            };
        elseif l_value_1 == "false" then
            return {
                kind = l_Kind_0.BOOLEAN, 
                value = false, 
                loc = v88:loc(l_token_10)
            };
        elseif l_value_1 == "null" then
            return {
                kind = l_Kind_0.NULL, 
                loc = v88:loc(l_token_10)
            };
        else
            return {
                kind = l_Kind_0.ENUM, 
                value = l_value_1, 
                loc = v88:loc(l_token_10)
            };
        end;
    elseif l_kind_0 == l_TokenKind_0.DOLLAR and not v89 then
        return v88:parseVariable();
    else
        error(v88:unexpected());
        return;
    end;
end;
v17.parseStringLiteral = function(v93) --[[ Line: 692 ]] --[[ Name: parseStringLiteral ]]
    -- upvalues: l_Kind_0 (copy), l_TokenKind_0 (copy)
    local l_token_11 = v93._lexer.token;
    v93._lexer:advance();
    return {
        kind = l_Kind_0.STRING, 
        value = l_token_11.value, 
        block = l_token_11.kind == l_TokenKind_0.BLOCK_STRING, 
        loc = v93:loc(l_token_11)
    };
end;
v17.parseList = function(v95, v96) --[[ Line: 708 ]] --[[ Name: parseList ]]
    -- upvalues: l_Kind_0 (copy), l_TokenKind_0 (copy)
    local l_token_12 = v95._lexer.token;
    return {
        kind = l_Kind_0.LIST, 
        values = v95:any(l_TokenKind_0.BRACKET_L, function() --[[ Line: 710 ]]
            -- upvalues: v95 (copy), v96 (copy)
            return v95:parseValueLiteral(v96);
        end, l_TokenKind_0.BRACKET_R), 
        loc = v95:loc(l_token_12)
    };
end;
v17.parseObject = function(v98, v99) --[[ Line: 725 ]] --[[ Name: parseObject ]]
    -- upvalues: l_Kind_0 (copy), l_TokenKind_0 (copy)
    local l_token_13 = v98._lexer.token;
    return {
        kind = l_Kind_0.OBJECT, 
        fields = v98:any(l_TokenKind_0.BRACE_L, function() --[[ Line: 727 ]]
            -- upvalues: v98 (copy), v99 (copy)
            return v98:parseObjectField(v99);
        end, l_TokenKind_0.BRACE_R), 
        loc = v98:loc(l_token_13)
    };
end;
v17.parseObjectField = function(v101, v102) --[[ Line: 740 ]] --[[ Name: parseObjectField ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_14 = v101._lexer.token;
    local v104 = v101:parseName();
    v101:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.OBJECT_FIELD, 
        name = v104, 
        value = v101:parseValueLiteral(v102), 
        loc = v101:loc(l_token_14)
    };
end;
v17.parseDirectives = function(v105, v106) --[[ Line: 753 ]] --[[ Name: parseDirectives ]]
    -- upvalues: l_TokenKind_0 (copy)
    local v107 = {};
    while v105:peek(l_TokenKind_0.AT) do
        table.insert(v107, v105:parseDirective(v106));
    end;
    return v107;
end;
v17.parseDirective = function(v108, v109) --[[ Line: 764 ]] --[[ Name: parseDirective ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_15 = v108._lexer.token;
    v108:expectToken(l_TokenKind_0.AT);
    return {
        kind = l_Kind_0.DIRECTIVE, 
        name = v108:parseName(), 
        arguments = v108:parseArguments(v109), 
        loc = v108:loc(l_token_15)
    };
end;
v17.parseTypeReference = function(v111) --[[ Line: 783 ]] --[[ Name: parseTypeReference ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_16 = v111._lexer.token;
    local v113 = nil;
    if v111:expectOptionalToken(l_TokenKind_0.BRACKET_L) then
        local v114 = v111:parseTypeReference();
        v111:expectToken(l_TokenKind_0.BRACKET_R);
        v113 = {
            kind = l_Kind_0.LIST_TYPE, 
            type = v114, 
            loc = v111:loc(l_token_16)
        };
    else
        v113 = v111:parseNamedType();
    end;
    if v111:expectOptionalToken(l_TokenKind_0.BANG) then
        return {
            kind = l_Kind_0.NON_NULL_TYPE, 
            type = v113, 
            loc = v111:loc(l_token_16)
        };
    else
        return v113;
    end;
end;
v17.parseNamedType = function(v115) --[[ Line: 816 ]] --[[ Name: parseNamedType ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_17 = v115._lexer.token;
    return {
        kind = l_Kind_0.NAMED_TYPE, 
        name = v115:parseName(), 
        loc = v115:loc(l_token_17)
    };
end;
v17.parseTypeSystemDefinition = function(v117) --[[ Line: 839 ]] --[[ Name: parseTypeSystemDefinition ]]
    -- upvalues: l_TokenKind_0 (copy)
    local v118 = if v117:peekDescription() then v117._lexer:lookahead() else v117._lexer.token;
    if v118.kind == l_TokenKind_0.NAME then
        local l_value_2 = v118.value;
        if l_value_2 == "schema" then
            return v117:parseSchemaDefinition();
        elseif l_value_2 == "scalar" then
            return v117:parseScalarTypeDefinition();
        elseif l_value_2 == "type" then
            return v117:parseObjectTypeDefinition();
        elseif l_value_2 == "interface" then
            return v117:parseInterfaceTypeDefinition();
        elseif l_value_2 == "union" then
            return v117:parseUnionTypeDefinition();
        elseif l_value_2 == "enum" then
            return v117:parseEnumTypeDefinition();
        elseif l_value_2 == "input" then
            return v117:parseInputObjectTypeDefinition();
        elseif l_value_2 == "directive" then
            return v117:parseDirectiveDefinition();
        end;
    end;
    error(v117:unexpected(v118));
end;
v17.peekDescription = function(v120) --[[ Line: 869 ]] --[[ Name: peekDescription ]]
    -- upvalues: l_TokenKind_0 (copy)
    return v120:peek(l_TokenKind_0.STRING) or v120:peek(l_TokenKind_0.BLOCK_STRING);
end;
v17.parseDescription = function(v121) --[[ Line: 876 ]] --[[ Name: parseDescription ]]
    if v121:peekDescription() then
        return v121:parseStringLiteral();
    else
        return;
    end;
end;
v17.parseSchemaDefinition = function(v122) --[[ Line: 886 ]] --[[ Name: parseSchemaDefinition ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_18 = v122._lexer.token;
    local v124 = v122:parseDescription();
    v122:expectKeyword("schema");
    local v125 = v122:parseDirectives(true);
    local v126 = v122:many(l_TokenKind_0.BRACE_L, v122.parseOperationTypeDefinition, l_TokenKind_0.BRACE_R);
    return {
        kind = l_Kind_0.SCHEMA_DEFINITION, 
        description = v124, 
        directives = v125, 
        operationTypes = v126, 
        loc = v122:loc(l_token_18)
    };
end;
v17.parseOperationTypeDefinition = function(v127) --[[ Line: 908 ]] --[[ Name: parseOperationTypeDefinition ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_19 = v127._lexer.token;
    local v129 = v127:parseOperationType();
    v127:expectToken(l_TokenKind_0.COLON);
    local v130 = v127:parseNamedType();
    return {
        kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
        operation = v129, 
        type = v130, 
        loc = v127:loc(l_token_19)
    };
end;
v17.parseScalarTypeDefinition = function(v131) --[[ Line: 925 ]] --[[ Name: parseScalarTypeDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_20 = v131._lexer.token;
    local v133 = v131:parseDescription();
    v131:expectKeyword("scalar");
    local v134 = v131:parseName();
    local v135 = v131:parseDirectives(true);
    return {
        kind = l_Kind_0.SCALAR_TYPE_DEFINITION, 
        description = v133, 
        name = v134, 
        directives = v135, 
        loc = v131:loc(l_token_20)
    };
end;
v17.parseObjectTypeDefinition = function(v136) --[[ Line: 945 ]] --[[ Name: parseObjectTypeDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_21 = v136._lexer.token;
    local v138 = v136:parseDescription();
    v136:expectKeyword("type");
    local v139 = v136:parseName();
    local v140 = v136:parseImplementsInterfaces();
    local v141 = v136:parseDirectives(true);
    local v142 = v136:parseFieldsDefinition();
    return {
        kind = l_Kind_0.OBJECT_TYPE_DEFINITION, 
        description = v138, 
        name = v139, 
        interfaces = v140, 
        directives = v141, 
        fields = v142, 
        loc = v136:loc(l_token_21)
    };
end;
v17.parseImplementsInterfaces = function(v143) --[[ Line: 969 ]] --[[ Name: parseImplementsInterfaces ]]
    -- upvalues: l_TokenKind_0 (copy)
    if v143:expectOptionalKeyword("implements") then
        return v143:delimitedMany(l_TokenKind_0.AMP, v143.parseNamedType);
    else
        return {};
    end;
end;
v17.parseFieldsDefinition = function(v144) --[[ Line: 980 ]] --[[ Name: parseFieldsDefinition ]]
    -- upvalues: l_TokenKind_0 (copy)
    return v144:optionalMany(l_TokenKind_0.BRACE_L, v144.parseFieldDefinition, l_TokenKind_0.BRACE_R);
end;
v17.parseFieldDefinition = function(v145) --[[ Line: 988 ]] --[[ Name: parseFieldDefinition ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_22 = v145._lexer.token;
    local v147 = v145:parseDescription();
    local v148 = v145:parseName();
    local v149 = v145:parseArgumentDefs();
    v145:expectToken(l_TokenKind_0.COLON);
    local v150 = v145:parseTypeReference();
    local v151 = v145:parseDirectives(true);
    return {
        kind = l_Kind_0.FIELD_DEFINITION, 
        description = v147, 
        name = v148, 
        arguments = v149, 
        type = v150, 
        directives = v151, 
        loc = v145:loc(l_token_22)
    };
end;
v17.parseArgumentDefs = function(v152) --[[ Line: 1010 ]] --[[ Name: parseArgumentDefs ]]
    -- upvalues: l_TokenKind_0 (copy)
    return v152:optionalMany(l_TokenKind_0.PAREN_L, v152.parseInputValueDef, l_TokenKind_0.PAREN_R);
end;
v17.parseInputValueDef = function(v153) --[[ Line: 1018 ]] --[[ Name: parseInputValueDef ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_23 = v153._lexer.token;
    local v155 = v153:parseDescription();
    local v156 = v153:parseName();
    v153:expectToken(l_TokenKind_0.COLON);
    local v157 = v153:parseTypeReference();
    local v158 = nil;
    if v153:expectOptionalToken(l_TokenKind_0.EQUALS) then
        v158 = v153:parseValueLiteral(true);
    end;
    local v159 = v153:parseDirectives(true);
    return {
        kind = l_Kind_0.INPUT_VALUE_DEFINITION, 
        description = v155, 
        name = v156, 
        type = v157, 
        defaultValue = v158, 
        directives = v159, 
        loc = v153:loc(l_token_23)
    };
end;
v17.parseInterfaceTypeDefinition = function(v160) --[[ Line: 1044 ]] --[[ Name: parseInterfaceTypeDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_24 = v160._lexer.token;
    local v162 = v160:parseDescription();
    v160:expectKeyword("interface");
    local v163 = v160:parseName();
    local v164 = v160:parseImplementsInterfaces();
    local v165 = v160:parseDirectives(true);
    local v166 = v160:parseFieldsDefinition();
    return {
        kind = l_Kind_0.INTERFACE_TYPE_DEFINITION, 
        description = v162, 
        name = v163, 
        interfaces = v164, 
        directives = v165, 
        fields = v166, 
        loc = v160:loc(l_token_24)
    };
end;
v17.parseUnionTypeDefinition = function(v167) --[[ Line: 1067 ]] --[[ Name: parseUnionTypeDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_25 = v167._lexer.token;
    local v169 = v167:parseDescription();
    v167:expectKeyword("union");
    local v170 = v167:parseName();
    local v171 = v167:parseDirectives(true);
    local v172 = v167:parseUnionMemberTypes();
    return {
        kind = l_Kind_0.UNION_TYPE_DEFINITION, 
        description = v169, 
        name = v170, 
        directives = v171, 
        types = v172, 
        loc = v167:loc(l_token_25)
    };
end;
v17.parseUnionMemberTypes = function(v173) --[[ Line: 1089 ]] --[[ Name: parseUnionMemberTypes ]]
    -- upvalues: l_TokenKind_0 (copy)
    local v174 = {};
    if v173:expectOptionalToken(l_TokenKind_0.EQUALS) then
        v173:expectOptionalToken(l_TokenKind_0.PIPE);
        repeat
            table.insert(v174, v173:parseNamedType());
        until not v173:expectOptionalToken(l_TokenKind_0.PIPE);
    end;
    return v174;
end;
v17.parseEnumTypeDefinition = function(v175) --[[ Line: 1105 ]] --[[ Name: parseEnumTypeDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_26 = v175._lexer.token;
    local v177 = v175:parseDescription();
    v175:expectKeyword("enum");
    local v178 = v175:parseName();
    local v179 = v175:parseDirectives(true);
    local v180 = v175:parseEnumValuesDefinition();
    return {
        kind = l_Kind_0.ENUM_TYPE_DEFINITION, 
        description = v177, 
        name = v178, 
        directives = v179, 
        values = v180, 
        loc = v175:loc(l_token_26)
    };
end;
v17.parseEnumValuesDefinition = function(v181) --[[ Line: 1125 ]] --[[ Name: parseEnumValuesDefinition ]]
    -- upvalues: l_TokenKind_0 (copy)
    return v181:optionalMany(l_TokenKind_0.BRACE_L, v181.parseEnumValueDefinition, l_TokenKind_0.BRACE_R);
end;
v17.parseEnumValueDefinition = function(v182) --[[ Line: 1134 ]] --[[ Name: parseEnumValueDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_27 = v182._lexer.token;
    local v184 = v182:parseDescription();
    local v185 = v182:parseName();
    local v186 = v182:parseDirectives(true);
    return {
        kind = l_Kind_0.ENUM_VALUE_DEFINITION, 
        description = v184, 
        name = v185, 
        directives = v186, 
        loc = v182:loc(l_token_27)
    };
end;
v17.parseInputObjectTypeDefinition = function(v187) --[[ Line: 1152 ]] --[[ Name: parseInputObjectTypeDefinition ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_28 = v187._lexer.token;
    local v189 = v187:parseDescription();
    v187:expectKeyword("input");
    local v190 = v187:parseName();
    local v191 = v187:parseDirectives(true);
    local v192 = v187:parseInputFieldsDefinition();
    return {
        kind = l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION, 
        description = v189, 
        name = v190, 
        directives = v191, 
        fields = v192, 
        loc = v187:loc(l_token_28)
    };
end;
v17.parseInputFieldsDefinition = function(v193) --[[ Line: 1172 ]] --[[ Name: parseInputFieldsDefinition ]]
    -- upvalues: l_TokenKind_0 (copy)
    return v193:optionalMany(l_TokenKind_0.BRACE_L, v193.parseInputValueDef, l_TokenKind_0.BRACE_R);
end;
v17.parseTypeSystemExtension = function(v194) --[[ Line: 1189 ]] --[[ Name: parseTypeSystemExtension ]]
    -- upvalues: l_TokenKind_0 (copy)
    local v195 = v194._lexer:lookahead();
    if v195.kind == l_TokenKind_0.NAME then
        local l_value_3 = v195.value;
        if l_value_3 == "schema" then
            return v194:parseSchemaExtension();
        elseif l_value_3 == "scalar" then
            return v194:parseScalarTypeExtension();
        elseif l_value_3 == "type" then
            return v194:parseObjectTypeExtension();
        elseif l_value_3 == "interface" then
            return v194:parseInterfaceTypeExtension();
        elseif l_value_3 == "union" then
            return v194:parseUnionTypeExtension();
        elseif l_value_3 == "enum" then
            return v194:parseEnumTypeExtension();
        elseif l_value_3 == "input" then
            return v194:parseInputObjectTypeExtension();
        end;
    end;
    error(v194:unexpected(v195));
end;
v17.parseSchemaExtension = function(v197) --[[ Line: 1219 ]] --[[ Name: parseSchemaExtension ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_29 = v197._lexer.token;
    v197:expectKeyword("extend");
    v197:expectKeyword("schema");
    local v199 = v197:parseDirectives(true);
    local v200 = v197:optionalMany(l_TokenKind_0.BRACE_L, v197.parseOperationTypeDefinition, l_TokenKind_0.BRACE_R);
    if #v199 == 0 and #v200 == 0 then
        error(v197:unexpected());
    end;
    return {
        kind = l_Kind_0.SCHEMA_EXTENSION, 
        directives = v199, 
        operationTypes = v200, 
        loc = v197:loc(l_token_29)
    };
end;
v17.parseScalarTypeExtension = function(v201) --[[ Line: 1244 ]] --[[ Name: parseScalarTypeExtension ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_30 = v201._lexer.token;
    v201:expectKeyword("extend");
    v201:expectKeyword("scalar");
    local v203 = v201:parseName();
    local v204 = v201:parseDirectives(true);
    if #v204 == 0 then
        error(v201:unexpected());
    end;
    return {
        kind = l_Kind_0.SCALAR_TYPE_EXTENSION, 
        name = v203, 
        directives = v204, 
        loc = v201:loc(l_token_30)
    };
end;
v17.parseObjectTypeExtension = function(v205) --[[ Line: 1267 ]] --[[ Name: parseObjectTypeExtension ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_31 = v205._lexer.token;
    v205:expectKeyword("extend");
    v205:expectKeyword("type");
    local v207 = v205:parseName();
    local v208 = v205:parseImplementsInterfaces();
    local v209 = v205:parseDirectives(true);
    local v210 = v205:parseFieldsDefinition();
    if #v208 == 0 and #v209 == 0 and #v210 == 0 then
        error(v205:unexpected());
    end;
    return {
        kind = l_Kind_0.OBJECT_TYPE_EXTENSION, 
        name = v207, 
        interfaces = v208, 
        directives = v209, 
        fields = v210, 
        loc = v205:loc(l_token_31)
    };
end;
v17.parseInterfaceTypeExtension = function(v211) --[[ Line: 1294 ]] --[[ Name: parseInterfaceTypeExtension ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_32 = v211._lexer.token;
    v211:expectKeyword("extend");
    v211:expectKeyword("interface");
    local v213 = v211:parseName();
    local v214 = v211:parseImplementsInterfaces();
    local v215 = v211:parseDirectives(true);
    local v216 = v211:parseFieldsDefinition();
    if #v214 == 0 and #v215 == 0 and #v216 == 0 then
        error(v211:unexpected());
    end;
    return {
        kind = l_Kind_0.INTERFACE_TYPE_EXTENSION, 
        name = v213, 
        interfaces = v214, 
        directives = v215, 
        fields = v216, 
        loc = v211:loc(l_token_32)
    };
end;
v17.parseUnionTypeExtension = function(v217) --[[ Line: 1320 ]] --[[ Name: parseUnionTypeExtension ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_33 = v217._lexer.token;
    v217:expectKeyword("extend");
    v217:expectKeyword("union");
    local v219 = v217:parseName();
    local v220 = v217:parseDirectives(true);
    local v221 = v217:parseUnionMemberTypes();
    if #v220 == 0 and #v221 == 0 then
        error(v217:unexpected());
    end;
    return {
        kind = l_Kind_0.UNION_TYPE_EXTENSION, 
        name = v219, 
        directives = v220, 
        types = v221, 
        loc = v217:loc(l_token_33)
    };
end;
v17.parseEnumTypeExtension = function(v222) --[[ Line: 1344 ]] --[[ Name: parseEnumTypeExtension ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_34 = v222._lexer.token;
    v222:expectKeyword("extend");
    v222:expectKeyword("enum");
    local v224 = v222:parseName();
    local v225 = v222:parseDirectives(true);
    local v226 = v222:parseEnumValuesDefinition();
    if #v225 == 0 and #v226 == 0 then
        error(v222:unexpected());
    end;
    return {
        kind = l_Kind_0.ENUM_TYPE_EXTENSION, 
        name = v224, 
        directives = v225, 
        values = v226, 
        loc = v222:loc(l_token_34)
    };
end;
v17.parseInputObjectTypeExtension = function(v227) --[[ Line: 1368 ]] --[[ Name: parseInputObjectTypeExtension ]]
    -- upvalues: l_Kind_0 (copy)
    local l_token_35 = v227._lexer.token;
    v227:expectKeyword("extend");
    v227:expectKeyword("input");
    local v229 = v227:parseName();
    local v230 = v227:parseDirectives(true);
    local v231 = v227:parseInputFieldsDefinition();
    if #v230 == 0 and #v231 == 0 then
        error(v227:unexpected());
    end;
    return {
        kind = l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION, 
        name = v229, 
        directives = v230, 
        fields = v231, 
        loc = v227:loc(l_token_35)
    };
end;
v17.parseDirectiveDefinition = function(v232) --[[ Line: 1391 ]] --[[ Name: parseDirectiveDefinition ]]
    -- upvalues: l_TokenKind_0 (copy), l_Kind_0 (copy)
    local l_token_36 = v232._lexer.token;
    local v234 = v232:parseDescription();
    v232:expectKeyword("directive");
    v232:expectToken(l_TokenKind_0.AT);
    local v235 = v232:parseName();
    local v236 = v232:parseArgumentDefs();
    local v237 = v232:expectOptionalKeyword("repeatable");
    v232:expectKeyword("on");
    local v238 = v232:parseDirectiveLocations();
    return {
        kind = l_Kind_0.DIRECTIVE_DEFINITION, 
        description = v234, 
        name = v235, 
        arguments = v236, 
        repeatable = v237, 
        locations = v238, 
        loc = v232:loc(l_token_36)
    };
end;
v17.parseDirectiveLocations = function(v239) --[[ Line: 1417 ]] --[[ Name: parseDirectiveLocations ]]
    -- upvalues: l_TokenKind_0 (copy)
    v239:expectOptionalToken(l_TokenKind_0.PIPE);
    local v240 = {};
    repeat
        table.insert(v240, v239:parseDirectiveLocation());
    until not v239:expectOptionalToken(l_TokenKind_0.PIPE);
    return v240;
end;
v17.parseDirectiveLocation = function(v241) --[[ Line: 1454 ]] --[[ Name: parseDirectiveLocation ]]
    -- upvalues: l_DirectiveLocation_0 (copy)
    local l_token_37 = v241._lexer.token;
    local v243 = v241:parseName();
    if l_DirectiveLocation_0[v243.value] ~= nil then
        return v243;
    else
        error(v241:unexpected(l_token_37));
        return;
    end;
end;
v17.loc = function(v244, v245) --[[ Line: 1467 ]] --[[ Name: loc ]]
    -- upvalues: l_Location_0 (copy)
    if (v244._options and v244._options.noLocation) ~= true then
        return l_Location_0.new(v245, v244._lexer.lastToken, v244._lexer.source);
    else
        return nil;
    end;
end;
v17.peek = function(v246, v247) --[[ Line: 1477 ]] --[[ Name: peek ]]
    return v246._lexer.token.kind == v247;
end;
v17.expectToken = function(v248, v249) --[[ Line: 1485 ]] --[[ Name: expectToken ]]
    -- upvalues: l_syntaxError_0 (copy), v16 (ref), v15 (ref)
    local l_token_38 = v248._lexer.token;
    if l_token_38.kind == v249 then
        v248._lexer:advance();
        return l_token_38;
    else
        error(l_syntaxError_0(v248._lexer.source, l_token_38.start, "Expected " .. v16(v249) .. ", found " .. v15(l_token_38) .. "."));
        return;
    end;
end;
v17.expectOptionalToken = function(v251, v252) --[[ Line: 1505 ]] --[[ Name: expectOptionalToken ]]
    local l_token_39 = v251._lexer.token;
    if l_token_39.kind == v252 then
        v251._lexer:advance();
        return l_token_39;
    else
        return nil;
    end;
end;
v17.expectKeyword = function(v254, v255) --[[ Line: 1518 ]] --[[ Name: expectKeyword ]]
    -- upvalues: l_TokenKind_0 (copy), l_syntaxError_0 (copy), v15 (ref)
    local l_token_40 = v254._lexer.token;
    if l_token_40.kind == l_TokenKind_0.NAME and l_token_40.value == v255 then
        v254._lexer:advance();
        return;
    else
        error(l_syntaxError_0(v254._lexer.source, l_token_40.start, "Expected \"" .. v255 .. "\", found " .. v15(l_token_40) .. "."));
        return;
    end;
end;
v17.expectOptionalKeyword = function(v257, v258) --[[ Line: 1537 ]] --[[ Name: expectOptionalKeyword ]]
    -- upvalues: l_TokenKind_0 (copy)
    local l_token_41 = v257._lexer.token;
    if l_token_41.kind == l_TokenKind_0.NAME and l_token_41.value == v258 then
        v257._lexer:advance();
        return true;
    else
        return false;
    end;
end;
v17.unexpected = function(v260, v261) --[[ Line: 1550 ]] --[[ Name: unexpected ]]
    -- upvalues: l_syntaxError_0 (copy), v15 (ref)
    local v262 = v261 ~= nil and v261 or v260._lexer.token;
    return l_syntaxError_0(v260._lexer.source, v262.start, "Unexpected " .. v15(v262) .. ".");
end;
v17.any = function(v263, v264, v265, v266) --[[ Line: 1561 ]] --[[ Name: any ]]
    v263:expectToken(v264);
    local v267 = {};
    while not v263:expectOptionalToken(v266) do
        table.insert(v267, v265(v263));
    end;
    return v267;
end;
v17.optionalMany = function(v268, v269, v270, v271) --[[ Line: 1582 ]] --[[ Name: optionalMany ]]
    if v268:expectOptionalToken(v269) then
        local v272 = {};
        repeat
            table.insert(v272, v270(v268));
        until v268:expectOptionalToken(v271);
        return v272;
    else
        return {};
    end;
end;
v17.many = function(v273, v274, v275, v276) --[[ Line: 1604 ]] --[[ Name: many ]]
    v273:expectToken(v274);
    local v277 = {};
    repeat
        table.insert(v277, v275(v273));
    until v273:expectOptionalToken(v276);
    return v277;
end;
v17.delimitedMany = function(v278, v279, v280) --[[ Line: 1623 ]] --[[ Name: delimitedMany ]]
    v278:expectOptionalToken(v279);
    local v281 = {};
    repeat
        table.insert(v281, v280(v278));
    until not v278:expectOptionalToken(v279);
    return v281;
end;
v15 = function(v282) --[[ Line: 1640 ]] --[[ Name: getTokenDesc ]]
    -- upvalues: v16 (ref)
    local l_value_4 = v282.value;
    return v16(v282.kind) .. (l_value_4 ~= nil and " \"" .. l_value_4 .. "\"" or "");
end;
v16 = function(v284) --[[ Line: 1648 ]] --[[ Name: getTokenKindDesc ]]
    -- upvalues: l_isPunctuatorTokenKind_0 (copy)
    return l_isPunctuatorTokenKind_0(v284) and "\"" .. v284 .. "\"" or v284;
end;
return {
    Parser = v17, 
    parse = v20, 
    parseValue = v25, 
    parseType = v30
};