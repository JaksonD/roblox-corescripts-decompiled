local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
return {
    createLiteralKind = function(v2) --[[ Line: 20 ]] --[[ Name: createLiteralKind ]]
        return {
            type = "literal", 
            value = v2
        };
    end, 
    createBindingPathKind = function(v3) --[[ Line: 30 ]] --[[ Name: createBindingPathKind ]]
        return {
            type = "binding_path", 
            value = v3
        };
    end, 
    createLiteralProp = function(v4, v5) --[[ Line: 46 ]] --[[ Name: createLiteralProp ]]
        return {
            kind = {
                type = "literal", 
                value = v4
            }, 
            descriptor = {
                name = v5, 
                fullName = v5
            }
        };
    end, 
    createBindingPathProp = function(v6, v7) --[[ Line: 74 ]] --[[ Name: createBindingPathProp ]]
        return {
            kind = {
                type = "binding_path", 
                value = v6
            }, 
            descriptor = {
                name = v7, 
                fullName = v7
            }
        };
    end, 
    createTokenProp = function(v8, v9) --[[ Line: 60 ]] --[[ Name: createTokenProp ]]
        return {
            kind = {
                type = "token", 
                value = v8
            }, 
            descriptor = {
                name = v9, 
                fullName = v9
            }
        };
    end, 
    createMockInputForNestedComponent = function(v10, v11) --[[ Line: 88 ]] --[[ Name: createMockInputForNestedComponent ]]
        -- upvalues: l_FFlagSduiInputDataSignals_0 (copy)
        if v10 == "literal" then
            return {
                kind = {
                    type = "literal", 
                    value = if l_FFlagSduiInputDataSignals_0 then {
                        kind = {
                            value = v11
                        }
                    } else v11
                }
            };
        else
            return {
                kind = {
                    type = "binding_path", 
                    value = v11
                }
            };
        end;
    end, 
    createMockConditionalPropValue = function(v12, v13) --[[ Line: 135 ]] --[[ Name: createMockConditionalPropValue ]]
        return {
            kind = {
                type = "conditional", 
                value = {
                    options = v12
                }
            }, 
            descriptor = {
                fullName = v13, 
                name = v13
            }
        };
    end, 
    createMockConditionalOptions = function(v14) --[[ Line: 239 ]] --[[ Name: createMockConditionalOptions ]]
        return {
            options = v14
        };
    end, 
    createMockComparisonConditionOption = function(v15, v16, v17, v18) --[[ Line: 154 ]] --[[ Name: createMockComparisonConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "comparison", 
                    value = {
                        op = v15, 
                        field = v16, 
                        kind = {
                            value = v17
                        }
                    }
                }
            }, 
            kind = v18
        };
    end, 
    createMockIsNullConditionOption = function(v19, v20) --[[ Line: 177 ]] --[[ Name: createMockIsNullConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "is_null", 
                    value = {
                        field = v19
                    }
                }
            }, 
            kind = v20
        };
    end, 
    createMockIsNotNullConditionOption = function(v21, v22) --[[ Line: 191 ]] --[[ Name: createMockIsNotNullConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "is_not_null", 
                    value = {
                        field = v21
                    }
                }
            }, 
            kind = v22
        };
    end, 
    createMockAndConditionOption = function(v23, v24) --[[ Line: 205 ]] --[[ Name: createMockAndConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "and_condition", 
                    value = {
                        conditions = v23
                    }
                }
            }, 
            kind = v24
        };
    end, 
    createMockOrConditionOption = function(v25, v26) --[[ Line: 219 ]] --[[ Name: createMockOrConditionOption ]]
        return {
            condition = {
                kind = {
                    type = "or_condition", 
                    value = {
                        conditions = v25
                    }
                }
            }, 
            kind = v26
        };
    end, 
    createMockNestedComponentConditionalOption = function(v27, v28, v29) --[[ Line: 118 ]] --[[ Name: createMockNestedComponentConditionalOption ]]
        return {
            condition = v27, 
            kind = {
                type = "literal", 
                value = {
                    roblox_component = v28, 
                    inputs = v29
                }
            }
        };
    end
};