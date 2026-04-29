local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent

require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)

local SduiPropUtils = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

require(SduiCoreSystemParent.Signals)

local FFlagSduiLocalizedLiterals = require(SduiCoreSystemParent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiFormatArgFormatters = require(SduiCoreSystemParent.SharedFlags).FFlagSduiFormatArgFormatters

return function(p1, t1: {[any]: any}?, p2, p3, t2: {[any]: any}, p4) --[[ buildInputsForNestedComponent ]] -- line: 27
	-- upvalues: SduiPropUtils (copy), FFlagSduiLocalizedLiterals (copy), FFlagSduiFormatArgFormatters (copy)
	if t1 then
		for v12, v13 in t1 do
			if v13.kind then
				local type = v13.kind.type

				if type == "binding_path" then
					local value = v13.kind.value
					local parts = string.split(value, ".")
					local v17, _ = SduiPropUtils.resolveBindingPathValue(p3 or false, parts, p2, p1, nil, false)

					t2[v12] = v17
				elseif type == "literal" then
					local v19 = v13.kind.value and (v13.kind.value.kind and v13.kind.value.kind.value)

					if v19 == nil then
						error(`Failed to determine value for nested input arg { v12 }`)
					end

					t2[v12] = v19
				elseif FFlagSduiLocalizedLiterals and type == "translation" then
					if p4 and p4.resolveLocalizedLiteral then
						t2[v12] = p4.resolveLocalizedLiteral(v13.kind.value)
					end
				elseif FFlagSduiFormatArgFormatters and type == "format" then
					local value = v13.kind.value

					t2[v12] = SduiPropUtils.generateFormatStringPropValue(value, p2, p4, p1)(p3 or false).data
				else
					error(`Unrecognized inputDataType for key { v12 }`)
				end
			end
		end
	end
end
