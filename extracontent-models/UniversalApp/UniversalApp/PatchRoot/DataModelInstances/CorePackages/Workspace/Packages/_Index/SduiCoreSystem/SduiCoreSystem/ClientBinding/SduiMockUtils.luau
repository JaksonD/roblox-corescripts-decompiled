return {
	createLiteralKind = function(p1) --[[ createLiteralKind ]] -- line: 16
		return {
			type = "literal",
			value = p1
		}
	end,
	createBindingPathKind = function(s1: string) --[[ createBindingPathKind ]] -- line: 26
		return {
			type = "binding_path",
			value = s1
		}
	end,
	createLiteralProp = function(p2, s2: string) --[[ createLiteralProp ]] -- line: 42
		return {
			kind = {
				type = "literal",
				value = p2
			},
			descriptor = {
				name = s2,
				fullName = s2
			}
		}
	end,
	createBindingPathProp = function(s3: string, s4: string) --[[ createBindingPathProp ]] -- line: 70
		return {
			kind = {
				type = "binding_path",
				value = s3
			},
			descriptor = {
				name = s4,
				fullName = s4
			}
		}
	end,
	createTokenProp = function(p3, s5: string) --[[ createTokenProp ]] -- line: 56
		return {
			kind = {
				type = "token",
				value = p3
			},
			descriptor = {
				name = s5,
				fullName = s5
			}
		}
	end,
	createMockInputForNestedComponent = function(p4, p5) --[[ createMockInputForNestedComponent ]] -- line: 84
		if p4 == "literal" then
			return {
				kind = {
					type = "literal",
					value = {
						kind = {
							value = p5
						}
					}
				}
			}
		end

		if p4 == "translation" then
			return {
				kind = {
					type = "translation",
					value = p5
				}
			}
		end

		return {
			kind = {
				type = "binding_path",
				value = p5
			}
		}
	end,
	createMockConditionalPropValue = function(t1: {[any]: any}, p6) --[[ createMockConditionalPropValue ]] -- line: 137
		return {
			kind = {
				type = "conditional",
				value = {
					options = t1
				}
			},
			descriptor = {
				fullName = p6,
				name = p6
			}
		}
	end,
	createMockConditionalOptions = function(t2: {[any]: any}) --[[ createMockConditionalOptions ]] -- line: 269
		return {
			options = t2
		}
	end,
	createMockComparisonConditionOption = function(s6: string, s7: string, p7, t3: {[any]: any}) --[[ createMockComparisonConditionOption ]] -- line: 156
		return {
			condition = {
				kind = {
					type = "comparison",
					value = {
						op = s6,
						field = s7,
						kind = {
							value = p7
						}
					}
				}
			},
			kind = t3
		}
	end,
	createMockIsNullConditionOption = function(s8: string, t4: {[any]: any}) --[[ createMockIsNullConditionOption ]] -- line: 179
		return {
			condition = {
				kind = {
					type = "is_null",
					value = {
						field = s8
					}
				}
			},
			kind = t4
		}
	end,
	createMockIsNotNullConditionOption = function(s9: string, t5: {[any]: any}) --[[ createMockIsNotNullConditionOption ]] -- line: 193
		return {
			condition = {
				kind = {
					type = "is_not_null",
					value = {
						field = s9
					}
				}
			},
			kind = t5
		}
	end,
	createMockIsEmptyConditionOption = function(s10: string, t6: {[any]: any}) --[[ createMockIsEmptyConditionOption ]] -- line: 207
		return {
			condition = {
				kind = {
					type = "is_empty",
					value = {
						field = s10
					}
				}
			},
			kind = t6
		}
	end,
	createMockIsNotEmptyConditionOption = function(s11: string, t7: {[any]: any}) --[[ createMockIsNotEmptyConditionOption ]] -- line: 221
		return {
			condition = {
				kind = {
					type = "is_not_empty",
					value = {
						field = s11
					}
				}
			},
			kind = t7
		}
	end,
	createMockAndConditionOption = function(t8: {[any]: any}, t9: {[any]: any}) --[[ createMockAndConditionOption ]] -- line: 235
		return {
			condition = {
				kind = {
					type = "and_condition",
					value = {
						conditions = t8
					}
				}
			},
			kind = t9
		}
	end,
	createMockOrConditionOption = function(t10: {[any]: any}, t11: {[any]: any}) --[[ createMockOrConditionOption ]] -- line: 249
		return {
			condition = {
				kind = {
					type = "or_condition",
					value = {
						conditions = t10
					}
				}
			},
			kind = t11
		}
	end,
	createMockNestedComponentConditionalOption = function(p8, p9, p10) --[[ createMockNestedComponentConditionalOption ]] -- line: 120
		return {
			condition = p8,
			kind = {
				type = "literal",
				value = {
					roblox_component = p9,
					inputs = p10
				}
			}
		}
	end
}
