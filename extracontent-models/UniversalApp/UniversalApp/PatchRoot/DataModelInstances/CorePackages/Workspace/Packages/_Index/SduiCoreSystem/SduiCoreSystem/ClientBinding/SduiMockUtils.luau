return {
    createLiteralKind = function(v0) --[[ Line: 16 ]] --[[ Name: createLiteralKind ]]
        return {
            type = "literal", 
            value = v0
        };
    end, 
    createBindingPathKind = function(v1) --[[ Line: 26 ]] --[[ Name: createBindingPathKind ]]
        return {
            type = "binding_path", 
            value = v1
        };
    end, 
    createLiteralProp = function(v2, v3) --[[ Line: 42 ]] --[[ Name: createLiteralProp ]]
        return {
            kind = {
                type = "literal", 
                value = v2
            }, 
            descriptor = {
                name = v3, 
                fullName = v3
            }
        };
    end, 
    createBindingPathProp = function(v4, v5) --[[ Line: 70 ]] --[[ Name: createBindingPathProp ]]
        return {
            kind = {
                type = "binding_path", 
                value = v4
            }, 
            descriptor = {
                name = v5, 
                fullName = v5
            }
        };
    end, 
    createTokenProp = function(v6, v7) --[[ Line: 56 ]] --[[ Name: createTokenProp ]]
        return {
            kind = {
                type = "token", 
                value = v6
            }, 
            descriptor = {
                name = v7, 
                fullName = v7
            }
        };
    end, 
    createMockInputForNestedComponent = function(v8, v9) --[[ Line: 84 ]] --[[ Name: createMockInputForNestedComponent ]]
        if v8 == "literal" then
            return {
                kind = {
                    type = "literal", 
                    value = {
                        kind = {
                            value = v9
                        }
                    }
                }
            };
        elseif v8 == "translation" then
            return {
                kind = {
                    type = "translation", 
                    value = v9
                }
            };
        else
            return {
                kind = {
                    type = "binding_path", 
                    value = v9
                }
            };
        end;
    end, 
    createMockConditionalPropValue = function(v10, v11) --[[ Line: 137 ]] --[[ Name: createMockConditionalPropValue ]]
        return {
            kind = {
                type = "conditional", 
                value = {
                    options = v10
                }
            }, 
            descriptor = {
                fullName = v11, 
                name = v11
            }
        };
    end, 
    createMockConditionalOptions = function(v12) --[[ Line: 241 ]] --[[ Name: createMockConditionalOptions ]]
        return {
            options = v12
        };
    end, 
    createMockComparisonConditionOption = function(v13, v14, v15, v16) --[[ Line: 156 ]] --[[ Name: createMockComparisonConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "comparison", 
                    value = {
                        op = v13, 
                        field = v14, 
                        kind = {
                            value = v15
                        }
                    }
                }
            }, 
            kind = v16
        };
    end, 
    createMockIsNullConditionOption = function(v17, v18) --[[ Line: 179 ]] --[[ Name: createMockIsNullConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "is_null", 
                    value = {
                        field = v17
                    }
                }
            }, 
            kind = v18
        };
    end, 
    createMockIsNotNullConditionOption = function(v19, v20) --[[ Line: 193 ]] --[[ Name: createMockIsNotNullConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "is_not_null", 
                    value = {
                        field = v19
                    }
                }
            }, 
            kind = v20
        };
    end, 
    createMockAndConditionOption = function(v21, v22) --[[ Line: 207 ]] --[[ Name: createMockAndConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "and_condition", 
                    value = {
                        conditions = v21
                    }
                }
            }, 
            kind = v22
        };
    end, 
    createMockOrConditionOption = function(v23, v24) --[[ Line: 221 ]] --[[ Name: createMockOrConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "or_condition", 
                    value = {
                        conditions = v23
                    }
                }
            }, 
            kind = v24
        };
    end, 
    createMockNestedComponentConditionalOption = function(v25, v26, v27) --[[ Line: 120 ]] --[[ Name: createMockNestedComponentConditionalOption ]]
        return {
            condition = v25, 
            kind = {
                type = "literal", 
                value = {
                    roblox_component = v26, 
                    inputs = v27
                }
            }
        };
    end
};