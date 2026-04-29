local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local struct = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local prop_condition = require(script.Parent.prop_condition)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 3070
	-- upvalues: t2 (copy)
	return (setmetatable({
		namespace = if t3 ~= nil and t3.namespace ~= nil then t3.namespace else "",
		key = if t3 ~= nil and t3.key ~= nil then t3.key else "",
		map_key = if t3 ~= nil and t3.map_key ~= nil then t3.map_key else ""
	}, t2))
end
function t2.encode(p1) -- line: 3078
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.namespace ~= nil and p1.namespace ~= "" then
		local v109, v110 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v109, v110, p1.namespace)
	end

	if p1.key ~= nil and p1.key ~= "" then
		local v111, v112 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v111, v112, p1.key)
	end

	if p1.map_key ~= nil and p1.map_key ~= "" then
		local v113, v114 = proto.writeTag(buf, n1, 3, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v113, v114, p1.map_key)
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 3102
	-- upvalues: t2 (copy), proto (copy)
	local v117 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v119, v120

		v119, v120, n2 = proto.readTag(p2, n2)

		if v120 == proto.wireTypes.varint then
			local v121

			v121, n2 = proto.readVarInt(p2, n2)
		elseif v120 == proto.wireTypes.lengthDelimited then
			if v119 == 1 then
				local v122

				v122, n2 = proto.readBuffer(p2, n2)
				v117.namespace = buffer.tostring(v122)
			elseif v119 == 2 then
				local v123

				v123, n2 = proto.readBuffer(p2, n2)
				v117.key = buffer.tostring(v123)
			elseif v119 == 3 then
				local v124

				v124, n2 = proto.readBuffer(p2, n2)
				v117.map_key = buffer.tostring(v124)
			else
				local v125, v126 = proto.readVarInt(p2, n2)

				n2 = v126 + v125
			end
		elseif v120 == proto.wireTypes.i32 then
			local v127

			v127, n2 = proto.readFixed32(p2, n2)
		elseif v120 == proto.wireTypes.i64 then
			local v128

			v128, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v120)
		end
	end

	return v117
end
function t2.jsonEncode(p3) -- line: 3155
	local t4 = {}

	if p3.namespace ~= nil and p3.namespace ~= "" then
		t4.namespace = p3.namespace
	end

	if p3.key ~= nil and p3.key ~= "" then
		t4.key = p3.key
	end

	if p3.map_key ~= nil and p3.map_key ~= "" then
		t4.mapKey = p3.map_key
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 3173
	-- upvalues: t2 (copy)
	local v132 = t2.new()

	if t5.namespace ~= nil then
		v132.namespace = t5.namespace
	end

	if t5.key ~= nil then
		v132.key = t5.key
	end

	if t5.map_key ~= nil then
		v132.map_key = t5.map_key
	end

	if t5.mapKey ~= nil then
		v132.map_key = t5.mapKey
	end

	return v132
end

t2.descriptor = {
	name = "TranslationRef",
	fullName = "roblox.apppageplatform.shared.v1beta1.TranslationRef"
}
t1.TranslationRef = t2
typeRegistry.default:register(t1.TranslationRef)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 3209
	-- upvalues: t6 (copy)
	return (setmetatable({
		str = if t7 ~= nil and t7.str ~= nil then t7.str else "",
		args = if t7 ~= nil and t7.args ~= nil then t7.args else {},
		translation = if t7 ~= nil and t7.translation ~= nil then t7.translation else nil
	}, t6))
end
function t6.encode(p4) -- line: 3217
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.str ~= nil and p4.str ~= "" then
		local v137, v138 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeString(v137, v138, p4.str)
	end

	if p4.args ~= nil and next(p4.args) ~= nil then
		for v139, v140 in p4.args do
			local buf3 = buffer.create(0)
			local v142, v143 = proto.writeTag(buf3, 0, 1, proto.wireTypes.lengthDelimited)
			local v144, v145 = proto.writeString(v142, v143, v139)
			local v146 = v140:encode()
			local v147, v148 = proto.writeTag(v144, v145, 2, proto.wireTypes.lengthDelimited)
			local v149, v150 = proto.writeBuffer(v147, v148, v146, buffer.len(v146))
			local v151, v152 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

			buf, n3 = proto.writeBuffer(v151, v152, v149, v150)
		end
	end

	if p4.translation ~= nil then
		local v153 = p4.translation:encode()
		local v154, v155 = proto.writeTag(buf, n3, 3, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v154, v155, v153, buffer.len(v153))
	end

	local buf4 = buffer.create(n3)

	buffer.copy(buf4, 0, buf, 0, n3)

	return buf4
end
function t6.decode(p5: buffer) -- line: 3251
	-- upvalues: t6 (copy), proto (copy), t1 (copy)
	local v158 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v160, v161

		v160, v161, n4 = proto.readTag(p5, n4)

		if v161 == proto.wireTypes.varint then
			local v162

			v162, n4 = proto.readVarInt(p5, n4)
		elseif v161 == proto.wireTypes.lengthDelimited then
			if v160 == 1 then
				local v163

				v163, n4 = proto.readBuffer(p5, n4)
				v158.str = buffer.tostring(v163)
			elseif v160 == 2 then
				local v164

				v164, n4 = proto.readBuffer(p5, n4)

				local v165 = t1.StringFormat_ArgsEntry.decode(v164)
				local v166 = t1.StringFormat_FormatArg.new()

				v158.args[v165.key or ""] = v165.value or v166
			elseif v160 == 3 then
				local v167

				v167, n4 = proto.readBuffer(p5, n4)
				v158.translation = t1.TranslationRef.decode(v167)
			else
				local v168, v169 = proto.readVarInt(p5, n4)

				n4 = v169 + v168
			end
		elseif v161 == proto.wireTypes.i32 then
			local v170

			v170, n4 = proto.readFixed32(p5, n4)
		elseif v161 == proto.wireTypes.i64 then
			local v171

			v171, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v161)
		end
	end

	return v158
end
function t6.jsonEncode(p6) -- line: 3311
	local t8 = {}

	if p6.str ~= nil and p6.str ~= "" then
		t8.str = p6.str
	end

	if p6.args ~= nil and next(p6.args) ~= nil then
		local t9 = {}

		for v175, v176 in p6.args do
			t9[v175] = v176:jsonEncode()
		end

		t8.args = t9
	end

	if p6.translation ~= nil then
		t8.translation = p6.translation:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t10: {[any]: any}) -- line: 3333
	-- upvalues: t6 (copy), t1 (copy)
	local v178 = t6.new()

	if t10.str ~= nil then
		v178.str = t10.str
	end

	if t10.args ~= nil then
		local t11 = {}

		for v180, v181 in t10.args do
			t11[v180] = t1.StringFormat_FormatArg.jsonDecode(v181)
		end

		v178.args = t11
	end

	if t10.translation ~= nil then
		v178.translation = t1.TranslationRef.jsonDecode(t10.translation)
	end

	return v178
end

t6.descriptor = {
	name = "StringFormat",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
}
t1.StringFormat = t6
typeRegistry.default:register(t1.StringFormat)

local t12 = {}

t12.__index = t12

function t12.new(t13: {[any]: any}?) -- line: 3370
	-- upvalues: t12 (copy)
	return (setmetatable({
		kind = if t13 ~= nil and t13.kind ~= nil then t13.kind else nil,
		formatter = if t13 ~= nil and t13.formatter ~= nil then t13.formatter else nil
	}, t12))
end
function t12.encode(p7) -- line: 3377
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n5 = 0

	if p7.kind ~= nil then
		if p7.kind.type == "literal" then
			local v186, v187 = proto.writeTag(buf, n5, 1, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeString(v186, v187, p7.kind.value)
		elseif p7.kind.type == "binding_path" then
			local v188, v189 = proto.writeTag(buf, n5, 2, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeString(v188, v189, p7.kind.value)
		end
	end

	if p7.formatter ~= nil then
		local v190 = p7.formatter:encode()
		local v191, v192 = proto.writeTag(buf, n5, 3, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeBuffer(v191, v192, v190, buffer.len(v190))
	end

	local buf5 = buffer.create(n5)

	buffer.copy(buf5, 0, buf, 0, n5)

	return buf5
end
function t12.decode(p8: buffer) -- line: 3402
	-- upvalues: t12 (copy), proto (copy), t1 (copy)
	local v195 = t12.new()
	local n6 = 0

	while n6 < buffer.len(p8) do
		local v197, v198

		v197, v198, n6 = proto.readTag(p8, n6)

		if v198 == proto.wireTypes.varint then
			local v199

			v199, n6 = proto.readVarInt(p8, n6)
		elseif v198 == proto.wireTypes.lengthDelimited then
			if v197 == 1 then
				local v200

				v200, n6 = proto.readBuffer(p8, n6)
				v195.kind = {
					type = "literal",
					value = buffer.tostring(v200)
				}
			elseif v197 == 2 then
				local v201

				v201, n6 = proto.readBuffer(p8, n6)
				v195.kind = {
					type = "binding_path",
					value = buffer.tostring(v201)
				}
			elseif v197 == 3 then
				local v202

				v202, n6 = proto.readBuffer(p8, n6)
				v195.formatter = t1.StringFormat_FormatArg_Formatter.decode(v202)
			else
				local v203, v204 = proto.readVarInt(p8, n6)

				n6 = v204 + v203
			end
		elseif v198 == proto.wireTypes.i32 then
			local v205

			v205, n6 = proto.readFixed32(p8, n6)
		elseif v198 == proto.wireTypes.i64 then
			local v206

			v206, n6 = proto.readFixed64(p8, n6)
		else
			error("Unsupported wire type: " .. v198)
		end
	end

	return v195
end
function t12.jsonEncode(p9) -- line: 3455
	local t14 = {}

	if p9.kind ~= nil then
		if p9.kind.type == "literal" then
			t14.literal = p9.kind.value
		elseif p9.kind.type == "binding_path" then
			t14.bindingPath = p9.kind.value
		end
	end

	if p9.formatter ~= nil then
		t14.formatter = p9.formatter:jsonEncode()
	end

	return t14
end
function t12.jsonDecode(t15: {[any]: any}) -- line: 3473
	-- upvalues: t12 (copy), t1 (copy)
	local v210 = t12.new()

	if t15.literal ~= nil then
		v210.kind = {
			type = "literal",
			value = t15.literal
		}
	end

	if t15.binding_path ~= nil then
		v210.kind = {
			type = "binding_path",
			value = t15.binding_path
		}
	end

	if t15.bindingPath ~= nil then
		v210.kind = {
			type = "binding_path",
			value = t15.bindingPath
		}
	end

	if t15.formatter ~= nil then
		v210.formatter = t1.StringFormat_FormatArg_Formatter.jsonDecode(t15.formatter)
	end

	return v210
end

t12.descriptor = {
	name = "StringFormat_FormatArg",
	fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
}
t1.StringFormat_FormatArg = t12
typeRegistry.default:register(t1.StringFormat_FormatArg)

local t16 = {}

t16.__index = t16

function t16.new(t17: {[any]: any}?) -- line: 3509
	-- upvalues: t1 (copy), t16 (copy)
	return (setmetatable({
		type = if t17 ~= nil and t17.type ~= nil then t17.type else assert(t1.StringFormat_FormatArg_Formatter_Type.fromNumber(0), "Enum has no 0 default"),
		config = if t17 ~= nil and t17.config ~= nil then t17.config else nil
	}, t16))
end
function t16.encode(p10) -- line: 3520
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n7 = 0

	if p10.type ~= nil and (p10.type ~= nil and p10.type ~= 0 or p10.type ~= t1.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		local v215, v216 = proto.writeTag(buf, n7, 1, proto.wireTypes.varint)

		buf, n7 = proto.writeVarInt(v215, v216, t1.StringFormat_FormatArg_Formatter_Type.toNumber(p10.type))
	end

	if p10.config ~= nil and p10.config.type == "date_config" then
		local v217 = p10.config.value:encode()
		local v218, v219 = proto.writeTag(buf, n7, 2, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeBuffer(v218, v219, v217, buffer.len(v217))
	end

	local buf6 = buffer.create(n7)

	buffer.copy(buf6, 0, buf, 0, n7)

	return buf6
end
function t16.decode(p11: buffer) -- line: 3552
	-- upvalues: t16 (copy), proto (copy), t1 (copy)
	local v222 = t16.new()
	local n8 = 0

	while n8 < buffer.len(p11) do
		local v224, v225

		v224, v225, n8 = proto.readTag(p11, n8)

		if v225 == proto.wireTypes.varint then
			if v224 == 1 then
				local v226

				v226, n8 = proto.readVarIntI32(p11, n8)
				v222.type = t1.StringFormat_FormatArg_Formatter_Type.fromNumber(v226) or v226
			else
				local v227

				v227, n8 = proto.readVarInt(p11, n8)
			end
		elseif v225 == proto.wireTypes.lengthDelimited then
			if v224 == 2 then
				local v228

				v228, n8 = proto.readBuffer(p11, n8)
				v222.config = {
					type = "date_config",
					value = t1.StringFormat_FormatArg_Formatter_DateConfig.decode(v228)
				}
			else
				local v229, v230 = proto.readVarInt(p11, n8)

				n8 = v230 + v229
			end
		elseif v225 == proto.wireTypes.i32 then
			local v231

			v231, n8 = proto.readFixed32(p11, n8)
		elseif v225 == proto.wireTypes.i64 then
			local v232

			v232, n8 = proto.readFixed64(p11, n8)
		else
			error("Unsupported wire type: " .. v225)
		end
	end

	return v222
end
function t16.jsonEncode(p12) -- line: 3603
	-- upvalues: t1 (copy)
	local t18 = {}

	if p12.type ~= nil and (p12.type ~= nil and p12.type ~= 0 or p12.type ~= t1.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		t18.type = if typeof(p12.type) ~= "number" then t1.StringFormat_FormatArg_Formatter_Type.toNumber(p12.type) else p12.type
	end

	if p12.config ~= nil and p12.config.type == "date_config" then
		t18.dateConfig = p12.config.value:jsonEncode()
	end

	return t18
end
function t16.jsonDecode(t19: {[any]: any}) -- line: 3627
	-- upvalues: t16 (copy), t1 (copy)
	local v236 = t16.new()

	if t19.type ~= nil then
		v236.type = if typeof(t19.type) ~= "number" then t1.StringFormat_FormatArg_Formatter_Type.fromName(t19.type) or t19.type else t1.StringFormat_FormatArg_Formatter_Type.fromNumber(t19.type) or t19.type
	end

	if t19.date_config ~= nil then
		v236.config = {
			type = "date_config",
			value = t1.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(t19.date_config)
		}
	end

	if t19.dateConfig ~= nil then
		v236.config = {
			type = "date_config",
			value = t1.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(t19.dateConfig)
		}
	end

	return v236
end

t16.descriptor = {
	name = "StringFormat_FormatArg_Formatter",
	fullName = "roblox.apppageplatform.shared.v1beta1.Formatter"
}
t1.StringFormat_FormatArg_Formatter = t16
typeRegistry.default:register(t1.StringFormat_FormatArg_Formatter)

local t20 = {}

t20.__index = t20

function t20.new(t21: {[any]: any}?) -- line: 3669
	-- upvalues: t20 (copy)
	return (setmetatable({
		pattern = if t21 ~= nil and t21.pattern ~= nil then t21.pattern else ""
	}, t20))
end
function t20.encode(p13) -- line: 3677
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n9 = 0

	if p13.pattern ~= nil and p13.pattern ~= "" then
		local v241, v242 = proto.writeTag(buf, n9, 1, proto.wireTypes.lengthDelimited)

		buf, n9 = proto.writeString(v241, v242, p13.pattern)
	end

	local buf7 = buffer.create(n9)

	buffer.copy(buf7, 0, buf, 0, n9)

	return buf7
end
function t20.decode(p14: buffer) -- line: 3693
	-- upvalues: t20 (copy), proto (copy)
	local v245 = t20.new()
	local n10 = 0

	while n10 < buffer.len(p14) do
		local v247, v248

		v247, v248, n10 = proto.readTag(p14, n10)

		if v248 == proto.wireTypes.varint then
			local v249

			v249, n10 = proto.readVarInt(p14, n10)
		elseif v248 == proto.wireTypes.lengthDelimited then
			if v247 == 1 then
				local v250

				v250, n10 = proto.readBuffer(p14, n10)
				v245.pattern = buffer.tostring(v250)
			else
				local v251, v252 = proto.readVarInt(p14, n10)

				n10 = v252 + v251
			end
		elseif v248 == proto.wireTypes.i32 then
			local v253

			v253, n10 = proto.readFixed32(p14, n10)
		elseif v248 == proto.wireTypes.i64 then
			local v254

			v254, n10 = proto.readFixed64(p14, n10)
		else
			error("Unsupported wire type: " .. v248)
		end
	end

	return v245
end
function t20.jsonEncode(p15) -- line: 3738
	local t22 = {}

	if p15.pattern ~= nil and p15.pattern ~= "" then
		t22.pattern = p15.pattern
	end

	return t22
end
function t20.jsonDecode(t23: {[any]: any}) -- line: 3750
	-- upvalues: t20 (copy)
	local v258 = t20.new()

	if t23.pattern ~= nil then
		v258.pattern = t23.pattern
	end

	return v258
end

t20.descriptor = {
	name = "StringFormat_FormatArg_Formatter_DateConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.DateConfig"
}
t1.StringFormat_FormatArg_Formatter_DateConfig = t20
typeRegistry.default:register(t1.StringFormat_FormatArg_Formatter_DateConfig)
t1.StringFormat_FormatArg_Formatter_Type = {
	fromNumber = function(n11: number) --[[ fromNumber ]] -- line: 3773
		if n11 == 0 then
			return "TYPE_INVALID"
		end

		if n11 == 1 then
			return "TYPE_NUMBER_ABBREVIATE"
		end

		if n11 == 2 then
			return "TYPE_NUMBER_LOCALIZE"
		end

		if n11 == 3 then
			return "TYPE_DATE_FORMAT"
		end

		return nil
	end,
	toNumber = function(p16) --[[ toNumber ]] -- line: 3787
		if p16 == "TYPE_INVALID" then
			return 0
		end

		if p16 == "TYPE_NUMBER_ABBREVIATE" then
			return 1
		end

		if p16 == "TYPE_NUMBER_LOCALIZE" then
			return 2
		end

		if p16 == "TYPE_DATE_FORMAT" then
			return 3
		end

		return p16
	end,
	fromName = function(s1: string) --[[ fromName ]] -- line: 3801
		if s1 == "TYPE_INVALID" then
			return "TYPE_INVALID"
		end

		if s1 == "TYPE_NUMBER_ABBREVIATE" then
			return "TYPE_NUMBER_ABBREVIATE"
		end

		if s1 == "TYPE_NUMBER_LOCALIZE" then
			return "TYPE_NUMBER_LOCALIZE"
		end

		if s1 == "TYPE_DATE_FORMAT" then
			return "TYPE_DATE_FORMAT"
		end

		return nil
	end
}

local t24 = {}

t24.__index = t24

function t24.new(t25: {[any]: any}?) -- line: 3820
	-- upvalues: t24 (copy)
	return (setmetatable({
		key = if t25 ~= nil and t25.key ~= nil then t25.key else "",
		value = if t25 ~= nil and t25.value ~= nil then t25.value else nil
	}, t24))
end
function t24.encode(p17) -- line: 3827
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n12 = 0

	if p17.key ~= nil and p17.key ~= "" then
		local v266, v267 = proto.writeTag(buf, n12, 1, proto.wireTypes.lengthDelimited)

		buf, n12 = proto.writeString(v266, v267, p17.key)
	end

	if p17.value ~= nil then
		local v268 = p17.value:encode()
		local v269, v270 = proto.writeTag(buf, n12, 2, proto.wireTypes.lengthDelimited)

		buf, n12 = proto.writeBuffer(v269, v270, v268, buffer.len(v268))
	end

	local buf8 = buffer.create(n12)

	buffer.copy(buf8, 0, buf, 0, n12)

	return buf8
end
function t24.decode(p18: buffer) -- line: 3847
	-- upvalues: t24 (copy), proto (copy), t1 (copy)
	local v273 = t24.new()
	local n13 = 0

	while n13 < buffer.len(p18) do
		local v275, v276

		v275, v276, n13 = proto.readTag(p18, n13)

		if v276 == proto.wireTypes.varint then
			local v277

			v277, n13 = proto.readVarInt(p18, n13)
		elseif v276 == proto.wireTypes.lengthDelimited then
			if v275 == 1 then
				local v278

				v278, n13 = proto.readBuffer(p18, n13)
				v273.key = buffer.tostring(v278)
			elseif v275 == 2 then
				local v279

				v279, n13 = proto.readBuffer(p18, n13)
				v273.value = t1.StringFormat_FormatArg.decode(v279)
			else
				local v280, v281 = proto.readVarInt(p18, n13)

				n13 = v281 + v280
			end
		elseif v276 == proto.wireTypes.i32 then
			local v282

			v282, n13 = proto.readFixed32(p18, n13)
		elseif v276 == proto.wireTypes.i64 then
			local v283

			v283, n13 = proto.readFixed64(p18, n13)
		else
			error("Unsupported wire type: " .. v276)
		end
	end

	return v273
end
function t24.jsonEncode(p19) -- line: 3895
	local t26 = {}

	if p19.key ~= nil and p19.key ~= "" then
		t26.key = p19.key
	end

	if p19.value ~= nil then
		t26.value = p19.value:jsonEncode()
	end

	return t26
end
function t24.jsonDecode(t27: {[any]: any}) -- line: 3909
	-- upvalues: t24 (copy), t1 (copy)
	local v287 = t24.new()

	if t27.key ~= nil then
		v287.key = t27.key
	end

	if t27.value ~= nil then
		v287.value = t1.StringFormat_FormatArg.jsonDecode(t27.value)
	end

	return v287
end

t24.descriptor = {
	name = "StringFormat_ArgsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
}
t1.StringFormat_ArgsEntry = t24
typeRegistry.default:register(t1.StringFormat_ArgsEntry)

local t28 = {}

t28.__index = t28

function t28.new(t29: {[any]: any}?) -- line: 3937
	-- upvalues: t28 (copy)
	return (setmetatable({
		kind = if t29 ~= nil and t29.kind ~= nil then t29.kind else nil
	}, t28))
end
function t28.encode(p20) -- line: 3943
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n14 = 0

	if p20.kind ~= nil then
		if p20.kind.type == "literal" then
			local v292, v293 = proto.writeTag(buf, n14, 1, proto.wireTypes.lengthDelimited)

			buf, n14 = proto.writeString(v292, v293, p20.kind.value)
		elseif p20.kind.type == "binding_path" then
			local v294, v295 = proto.writeTag(buf, n14, 2, proto.wireTypes.lengthDelimited)

			buf, n14 = proto.writeString(v294, v295, p20.kind.value)
		elseif p20.kind.type == "token" then
			local v296, v297 = proto.writeTag(buf, n14, 3, proto.wireTypes.lengthDelimited)

			buf, n14 = proto.writeString(v296, v297, p20.kind.value)
		elseif p20.kind.type == "format" then
			local v298 = p20.kind.value:encode()
			local v299, v300 = proto.writeTag(buf, n14, 4, proto.wireTypes.lengthDelimited)

			buf, n14 = proto.writeBuffer(v299, v300, v298, buffer.len(v298))
		elseif p20.kind.type == "conditional" then
			local v301 = p20.kind.value:encode()
			local v302, v303 = proto.writeTag(buf, n14, 5, proto.wireTypes.lengthDelimited)

			buf, n14 = proto.writeBuffer(v302, v303, v301, buffer.len(v301))
		elseif p20.kind.type == "translation" then
			local v304 = p20.kind.value:encode()
			local v305, v306 = proto.writeTag(buf, n14, 6, proto.wireTypes.lengthDelimited)

			buf, n14 = proto.writeBuffer(v305, v306, v304, buffer.len(v304))
		end
	end

	local buf9 = buffer.create(n14)

	buffer.copy(buf9, 0, buf, 0, n14)

	return buf9
end
function t28.decode(p21: buffer) -- line: 3977
	-- upvalues: t28 (copy), proto (copy), t1 (copy)
	local v309 = t28.new()
	local n15 = 0

	while n15 < buffer.len(p21) do
		local v311, v312

		v311, v312, n15 = proto.readTag(p21, n15)

		if v312 == proto.wireTypes.varint then
			local v313

			v313, n15 = proto.readVarInt(p21, n15)
		elseif v312 == proto.wireTypes.lengthDelimited then
			if v311 == 1 then
				local v314

				v314, n15 = proto.readBuffer(p21, n15)
				v309.kind = {
					type = "literal",
					value = buffer.tostring(v314)
				}
			elseif v311 == 2 then
				local v315

				v315, n15 = proto.readBuffer(p21, n15)
				v309.kind = {
					type = "binding_path",
					value = buffer.tostring(v315)
				}
			elseif v311 == 3 then
				local v316

				v316, n15 = proto.readBuffer(p21, n15)
				v309.kind = {
					type = "token",
					value = buffer.tostring(v316)
				}
			elseif v311 == 4 then
				local v317

				v317, n15 = proto.readBuffer(p21, n15)
				v309.kind = {
					type = "format",
					value = t1.StringFormat.decode(v317)
				}
			elseif v311 == 5 then
				local v318

				v318, n15 = proto.readBuffer(p21, n15)
				v309.kind = {
					type = "conditional",
					value = t1.StringProp_ConditionalOptions.decode(v318)
				}
			elseif v311 == 6 then
				local v319

				v319, n15 = proto.readBuffer(p21, n15)
				v309.kind = {
					type = "translation",
					value = t1.TranslationRef.decode(v319)
				}
			else
				local v320, v321 = proto.readVarInt(p21, n15)

				n15 = v321 + v320
			end
		elseif v312 == proto.wireTypes.i32 then
			local v322

			v322, n15 = proto.readFixed32(p21, n15)
		elseif v312 == proto.wireTypes.i64 then
			local v323

			v323, n15 = proto.readFixed64(p21, n15)
		else
			error("Unsupported wire type: " .. v312)
		end
	end

	return v309
end
function t28.jsonEncode(p22) -- line: 4045
	local t30 = {}

	if p22.kind ~= nil then
		if p22.kind.type == "literal" then
			t30.literal = p22.kind.value

			return t30
		end

		if p22.kind.type == "binding_path" then
			t30.bindingPath = p22.kind.value

			return t30
		end

		if p22.kind.type == "token" then
			t30.token = p22.kind.value

			return t30
		end

		if p22.kind.type == "format" then
			t30.format = p22.kind.value:jsonEncode()

			return t30
		end

		if p22.kind.type == "conditional" then
			t30.conditional = p22.kind.value:jsonEncode()

			return t30
		end

		if p22.kind.type == "translation" then
			t30.translation = p22.kind.value:jsonEncode()
		end
	end

	return t30
end
function t28.jsonDecode(t31: {[any]: any}) -- line: 4067
	-- upvalues: t28 (copy), t1 (copy)
	local v327 = t28.new()

	if t31.literal ~= nil then
		v327.kind = {
			type = "literal",
			value = t31.literal
		}
	end

	if t31.binding_path ~= nil then
		v327.kind = {
			type = "binding_path",
			value = t31.binding_path
		}
	end

	if t31.bindingPath ~= nil then
		v327.kind = {
			type = "binding_path",
			value = t31.bindingPath
		}
	end

	if t31.token ~= nil then
		v327.kind = {
			type = "token",
			value = t31.token
		}
	end

	if t31.format ~= nil then
		v327.kind = {
			type = "format",
			value = t1.StringFormat.jsonDecode(t31.format)
		}
	end

	if t31.conditional ~= nil then
		v327.kind = {
			type = "conditional",
			value = t1.StringProp_ConditionalOptions.jsonDecode(t31.conditional)
		}
	end

	if t31.translation ~= nil then
		v327.kind = {
			type = "translation",
			value = t1.TranslationRef.jsonDecode(t31.translation)
		}
	end

	return v327
end

t28.descriptor = {
	name = "StringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
}
t1.StringProp = t28
typeRegistry.default:register(t1.StringProp)

local t32 = {}

t32.__index = t32

function t32.new(t33: {[any]: any}?) -- line: 4116
	-- upvalues: t32 (copy)
	return (setmetatable({
		condition = if t33 ~= nil and t33.condition ~= nil then t33.condition else nil,
		kind = if t33 ~= nil and t33.kind ~= nil then t33.kind else nil
	}, t32))
end
function t32.encode(p23) -- line: 4125
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n16 = 0

	if p23.condition ~= nil then
		local v332 = p23.condition:encode()
		local v333, v334 = proto.writeTag(buf, n16, 1, proto.wireTypes.lengthDelimited)

		buf, n16 = proto.writeBuffer(v333, v334, v332, buffer.len(v332))
	end

	if p23.kind ~= nil then
		if p23.kind.type == "literal" then
			local v335, v336 = proto.writeTag(buf, n16, 2, proto.wireTypes.lengthDelimited)

			buf, n16 = proto.writeString(v335, v336, p23.kind.value)
		elseif p23.kind.type == "binding_path" then
			local v337, v338 = proto.writeTag(buf, n16, 3, proto.wireTypes.lengthDelimited)

			buf, n16 = proto.writeString(v337, v338, p23.kind.value)
		elseif p23.kind.type == "token" then
			local v339, v340 = proto.writeTag(buf, n16, 4, proto.wireTypes.lengthDelimited)

			buf, n16 = proto.writeString(v339, v340, p23.kind.value)
		elseif p23.kind.type == "format" then
			local v341 = p23.kind.value:encode()
			local v342, v343 = proto.writeTag(buf, n16, 5, proto.wireTypes.lengthDelimited)

			buf, n16 = proto.writeBuffer(v342, v343, v341, buffer.len(v341))
		elseif p23.kind.type == "translation" then
			local v344 = p23.kind.value:encode()
			local v345, v346 = proto.writeTag(buf, n16, 6, proto.wireTypes.lengthDelimited)

			buf, n16 = proto.writeBuffer(v345, v346, v344, buffer.len(v344))
		end
	end

	local buf10 = buffer.create(n16)

	buffer.copy(buf10, 0, buf, 0, n16)

	return buf10
end
function t32.decode(p24: buffer) -- line: 4161
	-- upvalues: t32 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v349 = t32.new()
	local n17 = 0

	while n17 < buffer.len(p24) do
		local v351, v352

		v351, v352, n17 = proto.readTag(p24, n17)

		if v352 == proto.wireTypes.varint then
			local v353

			v353, n17 = proto.readVarInt(p24, n17)
		elseif v352 == proto.wireTypes.lengthDelimited then
			if v351 == 1 then
				local v354

				v354, n17 = proto.readBuffer(p24, n17)
				v349.condition = prop_condition.PropCondition.decode(v354)
			elseif v351 == 2 then
				local v355

				v355, n17 = proto.readBuffer(p24, n17)
				v349.kind = {
					type = "literal",
					value = buffer.tostring(v355)
				}
			elseif v351 == 3 then
				local v356

				v356, n17 = proto.readBuffer(p24, n17)
				v349.kind = {
					type = "binding_path",
					value = buffer.tostring(v356)
				}
			elseif v351 == 4 then
				local v357

				v357, n17 = proto.readBuffer(p24, n17)
				v349.kind = {
					type = "token",
					value = buffer.tostring(v357)
				}
			elseif v351 == 5 then
				local v358

				v358, n17 = proto.readBuffer(p24, n17)
				v349.kind = {
					type = "format",
					value = t1.StringFormat.decode(v358)
				}
			elseif v351 == 6 then
				local v359

				v359, n17 = proto.readBuffer(p24, n17)
				v349.kind = {
					type = "translation",
					value = t1.TranslationRef.decode(v359)
				}
			else
				local v360, v361 = proto.readVarInt(p24, n17)

				n17 = v361 + v360
			end
		elseif v352 == proto.wireTypes.i32 then
			local v362

			v362, n17 = proto.readFixed32(p24, n17)
		elseif v352 == proto.wireTypes.i64 then
			local v363

			v363, n17 = proto.readFixed64(p24, n17)
		else
			error("Unsupported wire type: " .. v352)
		end
	end

	return v349
end
function t32.jsonEncode(p25) -- line: 4229
	local t34 = {}

	if p25.condition ~= nil then
		t34.condition = p25.condition:jsonEncode()
	end

	if p25.kind ~= nil then
		if p25.kind.type == "literal" then
			t34.literal = p25.kind.value

			return t34
		end

		if p25.kind.type == "binding_path" then
			t34.bindingPath = p25.kind.value

			return t34
		end

		if p25.kind.type == "token" then
			t34.token = p25.kind.value

			return t34
		end

		if p25.kind.type == "format" then
			t34.format = p25.kind.value:jsonEncode()

			return t34
		end

		if p25.kind.type == "translation" then
			t34.translation = p25.kind.value:jsonEncode()
		end
	end

	return t34
end
function t32.jsonDecode(t35: {[any]: any}) -- line: 4253
	-- upvalues: t32 (copy), prop_condition (copy), t1 (copy)
	local v367 = t32.new()

	if t35.condition ~= nil then
		v367.condition = prop_condition.PropCondition.jsonDecode(t35.condition)
	end

	if t35.literal ~= nil then
		v367.kind = {
			type = "literal",
			value = t35.literal
		}
	end

	if t35.binding_path ~= nil then
		v367.kind = {
			type = "binding_path",
			value = t35.binding_path
		}
	end

	if t35.bindingPath ~= nil then
		v367.kind = {
			type = "binding_path",
			value = t35.bindingPath
		}
	end

	if t35.token ~= nil then
		v367.kind = {
			type = "token",
			value = t35.token
		}
	end

	if t35.format ~= nil then
		v367.kind = {
			type = "format",
			value = t1.StringFormat.jsonDecode(t35.format)
		}
	end

	if t35.translation ~= nil then
		v367.kind = {
			type = "translation",
			value = t1.TranslationRef.jsonDecode(t35.translation)
		}
	end

	return v367
end

t32.descriptor = {
	name = "StringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.StringProp_ConditionalOption = t32
typeRegistry.default:register(t1.StringProp_ConditionalOption)

local t36 = {}

t36.__index = t36

function t36.new(t37: {[any]: any}?) -- line: 4302
	-- upvalues: t36 (copy)
	return (setmetatable({
		options = if t37 ~= nil and t37.options ~= nil then t37.options else {}
	}, t36))
end
function t36.encode(p26) -- line: 4310
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n18 = 0

	if p26.options ~= nil and #p26.options > 0 then
		for _, v373 in p26.options do
			local v374 = v373:encode()
			local v375, v376 = proto.writeTag(buf, n18, 1, proto.wireTypes.lengthDelimited)

			buf, n18 = proto.writeBuffer(v375, v376, v374, buffer.len(v374))
		end
	end

	local buf11 = buffer.create(n18)

	buffer.copy(buf11, 0, buf, 0, n18)

	return buf11
end
function t36.decode(p27: buffer) -- line: 4327
	-- upvalues: t36 (copy), proto (copy), t1 (copy)
	local v379 = t36.new()
	local n19 = 0

	while n19 < buffer.len(p27) do
		local v381, v382

		v381, v382, n19 = proto.readTag(p27, n19)

		if v382 == proto.wireTypes.varint then
			local v383

			v383, n19 = proto.readVarInt(p27, n19)
		elseif v382 == proto.wireTypes.lengthDelimited then
			if v381 == 1 then
				local v384

				v384, n19 = proto.readBuffer(p27, n19)
				table.insert(v379.options, t1.StringProp_ConditionalOption.decode(v384))
			else
				local v385, v386 = proto.readVarInt(p27, n19)

				n19 = v386 + v385
			end
		elseif v382 == proto.wireTypes.i32 then
			local v387

			v387, n19 = proto.readFixed32(p27, n19)
		elseif v382 == proto.wireTypes.i64 then
			local v388

			v388, n19 = proto.readFixed64(p27, n19)
		else
			error("Unsupported wire type: " .. v382)
		end
	end

	return v379
end
function t36.jsonEncode(p28) -- line: 4370
	local t38 = {}

	if p28.options ~= nil and #p28.options > 0 then
		local t39 = {}

		for _, v393 in p28.options do
			table.insert(t39, v393:jsonEncode())
		end

		t38.options = t39
	end

	return t38
end
function t36.jsonDecode(t40: {[any]: any}) -- line: 4384
	-- upvalues: t36 (copy), t1 (copy)
	local v395 = t36.new()

	if t40.options ~= nil then
		local t41 = {}

		for _, v398 in t40.options do
			table.insert(t41, t1.StringProp_ConditionalOption.jsonDecode(v398))
		end

		v395.options = t41
	end

	return v395
end

t36.descriptor = {
	name = "StringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.StringProp_ConditionalOptions = t36
typeRegistry.default:register(t1.StringProp_ConditionalOptions)

local t42 = {}

t42.__index = t42

function t42.new(t43: {[any]: any}?) -- line: 4413
	-- upvalues: t42 (copy)
	return (setmetatable({
		kind = if t43 ~= nil and t43.kind ~= nil then t43.kind else nil
	}, t42))
end
function t42.encode(p29) -- line: 4419
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n20 = 0

	if p29.kind ~= nil then
		if p29.kind.type == "literal" then
			local v403, v404 = proto.writeTag(buf, n20, 1, proto.wireTypes.i32)

			buf, n20 = proto.writeFloat(v403, v404, p29.kind.value)
		elseif p29.kind.type == "binding_path" then
			local v405, v406 = proto.writeTag(buf, n20, 2, proto.wireTypes.lengthDelimited)

			buf, n20 = proto.writeString(v405, v406, p29.kind.value)
		elseif p29.kind.type == "token" then
			local v407, v408 = proto.writeTag(buf, n20, 3, proto.wireTypes.lengthDelimited)

			buf, n20 = proto.writeString(v407, v408, p29.kind.value)
		elseif p29.kind.type == "conditional" then
			local v409 = p29.kind.value:encode()
			local v410, v411 = proto.writeTag(buf, n20, 4, proto.wireTypes.lengthDelimited)

			buf, n20 = proto.writeBuffer(v410, v411, v409, buffer.len(v409))
		end
	end

	local buf12 = buffer.create(n20)

	buffer.copy(buf12, 0, buf, 0, n20)

	return buf12
end
function t42.decode(p30: buffer) -- line: 4445
	-- upvalues: t42 (copy), proto (copy), t1 (copy)
	local v414 = t42.new()
	local n21 = 0

	while n21 < buffer.len(p30) do
		local v416, v417

		v416, v417, n21 = proto.readTag(p30, n21)

		if v417 == proto.wireTypes.varint then
			local v418

			v418, n21 = proto.readVarInt(p30, n21)
		elseif v417 == proto.wireTypes.lengthDelimited then
			if v416 == 2 then
				local v419

				v419, n21 = proto.readBuffer(p30, n21)
				v414.kind = {
					type = "binding_path",
					value = buffer.tostring(v419)
				}
			elseif v416 == 3 then
				local v420

				v420, n21 = proto.readBuffer(p30, n21)
				v414.kind = {
					type = "token",
					value = buffer.tostring(v420)
				}
			elseif v416 == 4 then
				local v421

				v421, n21 = proto.readBuffer(p30, n21)
				v414.kind = {
					type = "conditional",
					value = t1.FloatProp_ConditionalOptions.decode(v421)
				}
			else
				local v422, v423 = proto.readVarInt(p30, n21)

				n21 = v423 + v422
			end
		elseif v417 == proto.wireTypes.i32 then
			if v416 == 1 then
				local v424

				v424, n21 = proto.readFloat(p30, n21)
				v414.kind = {
					type = "literal",
					value = v424
				}
			else
				local v425

				v425, n21 = proto.readFixed32(p30, n21)
			end
		elseif v417 == proto.wireTypes.i64 then
			local v426

			v426, n21 = proto.readFixed64(p30, n21)
		else
			error("Unsupported wire type: " .. v417)
		end
	end

	return v414
end
function t42.jsonEncode(p31) -- line: 4503
	-- upvalues: proto (copy)
	local t44 = {}

	if p31.kind ~= nil then
		if p31.kind.type == "literal" then
			t44.literal = proto.json.serializeNumber(p31.kind.value)

			return t44
		end

		if p31.kind.type == "binding_path" then
			t44.bindingPath = p31.kind.value

			return t44
		end

		if p31.kind.type == "token" then
			t44.token = p31.kind.value

			return t44
		end

		if p31.kind.type == "conditional" then
			t44.conditional = p31.kind.value:jsonEncode()
		end
	end

	return t44
end
function t42.jsonDecode(t45: {[any]: any}) -- line: 4521
	-- upvalues: t42 (copy), proto (copy), t1 (copy)
	local v430 = t42.new()

	if t45.literal ~= nil then
		v430.kind = {
			type = "literal",
			value = proto.json.deserializeNumber(t45.literal)
		}
	end

	if t45.binding_path ~= nil then
		v430.kind = {
			type = "binding_path",
			value = t45.binding_path
		}
	end

	if t45.bindingPath ~= nil then
		v430.kind = {
			type = "binding_path",
			value = t45.bindingPath
		}
	end

	if t45.token ~= nil then
		v430.kind = {
			type = "token",
			value = t45.token
		}
	end

	if t45.conditional ~= nil then
		v430.kind = {
			type = "conditional",
			value = t1.FloatProp_ConditionalOptions.jsonDecode(t45.conditional)
		}
	end

	return v430
end

t42.descriptor = {
	name = "FloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
}
t1.FloatProp = t42
typeRegistry.default:register(t1.FloatProp)

local t46 = {}

t46.__index = t46

function t46.new(t47: {[any]: any}?) -- line: 4562
	-- upvalues: t46 (copy)
	return (setmetatable({
		condition = if t47 ~= nil and t47.condition ~= nil then t47.condition else nil,
		kind = if t47 ~= nil and t47.kind ~= nil then t47.kind else nil
	}, t46))
end
function t46.encode(p32) -- line: 4571
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n22 = 0

	if p32.condition ~= nil then
		local v435 = p32.condition:encode()
		local v436, v437 = proto.writeTag(buf, n22, 1, proto.wireTypes.lengthDelimited)

		buf, n22 = proto.writeBuffer(v436, v437, v435, buffer.len(v435))
	end

	if p32.kind ~= nil then
		if p32.kind.type == "literal" then
			local v438, v439 = proto.writeTag(buf, n22, 2, proto.wireTypes.i32)

			buf, n22 = proto.writeFloat(v438, v439, p32.kind.value)
		elseif p32.kind.type == "binding_path" then
			local v440, v441 = proto.writeTag(buf, n22, 3, proto.wireTypes.lengthDelimited)

			buf, n22 = proto.writeString(v440, v441, p32.kind.value)
		elseif p32.kind.type == "token" then
			local v442, v443 = proto.writeTag(buf, n22, 4, proto.wireTypes.lengthDelimited)

			buf, n22 = proto.writeString(v442, v443, p32.kind.value)
		end
	end

	local buf13 = buffer.create(n22)

	buffer.copy(buf13, 0, buf, 0, n22)

	return buf13
end
function t46.decode(p33: buffer) -- line: 4599
	-- upvalues: t46 (copy), proto (copy), prop_condition (copy)
	local v446 = t46.new()
	local n23 = 0

	while n23 < buffer.len(p33) do
		local v448, v449

		v448, v449, n23 = proto.readTag(p33, n23)

		if v449 == proto.wireTypes.varint then
			local v450

			v450, n23 = proto.readVarInt(p33, n23)
		elseif v449 == proto.wireTypes.lengthDelimited then
			if v448 == 1 then
				local v451

				v451, n23 = proto.readBuffer(p33, n23)
				v446.condition = prop_condition.PropCondition.decode(v451)
			elseif v448 == 3 then
				local v452

				v452, n23 = proto.readBuffer(p33, n23)
				v446.kind = {
					type = "binding_path",
					value = buffer.tostring(v452)
				}
			elseif v448 == 4 then
				local v453

				v453, n23 = proto.readBuffer(p33, n23)
				v446.kind = {
					type = "token",
					value = buffer.tostring(v453)
				}
			else
				local v454, v455 = proto.readVarInt(p33, n23)

				n23 = v455 + v454
			end
		elseif v449 == proto.wireTypes.i32 then
			if v448 == 2 then
				local v456

				v456, n23 = proto.readFloat(p33, n23)
				v446.kind = {
					type = "literal",
					value = v456
				}
			else
				local v457

				v457, n23 = proto.readFixed32(p33, n23)
			end
		elseif v449 == proto.wireTypes.i64 then
			local v458

			v458, n23 = proto.readFixed64(p33, n23)
		else
			error("Unsupported wire type: " .. v449)
		end
	end

	return v446
end
function t46.jsonEncode(p34) -- line: 4657
	-- upvalues: proto (copy)
	local t48 = {}

	if p34.condition ~= nil then
		t48.condition = p34.condition:jsonEncode()
	end

	if p34.kind ~= nil then
		if p34.kind.type == "literal" then
			t48.literal = proto.json.serializeNumber(p34.kind.value)

			return t48
		end

		if p34.kind.type == "binding_path" then
			t48.bindingPath = p34.kind.value

			return t48
		end

		if p34.kind.type == "token" then
			t48.token = p34.kind.value
		end
	end

	return t48
end
function t46.jsonDecode(t49: {[any]: any}) -- line: 4677
	-- upvalues: t46 (copy), prop_condition (copy), proto (copy)
	local v462 = t46.new()

	if t49.condition ~= nil then
		v462.condition = prop_condition.PropCondition.jsonDecode(t49.condition)
	end

	if t49.literal ~= nil then
		v462.kind = {
			type = "literal",
			value = proto.json.deserializeNumber(t49.literal)
		}
	end

	if t49.binding_path ~= nil then
		v462.kind = {
			type = "binding_path",
			value = t49.binding_path
		}
	end

	if t49.bindingPath ~= nil then
		v462.kind = {
			type = "binding_path",
			value = t49.bindingPath
		}
	end

	if t49.token ~= nil then
		v462.kind = {
			type = "token",
			value = t49.token
		}
	end

	return v462
end

t46.descriptor = {
	name = "FloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.FloatProp_ConditionalOption = t46
typeRegistry.default:register(t1.FloatProp_ConditionalOption)

local t50 = {}

t50.__index = t50

function t50.new(t51: {[any]: any}?) -- line: 4718
	-- upvalues: t50 (copy)
	return (setmetatable({
		options = if t51 ~= nil and t51.options ~= nil then t51.options else {}
	}, t50))
end
function t50.encode(p35) -- line: 4726
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n24 = 0

	if p35.options ~= nil and #p35.options > 0 then
		for _, v468 in p35.options do
			local v469 = v468:encode()
			local v470, v471 = proto.writeTag(buf, n24, 1, proto.wireTypes.lengthDelimited)

			buf, n24 = proto.writeBuffer(v470, v471, v469, buffer.len(v469))
		end
	end

	local buf14 = buffer.create(n24)

	buffer.copy(buf14, 0, buf, 0, n24)

	return buf14
end
function t50.decode(p36: buffer) -- line: 4743
	-- upvalues: t50 (copy), proto (copy), t1 (copy)
	local v474 = t50.new()
	local n25 = 0

	while n25 < buffer.len(p36) do
		local v476, v477

		v476, v477, n25 = proto.readTag(p36, n25)

		if v477 == proto.wireTypes.varint then
			local v478

			v478, n25 = proto.readVarInt(p36, n25)
		elseif v477 == proto.wireTypes.lengthDelimited then
			if v476 == 1 then
				local v479

				v479, n25 = proto.readBuffer(p36, n25)
				table.insert(v474.options, t1.FloatProp_ConditionalOption.decode(v479))
			else
				local v480, v481 = proto.readVarInt(p36, n25)

				n25 = v481 + v480
			end
		elseif v477 == proto.wireTypes.i32 then
			local v482

			v482, n25 = proto.readFixed32(p36, n25)
		elseif v477 == proto.wireTypes.i64 then
			local v483

			v483, n25 = proto.readFixed64(p36, n25)
		else
			error("Unsupported wire type: " .. v477)
		end
	end

	return v474
end
function t50.jsonEncode(p37) -- line: 4786
	local t52 = {}

	if p37.options ~= nil and #p37.options > 0 then
		local t53 = {}

		for _, v488 in p37.options do
			table.insert(t53, v488:jsonEncode())
		end

		t52.options = t53
	end

	return t52
end
function t50.jsonDecode(t54: {[any]: any}) -- line: 4800
	-- upvalues: t50 (copy), t1 (copy)
	local v490 = t50.new()

	if t54.options ~= nil then
		local t55 = {}

		for _, v493 in t54.options do
			table.insert(t55, t1.FloatProp_ConditionalOption.jsonDecode(v493))
		end

		v490.options = t55
	end

	return v490
end

t50.descriptor = {
	name = "FloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.FloatProp_ConditionalOptions = t50
typeRegistry.default:register(t1.FloatProp_ConditionalOptions)

local t56 = {}

t56.__index = t56

function t56.new(t57: {[any]: any}?) -- line: 4829
	-- upvalues: t56 (copy)
	return (setmetatable({
		kind = if t57 ~= nil and t57.kind ~= nil then t57.kind else nil
	}, t56))
end
function t56.encode(p38) -- line: 4835
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n26 = 0

	if p38.kind ~= nil then
		if p38.kind.type == "literal" then
			local v498, v499 = proto.writeTag(buf, n26, 1, proto.wireTypes.i64)

			buf, n26 = proto.writeDouble(v498, v499, p38.kind.value)
		elseif p38.kind.type == "binding_path" then
			local v500, v501 = proto.writeTag(buf, n26, 2, proto.wireTypes.lengthDelimited)

			buf, n26 = proto.writeString(v500, v501, p38.kind.value)
		elseif p38.kind.type == "token" then
			local v502, v503 = proto.writeTag(buf, n26, 3, proto.wireTypes.lengthDelimited)

			buf, n26 = proto.writeString(v502, v503, p38.kind.value)
		elseif p38.kind.type == "conditional" then
			local v504 = p38.kind.value:encode()
			local v505, v506 = proto.writeTag(buf, n26, 4, proto.wireTypes.lengthDelimited)

			buf, n26 = proto.writeBuffer(v505, v506, v504, buffer.len(v504))
		end
	end

	local buf15 = buffer.create(n26)

	buffer.copy(buf15, 0, buf, 0, n26)

	return buf15
end
function t56.decode(p39: buffer) -- line: 4861
	-- upvalues: t56 (copy), proto (copy), t1 (copy)
	local v509 = t56.new()
	local n27 = 0

	while n27 < buffer.len(p39) do
		local v511, v512

		v511, v512, n27 = proto.readTag(p39, n27)

		if v512 == proto.wireTypes.varint then
			local v513

			v513, n27 = proto.readVarInt(p39, n27)
		elseif v512 == proto.wireTypes.lengthDelimited then
			if v511 == 2 then
				local v514

				v514, n27 = proto.readBuffer(p39, n27)
				v509.kind = {
					type = "binding_path",
					value = buffer.tostring(v514)
				}
			elseif v511 == 3 then
				local v515

				v515, n27 = proto.readBuffer(p39, n27)
				v509.kind = {
					type = "token",
					value = buffer.tostring(v515)
				}
			elseif v511 == 4 then
				local v516

				v516, n27 = proto.readBuffer(p39, n27)
				v509.kind = {
					type = "conditional",
					value = t1.DoubleProp_ConditionalOptions.decode(v516)
				}
			else
				local v517, v518 = proto.readVarInt(p39, n27)

				n27 = v518 + v517
			end
		elseif v512 == proto.wireTypes.i32 then
			local v519

			v519, n27 = proto.readFixed32(p39, n27)
		elseif v512 == proto.wireTypes.i64 then
			if v511 == 1 then
				local v520

				v520, n27 = proto.readDouble(p39, n27)
				v509.kind = {
					type = "literal",
					value = v520
				}
			else
				local v521

				v521, n27 = proto.readFixed64(p39, n27)
			end
		else
			error("Unsupported wire type: " .. v512)
		end
	end

	return v509
end
function t56.jsonEncode(p40) -- line: 4919
	-- upvalues: proto (copy)
	local t58 = {}

	if p40.kind ~= nil then
		if p40.kind.type == "literal" then
			t58.literal = proto.json.serializeNumber(p40.kind.value)

			return t58
		end

		if p40.kind.type == "binding_path" then
			t58.bindingPath = p40.kind.value

			return t58
		end

		if p40.kind.type == "token" then
			t58.token = p40.kind.value

			return t58
		end

		if p40.kind.type == "conditional" then
			t58.conditional = p40.kind.value:jsonEncode()
		end
	end

	return t58
end
function t56.jsonDecode(t59: {[any]: any}) -- line: 4937
	-- upvalues: t56 (copy), proto (copy), t1 (copy)
	local v525 = t56.new()

	if t59.literal ~= nil then
		v525.kind = {
			type = "literal",
			value = proto.json.deserializeNumber(t59.literal)
		}
	end

	if t59.binding_path ~= nil then
		v525.kind = {
			type = "binding_path",
			value = t59.binding_path
		}
	end

	if t59.bindingPath ~= nil then
		v525.kind = {
			type = "binding_path",
			value = t59.bindingPath
		}
	end

	if t59.token ~= nil then
		v525.kind = {
			type = "token",
			value = t59.token
		}
	end

	if t59.conditional ~= nil then
		v525.kind = {
			type = "conditional",
			value = t1.DoubleProp_ConditionalOptions.jsonDecode(t59.conditional)
		}
	end

	return v525
end

t56.descriptor = {
	name = "DoubleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
}
t1.DoubleProp = t56
typeRegistry.default:register(t1.DoubleProp)

local t60 = {}

t60.__index = t60

function t60.new(t61: {[any]: any}?) -- line: 4978
	-- upvalues: t60 (copy)
	return (setmetatable({
		condition = if t61 ~= nil and t61.condition ~= nil then t61.condition else nil,
		kind = if t61 ~= nil and t61.kind ~= nil then t61.kind else nil
	}, t60))
end
function t60.encode(p41) -- line: 4987
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n28 = 0

	if p41.condition ~= nil then
		local v530 = p41.condition:encode()
		local v531, v532 = proto.writeTag(buf, n28, 1, proto.wireTypes.lengthDelimited)

		buf, n28 = proto.writeBuffer(v531, v532, v530, buffer.len(v530))
	end

	if p41.kind ~= nil then
		if p41.kind.type == "literal" then
			local v533, v534 = proto.writeTag(buf, n28, 2, proto.wireTypes.i64)

			buf, n28 = proto.writeDouble(v533, v534, p41.kind.value)
		elseif p41.kind.type == "binding_path" then
			local v535, v536 = proto.writeTag(buf, n28, 3, proto.wireTypes.lengthDelimited)

			buf, n28 = proto.writeString(v535, v536, p41.kind.value)
		elseif p41.kind.type == "token" then
			local v537, v538 = proto.writeTag(buf, n28, 4, proto.wireTypes.lengthDelimited)

			buf, n28 = proto.writeString(v537, v538, p41.kind.value)
		end
	end

	local buf16 = buffer.create(n28)

	buffer.copy(buf16, 0, buf, 0, n28)

	return buf16
end
function t60.decode(p42: buffer) -- line: 5015
	-- upvalues: t60 (copy), proto (copy), prop_condition (copy)
	local v541 = t60.new()
	local n29 = 0

	while n29 < buffer.len(p42) do
		local v543, v544

		v543, v544, n29 = proto.readTag(p42, n29)

		if v544 == proto.wireTypes.varint then
			local v545

			v545, n29 = proto.readVarInt(p42, n29)
		elseif v544 == proto.wireTypes.lengthDelimited then
			if v543 == 1 then
				local v546

				v546, n29 = proto.readBuffer(p42, n29)
				v541.condition = prop_condition.PropCondition.decode(v546)
			elseif v543 == 3 then
				local v547

				v547, n29 = proto.readBuffer(p42, n29)
				v541.kind = {
					type = "binding_path",
					value = buffer.tostring(v547)
				}
			elseif v543 == 4 then
				local v548

				v548, n29 = proto.readBuffer(p42, n29)
				v541.kind = {
					type = "token",
					value = buffer.tostring(v548)
				}
			else
				local v549, v550 = proto.readVarInt(p42, n29)

				n29 = v550 + v549
			end
		elseif v544 == proto.wireTypes.i32 then
			local v551

			v551, n29 = proto.readFixed32(p42, n29)
		elseif v544 == proto.wireTypes.i64 then
			if v543 == 2 then
				local v552

				v552, n29 = proto.readDouble(p42, n29)
				v541.kind = {
					type = "literal",
					value = v552
				}
			else
				local v553

				v553, n29 = proto.readFixed64(p42, n29)
			end
		else
			error("Unsupported wire type: " .. v544)
		end
	end

	return v541
end
function t60.jsonEncode(p43) -- line: 5073
	-- upvalues: proto (copy)
	local t62 = {}

	if p43.condition ~= nil then
		t62.condition = p43.condition:jsonEncode()
	end

	if p43.kind ~= nil then
		if p43.kind.type == "literal" then
			t62.literal = proto.json.serializeNumber(p43.kind.value)

			return t62
		end

		if p43.kind.type == "binding_path" then
			t62.bindingPath = p43.kind.value

			return t62
		end

		if p43.kind.type == "token" then
			t62.token = p43.kind.value
		end
	end

	return t62
end
function t60.jsonDecode(t63: {[any]: any}) -- line: 5093
	-- upvalues: t60 (copy), prop_condition (copy), proto (copy)
	local v557 = t60.new()

	if t63.condition ~= nil then
		v557.condition = prop_condition.PropCondition.jsonDecode(t63.condition)
	end

	if t63.literal ~= nil then
		v557.kind = {
			type = "literal",
			value = proto.json.deserializeNumber(t63.literal)
		}
	end

	if t63.binding_path ~= nil then
		v557.kind = {
			type = "binding_path",
			value = t63.binding_path
		}
	end

	if t63.bindingPath ~= nil then
		v557.kind = {
			type = "binding_path",
			value = t63.bindingPath
		}
	end

	if t63.token ~= nil then
		v557.kind = {
			type = "token",
			value = t63.token
		}
	end

	return v557
end

t60.descriptor = {
	name = "DoubleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.DoubleProp_ConditionalOption = t60
typeRegistry.default:register(t1.DoubleProp_ConditionalOption)

local t64 = {}

t64.__index = t64

function t64.new(t65: {[any]: any}?) -- line: 5134
	-- upvalues: t64 (copy)
	return (setmetatable({
		options = if t65 ~= nil and t65.options ~= nil then t65.options else {}
	}, t64))
end
function t64.encode(p44) -- line: 5142
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n30 = 0

	if p44.options ~= nil and #p44.options > 0 then
		for _, v563 in p44.options do
			local v564 = v563:encode()
			local v565, v566 = proto.writeTag(buf, n30, 1, proto.wireTypes.lengthDelimited)

			buf, n30 = proto.writeBuffer(v565, v566, v564, buffer.len(v564))
		end
	end

	local buf17 = buffer.create(n30)

	buffer.copy(buf17, 0, buf, 0, n30)

	return buf17
end
function t64.decode(p45: buffer) -- line: 5159
	-- upvalues: t64 (copy), proto (copy), t1 (copy)
	local v569 = t64.new()
	local n31 = 0

	while n31 < buffer.len(p45) do
		local v571, v572

		v571, v572, n31 = proto.readTag(p45, n31)

		if v572 == proto.wireTypes.varint then
			local v573

			v573, n31 = proto.readVarInt(p45, n31)
		elseif v572 == proto.wireTypes.lengthDelimited then
			if v571 == 1 then
				local v574

				v574, n31 = proto.readBuffer(p45, n31)
				table.insert(v569.options, t1.DoubleProp_ConditionalOption.decode(v574))
			else
				local v575, v576 = proto.readVarInt(p45, n31)

				n31 = v576 + v575
			end
		elseif v572 == proto.wireTypes.i32 then
			local v577

			v577, n31 = proto.readFixed32(p45, n31)
		elseif v572 == proto.wireTypes.i64 then
			local v578

			v578, n31 = proto.readFixed64(p45, n31)
		else
			error("Unsupported wire type: " .. v572)
		end
	end

	return v569
end
function t64.jsonEncode(p46) -- line: 5202
	local t66 = {}

	if p46.options ~= nil and #p46.options > 0 then
		local t67 = {}

		for _, v583 in p46.options do
			table.insert(t67, v583:jsonEncode())
		end

		t66.options = t67
	end

	return t66
end
function t64.jsonDecode(t68: {[any]: any}) -- line: 5216
	-- upvalues: t64 (copy), t1 (copy)
	local v585 = t64.new()

	if t68.options ~= nil then
		local t69 = {}

		for _, v588 in t68.options do
			table.insert(t69, t1.DoubleProp_ConditionalOption.jsonDecode(v588))
		end

		v585.options = t69
	end

	return v585
end

t64.descriptor = {
	name = "DoubleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.DoubleProp_ConditionalOptions = t64
typeRegistry.default:register(t1.DoubleProp_ConditionalOptions)

local t70 = {}

t70.__index = t70

function t70.new(t71: {[any]: any}?) -- line: 5245
	-- upvalues: t70 (copy)
	return (setmetatable({
		kind = if t71 ~= nil and t71.kind ~= nil then t71.kind else nil
	}, t70))
end
function t70.encode(p47) -- line: 5251
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n32 = 0

	if p47.kind ~= nil then
		if p47.kind.type == "literal" then
			local v593, v594 = proto.writeTag(buf, n32, 1, proto.wireTypes.varint)

			buf, n32 = proto.writeVarInt(v593, v594, p47.kind.value)
		elseif p47.kind.type == "binding_path" then
			local v595, v596 = proto.writeTag(buf, n32, 2, proto.wireTypes.lengthDelimited)

			buf, n32 = proto.writeString(v595, v596, p47.kind.value)
		elseif p47.kind.type == "token" then
			local v597, v598 = proto.writeTag(buf, n32, 3, proto.wireTypes.lengthDelimited)

			buf, n32 = proto.writeString(v597, v598, p47.kind.value)
		elseif p47.kind.type == "conditional" then
			local v599 = p47.kind.value:encode()
			local v600, v601 = proto.writeTag(buf, n32, 4, proto.wireTypes.lengthDelimited)

			buf, n32 = proto.writeBuffer(v600, v601, v599, buffer.len(v599))
		end
	end

	local buf18 = buffer.create(n32)

	buffer.copy(buf18, 0, buf, 0, n32)

	return buf18
end
function t70.decode(p48: buffer) -- line: 5277
	-- upvalues: t70 (copy), proto (copy), t1 (copy)
	local v604 = t70.new()
	local n33 = 0

	while n33 < buffer.len(p48) do
		local v606, v607

		v606, v607, n33 = proto.readTag(p48, n33)

		if v607 == proto.wireTypes.varint then
			if v606 == 1 then
				local v608

				v608, n33 = proto.readVarIntI32(p48, n33)
				v604.kind = {
					type = "literal",
					value = v608
				}
			else
				local v609

				v609, n33 = proto.readVarInt(p48, n33)
			end
		elseif v607 == proto.wireTypes.lengthDelimited then
			if v606 == 2 then
				local v610

				v610, n33 = proto.readBuffer(p48, n33)
				v604.kind = {
					type = "binding_path",
					value = buffer.tostring(v610)
				}
			elseif v606 == 3 then
				local v611

				v611, n33 = proto.readBuffer(p48, n33)
				v604.kind = {
					type = "token",
					value = buffer.tostring(v611)
				}
			elseif v606 == 4 then
				local v612

				v612, n33 = proto.readBuffer(p48, n33)
				v604.kind = {
					type = "conditional",
					value = t1.Int32Prop_ConditionalOptions.decode(v612)
				}
			else
				local v613, v614 = proto.readVarInt(p48, n33)

				n33 = v614 + v613
			end
		elseif v607 == proto.wireTypes.i32 then
			local v615

			v615, n33 = proto.readFixed32(p48, n33)
		elseif v607 == proto.wireTypes.i64 then
			local v616

			v616, n33 = proto.readFixed64(p48, n33)
		else
			error("Unsupported wire type: " .. v607)
		end
	end

	return v604
end
function t70.jsonEncode(p49) -- line: 5335
	local t72 = {}

	if p49.kind ~= nil then
		if p49.kind.type == "literal" then
			t72.literal = p49.kind.value

			return t72
		end

		if p49.kind.type == "binding_path" then
			t72.bindingPath = p49.kind.value

			return t72
		end

		if p49.kind.type == "token" then
			t72.token = p49.kind.value

			return t72
		end

		if p49.kind.type == "conditional" then
			t72.conditional = p49.kind.value:jsonEncode()
		end
	end

	return t72
end
function t70.jsonDecode(t73: {[any]: any}) -- line: 5353
	-- upvalues: t70 (copy), t1 (copy)
	local v620 = t70.new()

	if t73.literal ~= nil then
		v620.kind = {
			type = "literal",
			value = t73.literal
		}
	end

	if t73.binding_path ~= nil then
		v620.kind = {
			type = "binding_path",
			value = t73.binding_path
		}
	end

	if t73.bindingPath ~= nil then
		v620.kind = {
			type = "binding_path",
			value = t73.bindingPath
		}
	end

	if t73.token ~= nil then
		v620.kind = {
			type = "token",
			value = t73.token
		}
	end

	if t73.conditional ~= nil then
		v620.kind = {
			type = "conditional",
			value = t1.Int32Prop_ConditionalOptions.jsonDecode(t73.conditional)
		}
	end

	return v620
end

t70.descriptor = {
	name = "Int32Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
}
t1.Int32Prop = t70
typeRegistry.default:register(t1.Int32Prop)

local t74 = {}

t74.__index = t74

function t74.new(t75: {[any]: any}?) -- line: 5394
	-- upvalues: t74 (copy)
	return (setmetatable({
		condition = if t75 ~= nil and t75.condition ~= nil then t75.condition else nil,
		kind = if t75 ~= nil and t75.kind ~= nil then t75.kind else nil
	}, t74))
end
function t74.encode(p50) -- line: 5403
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n34 = 0

	if p50.condition ~= nil then
		local v625 = p50.condition:encode()
		local v626, v627 = proto.writeTag(buf, n34, 1, proto.wireTypes.lengthDelimited)

		buf, n34 = proto.writeBuffer(v626, v627, v625, buffer.len(v625))
	end

	if p50.kind ~= nil then
		if p50.kind.type == "literal" then
			local v628, v629 = proto.writeTag(buf, n34, 2, proto.wireTypes.varint)

			buf, n34 = proto.writeVarInt(v628, v629, p50.kind.value)
		elseif p50.kind.type == "binding_path" then
			local v630, v631 = proto.writeTag(buf, n34, 3, proto.wireTypes.lengthDelimited)

			buf, n34 = proto.writeString(v630, v631, p50.kind.value)
		elseif p50.kind.type == "token" then
			local v632, v633 = proto.writeTag(buf, n34, 4, proto.wireTypes.lengthDelimited)

			buf, n34 = proto.writeString(v632, v633, p50.kind.value)
		end
	end

	local buf19 = buffer.create(n34)

	buffer.copy(buf19, 0, buf, 0, n34)

	return buf19
end
function t74.decode(p51: buffer) -- line: 5431
	-- upvalues: t74 (copy), proto (copy), prop_condition (copy)
	local v636 = t74.new()
	local n35 = 0

	while n35 < buffer.len(p51) do
		local v638, v639

		v638, v639, n35 = proto.readTag(p51, n35)

		if v639 == proto.wireTypes.varint then
			if v638 == 2 then
				local v640

				v640, n35 = proto.readVarIntI32(p51, n35)
				v636.kind = {
					type = "literal",
					value = v640
				}
			else
				local v641

				v641, n35 = proto.readVarInt(p51, n35)
			end
		elseif v639 == proto.wireTypes.lengthDelimited then
			if v638 == 1 then
				local v642

				v642, n35 = proto.readBuffer(p51, n35)
				v636.condition = prop_condition.PropCondition.decode(v642)
			elseif v638 == 3 then
				local v643

				v643, n35 = proto.readBuffer(p51, n35)
				v636.kind = {
					type = "binding_path",
					value = buffer.tostring(v643)
				}
			elseif v638 == 4 then
				local v644

				v644, n35 = proto.readBuffer(p51, n35)
				v636.kind = {
					type = "token",
					value = buffer.tostring(v644)
				}
			else
				local v645, v646 = proto.readVarInt(p51, n35)

				n35 = v646 + v645
			end
		elseif v639 == proto.wireTypes.i32 then
			local v647

			v647, n35 = proto.readFixed32(p51, n35)
		elseif v639 == proto.wireTypes.i64 then
			local v648

			v648, n35 = proto.readFixed64(p51, n35)
		else
			error("Unsupported wire type: " .. v639)
		end
	end

	return v636
end
function t74.jsonEncode(p52) -- line: 5489
	local t76 = {}

	if p52.condition ~= nil then
		t76.condition = p52.condition:jsonEncode()
	end

	if p52.kind ~= nil then
		if p52.kind.type == "literal" then
			t76.literal = p52.kind.value

			return t76
		end

		if p52.kind.type == "binding_path" then
			t76.bindingPath = p52.kind.value

			return t76
		end

		if p52.kind.type == "token" then
			t76.token = p52.kind.value
		end
	end

	return t76
end
function t74.jsonDecode(t77: {[any]: any}) -- line: 5509
	-- upvalues: t74 (copy), prop_condition (copy)
	local v652 = t74.new()

	if t77.condition ~= nil then
		v652.condition = prop_condition.PropCondition.jsonDecode(t77.condition)
	end

	if t77.literal ~= nil then
		v652.kind = {
			type = "literal",
			value = t77.literal
		}
	end

	if t77.binding_path ~= nil then
		v652.kind = {
			type = "binding_path",
			value = t77.binding_path
		}
	end

	if t77.bindingPath ~= nil then
		v652.kind = {
			type = "binding_path",
			value = t77.bindingPath
		}
	end

	if t77.token ~= nil then
		v652.kind = {
			type = "token",
			value = t77.token
		}
	end

	return v652
end

t74.descriptor = {
	name = "Int32Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.Int32Prop_ConditionalOption = t74
typeRegistry.default:register(t1.Int32Prop_ConditionalOption)

local t78 = {}

t78.__index = t78

function t78.new(t79: {[any]: any}?) -- line: 5550
	-- upvalues: t78 (copy)
	return (setmetatable({
		options = if t79 ~= nil and t79.options ~= nil then t79.options else {}
	}, t78))
end
function t78.encode(p53) -- line: 5558
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n36 = 0

	if p53.options ~= nil and #p53.options > 0 then
		for _, v658 in p53.options do
			local v659 = v658:encode()
			local v660, v661 = proto.writeTag(buf, n36, 1, proto.wireTypes.lengthDelimited)

			buf, n36 = proto.writeBuffer(v660, v661, v659, buffer.len(v659))
		end
	end

	local buf20 = buffer.create(n36)

	buffer.copy(buf20, 0, buf, 0, n36)

	return buf20
end
function t78.decode(p54: buffer) -- line: 5575
	-- upvalues: t78 (copy), proto (copy), t1 (copy)
	local v664 = t78.new()
	local n37 = 0

	while n37 < buffer.len(p54) do
		local v666, v667

		v666, v667, n37 = proto.readTag(p54, n37)

		if v667 == proto.wireTypes.varint then
			local v668

			v668, n37 = proto.readVarInt(p54, n37)
		elseif v667 == proto.wireTypes.lengthDelimited then
			if v666 == 1 then
				local v669

				v669, n37 = proto.readBuffer(p54, n37)
				table.insert(v664.options, t1.Int32Prop_ConditionalOption.decode(v669))
			else
				local v670, v671 = proto.readVarInt(p54, n37)

				n37 = v671 + v670
			end
		elseif v667 == proto.wireTypes.i32 then
			local v672

			v672, n37 = proto.readFixed32(p54, n37)
		elseif v667 == proto.wireTypes.i64 then
			local v673

			v673, n37 = proto.readFixed64(p54, n37)
		else
			error("Unsupported wire type: " .. v667)
		end
	end

	return v664
end
function t78.jsonEncode(p55) -- line: 5618
	local t80 = {}

	if p55.options ~= nil and #p55.options > 0 then
		local t81 = {}

		for _, v678 in p55.options do
			table.insert(t81, v678:jsonEncode())
		end

		t80.options = t81
	end

	return t80
end
function t78.jsonDecode(t82: {[any]: any}) -- line: 5632
	-- upvalues: t78 (copy), t1 (copy)
	local v680 = t78.new()

	if t82.options ~= nil then
		local t83 = {}

		for _, v683 in t82.options do
			table.insert(t83, t1.Int32Prop_ConditionalOption.jsonDecode(v683))
		end

		v680.options = t83
	end

	return v680
end

t78.descriptor = {
	name = "Int32Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.Int32Prop_ConditionalOptions = t78
typeRegistry.default:register(t1.Int32Prop_ConditionalOptions)

local t84 = {}

t84.__index = t84

function t84.new(t85: {[any]: any}?) -- line: 5661
	-- upvalues: t84 (copy)
	return (setmetatable({
		kind = if t85 ~= nil and t85.kind ~= nil then t85.kind else nil
	}, t84))
end
function t84.encode(p56) -- line: 5667
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n38 = 0

	if p56.kind ~= nil then
		if p56.kind.type == "literal" then
			local v688, v689 = proto.writeTag(buf, n38, 1, proto.wireTypes.varint)

			buf, n38 = proto.writeVarInt(v688, v689, p56.kind.value)
		elseif p56.kind.type == "binding_path" then
			local v690, v691 = proto.writeTag(buf, n38, 2, proto.wireTypes.lengthDelimited)

			buf, n38 = proto.writeString(v690, v691, p56.kind.value)
		elseif p56.kind.type == "token" then
			local v692, v693 = proto.writeTag(buf, n38, 3, proto.wireTypes.lengthDelimited)

			buf, n38 = proto.writeString(v692, v693, p56.kind.value)
		elseif p56.kind.type == "conditional" then
			local v694 = p56.kind.value:encode()
			local v695, v696 = proto.writeTag(buf, n38, 4, proto.wireTypes.lengthDelimited)

			buf, n38 = proto.writeBuffer(v695, v696, v694, buffer.len(v694))
		end
	end

	local buf21 = buffer.create(n38)

	buffer.copy(buf21, 0, buf, 0, n38)

	return buf21
end
function t84.decode(p57: buffer) -- line: 5693
	-- upvalues: t84 (copy), proto (copy), t1 (copy)
	local v699 = t84.new()
	local n39 = 0

	while n39 < buffer.len(p57) do
		local v701, v702

		v701, v702, n39 = proto.readTag(p57, n39)

		if v702 == proto.wireTypes.varint then
			if v701 == 1 then
				local v703

				v703, n39 = proto.readVarIntI64(p57, n39)
				v699.kind = {
					type = "literal",
					value = v703
				}
			else
				local v704

				v704, n39 = proto.readVarInt(p57, n39)
			end
		elseif v702 == proto.wireTypes.lengthDelimited then
			if v701 == 2 then
				local v705

				v705, n39 = proto.readBuffer(p57, n39)
				v699.kind = {
					type = "binding_path",
					value = buffer.tostring(v705)
				}
			elseif v701 == 3 then
				local v706

				v706, n39 = proto.readBuffer(p57, n39)
				v699.kind = {
					type = "token",
					value = buffer.tostring(v706)
				}
			elseif v701 == 4 then
				local v707

				v707, n39 = proto.readBuffer(p57, n39)
				v699.kind = {
					type = "conditional",
					value = t1.Int64Prop_ConditionalOptions.decode(v707)
				}
			else
				local v708, v709 = proto.readVarInt(p57, n39)

				n39 = v709 + v708
			end
		elseif v702 == proto.wireTypes.i32 then
			local v710

			v710, n39 = proto.readFixed32(p57, n39)
		elseif v702 == proto.wireTypes.i64 then
			local v711

			v711, n39 = proto.readFixed64(p57, n39)
		else
			error("Unsupported wire type: " .. v702)
		end
	end

	return v699
end
function t84.jsonEncode(p58) -- line: 5751
	local t86 = {}

	if p58.kind ~= nil then
		if p58.kind.type == "literal" then
			t86.literal = p58.kind.value

			return t86
		end

		if p58.kind.type == "binding_path" then
			t86.bindingPath = p58.kind.value

			return t86
		end

		if p58.kind.type == "token" then
			t86.token = p58.kind.value

			return t86
		end

		if p58.kind.type == "conditional" then
			t86.conditional = p58.kind.value:jsonEncode()
		end
	end

	return t86
end
function t84.jsonDecode(t87: {[any]: any}) -- line: 5769
	-- upvalues: t84 (copy), t1 (copy)
	local v715 = t84.new()

	if t87.literal ~= nil then
		v715.kind = {
			type = "literal",
			value = t87.literal
		}
	end

	if t87.binding_path ~= nil then
		v715.kind = {
			type = "binding_path",
			value = t87.binding_path
		}
	end

	if t87.bindingPath ~= nil then
		v715.kind = {
			type = "binding_path",
			value = t87.bindingPath
		}
	end

	if t87.token ~= nil then
		v715.kind = {
			type = "token",
			value = t87.token
		}
	end

	if t87.conditional ~= nil then
		v715.kind = {
			type = "conditional",
			value = t1.Int64Prop_ConditionalOptions.jsonDecode(t87.conditional)
		}
	end

	return v715
end

t84.descriptor = {
	name = "Int64Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
}
t1.Int64Prop = t84
typeRegistry.default:register(t1.Int64Prop)

local t88 = {}

t88.__index = t88

function t88.new(t89: {[any]: any}?) -- line: 5810
	-- upvalues: t88 (copy)
	return (setmetatable({
		condition = if t89 ~= nil and t89.condition ~= nil then t89.condition else nil,
		kind = if t89 ~= nil and t89.kind ~= nil then t89.kind else nil
	}, t88))
end
function t88.encode(p59) -- line: 5819
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n40 = 0

	if p59.condition ~= nil then
		local v720 = p59.condition:encode()
		local v721, v722 = proto.writeTag(buf, n40, 1, proto.wireTypes.lengthDelimited)

		buf, n40 = proto.writeBuffer(v721, v722, v720, buffer.len(v720))
	end

	if p59.kind ~= nil then
		if p59.kind.type == "literal" then
			local v723, v724 = proto.writeTag(buf, n40, 2, proto.wireTypes.varint)

			buf, n40 = proto.writeVarInt(v723, v724, p59.kind.value)
		elseif p59.kind.type == "binding_path" then
			local v725, v726 = proto.writeTag(buf, n40, 3, proto.wireTypes.lengthDelimited)

			buf, n40 = proto.writeString(v725, v726, p59.kind.value)
		elseif p59.kind.type == "token" then
			local v727, v728 = proto.writeTag(buf, n40, 4, proto.wireTypes.lengthDelimited)

			buf, n40 = proto.writeString(v727, v728, p59.kind.value)
		end
	end

	local buf22 = buffer.create(n40)

	buffer.copy(buf22, 0, buf, 0, n40)

	return buf22
end
function t88.decode(p60: buffer) -- line: 5847
	-- upvalues: t88 (copy), proto (copy), prop_condition (copy)
	local v731 = t88.new()
	local n41 = 0

	while n41 < buffer.len(p60) do
		local v733, v734

		v733, v734, n41 = proto.readTag(p60, n41)

		if v734 == proto.wireTypes.varint then
			if v733 == 2 then
				local v735

				v735, n41 = proto.readVarIntI64(p60, n41)
				v731.kind = {
					type = "literal",
					value = v735
				}
			else
				local v736

				v736, n41 = proto.readVarInt(p60, n41)
			end
		elseif v734 == proto.wireTypes.lengthDelimited then
			if v733 == 1 then
				local v737

				v737, n41 = proto.readBuffer(p60, n41)
				v731.condition = prop_condition.PropCondition.decode(v737)
			elseif v733 == 3 then
				local v738

				v738, n41 = proto.readBuffer(p60, n41)
				v731.kind = {
					type = "binding_path",
					value = buffer.tostring(v738)
				}
			elseif v733 == 4 then
				local v739

				v739, n41 = proto.readBuffer(p60, n41)
				v731.kind = {
					type = "token",
					value = buffer.tostring(v739)
				}
			else
				local v740, v741 = proto.readVarInt(p60, n41)

				n41 = v741 + v740
			end
		elseif v734 == proto.wireTypes.i32 then
			local v742

			v742, n41 = proto.readFixed32(p60, n41)
		elseif v734 == proto.wireTypes.i64 then
			local v743

			v743, n41 = proto.readFixed64(p60, n41)
		else
			error("Unsupported wire type: " .. v734)
		end
	end

	return v731
end
function t88.jsonEncode(p61) -- line: 5905
	local t90 = {}

	if p61.condition ~= nil then
		t90.condition = p61.condition:jsonEncode()
	end

	if p61.kind ~= nil then
		if p61.kind.type == "literal" then
			t90.literal = p61.kind.value

			return t90
		end

		if p61.kind.type == "binding_path" then
			t90.bindingPath = p61.kind.value

			return t90
		end

		if p61.kind.type == "token" then
			t90.token = p61.kind.value
		end
	end

	return t90
end
function t88.jsonDecode(t91: {[any]: any}) -- line: 5925
	-- upvalues: t88 (copy), prop_condition (copy)
	local v747 = t88.new()

	if t91.condition ~= nil then
		v747.condition = prop_condition.PropCondition.jsonDecode(t91.condition)
	end

	if t91.literal ~= nil then
		v747.kind = {
			type = "literal",
			value = t91.literal
		}
	end

	if t91.binding_path ~= nil then
		v747.kind = {
			type = "binding_path",
			value = t91.binding_path
		}
	end

	if t91.bindingPath ~= nil then
		v747.kind = {
			type = "binding_path",
			value = t91.bindingPath
		}
	end

	if t91.token ~= nil then
		v747.kind = {
			type = "token",
			value = t91.token
		}
	end

	return v747
end

t88.descriptor = {
	name = "Int64Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.Int64Prop_ConditionalOption = t88
typeRegistry.default:register(t1.Int64Prop_ConditionalOption)

local t92 = {}

t92.__index = t92

function t92.new(t93: {[any]: any}?) -- line: 5966
	-- upvalues: t92 (copy)
	return (setmetatable({
		options = if t93 ~= nil and t93.options ~= nil then t93.options else {}
	}, t92))
end
function t92.encode(p62) -- line: 5974
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n42 = 0

	if p62.options ~= nil and #p62.options > 0 then
		for _, v753 in p62.options do
			local v754 = v753:encode()
			local v755, v756 = proto.writeTag(buf, n42, 1, proto.wireTypes.lengthDelimited)

			buf, n42 = proto.writeBuffer(v755, v756, v754, buffer.len(v754))
		end
	end

	local buf23 = buffer.create(n42)

	buffer.copy(buf23, 0, buf, 0, n42)

	return buf23
end
function t92.decode(p63: buffer) -- line: 5991
	-- upvalues: t92 (copy), proto (copy), t1 (copy)
	local v759 = t92.new()
	local n43 = 0

	while n43 < buffer.len(p63) do
		local v761, v762

		v761, v762, n43 = proto.readTag(p63, n43)

		if v762 == proto.wireTypes.varint then
			local v763

			v763, n43 = proto.readVarInt(p63, n43)
		elseif v762 == proto.wireTypes.lengthDelimited then
			if v761 == 1 then
				local v764

				v764, n43 = proto.readBuffer(p63, n43)
				table.insert(v759.options, t1.Int64Prop_ConditionalOption.decode(v764))
			else
				local v765, v766 = proto.readVarInt(p63, n43)

				n43 = v766 + v765
			end
		elseif v762 == proto.wireTypes.i32 then
			local v767

			v767, n43 = proto.readFixed32(p63, n43)
		elseif v762 == proto.wireTypes.i64 then
			local v768

			v768, n43 = proto.readFixed64(p63, n43)
		else
			error("Unsupported wire type: " .. v762)
		end
	end

	return v759
end
function t92.jsonEncode(p64) -- line: 6034
	local t94 = {}

	if p64.options ~= nil and #p64.options > 0 then
		local t95 = {}

		for _, v773 in p64.options do
			table.insert(t95, v773:jsonEncode())
		end

		t94.options = t95
	end

	return t94
end
function t92.jsonDecode(t96: {[any]: any}) -- line: 6048
	-- upvalues: t92 (copy), t1 (copy)
	local v775 = t92.new()

	if t96.options ~= nil then
		local t97 = {}

		for _, v778 in t96.options do
			table.insert(t97, t1.Int64Prop_ConditionalOption.jsonDecode(v778))
		end

		v775.options = t97
	end

	return v775
end

t92.descriptor = {
	name = "Int64Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.Int64Prop_ConditionalOptions = t92
typeRegistry.default:register(t1.Int64Prop_ConditionalOptions)

local t98 = {}

t98.__index = t98

function t98.new(t99: {[any]: any}?) -- line: 6077
	-- upvalues: t98 (copy)
	return (setmetatable({
		kind = if t99 ~= nil and t99.kind ~= nil then t99.kind else nil
	}, t98))
end
function t98.encode(p65) -- line: 6083
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n44 = 0

	if p65.kind ~= nil then
		if p65.kind.type == "literal" then
			local v783, v784 = proto.writeTag(buf, n44, 1, proto.wireTypes.varint)

			buf, n44 = proto.writeVarInt(v783, v784, not p65.kind.value and 0 or 1)
		elseif p65.kind.type == "binding_path" then
			local v785, v786 = proto.writeTag(buf, n44, 2, proto.wireTypes.lengthDelimited)

			buf, n44 = proto.writeString(v785, v786, p65.kind.value)
		elseif p65.kind.type == "conditional" then
			local v787 = p65.kind.value:encode()
			local v788, v789 = proto.writeTag(buf, n44, 3, proto.wireTypes.lengthDelimited)

			buf, n44 = proto.writeBuffer(v788, v789, v787, buffer.len(v787))
		end
	end

	local buf24 = buffer.create(n44)

	buffer.copy(buf24, 0, buf, 0, n44)

	return buf24
end
function t98.decode(p66: buffer) -- line: 6106
	-- upvalues: t98 (copy), proto (copy), t1 (copy)
	local v792 = t98.new()
	local n45 = 0

	while n45 < buffer.len(p66) do
		local v794, v795

		v794, v795, n45 = proto.readTag(p66, n45)

		if v795 == proto.wireTypes.varint then
			if v794 == 1 then
				local v796

				v796, n45 = proto.readVarInt(p66, n45)
				v792.kind = {
					type = "literal",
					value = v796 ~= 0
				}
			else
				local v797

				v797, n45 = proto.readVarInt(p66, n45)
			end
		elseif v795 == proto.wireTypes.lengthDelimited then
			if v794 == 2 then
				local v798

				v798, n45 = proto.readBuffer(p66, n45)
				v792.kind = {
					type = "binding_path",
					value = buffer.tostring(v798)
				}
			elseif v794 == 3 then
				local v799

				v799, n45 = proto.readBuffer(p66, n45)
				v792.kind = {
					type = "conditional",
					value = t1.BoolProp_ConditionalOptions.decode(v799)
				}
			else
				local v800, v801 = proto.readVarInt(p66, n45)

				n45 = v801 + v800
			end
		elseif v795 == proto.wireTypes.i32 then
			local v802

			v802, n45 = proto.readFixed32(p66, n45)
		elseif v795 == proto.wireTypes.i64 then
			local v803

			v803, n45 = proto.readFixed64(p66, n45)
		else
			error("Unsupported wire type: " .. v795)
		end
	end

	return v792
end
function t98.jsonEncode(p67) -- line: 6159
	local t100 = {}

	if p67.kind ~= nil then
		if p67.kind.type == "literal" then
			t100.literal = p67.kind.value

			return t100
		end

		if p67.kind.type == "binding_path" then
			t100.bindingPath = p67.kind.value

			return t100
		end

		if p67.kind.type == "conditional" then
			t100.conditional = p67.kind.value:jsonEncode()
		end
	end

	return t100
end
function t98.jsonDecode(t101: {[any]: any}) -- line: 6175
	-- upvalues: t98 (copy), t1 (copy)
	local v807 = t98.new()

	if t101.literal ~= nil then
		v807.kind = {
			type = "literal",
			value = t101.literal
		}
	end

	if t101.binding_path ~= nil then
		v807.kind = {
			type = "binding_path",
			value = t101.binding_path
		}
	end

	if t101.bindingPath ~= nil then
		v807.kind = {
			type = "binding_path",
			value = t101.bindingPath
		}
	end

	if t101.conditional ~= nil then
		v807.kind = {
			type = "conditional",
			value = t1.BoolProp_ConditionalOptions.jsonDecode(t101.conditional)
		}
	end

	return v807
end

t98.descriptor = {
	name = "BoolProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
}
t1.BoolProp = t98
typeRegistry.default:register(t1.BoolProp)

local t102 = {}

t102.__index = t102

function t102.new(t103: {[any]: any}?) -- line: 6212
	-- upvalues: t102 (copy)
	return (setmetatable({
		condition = if t103 ~= nil and t103.condition ~= nil then t103.condition else nil,
		kind = if t103 ~= nil and t103.kind ~= nil then t103.kind else nil
	}, t102))
end
function t102.encode(p68) -- line: 6221
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n46 = 0

	if p68.condition ~= nil then
		local v812 = p68.condition:encode()
		local v813, v814 = proto.writeTag(buf, n46, 1, proto.wireTypes.lengthDelimited)

		buf, n46 = proto.writeBuffer(v813, v814, v812, buffer.len(v812))
	end

	if p68.kind ~= nil then
		if p68.kind.type == "literal" then
			local v815, v816 = proto.writeTag(buf, n46, 2, proto.wireTypes.varint)

			buf, n46 = proto.writeVarInt(v815, v816, not p68.kind.value and 0 or 1)
		elseif p68.kind.type == "binding_path" then
			local v817, v818 = proto.writeTag(buf, n46, 3, proto.wireTypes.lengthDelimited)

			buf, n46 = proto.writeString(v817, v818, p68.kind.value)
		end
	end

	local buf25 = buffer.create(n46)

	buffer.copy(buf25, 0, buf, 0, n46)

	return buf25
end
function t102.decode(p69: buffer) -- line: 6246
	-- upvalues: t102 (copy), proto (copy), prop_condition (copy)
	local v821 = t102.new()
	local n47 = 0

	while n47 < buffer.len(p69) do
		local v823, v824

		v823, v824, n47 = proto.readTag(p69, n47)

		if v824 == proto.wireTypes.varint then
			if v823 == 2 then
				local v825

				v825, n47 = proto.readVarInt(p69, n47)
				v821.kind = {
					type = "literal",
					value = v825 ~= 0
				}
			else
				local v826

				v826, n47 = proto.readVarInt(p69, n47)
			end
		elseif v824 == proto.wireTypes.lengthDelimited then
			if v823 == 1 then
				local v827

				v827, n47 = proto.readBuffer(p69, n47)
				v821.condition = prop_condition.PropCondition.decode(v827)
			elseif v823 == 3 then
				local v828

				v828, n47 = proto.readBuffer(p69, n47)
				v821.kind = {
					type = "binding_path",
					value = buffer.tostring(v828)
				}
			else
				local v829, v830 = proto.readVarInt(p69, n47)

				n47 = v830 + v829
			end
		elseif v824 == proto.wireTypes.i32 then
			local v831

			v831, n47 = proto.readFixed32(p69, n47)
		elseif v824 == proto.wireTypes.i64 then
			local v832

			v832, n47 = proto.readFixed64(p69, n47)
		else
			error("Unsupported wire type: " .. v824)
		end
	end

	return v821
end
function t102.jsonEncode(p70) -- line: 6299
	local t104 = {}

	if p70.condition ~= nil then
		t104.condition = p70.condition:jsonEncode()
	end

	if p70.kind ~= nil then
		if p70.kind.type == "literal" then
			t104.literal = p70.kind.value

			return t104
		end

		if p70.kind.type == "binding_path" then
			t104.bindingPath = p70.kind.value
		end
	end

	return t104
end
function t102.jsonDecode(t105: {[any]: any}) -- line: 6317
	-- upvalues: t102 (copy), prop_condition (copy)
	local v836 = t102.new()

	if t105.condition ~= nil then
		v836.condition = prop_condition.PropCondition.jsonDecode(t105.condition)
	end

	if t105.literal ~= nil then
		v836.kind = {
			type = "literal",
			value = t105.literal
		}
	end

	if t105.binding_path ~= nil then
		v836.kind = {
			type = "binding_path",
			value = t105.binding_path
		}
	end

	if t105.bindingPath ~= nil then
		v836.kind = {
			type = "binding_path",
			value = t105.bindingPath
		}
	end

	return v836
end

t102.descriptor = {
	name = "BoolProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.BoolProp_ConditionalOption = t102
typeRegistry.default:register(t1.BoolProp_ConditionalOption)

local t106 = {}

t106.__index = t106

function t106.new(t107: {[any]: any}?) -- line: 6354
	-- upvalues: t106 (copy)
	return (setmetatable({
		options = if t107 ~= nil and t107.options ~= nil then t107.options else {}
	}, t106))
end
function t106.encode(p71) -- line: 6362
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n48 = 0

	if p71.options ~= nil and #p71.options > 0 then
		for _, v842 in p71.options do
			local v843 = v842:encode()
			local v844, v845 = proto.writeTag(buf, n48, 1, proto.wireTypes.lengthDelimited)

			buf, n48 = proto.writeBuffer(v844, v845, v843, buffer.len(v843))
		end
	end

	local buf26 = buffer.create(n48)

	buffer.copy(buf26, 0, buf, 0, n48)

	return buf26
end
function t106.decode(p72: buffer) -- line: 6379
	-- upvalues: t106 (copy), proto (copy), t1 (copy)
	local v848 = t106.new()
	local n49 = 0

	while n49 < buffer.len(p72) do
		local v850, v851

		v850, v851, n49 = proto.readTag(p72, n49)

		if v851 == proto.wireTypes.varint then
			local v852

			v852, n49 = proto.readVarInt(p72, n49)
		elseif v851 == proto.wireTypes.lengthDelimited then
			if v850 == 1 then
				local v853

				v853, n49 = proto.readBuffer(p72, n49)
				table.insert(v848.options, t1.BoolProp_ConditionalOption.decode(v853))
			else
				local v854, v855 = proto.readVarInt(p72, n49)

				n49 = v855 + v854
			end
		elseif v851 == proto.wireTypes.i32 then
			local v856

			v856, n49 = proto.readFixed32(p72, n49)
		elseif v851 == proto.wireTypes.i64 then
			local v857

			v857, n49 = proto.readFixed64(p72, n49)
		else
			error("Unsupported wire type: " .. v851)
		end
	end

	return v848
end
function t106.jsonEncode(p73) -- line: 6422
	local t108 = {}

	if p73.options ~= nil and #p73.options > 0 then
		local t109 = {}

		for _, v862 in p73.options do
			table.insert(t109, v862:jsonEncode())
		end

		t108.options = t109
	end

	return t108
end
function t106.jsonDecode(t110: {[any]: any}) -- line: 6436
	-- upvalues: t106 (copy), t1 (copy)
	local v864 = t106.new()

	if t110.options ~= nil then
		local t111 = {}

		for _, v867 in t110.options do
			table.insert(t111, t1.BoolProp_ConditionalOption.jsonDecode(v867))
		end

		v864.options = t111
	end

	return v864
end

t106.descriptor = {
	name = "BoolProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.BoolProp_ConditionalOptions = t106
typeRegistry.default:register(t1.BoolProp_ConditionalOptions)

local t112 = {}

t112.__index = t112

function t112.new(t113: {[any]: any}?) -- line: 6465
	-- upvalues: t112 (copy)
	return (setmetatable({
		kind = if t113 ~= nil and t113.kind ~= nil then t113.kind else nil
	}, t112))
end
function t112.encode(p74) -- line: 6471
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n50 = 0

	if p74.kind ~= nil then
		if p74.kind.type == "literal" then
			local v872 = p74.kind.value:encode()
			local v873, v874 = proto.writeTag(buf, n50, 1, proto.wireTypes.lengthDelimited)

			buf, n50 = proto.writeBuffer(v873, v874, v872, buffer.len(v872))
		elseif p74.kind.type == "binding_path" then
			local v875, v876 = proto.writeTag(buf, n50, 2, proto.wireTypes.lengthDelimited)

			buf, n50 = proto.writeString(v875, v876, p74.kind.value)
		elseif p74.kind.type == "conditional" then
			local v877 = p74.kind.value:encode()
			local v878, v879 = proto.writeTag(buf, n50, 3, proto.wireTypes.lengthDelimited)

			buf, n50 = proto.writeBuffer(v878, v879, v877, buffer.len(v877))
		end
	end

	local buf27 = buffer.create(n50)

	buffer.copy(buf27, 0, buf, 0, n50)

	return buf27
end
function t112.decode(p75: buffer) -- line: 6495
	-- upvalues: t112 (copy), proto (copy), struct (copy), t1 (copy)
	local v882 = t112.new()
	local n51 = 0

	while n51 < buffer.len(p75) do
		local v884, v885

		v884, v885, n51 = proto.readTag(p75, n51)

		if v885 == proto.wireTypes.varint then
			local v886

			v886, n51 = proto.readVarInt(p75, n51)
		elseif v885 == proto.wireTypes.lengthDelimited then
			if v884 == 1 then
				local v887

				v887, n51 = proto.readBuffer(p75, n51)
				v882.kind = {
					type = "literal",
					value = struct.Struct.decode(v887)
				}
			elseif v884 == 2 then
				local v888

				v888, n51 = proto.readBuffer(p75, n51)
				v882.kind = {
					type = "binding_path",
					value = buffer.tostring(v888)
				}
			elseif v884 == 3 then
				local v889

				v889, n51 = proto.readBuffer(p75, n51)
				v882.kind = {
					type = "conditional",
					value = t1.StructProp_ConditionalOptions.decode(v889)
				}
			else
				local v890, v891 = proto.readVarInt(p75, n51)

				n51 = v891 + v890
			end
		elseif v885 == proto.wireTypes.i32 then
			local v892

			v892, n51 = proto.readFixed32(p75, n51)
		elseif v885 == proto.wireTypes.i64 then
			local v893

			v893, n51 = proto.readFixed64(p75, n51)
		else
			error("Unsupported wire type: " .. v885)
		end
	end

	return v882
end
function t112.jsonEncode(p76) -- line: 6548
	local t114 = {}

	if p76.kind ~= nil then
		if p76.kind.type == "literal" then
			t114.literal = p76.kind.value:jsonEncode()

			return t114
		end

		if p76.kind.type == "binding_path" then
			t114.bindingPath = p76.kind.value

			return t114
		end

		if p76.kind.type == "conditional" then
			t114.conditional = p76.kind.value:jsonEncode()
		end
	end

	return t114
end
function t112.jsonDecode(t115: {[any]: any}) -- line: 6564
	-- upvalues: t112 (copy), struct (copy), t1 (copy)
	local v897 = t112.new()

	if t115.literal ~= nil then
		v897.kind = {
			type = "literal",
			value = struct.Struct.jsonDecode(t115.literal)
		}
	end

	if t115.binding_path ~= nil then
		v897.kind = {
			type = "binding_path",
			value = t115.binding_path
		}
	end

	if t115.bindingPath ~= nil then
		v897.kind = {
			type = "binding_path",
			value = t115.bindingPath
		}
	end

	if t115.conditional ~= nil then
		v897.kind = {
			type = "conditional",
			value = t1.StructProp_ConditionalOptions.jsonDecode(t115.conditional)
		}
	end

	return v897
end

t112.descriptor = {
	name = "StructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
}
t1.StructProp = t112
typeRegistry.default:register(t1.StructProp)

local t116 = {}

t116.__index = t116

function t116.new(t117: {[any]: any}?) -- line: 6601
	-- upvalues: t116 (copy)
	return (setmetatable({
		condition = if t117 ~= nil and t117.condition ~= nil then t117.condition else nil,
		kind = if t117 ~= nil and t117.kind ~= nil then t117.kind else nil
	}, t116))
end
function t116.encode(p77) -- line: 6610
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n52 = 0

	if p77.condition ~= nil then
		local v902 = p77.condition:encode()
		local v903, v904 = proto.writeTag(buf, n52, 1, proto.wireTypes.lengthDelimited)

		buf, n52 = proto.writeBuffer(v903, v904, v902, buffer.len(v902))
	end

	if p77.kind ~= nil then
		if p77.kind.type == "literal" then
			local v905 = p77.kind.value:encode()
			local v906, v907 = proto.writeTag(buf, n52, 2, proto.wireTypes.lengthDelimited)

			buf, n52 = proto.writeBuffer(v906, v907, v905, buffer.len(v905))
		elseif p77.kind.type == "binding_path" then
			local v908, v909 = proto.writeTag(buf, n52, 3, proto.wireTypes.lengthDelimited)

			buf, n52 = proto.writeString(v908, v909, p77.kind.value)
		end
	end

	local buf28 = buffer.create(n52)

	buffer.copy(buf28, 0, buf, 0, n52)

	return buf28
end
function t116.decode(p78: buffer) -- line: 6636
	-- upvalues: t116 (copy), proto (copy), prop_condition (copy), struct (copy)
	local v912 = t116.new()
	local n53 = 0

	while n53 < buffer.len(p78) do
		local v914, v915

		v914, v915, n53 = proto.readTag(p78, n53)

		if v915 == proto.wireTypes.varint then
			local v916

			v916, n53 = proto.readVarInt(p78, n53)
		elseif v915 == proto.wireTypes.lengthDelimited then
			if v914 == 1 then
				local v917

				v917, n53 = proto.readBuffer(p78, n53)
				v912.condition = prop_condition.PropCondition.decode(v917)
			elseif v914 == 2 then
				local v918

				v918, n53 = proto.readBuffer(p78, n53)
				v912.kind = {
					type = "literal",
					value = struct.Struct.decode(v918)
				}
			elseif v914 == 3 then
				local v919

				v919, n53 = proto.readBuffer(p78, n53)
				v912.kind = {
					type = "binding_path",
					value = buffer.tostring(v919)
				}
			else
				local v920, v921 = proto.readVarInt(p78, n53)

				n53 = v921 + v920
			end
		elseif v915 == proto.wireTypes.i32 then
			local v922

			v922, n53 = proto.readFixed32(p78, n53)
		elseif v915 == proto.wireTypes.i64 then
			local v923

			v923, n53 = proto.readFixed64(p78, n53)
		else
			error("Unsupported wire type: " .. v915)
		end
	end

	return v912
end
function t116.jsonEncode(p79) -- line: 6689
	local t118 = {}

	if p79.condition ~= nil then
		t118.condition = p79.condition:jsonEncode()
	end

	if p79.kind ~= nil then
		if p79.kind.type == "literal" then
			t118.literal = p79.kind.value:jsonEncode()

			return t118
		end

		if p79.kind.type == "binding_path" then
			t118.bindingPath = p79.kind.value
		end
	end

	return t118
end
function t116.jsonDecode(t119: {[any]: any}) -- line: 6707
	-- upvalues: t116 (copy), prop_condition (copy), struct (copy)
	local v927 = t116.new()

	if t119.condition ~= nil then
		v927.condition = prop_condition.PropCondition.jsonDecode(t119.condition)
	end

	if t119.literal ~= nil then
		v927.kind = {
			type = "literal",
			value = struct.Struct.jsonDecode(t119.literal)
		}
	end

	if t119.binding_path ~= nil then
		v927.kind = {
			type = "binding_path",
			value = t119.binding_path
		}
	end

	if t119.bindingPath ~= nil then
		v927.kind = {
			type = "binding_path",
			value = t119.bindingPath
		}
	end

	return v927
end

t116.descriptor = {
	name = "StructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.StructProp_ConditionalOption = t116
typeRegistry.default:register(t1.StructProp_ConditionalOption)

local t120 = {}

t120.__index = t120

function t120.new(t121: {[any]: any}?) -- line: 6744
	-- upvalues: t120 (copy)
	return (setmetatable({
		options = if t121 ~= nil and t121.options ~= nil then t121.options else {}
	}, t120))
end
function t120.encode(p80) -- line: 6752
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n54 = 0

	if p80.options ~= nil and #p80.options > 0 then
		for _, v933 in p80.options do
			local v934 = v933:encode()
			local v935, v936 = proto.writeTag(buf, n54, 1, proto.wireTypes.lengthDelimited)

			buf, n54 = proto.writeBuffer(v935, v936, v934, buffer.len(v934))
		end
	end

	local buf29 = buffer.create(n54)

	buffer.copy(buf29, 0, buf, 0, n54)

	return buf29
end
function t120.decode(p81: buffer) -- line: 6769
	-- upvalues: t120 (copy), proto (copy), t1 (copy)
	local v939 = t120.new()
	local n55 = 0

	while n55 < buffer.len(p81) do
		local v941, v942

		v941, v942, n55 = proto.readTag(p81, n55)

		if v942 == proto.wireTypes.varint then
			local v943

			v943, n55 = proto.readVarInt(p81, n55)
		elseif v942 == proto.wireTypes.lengthDelimited then
			if v941 == 1 then
				local v944

				v944, n55 = proto.readBuffer(p81, n55)
				table.insert(v939.options, t1.StructProp_ConditionalOption.decode(v944))
			else
				local v945, v946 = proto.readVarInt(p81, n55)

				n55 = v946 + v945
			end
		elseif v942 == proto.wireTypes.i32 then
			local v947

			v947, n55 = proto.readFixed32(p81, n55)
		elseif v942 == proto.wireTypes.i64 then
			local v948

			v948, n55 = proto.readFixed64(p81, n55)
		else
			error("Unsupported wire type: " .. v942)
		end
	end

	return v939
end
function t120.jsonEncode(p82) -- line: 6812
	local t122 = {}

	if p82.options ~= nil and #p82.options > 0 then
		local t123 = {}

		for _, v953 in p82.options do
			table.insert(t123, v953:jsonEncode())
		end

		t122.options = t123
	end

	return t122
end
function t120.jsonDecode(t124: {[any]: any}) -- line: 6826
	-- upvalues: t120 (copy), t1 (copy)
	local v955 = t120.new()

	if t124.options ~= nil then
		local t125 = {}

		for _, v958 in t124.options do
			table.insert(t125, t1.StructProp_ConditionalOption.jsonDecode(v958))
		end

		v955.options = t125
	end

	return v955
end

t120.descriptor = {
	name = "StructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.StructProp_ConditionalOptions = t120
typeRegistry.default:register(t1.StructProp_ConditionalOptions)

local t126 = {}

t126.__index = t126

function t126.new(t127: {[any]: any}?) -- line: 6855
	-- upvalues: t126 (copy)
	return (setmetatable({
		kind = if t127 ~= nil and t127.kind ~= nil then t127.kind else nil
	}, t126))
end
function t126.encode(p83) -- line: 6861
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n56 = 0

	if p83.kind ~= nil then
		if p83.kind.type == "literal" then
			local v963, v964 = proto.writeTag(buf, n56, 1, proto.wireTypes.lengthDelimited)

			buf, n56 = proto.writeString(v963, v964, p83.kind.value)
		elseif p83.kind.type == "binding_path" then
			local v965, v966 = proto.writeTag(buf, n56, 2, proto.wireTypes.lengthDelimited)

			buf, n56 = proto.writeString(v965, v966, p83.kind.value)
		elseif p83.kind.type == "format" then
			local v967 = p83.kind.value:encode()
			local v968, v969 = proto.writeTag(buf, n56, 3, proto.wireTypes.lengthDelimited)

			buf, n56 = proto.writeBuffer(v968, v969, v967, buffer.len(v967))
		elseif p83.kind.type == "conditional" then
			local v970 = p83.kind.value:encode()
			local v971, v972 = proto.writeTag(buf, n56, 4, proto.wireTypes.lengthDelimited)

			buf, n56 = proto.writeBuffer(v971, v972, v970, buffer.len(v970))
		elseif p83.kind.type == "translation" then
			local v973 = p83.kind.value:encode()
			local v974, v975 = proto.writeTag(buf, n56, 5, proto.wireTypes.lengthDelimited)

			buf, n56 = proto.writeBuffer(v974, v975, v973, buffer.len(v973))
		end
	end

	local buf30 = buffer.create(n56)

	buffer.copy(buf30, 0, buf, 0, n56)

	return buf30
end
function t126.decode(p84: buffer) -- line: 6892
	-- upvalues: t126 (copy), proto (copy), t1 (copy)
	local v978 = t126.new()
	local n57 = 0

	while n57 < buffer.len(p84) do
		local v980, v981

		v980, v981, n57 = proto.readTag(p84, n57)

		if v981 == proto.wireTypes.varint then
			local v982

			v982, n57 = proto.readVarInt(p84, n57)
		elseif v981 == proto.wireTypes.lengthDelimited then
			if v980 == 1 then
				local v983

				v983, n57 = proto.readBuffer(p84, n57)
				v978.kind = {
					type = "literal",
					value = buffer.tostring(v983)
				}
			elseif v980 == 2 then
				local v984

				v984, n57 = proto.readBuffer(p84, n57)
				v978.kind = {
					type = "binding_path",
					value = buffer.tostring(v984)
				}
			elseif v980 == 3 then
				local v985

				v985, n57 = proto.readBuffer(p84, n57)
				v978.kind = {
					type = "format",
					value = t1.StringFormat.decode(v985)
				}
			elseif v980 == 4 then
				local v986

				v986, n57 = proto.readBuffer(p84, n57)
				v978.kind = {
					type = "conditional",
					value = t1.ImageStringProp_ConditionalOptions.decode(v986)
				}
			elseif v980 == 5 then
				local v987

				v987, n57 = proto.readBuffer(p84, n57)
				v978.kind = {
					type = "translation",
					value = t1.TranslationRef.decode(v987)
				}
			else
				local v988, v989 = proto.readVarInt(p84, n57)

				n57 = v989 + v988
			end
		elseif v981 == proto.wireTypes.i32 then
			local v990

			v990, n57 = proto.readFixed32(p84, n57)
		elseif v981 == proto.wireTypes.i64 then
			local v991

			v991, n57 = proto.readFixed64(p84, n57)
		else
			error("Unsupported wire type: " .. v981)
		end
	end

	return v978
end
function t126.jsonEncode(p85) -- line: 6956
	local t128 = {}

	if p85.kind ~= nil then
		if p85.kind.type == "literal" then
			t128.literal = p85.kind.value

			return t128
		end

		if p85.kind.type == "binding_path" then
			t128.bindingPath = p85.kind.value

			return t128
		end

		if p85.kind.type == "format" then
			t128.format = p85.kind.value:jsonEncode()

			return t128
		end

		if p85.kind.type == "conditional" then
			t128.conditional = p85.kind.value:jsonEncode()

			return t128
		end

		if p85.kind.type == "translation" then
			t128.translation = p85.kind.value:jsonEncode()
		end
	end

	return t128
end
function t126.jsonDecode(t129: {[any]: any}) -- line: 6976
	-- upvalues: t126 (copy), t1 (copy)
	local v995 = t126.new()

	if t129.literal ~= nil then
		v995.kind = {
			type = "literal",
			value = t129.literal
		}
	end

	if t129.binding_path ~= nil then
		v995.kind = {
			type = "binding_path",
			value = t129.binding_path
		}
	end

	if t129.bindingPath ~= nil then
		v995.kind = {
			type = "binding_path",
			value = t129.bindingPath
		}
	end

	if t129.format ~= nil then
		v995.kind = {
			type = "format",
			value = t1.StringFormat.jsonDecode(t129.format)
		}
	end

	if t129.conditional ~= nil then
		v995.kind = {
			type = "conditional",
			value = t1.ImageStringProp_ConditionalOptions.jsonDecode(t129.conditional)
		}
	end

	if t129.translation ~= nil then
		v995.kind = {
			type = "translation",
			value = t1.TranslationRef.jsonDecode(t129.translation)
		}
	end

	return v995
end

t126.descriptor = {
	name = "ImageStringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
}
t1.ImageStringProp = t126
typeRegistry.default:register(t1.ImageStringProp)

local t130 = {}

t130.__index = t130

function t130.new(t131: {[any]: any}?) -- line: 7023
	-- upvalues: t130 (copy)
	return (setmetatable({
		condition = if t131 ~= nil and t131.condition ~= nil then t131.condition else nil,
		kind = if t131 ~= nil and t131.kind ~= nil then t131.kind else nil
	}, t130))
end
function t130.encode(p86) -- line: 7032
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n58 = 0

	if p86.condition ~= nil then
		local v1000 = p86.condition:encode()
		local v1001, v1002 = proto.writeTag(buf, n58, 1, proto.wireTypes.lengthDelimited)

		buf, n58 = proto.writeBuffer(v1001, v1002, v1000, buffer.len(v1000))
	end

	if p86.kind ~= nil then
		if p86.kind.type == "literal" then
			local v1003, v1004 = proto.writeTag(buf, n58, 2, proto.wireTypes.lengthDelimited)

			buf, n58 = proto.writeString(v1003, v1004, p86.kind.value)
		elseif p86.kind.type == "binding_path" then
			local v1005, v1006 = proto.writeTag(buf, n58, 3, proto.wireTypes.lengthDelimited)

			buf, n58 = proto.writeString(v1005, v1006, p86.kind.value)
		elseif p86.kind.type == "format" then
			local v1007 = p86.kind.value:encode()
			local v1008, v1009 = proto.writeTag(buf, n58, 4, proto.wireTypes.lengthDelimited)

			buf, n58 = proto.writeBuffer(v1008, v1009, v1007, buffer.len(v1007))
		elseif p86.kind.type == "translation" then
			local v1010 = p86.kind.value:encode()
			local v1011, v1012 = proto.writeTag(buf, n58, 5, proto.wireTypes.lengthDelimited)

			buf, n58 = proto.writeBuffer(v1011, v1012, v1010, buffer.len(v1010))
		end
	end

	local buf31 = buffer.create(n58)

	buffer.copy(buf31, 0, buf, 0, n58)

	return buf31
end
function t130.decode(p87: buffer) -- line: 7065
	-- upvalues: t130 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v1015 = t130.new()
	local n59 = 0

	while n59 < buffer.len(p87) do
		local v1017, v1018

		v1017, v1018, n59 = proto.readTag(p87, n59)

		if v1018 == proto.wireTypes.varint then
			local v1019

			v1019, n59 = proto.readVarInt(p87, n59)
		elseif v1018 == proto.wireTypes.lengthDelimited then
			if v1017 == 1 then
				local v1020

				v1020, n59 = proto.readBuffer(p87, n59)
				v1015.condition = prop_condition.PropCondition.decode(v1020)
			elseif v1017 == 2 then
				local v1021

				v1021, n59 = proto.readBuffer(p87, n59)
				v1015.kind = {
					type = "literal",
					value = buffer.tostring(v1021)
				}
			elseif v1017 == 3 then
				local v1022

				v1022, n59 = proto.readBuffer(p87, n59)
				v1015.kind = {
					type = "binding_path",
					value = buffer.tostring(v1022)
				}
			elseif v1017 == 4 then
				local v1023

				v1023, n59 = proto.readBuffer(p87, n59)
				v1015.kind = {
					type = "format",
					value = t1.StringFormat.decode(v1023)
				}
			elseif v1017 == 5 then
				local v1024

				v1024, n59 = proto.readBuffer(p87, n59)
				v1015.kind = {
					type = "translation",
					value = t1.TranslationRef.decode(v1024)
				}
			else
				local v1025, v1026 = proto.readVarInt(p87, n59)

				n59 = v1026 + v1025
			end
		elseif v1018 == proto.wireTypes.i32 then
			local v1027

			v1027, n59 = proto.readFixed32(p87, n59)
		elseif v1018 == proto.wireTypes.i64 then
			local v1028

			v1028, n59 = proto.readFixed64(p87, n59)
		else
			error("Unsupported wire type: " .. v1018)
		end
	end

	return v1015
end
function t130.jsonEncode(p88) -- line: 7128
	local t132 = {}

	if p88.condition ~= nil then
		t132.condition = p88.condition:jsonEncode()
	end

	if p88.kind ~= nil then
		if p88.kind.type == "literal" then
			t132.literal = p88.kind.value

			return t132
		end

		if p88.kind.type == "binding_path" then
			t132.bindingPath = p88.kind.value

			return t132
		end

		if p88.kind.type == "format" then
			t132.format = p88.kind.value:jsonEncode()

			return t132
		end

		if p88.kind.type == "translation" then
			t132.translation = p88.kind.value:jsonEncode()
		end
	end

	return t132
end
function t130.jsonDecode(t133: {[any]: any}) -- line: 7150
	-- upvalues: t130 (copy), prop_condition (copy), t1 (copy)
	local v1032 = t130.new()

	if t133.condition ~= nil then
		v1032.condition = prop_condition.PropCondition.jsonDecode(t133.condition)
	end

	if t133.literal ~= nil then
		v1032.kind = {
			type = "literal",
			value = t133.literal
		}
	end

	if t133.binding_path ~= nil then
		v1032.kind = {
			type = "binding_path",
			value = t133.binding_path
		}
	end

	if t133.bindingPath ~= nil then
		v1032.kind = {
			type = "binding_path",
			value = t133.bindingPath
		}
	end

	if t133.format ~= nil then
		v1032.kind = {
			type = "format",
			value = t1.StringFormat.jsonDecode(t133.format)
		}
	end

	if t133.translation ~= nil then
		v1032.kind = {
			type = "translation",
			value = t1.TranslationRef.jsonDecode(t133.translation)
		}
	end

	return v1032
end

t130.descriptor = {
	name = "ImageStringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.ImageStringProp_ConditionalOption = t130
typeRegistry.default:register(t1.ImageStringProp_ConditionalOption)

local t134 = {}

t134.__index = t134

function t134.new(t135: {[any]: any}?) -- line: 7197
	-- upvalues: t134 (copy)
	return (setmetatable({
		options = if t135 ~= nil and t135.options ~= nil then t135.options else {}
	}, t134))
end
function t134.encode(p89) -- line: 7205
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n60 = 0

	if p89.options ~= nil and #p89.options > 0 then
		for _, v1038 in p89.options do
			local v1039 = v1038:encode()
			local v1040, v1041 = proto.writeTag(buf, n60, 1, proto.wireTypes.lengthDelimited)

			buf, n60 = proto.writeBuffer(v1040, v1041, v1039, buffer.len(v1039))
		end
	end

	local buf32 = buffer.create(n60)

	buffer.copy(buf32, 0, buf, 0, n60)

	return buf32
end
function t134.decode(p90: buffer) -- line: 7222
	-- upvalues: t134 (copy), proto (copy), t1 (copy)
	local v1044 = t134.new()
	local n61 = 0

	while n61 < buffer.len(p90) do
		local v1046, v1047

		v1046, v1047, n61 = proto.readTag(p90, n61)

		if v1047 == proto.wireTypes.varint then
			local v1048

			v1048, n61 = proto.readVarInt(p90, n61)
		elseif v1047 == proto.wireTypes.lengthDelimited then
			if v1046 == 1 then
				local v1049

				v1049, n61 = proto.readBuffer(p90, n61)
				table.insert(v1044.options, t1.ImageStringProp_ConditionalOption.decode(v1049))
			else
				local v1050, v1051 = proto.readVarInt(p90, n61)

				n61 = v1051 + v1050
			end
		elseif v1047 == proto.wireTypes.i32 then
			local v1052

			v1052, n61 = proto.readFixed32(p90, n61)
		elseif v1047 == proto.wireTypes.i64 then
			local v1053

			v1053, n61 = proto.readFixed64(p90, n61)
		else
			error("Unsupported wire type: " .. v1047)
		end
	end

	return v1044
end
function t134.jsonEncode(p91) -- line: 7265
	local t136 = {}

	if p91.options ~= nil and #p91.options > 0 then
		local t137 = {}

		for _, v1058 in p91.options do
			table.insert(t137, v1058:jsonEncode())
		end

		t136.options = t137
	end

	return t136
end
function t134.jsonDecode(t138: {[any]: any}) -- line: 7279
	-- upvalues: t134 (copy), t1 (copy)
	local v1060 = t134.new()

	if t138.options ~= nil then
		local t139 = {}

		for _, v1063 in t138.options do
			table.insert(t139, t1.ImageStringProp_ConditionalOption.jsonDecode(v1063))
		end

		v1060.options = t139
	end

	return v1060
end

t134.descriptor = {
	name = "ImageStringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.ImageStringProp_ConditionalOptions = t134
typeRegistry.default:register(t1.ImageStringProp_ConditionalOptions)

local t140 = {}

t140.__index = t140

function t140.new(t141: {[any]: any}?) -- line: 7310
	-- upvalues: t140 (copy)
	return (setmetatable({
		kind = if t141 ~= nil and t141.kind ~= nil then t141.kind else nil
	}, t140))
end
function t140.encode(p92) -- line: 7316
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n62 = 0

	if p92.kind ~= nil then
		if p92.kind.type == "literal" then
			local v1068, v1069 = proto.writeTag(buf, n62, 1, proto.wireTypes.lengthDelimited)

			buf, n62 = proto.writeString(v1068, v1069, p92.kind.value)
		elseif p92.kind.type == "binding_path" then
			local v1070, v1071 = proto.writeTag(buf, n62, 2, proto.wireTypes.lengthDelimited)

			buf, n62 = proto.writeString(v1070, v1071, p92.kind.value)
		elseif p92.kind.type == "format" then
			local v1072 = p92.kind.value:encode()
			local v1073, v1074 = proto.writeTag(buf, n62, 3, proto.wireTypes.lengthDelimited)

			buf, n62 = proto.writeBuffer(v1073, v1074, v1072, buffer.len(v1072))
		elseif p92.kind.type == "conditional" then
			local v1075 = p92.kind.value:encode()
			local v1076, v1077 = proto.writeTag(buf, n62, 4, proto.wireTypes.lengthDelimited)

			buf, n62 = proto.writeBuffer(v1076, v1077, v1075, buffer.len(v1075))
		elseif p92.kind.type == "translation" then
			local v1078 = p92.kind.value:encode()
			local v1079, v1080 = proto.writeTag(buf, n62, 5, proto.wireTypes.lengthDelimited)

			buf, n62 = proto.writeBuffer(v1079, v1080, v1078, buffer.len(v1078))
		end
	end

	local buf33 = buffer.create(n62)

	buffer.copy(buf33, 0, buf, 0, n62)

	return buf33
end
function t140.decode(p93: buffer) -- line: 7347
	-- upvalues: t140 (copy), proto (copy), t1 (copy)
	local v1083 = t140.new()
	local n63 = 0

	while n63 < buffer.len(p93) do
		local v1085, v1086

		v1085, v1086, n63 = proto.readTag(p93, n63)

		if v1086 == proto.wireTypes.varint then
			local v1087

			v1087, n63 = proto.readVarInt(p93, n63)
		elseif v1086 == proto.wireTypes.lengthDelimited then
			if v1085 == 1 then
				local v1088

				v1088, n63 = proto.readBuffer(p93, n63)
				v1083.kind = {
					type = "literal",
					value = buffer.tostring(v1088)
				}
			elseif v1085 == 2 then
				local v1089

				v1089, n63 = proto.readBuffer(p93, n63)
				v1083.kind = {
					type = "binding_path",
					value = buffer.tostring(v1089)
				}
			elseif v1085 == 3 then
				local v1090

				v1090, n63 = proto.readBuffer(p93, n63)
				v1083.kind = {
					type = "format",
					value = t1.StringFormat.decode(v1090)
				}
			elseif v1085 == 4 then
				local v1091

				v1091, n63 = proto.readBuffer(p93, n63)
				v1083.kind = {
					type = "conditional",
					value = t1.ImageSetProp_ConditionalOptions.decode(v1091)
				}
			elseif v1085 == 5 then
				local v1092

				v1092, n63 = proto.readBuffer(p93, n63)
				v1083.kind = {
					type = "translation",
					value = t1.TranslationRef.decode(v1092)
				}
			else
				local v1093, v1094 = proto.readVarInt(p93, n63)

				n63 = v1094 + v1093
			end
		elseif v1086 == proto.wireTypes.i32 then
			local v1095

			v1095, n63 = proto.readFixed32(p93, n63)
		elseif v1086 == proto.wireTypes.i64 then
			local v1096

			v1096, n63 = proto.readFixed64(p93, n63)
		else
			error("Unsupported wire type: " .. v1086)
		end
	end

	return v1083
end
function t140.jsonEncode(p94) -- line: 7410
	local t142 = {}

	if p94.kind ~= nil then
		if p94.kind.type == "literal" then
			t142.literal = p94.kind.value

			return t142
		end

		if p94.kind.type == "binding_path" then
			t142.bindingPath = p94.kind.value

			return t142
		end

		if p94.kind.type == "format" then
			t142.format = p94.kind.value:jsonEncode()

			return t142
		end

		if p94.kind.type == "conditional" then
			t142.conditional = p94.kind.value:jsonEncode()

			return t142
		end

		if p94.kind.type == "translation" then
			t142.translation = p94.kind.value:jsonEncode()
		end
	end

	return t142
end
function t140.jsonDecode(t143: {[any]: any}) -- line: 7430
	-- upvalues: t140 (copy), t1 (copy)
	local v1100 = t140.new()

	if t143.literal ~= nil then
		v1100.kind = {
			type = "literal",
			value = t143.literal
		}
	end

	if t143.binding_path ~= nil then
		v1100.kind = {
			type = "binding_path",
			value = t143.binding_path
		}
	end

	if t143.bindingPath ~= nil then
		v1100.kind = {
			type = "binding_path",
			value = t143.bindingPath
		}
	end

	if t143.format ~= nil then
		v1100.kind = {
			type = "format",
			value = t1.StringFormat.jsonDecode(t143.format)
		}
	end

	if t143.conditional ~= nil then
		v1100.kind = {
			type = "conditional",
			value = t1.ImageSetProp_ConditionalOptions.jsonDecode(t143.conditional)
		}
	end

	if t143.translation ~= nil then
		v1100.kind = {
			type = "translation",
			value = t1.TranslationRef.jsonDecode(t143.translation)
		}
	end

	return v1100
end

t140.descriptor = {
	name = "ImageSetProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
}
t1.ImageSetProp = t140
typeRegistry.default:register(t1.ImageSetProp)

local t144 = {}

t144.__index = t144

function t144.new(t145: {[any]: any}?) -- line: 7475
	-- upvalues: t144 (copy)
	return (setmetatable({
		condition = if t145 ~= nil and t145.condition ~= nil then t145.condition else nil,
		kind = if t145 ~= nil and t145.kind ~= nil then t145.kind else nil
	}, t144))
end
function t144.encode(p95) -- line: 7484
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n64 = 0

	if p95.condition ~= nil then
		local v1105 = p95.condition:encode()
		local v1106, v1107 = proto.writeTag(buf, n64, 1, proto.wireTypes.lengthDelimited)

		buf, n64 = proto.writeBuffer(v1106, v1107, v1105, buffer.len(v1105))
	end

	if p95.kind ~= nil then
		if p95.kind.type == "literal" then
			local v1108, v1109 = proto.writeTag(buf, n64, 2, proto.wireTypes.lengthDelimited)

			buf, n64 = proto.writeString(v1108, v1109, p95.kind.value)
		elseif p95.kind.type == "binding_path" then
			local v1110, v1111 = proto.writeTag(buf, n64, 3, proto.wireTypes.lengthDelimited)

			buf, n64 = proto.writeString(v1110, v1111, p95.kind.value)
		elseif p95.kind.type == "format" then
			local v1112 = p95.kind.value:encode()
			local v1113, v1114 = proto.writeTag(buf, n64, 4, proto.wireTypes.lengthDelimited)

			buf, n64 = proto.writeBuffer(v1113, v1114, v1112, buffer.len(v1112))
		elseif p95.kind.type == "translation" then
			local v1115 = p95.kind.value:encode()
			local v1116, v1117 = proto.writeTag(buf, n64, 5, proto.wireTypes.lengthDelimited)

			buf, n64 = proto.writeBuffer(v1116, v1117, v1115, buffer.len(v1115))
		end
	end

	local buf34 = buffer.create(n64)

	buffer.copy(buf34, 0, buf, 0, n64)

	return buf34
end
function t144.decode(p96: buffer) -- line: 7517
	-- upvalues: t144 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v1120 = t144.new()
	local n65 = 0

	while n65 < buffer.len(p96) do
		local v1122, v1123

		v1122, v1123, n65 = proto.readTag(p96, n65)

		if v1123 == proto.wireTypes.varint then
			local v1124

			v1124, n65 = proto.readVarInt(p96, n65)
		elseif v1123 == proto.wireTypes.lengthDelimited then
			if v1122 == 1 then
				local v1125

				v1125, n65 = proto.readBuffer(p96, n65)
				v1120.condition = prop_condition.PropCondition.decode(v1125)
			elseif v1122 == 2 then
				local v1126

				v1126, n65 = proto.readBuffer(p96, n65)
				v1120.kind = {
					type = "literal",
					value = buffer.tostring(v1126)
				}
			elseif v1122 == 3 then
				local v1127

				v1127, n65 = proto.readBuffer(p96, n65)
				v1120.kind = {
					type = "binding_path",
					value = buffer.tostring(v1127)
				}
			elseif v1122 == 4 then
				local v1128

				v1128, n65 = proto.readBuffer(p96, n65)
				v1120.kind = {
					type = "format",
					value = t1.StringFormat.decode(v1128)
				}
			elseif v1122 == 5 then
				local v1129

				v1129, n65 = proto.readBuffer(p96, n65)
				v1120.kind = {
					type = "translation",
					value = t1.TranslationRef.decode(v1129)
				}
			else
				local v1130, v1131 = proto.readVarInt(p96, n65)

				n65 = v1131 + v1130
			end
		elseif v1123 == proto.wireTypes.i32 then
			local v1132

			v1132, n65 = proto.readFixed32(p96, n65)
		elseif v1123 == proto.wireTypes.i64 then
			local v1133

			v1133, n65 = proto.readFixed64(p96, n65)
		else
			error("Unsupported wire type: " .. v1123)
		end
	end

	return v1120
end
function t144.jsonEncode(p97) -- line: 7580
	local t146 = {}

	if p97.condition ~= nil then
		t146.condition = p97.condition:jsonEncode()
	end

	if p97.kind ~= nil then
		if p97.kind.type == "literal" then
			t146.literal = p97.kind.value

			return t146
		end

		if p97.kind.type == "binding_path" then
			t146.bindingPath = p97.kind.value

			return t146
		end

		if p97.kind.type == "format" then
			t146.format = p97.kind.value:jsonEncode()

			return t146
		end

		if p97.kind.type == "translation" then
			t146.translation = p97.kind.value:jsonEncode()
		end
	end

	return t146
end
function t144.jsonDecode(t147: {[any]: any}) -- line: 7602
	-- upvalues: t144 (copy), prop_condition (copy), t1 (copy)
	local v1137 = t144.new()

	if t147.condition ~= nil then
		v1137.condition = prop_condition.PropCondition.jsonDecode(t147.condition)
	end

	if t147.literal ~= nil then
		v1137.kind = {
			type = "literal",
			value = t147.literal
		}
	end

	if t147.binding_path ~= nil then
		v1137.kind = {
			type = "binding_path",
			value = t147.binding_path
		}
	end

	if t147.bindingPath ~= nil then
		v1137.kind = {
			type = "binding_path",
			value = t147.bindingPath
		}
	end

	if t147.format ~= nil then
		v1137.kind = {
			type = "format",
			value = t1.StringFormat.jsonDecode(t147.format)
		}
	end

	if t147.translation ~= nil then
		v1137.kind = {
			type = "translation",
			value = t1.TranslationRef.jsonDecode(t147.translation)
		}
	end

	return v1137
end

t144.descriptor = {
	name = "ImageSetProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.ImageSetProp_ConditionalOption = t144
typeRegistry.default:register(t1.ImageSetProp_ConditionalOption)

local t148 = {}

t148.__index = t148

function t148.new(t149: {[any]: any}?) -- line: 7647
	-- upvalues: t148 (copy)
	return (setmetatable({
		options = if t149 ~= nil and t149.options ~= nil then t149.options else {}
	}, t148))
end
function t148.encode(p98) -- line: 7655
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n66 = 0

	if p98.options ~= nil and #p98.options > 0 then
		for _, v1143 in p98.options do
			local v1144 = v1143:encode()
			local v1145, v1146 = proto.writeTag(buf, n66, 1, proto.wireTypes.lengthDelimited)

			buf, n66 = proto.writeBuffer(v1145, v1146, v1144, buffer.len(v1144))
		end
	end

	local buf35 = buffer.create(n66)

	buffer.copy(buf35, 0, buf, 0, n66)

	return buf35
end
function t148.decode(p99: buffer) -- line: 7672
	-- upvalues: t148 (copy), proto (copy), t1 (copy)
	local v1149 = t148.new()
	local n67 = 0

	while n67 < buffer.len(p99) do
		local v1151, v1152

		v1151, v1152, n67 = proto.readTag(p99, n67)

		if v1152 == proto.wireTypes.varint then
			local v1153

			v1153, n67 = proto.readVarInt(p99, n67)
		elseif v1152 == proto.wireTypes.lengthDelimited then
			if v1151 == 1 then
				local v1154

				v1154, n67 = proto.readBuffer(p99, n67)
				table.insert(v1149.options, t1.ImageSetProp_ConditionalOption.decode(v1154))
			else
				local v1155, v1156 = proto.readVarInt(p99, n67)

				n67 = v1156 + v1155
			end
		elseif v1152 == proto.wireTypes.i32 then
			local v1157

			v1157, n67 = proto.readFixed32(p99, n67)
		elseif v1152 == proto.wireTypes.i64 then
			local v1158

			v1158, n67 = proto.readFixed64(p99, n67)
		else
			error("Unsupported wire type: " .. v1152)
		end
	end

	return v1149
end
function t148.jsonEncode(p100) -- line: 7715
	local t150 = {}

	if p100.options ~= nil and #p100.options > 0 then
		local t151 = {}

		for _, v1163 in p100.options do
			table.insert(t151, v1163:jsonEncode())
		end

		t150.options = t151
	end

	return t150
end
function t148.jsonDecode(t152: {[any]: any}) -- line: 7729
	-- upvalues: t148 (copy), t1 (copy)
	local v1165 = t148.new()

	if t152.options ~= nil then
		local t153 = {}

		for _, v1168 in t152.options do
			table.insert(t153, t1.ImageSetProp_ConditionalOption.jsonDecode(v1168))
		end

		v1165.options = t153
	end

	return v1165
end

t148.descriptor = {
	name = "ImageSetProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.ImageSetProp_ConditionalOptions = t148
typeRegistry.default:register(t1.ImageSetProp_ConditionalOptions)

local t154 = {}

t154.__index = t154

function t154.new(t155: {[any]: any}?) -- line: 7758
	-- upvalues: t154 (copy)
	return (setmetatable({
		kind = if t155 ~= nil and t155.kind ~= nil then t155.kind else nil
	}, t154))
end
function t154.encode(p101) -- line: 7764
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n68 = 0

	if p101.kind ~= nil then
		if p101.kind.type == "literal" then
			local v1173, v1174 = proto.writeTag(buf, n68, 1, proto.wireTypes.lengthDelimited)

			buf, n68 = proto.writeString(v1173, v1174, p101.kind.value)
		elseif p101.kind.type == "token" then
			local v1175, v1176 = proto.writeTag(buf, n68, 2, proto.wireTypes.lengthDelimited)

			buf, n68 = proto.writeString(v1175, v1176, p101.kind.value)
		elseif p101.kind.type == "conditional" then
			local v1177 = p101.kind.value:encode()
			local v1178, v1179 = proto.writeTag(buf, n68, 3, proto.wireTypes.lengthDelimited)

			buf, n68 = proto.writeBuffer(v1178, v1179, v1177, buffer.len(v1177))
		elseif p101.kind.type == "binding_path" then
			local v1180, v1181 = proto.writeTag(buf, n68, 4, proto.wireTypes.lengthDelimited)

			buf, n68 = proto.writeString(v1180, v1181, p101.kind.value)
		end
	end

	local buf36 = buffer.create(n68)

	buffer.copy(buf36, 0, buf, 0, n68)

	return buf36
end
function t154.decode(p102: buffer) -- line: 7790
	-- upvalues: t154 (copy), proto (copy), t1 (copy)
	local v1184 = t154.new()
	local n69 = 0

	while n69 < buffer.len(p102) do
		local v1186, v1187

		v1186, v1187, n69 = proto.readTag(p102, n69)

		if v1187 == proto.wireTypes.varint then
			local v1188

			v1188, n69 = proto.readVarInt(p102, n69)
		elseif v1187 == proto.wireTypes.lengthDelimited then
			if v1186 == 1 then
				local v1189

				v1189, n69 = proto.readBuffer(p102, n69)
				v1184.kind = {
					type = "literal",
					value = buffer.tostring(v1189)
				}
			elseif v1186 == 2 then
				local v1190

				v1190, n69 = proto.readBuffer(p102, n69)
				v1184.kind = {
					type = "token",
					value = buffer.tostring(v1190)
				}
			elseif v1186 == 3 then
				local v1191

				v1191, n69 = proto.readBuffer(p102, n69)
				v1184.kind = {
					type = "conditional",
					value = t1.ColorProp_ConditionalOptions.decode(v1191)
				}
			elseif v1186 == 4 then
				local v1192

				v1192, n69 = proto.readBuffer(p102, n69)
				v1184.kind = {
					type = "binding_path",
					value = buffer.tostring(v1192)
				}
			else
				local v1193, v1194 = proto.readVarInt(p102, n69)

				n69 = v1194 + v1193
			end
		elseif v1187 == proto.wireTypes.i32 then
			local v1195

			v1195, n69 = proto.readFixed32(p102, n69)
		elseif v1187 == proto.wireTypes.i64 then
			local v1196

			v1196, n69 = proto.readFixed64(p102, n69)
		else
			error("Unsupported wire type: " .. v1187)
		end
	end

	return v1184
end
function t154.jsonEncode(p103) -- line: 7848
	local t156 = {}

	if p103.kind ~= nil then
		if p103.kind.type == "literal" then
			t156.literal = p103.kind.value

			return t156
		end

		if p103.kind.type == "token" then
			t156.token = p103.kind.value

			return t156
		end

		if p103.kind.type == "conditional" then
			t156.conditional = p103.kind.value:jsonEncode()

			return t156
		end

		if p103.kind.type == "binding_path" then
			t156.bindingPath = p103.kind.value
		end
	end

	return t156
end
function t154.jsonDecode(t157: {[any]: any}) -- line: 7866
	-- upvalues: t154 (copy), t1 (copy)
	local v1200 = t154.new()

	if t157.literal ~= nil then
		v1200.kind = {
			type = "literal",
			value = t157.literal
		}
	end

	if t157.token ~= nil then
		v1200.kind = {
			type = "token",
			value = t157.token
		}
	end

	if t157.conditional ~= nil then
		v1200.kind = {
			type = "conditional",
			value = t1.ColorProp_ConditionalOptions.jsonDecode(t157.conditional)
		}
	end

	if t157.binding_path ~= nil then
		v1200.kind = {
			type = "binding_path",
			value = t157.binding_path
		}
	end

	if t157.bindingPath ~= nil then
		v1200.kind = {
			type = "binding_path",
			value = t157.bindingPath
		}
	end

	return v1200
end

t154.descriptor = {
	name = "ColorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
}
t1.ColorProp = t154
typeRegistry.default:register(t1.ColorProp)

local t158 = {}

t158.__index = t158

function t158.new(t159: {[any]: any}?) -- line: 7907
	-- upvalues: t158 (copy)
	return (setmetatable({
		condition = if t159 ~= nil and t159.condition ~= nil then t159.condition else nil,
		kind = if t159 ~= nil and t159.kind ~= nil then t159.kind else nil
	}, t158))
end
function t158.encode(p104) -- line: 7916
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n70 = 0

	if p104.condition ~= nil then
		local v1205 = p104.condition:encode()
		local v1206, v1207 = proto.writeTag(buf, n70, 1, proto.wireTypes.lengthDelimited)

		buf, n70 = proto.writeBuffer(v1206, v1207, v1205, buffer.len(v1205))
	end

	if p104.kind ~= nil then
		if p104.kind.type == "literal" then
			local v1208, v1209 = proto.writeTag(buf, n70, 2, proto.wireTypes.lengthDelimited)

			buf, n70 = proto.writeString(v1208, v1209, p104.kind.value)
		elseif p104.kind.type == "token" then
			local v1210, v1211 = proto.writeTag(buf, n70, 3, proto.wireTypes.lengthDelimited)

			buf, n70 = proto.writeString(v1210, v1211, p104.kind.value)
		elseif p104.kind.type == "binding_path" then
			local v1212, v1213 = proto.writeTag(buf, n70, 4, proto.wireTypes.lengthDelimited)

			buf, n70 = proto.writeString(v1212, v1213, p104.kind.value)
		end
	end

	local buf37 = buffer.create(n70)

	buffer.copy(buf37, 0, buf, 0, n70)

	return buf37
end
function t158.decode(p105: buffer) -- line: 7944
	-- upvalues: t158 (copy), proto (copy), prop_condition (copy)
	local v1216 = t158.new()
	local n71 = 0

	while n71 < buffer.len(p105) do
		local v1218, v1219

		v1218, v1219, n71 = proto.readTag(p105, n71)

		if v1219 == proto.wireTypes.varint then
			local v1220

			v1220, n71 = proto.readVarInt(p105, n71)
		elseif v1219 == proto.wireTypes.lengthDelimited then
			if v1218 == 1 then
				local v1221

				v1221, n71 = proto.readBuffer(p105, n71)
				v1216.condition = prop_condition.PropCondition.decode(v1221)
			elseif v1218 == 2 then
				local v1222

				v1222, n71 = proto.readBuffer(p105, n71)
				v1216.kind = {
					type = "literal",
					value = buffer.tostring(v1222)
				}
			elseif v1218 == 3 then
				local v1223

				v1223, n71 = proto.readBuffer(p105, n71)
				v1216.kind = {
					type = "token",
					value = buffer.tostring(v1223)
				}
			elseif v1218 == 4 then
				local v1224

				v1224, n71 = proto.readBuffer(p105, n71)
				v1216.kind = {
					type = "binding_path",
					value = buffer.tostring(v1224)
				}
			else
				local v1225, v1226 = proto.readVarInt(p105, n71)

				n71 = v1226 + v1225
			end
		elseif v1219 == proto.wireTypes.i32 then
			local v1227

			v1227, n71 = proto.readFixed32(p105, n71)
		elseif v1219 == proto.wireTypes.i64 then
			local v1228

			v1228, n71 = proto.readFixed64(p105, n71)
		else
			error("Unsupported wire type: " .. v1219)
		end
	end

	return v1216
end
function t158.jsonEncode(p106) -- line: 8002
	local t160 = {}

	if p106.condition ~= nil then
		t160.condition = p106.condition:jsonEncode()
	end

	if p106.kind ~= nil then
		if p106.kind.type == "literal" then
			t160.literal = p106.kind.value

			return t160
		end

		if p106.kind.type == "token" then
			t160.token = p106.kind.value

			return t160
		end

		if p106.kind.type == "binding_path" then
			t160.bindingPath = p106.kind.value
		end
	end

	return t160
end
function t158.jsonDecode(t161: {[any]: any}) -- line: 8022
	-- upvalues: t158 (copy), prop_condition (copy)
	local v1232 = t158.new()

	if t161.condition ~= nil then
		v1232.condition = prop_condition.PropCondition.jsonDecode(t161.condition)
	end

	if t161.literal ~= nil then
		v1232.kind = {
			type = "literal",
			value = t161.literal
		}
	end

	if t161.token ~= nil then
		v1232.kind = {
			type = "token",
			value = t161.token
		}
	end

	if t161.binding_path ~= nil then
		v1232.kind = {
			type = "binding_path",
			value = t161.binding_path
		}
	end

	if t161.bindingPath ~= nil then
		v1232.kind = {
			type = "binding_path",
			value = t161.bindingPath
		}
	end

	return v1232
end

t158.descriptor = {
	name = "ColorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.ColorProp_ConditionalOption = t158
typeRegistry.default:register(t1.ColorProp_ConditionalOption)

local t162 = {}

t162.__index = t162

function t162.new(t163: {[any]: any}?) -- line: 8063
	-- upvalues: t162 (copy)
	return (setmetatable({
		options = if t163 ~= nil and t163.options ~= nil then t163.options else {}
	}, t162))
end
function t162.encode(p107) -- line: 8071
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n72 = 0

	if p107.options ~= nil and #p107.options > 0 then
		for _, v1238 in p107.options do
			local v1239 = v1238:encode()
			local v1240, v1241 = proto.writeTag(buf, n72, 1, proto.wireTypes.lengthDelimited)

			buf, n72 = proto.writeBuffer(v1240, v1241, v1239, buffer.len(v1239))
		end
	end

	local buf38 = buffer.create(n72)

	buffer.copy(buf38, 0, buf, 0, n72)

	return buf38
end
function t162.decode(p108: buffer) -- line: 8088
	-- upvalues: t162 (copy), proto (copy), t1 (copy)
	local v1244 = t162.new()
	local n73 = 0

	while n73 < buffer.len(p108) do
		local v1246, v1247

		v1246, v1247, n73 = proto.readTag(p108, n73)

		if v1247 == proto.wireTypes.varint then
			local v1248

			v1248, n73 = proto.readVarInt(p108, n73)
		elseif v1247 == proto.wireTypes.lengthDelimited then
			if v1246 == 1 then
				local v1249

				v1249, n73 = proto.readBuffer(p108, n73)
				table.insert(v1244.options, t1.ColorProp_ConditionalOption.decode(v1249))
			else
				local v1250, v1251 = proto.readVarInt(p108, n73)

				n73 = v1251 + v1250
			end
		elseif v1247 == proto.wireTypes.i32 then
			local v1252

			v1252, n73 = proto.readFixed32(p108, n73)
		elseif v1247 == proto.wireTypes.i64 then
			local v1253

			v1253, n73 = proto.readFixed64(p108, n73)
		else
			error("Unsupported wire type: " .. v1247)
		end
	end

	return v1244
end
function t162.jsonEncode(p109) -- line: 8131
	local t164 = {}

	if p109.options ~= nil and #p109.options > 0 then
		local t165 = {}

		for _, v1258 in p109.options do
			table.insert(t165, v1258:jsonEncode())
		end

		t164.options = t165
	end

	return t164
end
function t162.jsonDecode(t166: {[any]: any}) -- line: 8145
	-- upvalues: t162 (copy), t1 (copy)
	local v1260 = t162.new()

	if t166.options ~= nil then
		local t167 = {}

		for _, v1263 in t166.options do
			table.insert(t167, t1.ColorProp_ConditionalOption.jsonDecode(v1263))
		end

		v1260.options = t167
	end

	return v1260
end

t162.descriptor = {
	name = "ColorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.ColorProp_ConditionalOptions = t162
typeRegistry.default:register(t1.ColorProp_ConditionalOptions)

local t168 = {}

t168.__index = t168

function t168.new(t169: {[any]: any}?) -- line: 8174
	-- upvalues: t168 (copy)
	return (setmetatable({
		kind = if t169 ~= nil and t169.kind ~= nil then t169.kind else nil
	}, t168))
end
function t168.encode(p110) -- line: 8180
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n74 = 0

	if p110.kind ~= nil then
		if p110.kind.type == "token" then
			local v1268, v1269 = proto.writeTag(buf, n74, 1, proto.wireTypes.lengthDelimited)

			buf, n74 = proto.writeString(v1268, v1269, p110.kind.value)
		elseif p110.kind.type == "conditional" then
			local v1270 = p110.kind.value:encode()
			local v1271, v1272 = proto.writeTag(buf, n74, 2, proto.wireTypes.lengthDelimited)

			buf, n74 = proto.writeBuffer(v1271, v1272, v1270, buffer.len(v1270))
		end
	end

	local buf39 = buffer.create(n74)

	buffer.copy(buf39, 0, buf, 0, n74)

	return buf39
end
function t168.decode(p111: buffer) -- line: 8200
	-- upvalues: t168 (copy), proto (copy), t1 (copy)
	local v1275 = t168.new()
	local n75 = 0

	while n75 < buffer.len(p111) do
		local v1277, v1278

		v1277, v1278, n75 = proto.readTag(p111, n75)

		if v1278 == proto.wireTypes.varint then
			local v1279

			v1279, n75 = proto.readVarInt(p111, n75)
		elseif v1278 == proto.wireTypes.lengthDelimited then
			if v1277 == 1 then
				local v1280

				v1280, n75 = proto.readBuffer(p111, n75)
				v1275.kind = {
					type = "token",
					value = buffer.tostring(v1280)
				}
			elseif v1277 == 2 then
				local v1281

				v1281, n75 = proto.readBuffer(p111, n75)
				v1275.kind = {
					type = "conditional",
					value = t1.TypographyProp_ConditionalOptions.decode(v1281)
				}
			else
				local v1282, v1283 = proto.readVarInt(p111, n75)

				n75 = v1283 + v1282
			end
		elseif v1278 == proto.wireTypes.i32 then
			local v1284

			v1284, n75 = proto.readFixed32(p111, n75)
		elseif v1278 == proto.wireTypes.i64 then
			local v1285

			v1285, n75 = proto.readFixed64(p111, n75)
		else
			error("Unsupported wire type: " .. v1278)
		end
	end

	return v1275
end
function t168.jsonEncode(p112) -- line: 8249
	local t170 = {}

	if p112.kind ~= nil then
		if p112.kind.type == "token" then
			t170.token = p112.kind.value

			return t170
		end

		if p112.kind.type == "conditional" then
			t170.conditional = p112.kind.value:jsonEncode()
		end
	end

	return t170
end
function t168.jsonDecode(t171: {[any]: any}) -- line: 8263
	-- upvalues: t168 (copy), t1 (copy)
	local v1289 = t168.new()

	if t171.token ~= nil then
		v1289.kind = {
			type = "token",
			value = t171.token
		}
	end

	if t171.conditional ~= nil then
		v1289.kind = {
			type = "conditional",
			value = t1.TypographyProp_ConditionalOptions.jsonDecode(t171.conditional)
		}
	end

	return v1289
end

t168.descriptor = {
	name = "TypographyProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
}
t1.TypographyProp = t168
typeRegistry.default:register(t1.TypographyProp)

local t172 = {}

t172.__index = t172

function t172.new(t173: {[any]: any}?) -- line: 8294
	-- upvalues: t172 (copy)
	return (setmetatable({
		condition = if t173 ~= nil and t173.condition ~= nil then t173.condition else nil,
		kind = if t173 ~= nil and t173.kind ~= nil then t173.kind else nil
	}, t172))
end
function t172.encode(p113) -- line: 8303
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n76 = 0

	if p113.condition ~= nil then
		local v1294 = p113.condition:encode()
		local v1295, v1296 = proto.writeTag(buf, n76, 1, proto.wireTypes.lengthDelimited)

		buf, n76 = proto.writeBuffer(v1295, v1296, v1294, buffer.len(v1294))
	end

	if p113.kind ~= nil and p113.kind.type == "token" then
		local v1297, v1298 = proto.writeTag(buf, n76, 2, proto.wireTypes.lengthDelimited)

		buf, n76 = proto.writeString(v1297, v1298, p113.kind.value)
	end

	local buf40 = buffer.create(n76)

	buffer.copy(buf40, 0, buf, 0, n76)

	return buf40
end
function t172.decode(p114: buffer) -- line: 8325
	-- upvalues: t172 (copy), proto (copy), prop_condition (copy)
	local v1301 = t172.new()
	local n77 = 0

	while n77 < buffer.len(p114) do
		local v1303, v1304

		v1303, v1304, n77 = proto.readTag(p114, n77)

		if v1304 == proto.wireTypes.varint then
			local v1305

			v1305, n77 = proto.readVarInt(p114, n77)
		elseif v1304 == proto.wireTypes.lengthDelimited then
			if v1303 == 1 then
				local v1306

				v1306, n77 = proto.readBuffer(p114, n77)
				v1301.condition = prop_condition.PropCondition.decode(v1306)
			elseif v1303 == 2 then
				local v1307

				v1307, n77 = proto.readBuffer(p114, n77)
				v1301.kind = {
					type = "token",
					value = buffer.tostring(v1307)
				}
			else
				local v1308, v1309 = proto.readVarInt(p114, n77)

				n77 = v1309 + v1308
			end
		elseif v1304 == proto.wireTypes.i32 then
			local v1310

			v1310, n77 = proto.readFixed32(p114, n77)
		elseif v1304 == proto.wireTypes.i64 then
			local v1311

			v1311, n77 = proto.readFixed64(p114, n77)
		else
			error("Unsupported wire type: " .. v1304)
		end
	end

	return v1301
end
function t172.jsonEncode(p115) -- line: 8373
	local t174 = {}

	if p115.condition ~= nil then
		t174.condition = p115.condition:jsonEncode()
	end

	if p115.kind ~= nil and p115.kind.type == "token" then
		t174.token = p115.kind.value
	end

	return t174
end
function t172.jsonDecode(t175: {[any]: any}) -- line: 8389
	-- upvalues: t172 (copy), prop_condition (copy)
	local v1315 = t172.new()

	if t175.condition ~= nil then
		v1315.condition = prop_condition.PropCondition.jsonDecode(t175.condition)
	end

	if t175.token ~= nil then
		v1315.kind = {
			type = "token",
			value = t175.token
		}
	end

	return v1315
end

t172.descriptor = {
	name = "TypographyProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.TypographyProp_ConditionalOption = t172
typeRegistry.default:register(t1.TypographyProp_ConditionalOption)

local t176 = {}

t176.__index = t176

function t176.new(t177: {[any]: any}?) -- line: 8420
	-- upvalues: t176 (copy)
	return (setmetatable({
		options = if t177 ~= nil and t177.options ~= nil then t177.options else {}
	}, t176))
end
function t176.encode(p116) -- line: 8428
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n78 = 0

	if p116.options ~= nil and #p116.options > 0 then
		for _, v1321 in p116.options do
			local v1322 = v1321:encode()
			local v1323, v1324 = proto.writeTag(buf, n78, 1, proto.wireTypes.lengthDelimited)

			buf, n78 = proto.writeBuffer(v1323, v1324, v1322, buffer.len(v1322))
		end
	end

	local buf41 = buffer.create(n78)

	buffer.copy(buf41, 0, buf, 0, n78)

	return buf41
end
function t176.decode(p117: buffer) -- line: 8445
	-- upvalues: t176 (copy), proto (copy), t1 (copy)
	local v1327 = t176.new()
	local n79 = 0

	while n79 < buffer.len(p117) do
		local v1329, v1330

		v1329, v1330, n79 = proto.readTag(p117, n79)

		if v1330 == proto.wireTypes.varint then
			local v1331

			v1331, n79 = proto.readVarInt(p117, n79)
		elseif v1330 == proto.wireTypes.lengthDelimited then
			if v1329 == 1 then
				local v1332

				v1332, n79 = proto.readBuffer(p117, n79)
				table.insert(v1327.options, t1.TypographyProp_ConditionalOption.decode(v1332))
			else
				local v1333, v1334 = proto.readVarInt(p117, n79)

				n79 = v1334 + v1333
			end
		elseif v1330 == proto.wireTypes.i32 then
			local v1335

			v1335, n79 = proto.readFixed32(p117, n79)
		elseif v1330 == proto.wireTypes.i64 then
			local v1336

			v1336, n79 = proto.readFixed64(p117, n79)
		else
			error("Unsupported wire type: " .. v1330)
		end
	end

	return v1327
end
function t176.jsonEncode(p118) -- line: 8488
	local t178 = {}

	if p118.options ~= nil and #p118.options > 0 then
		local t179 = {}

		for _, v1341 in p118.options do
			table.insert(t179, v1341:jsonEncode())
		end

		t178.options = t179
	end

	return t178
end
function t176.jsonDecode(t180: {[any]: any}) -- line: 8502
	-- upvalues: t176 (copy), t1 (copy)
	local v1343 = t176.new()

	if t180.options ~= nil then
		local t181 = {}

		for _, v1346 in t180.options do
			table.insert(t181, t1.TypographyProp_ConditionalOption.jsonDecode(v1346))
		end

		v1343.options = t181
	end

	return v1343
end

t176.descriptor = {
	name = "TypographyProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.TypographyProp_ConditionalOptions = t176
typeRegistry.default:register(t1.TypographyProp_ConditionalOptions)

local t182 = {}

t182.__index = t182

function t182.new(t183: {[any]: any}?) -- line: 8533
	-- upvalues: t182 (copy)
	return (setmetatable({
		kind = if t183 ~= nil and t183.kind ~= nil then t183.kind else nil
	}, t182))
end
function t182.encode(p119) -- line: 8539
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n80 = 0

	if p119.kind ~= nil then
		if p119.kind.type == "token" then
			local v1351, v1352 = proto.writeTag(buf, n80, 1, proto.wireTypes.lengthDelimited)

			buf, n80 = proto.writeString(v1351, v1352, p119.kind.value)
		elseif p119.kind.type == "conditional" then
			local v1353 = p119.kind.value:encode()
			local v1354, v1355 = proto.writeTag(buf, n80, 2, proto.wireTypes.lengthDelimited)

			buf, n80 = proto.writeBuffer(v1354, v1355, v1353, buffer.len(v1353))
		end
	end

	local buf42 = buffer.create(n80)

	buffer.copy(buf42, 0, buf, 0, n80)

	return buf42
end
function t182.decode(p120: buffer) -- line: 8559
	-- upvalues: t182 (copy), proto (copy), t1 (copy)
	local v1358 = t182.new()
	local n81 = 0

	while n81 < buffer.len(p120) do
		local v1360, v1361

		v1360, v1361, n81 = proto.readTag(p120, n81)

		if v1361 == proto.wireTypes.varint then
			local v1362

			v1362, n81 = proto.readVarInt(p120, n81)
		elseif v1361 == proto.wireTypes.lengthDelimited then
			if v1360 == 1 then
				local v1363

				v1363, n81 = proto.readBuffer(p120, n81)
				v1358.kind = {
					type = "token",
					value = buffer.tostring(v1363)
				}
			elseif v1360 == 2 then
				local v1364

				v1364, n81 = proto.readBuffer(p120, n81)
				v1358.kind = {
					type = "conditional",
					value = t1.TypographyFontProp_ConditionalOptions.decode(v1364)
				}
			else
				local v1365, v1366 = proto.readVarInt(p120, n81)

				n81 = v1366 + v1365
			end
		elseif v1361 == proto.wireTypes.i32 then
			local v1367

			v1367, n81 = proto.readFixed32(p120, n81)
		elseif v1361 == proto.wireTypes.i64 then
			local v1368

			v1368, n81 = proto.readFixed64(p120, n81)
		else
			error("Unsupported wire type: " .. v1361)
		end
	end

	return v1358
end
function t182.jsonEncode(p121) -- line: 8608
	local t184 = {}

	if p121.kind ~= nil then
		if p121.kind.type == "token" then
			t184.token = p121.kind.value

			return t184
		end

		if p121.kind.type == "conditional" then
			t184.conditional = p121.kind.value:jsonEncode()
		end
	end

	return t184
end
function t182.jsonDecode(t185: {[any]: any}) -- line: 8622
	-- upvalues: t182 (copy), t1 (copy)
	local v1372 = t182.new()

	if t185.token ~= nil then
		v1372.kind = {
			type = "token",
			value = t185.token
		}
	end

	if t185.conditional ~= nil then
		v1372.kind = {
			type = "conditional",
			value = t1.TypographyFontProp_ConditionalOptions.jsonDecode(t185.conditional)
		}
	end

	return v1372
end

t182.descriptor = {
	name = "TypographyFontProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
}
t1.TypographyFontProp = t182
typeRegistry.default:register(t1.TypographyFontProp)

local t186 = {}

t186.__index = t186

function t186.new(t187: {[any]: any}?) -- line: 8653
	-- upvalues: t186 (copy)
	return (setmetatable({
		condition = if t187 ~= nil and t187.condition ~= nil then t187.condition else nil,
		kind = if t187 ~= nil and t187.kind ~= nil then t187.kind else nil
	}, t186))
end
function t186.encode(p122) -- line: 8662
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n82 = 0

	if p122.condition ~= nil then
		local v1377 = p122.condition:encode()
		local v1378, v1379 = proto.writeTag(buf, n82, 1, proto.wireTypes.lengthDelimited)

		buf, n82 = proto.writeBuffer(v1378, v1379, v1377, buffer.len(v1377))
	end

	if p122.kind ~= nil and p122.kind.type == "token" then
		local v1380, v1381 = proto.writeTag(buf, n82, 2, proto.wireTypes.lengthDelimited)

		buf, n82 = proto.writeString(v1380, v1381, p122.kind.value)
	end

	local buf43 = buffer.create(n82)

	buffer.copy(buf43, 0, buf, 0, n82)

	return buf43
end
function t186.decode(p123: buffer) -- line: 8684
	-- upvalues: t186 (copy), proto (copy), prop_condition (copy)
	local v1384 = t186.new()
	local n83 = 0

	while n83 < buffer.len(p123) do
		local v1386, v1387

		v1386, v1387, n83 = proto.readTag(p123, n83)

		if v1387 == proto.wireTypes.varint then
			local v1388

			v1388, n83 = proto.readVarInt(p123, n83)
		elseif v1387 == proto.wireTypes.lengthDelimited then
			if v1386 == 1 then
				local v1389

				v1389, n83 = proto.readBuffer(p123, n83)
				v1384.condition = prop_condition.PropCondition.decode(v1389)
			elseif v1386 == 2 then
				local v1390

				v1390, n83 = proto.readBuffer(p123, n83)
				v1384.kind = {
					type = "token",
					value = buffer.tostring(v1390)
				}
			else
				local v1391, v1392 = proto.readVarInt(p123, n83)

				n83 = v1392 + v1391
			end
		elseif v1387 == proto.wireTypes.i32 then
			local v1393

			v1393, n83 = proto.readFixed32(p123, n83)
		elseif v1387 == proto.wireTypes.i64 then
			local v1394

			v1394, n83 = proto.readFixed64(p123, n83)
		else
			error("Unsupported wire type: " .. v1387)
		end
	end

	return v1384
end
function t186.jsonEncode(p124) -- line: 8732
	local t188 = {}

	if p124.condition ~= nil then
		t188.condition = p124.condition:jsonEncode()
	end

	if p124.kind ~= nil and p124.kind.type == "token" then
		t188.token = p124.kind.value
	end

	return t188
end
function t186.jsonDecode(t189: {[any]: any}) -- line: 8748
	-- upvalues: t186 (copy), prop_condition (copy)
	local v1398 = t186.new()

	if t189.condition ~= nil then
		v1398.condition = prop_condition.PropCondition.jsonDecode(t189.condition)
	end

	if t189.token ~= nil then
		v1398.kind = {
			type = "token",
			value = t189.token
		}
	end

	return v1398
end

t186.descriptor = {
	name = "TypographyFontProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.TypographyFontProp_ConditionalOption = t186
typeRegistry.default:register(t1.TypographyFontProp_ConditionalOption)

local t190 = {}

t190.__index = t190

function t190.new(t191: {[any]: any}?) -- line: 8779
	-- upvalues: t190 (copy)
	return (setmetatable({
		options = if t191 ~= nil and t191.options ~= nil then t191.options else {}
	}, t190))
end
function t190.encode(p125) -- line: 8787
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n84 = 0

	if p125.options ~= nil and #p125.options > 0 then
		for _, v1404 in p125.options do
			local v1405 = v1404:encode()
			local v1406, v1407 = proto.writeTag(buf, n84, 1, proto.wireTypes.lengthDelimited)

			buf, n84 = proto.writeBuffer(v1406, v1407, v1405, buffer.len(v1405))
		end
	end

	local buf44 = buffer.create(n84)

	buffer.copy(buf44, 0, buf, 0, n84)

	return buf44
end
function t190.decode(p126: buffer) -- line: 8804
	-- upvalues: t190 (copy), proto (copy), t1 (copy)
	local v1410 = t190.new()
	local n85 = 0

	while n85 < buffer.len(p126) do
		local v1412, v1413

		v1412, v1413, n85 = proto.readTag(p126, n85)

		if v1413 == proto.wireTypes.varint then
			local v1414

			v1414, n85 = proto.readVarInt(p126, n85)
		elseif v1413 == proto.wireTypes.lengthDelimited then
			if v1412 == 1 then
				local v1415

				v1415, n85 = proto.readBuffer(p126, n85)
				table.insert(v1410.options, t1.TypographyFontProp_ConditionalOption.decode(v1415))
			else
				local v1416, v1417 = proto.readVarInt(p126, n85)

				n85 = v1417 + v1416
			end
		elseif v1413 == proto.wireTypes.i32 then
			local v1418

			v1418, n85 = proto.readFixed32(p126, n85)
		elseif v1413 == proto.wireTypes.i64 then
			local v1419

			v1419, n85 = proto.readFixed64(p126, n85)
		else
			error("Unsupported wire type: " .. v1413)
		end
	end

	return v1410
end
function t190.jsonEncode(p127) -- line: 8847
	local t192 = {}

	if p127.options ~= nil and #p127.options > 0 then
		local t193 = {}

		for _, v1424 in p127.options do
			table.insert(t193, v1424:jsonEncode())
		end

		t192.options = t193
	end

	return t192
end
function t190.jsonDecode(t194: {[any]: any}) -- line: 8861
	-- upvalues: t190 (copy), t1 (copy)
	local v1426 = t190.new()

	if t194.options ~= nil then
		local t195 = {}

		for _, v1429 in t194.options do
			table.insert(t195, t1.TypographyFontProp_ConditionalOption.jsonDecode(v1429))
		end

		v1426.options = t195
	end

	return v1426
end

t190.descriptor = {
	name = "TypographyFontProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.TypographyFontProp_ConditionalOptions = t190
typeRegistry.default:register(t1.TypographyFontProp_ConditionalOptions)

local t196 = {}

t196.__index = t196

function t196.new(t197: {[any]: any}?) -- line: 8892
	-- upvalues: t196 (copy)
	return (setmetatable({
		kind = if t197 ~= nil and t197.kind ~= nil then t197.kind else nil
	}, t196))
end
function t196.encode(p128) -- line: 8898
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n86 = 0

	if p128.kind ~= nil then
		if p128.kind.type == "token" then
			local v1434, v1435 = proto.writeTag(buf, n86, 1, proto.wireTypes.lengthDelimited)

			buf, n86 = proto.writeString(v1434, v1435, p128.kind.value)
		elseif p128.kind.type == "conditional" then
			local v1436 = p128.kind.value:encode()
			local v1437, v1438 = proto.writeTag(buf, n86, 2, proto.wireTypes.lengthDelimited)

			buf, n86 = proto.writeBuffer(v1437, v1438, v1436, buffer.len(v1436))
		end
	end

	local buf45 = buffer.create(n86)

	buffer.copy(buf45, 0, buf, 0, n86)

	return buf45
end
function t196.decode(p129: buffer) -- line: 8918
	-- upvalues: t196 (copy), proto (copy), t1 (copy)
	local v1441 = t196.new()
	local n87 = 0

	while n87 < buffer.len(p129) do
		local v1443, v1444

		v1443, v1444, n87 = proto.readTag(p129, n87)

		if v1444 == proto.wireTypes.varint then
			local v1445

			v1445, n87 = proto.readVarInt(p129, n87)
		elseif v1444 == proto.wireTypes.lengthDelimited then
			if v1443 == 1 then
				local v1446

				v1446, n87 = proto.readBuffer(p129, n87)
				v1441.kind = {
					type = "token",
					value = buffer.tostring(v1446)
				}
			elseif v1443 == 2 then
				local v1447

				v1447, n87 = proto.readBuffer(p129, n87)
				v1441.kind = {
					type = "conditional",
					value = t1.ColorStyleProp_ConditionalOptions.decode(v1447)
				}
			else
				local v1448, v1449 = proto.readVarInt(p129, n87)

				n87 = v1449 + v1448
			end
		elseif v1444 == proto.wireTypes.i32 then
			local v1450

			v1450, n87 = proto.readFixed32(p129, n87)
		elseif v1444 == proto.wireTypes.i64 then
			local v1451

			v1451, n87 = proto.readFixed64(p129, n87)
		else
			error("Unsupported wire type: " .. v1444)
		end
	end

	return v1441
end
function t196.jsonEncode(p130) -- line: 8967
	local t198 = {}

	if p130.kind ~= nil then
		if p130.kind.type == "token" then
			t198.token = p130.kind.value

			return t198
		end

		if p130.kind.type == "conditional" then
			t198.conditional = p130.kind.value:jsonEncode()
		end
	end

	return t198
end
function t196.jsonDecode(t199: {[any]: any}) -- line: 8981
	-- upvalues: t196 (copy), t1 (copy)
	local v1455 = t196.new()

	if t199.token ~= nil then
		v1455.kind = {
			type = "token",
			value = t199.token
		}
	end

	if t199.conditional ~= nil then
		v1455.kind = {
			type = "conditional",
			value = t1.ColorStyleProp_ConditionalOptions.jsonDecode(t199.conditional)
		}
	end

	return v1455
end

t196.descriptor = {
	name = "ColorStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
}
t1.ColorStyleProp = t196
typeRegistry.default:register(t1.ColorStyleProp)

local t200 = {}

t200.__index = t200

function t200.new(t201: {[any]: any}?) -- line: 9012
	-- upvalues: t200 (copy)
	return (setmetatable({
		condition = if t201 ~= nil and t201.condition ~= nil then t201.condition else nil,
		kind = if t201 ~= nil and t201.kind ~= nil then t201.kind else nil
	}, t200))
end
function t200.encode(p131) -- line: 9021
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n88 = 0

	if p131.condition ~= nil then
		local v1460 = p131.condition:encode()
		local v1461, v1462 = proto.writeTag(buf, n88, 1, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeBuffer(v1461, v1462, v1460, buffer.len(v1460))
	end

	if p131.kind ~= nil and p131.kind.type == "token" then
		local v1463, v1464 = proto.writeTag(buf, n88, 2, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeString(v1463, v1464, p131.kind.value)
	end

	local buf46 = buffer.create(n88)

	buffer.copy(buf46, 0, buf, 0, n88)

	return buf46
end
function t200.decode(p132: buffer) -- line: 9043
	-- upvalues: t200 (copy), proto (copy), prop_condition (copy)
	local v1467 = t200.new()
	local n89 = 0

	while n89 < buffer.len(p132) do
		local v1469, v1470

		v1469, v1470, n89 = proto.readTag(p132, n89)

		if v1470 == proto.wireTypes.varint then
			local v1471

			v1471, n89 = proto.readVarInt(p132, n89)
		elseif v1470 == proto.wireTypes.lengthDelimited then
			if v1469 == 1 then
				local v1472

				v1472, n89 = proto.readBuffer(p132, n89)
				v1467.condition = prop_condition.PropCondition.decode(v1472)
			elseif v1469 == 2 then
				local v1473

				v1473, n89 = proto.readBuffer(p132, n89)
				v1467.kind = {
					type = "token",
					value = buffer.tostring(v1473)
				}
			else
				local v1474, v1475 = proto.readVarInt(p132, n89)

				n89 = v1475 + v1474
			end
		elseif v1470 == proto.wireTypes.i32 then
			local v1476

			v1476, n89 = proto.readFixed32(p132, n89)
		elseif v1470 == proto.wireTypes.i64 then
			local v1477

			v1477, n89 = proto.readFixed64(p132, n89)
		else
			error("Unsupported wire type: " .. v1470)
		end
	end

	return v1467
end
function t200.jsonEncode(p133) -- line: 9091
	local t202 = {}

	if p133.condition ~= nil then
		t202.condition = p133.condition:jsonEncode()
	end

	if p133.kind ~= nil and p133.kind.type == "token" then
		t202.token = p133.kind.value
	end

	return t202
end
function t200.jsonDecode(t203: {[any]: any}) -- line: 9107
	-- upvalues: t200 (copy), prop_condition (copy)
	local v1481 = t200.new()

	if t203.condition ~= nil then
		v1481.condition = prop_condition.PropCondition.jsonDecode(t203.condition)
	end

	if t203.token ~= nil then
		v1481.kind = {
			type = "token",
			value = t203.token
		}
	end

	return v1481
end

t200.descriptor = {
	name = "ColorStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.ColorStyleProp_ConditionalOption = t200
typeRegistry.default:register(t1.ColorStyleProp_ConditionalOption)

local t204 = {}

t204.__index = t204

function t204.new(t205: {[any]: any}?) -- line: 9138
	-- upvalues: t204 (copy)
	return (setmetatable({
		options = if t205 ~= nil and t205.options ~= nil then t205.options else {}
	}, t204))
end
function t204.encode(p134) -- line: 9146
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n90 = 0

	if p134.options ~= nil and #p134.options > 0 then
		for _, v1487 in p134.options do
			local v1488 = v1487:encode()
			local v1489, v1490 = proto.writeTag(buf, n90, 1, proto.wireTypes.lengthDelimited)

			buf, n90 = proto.writeBuffer(v1489, v1490, v1488, buffer.len(v1488))
		end
	end

	local buf47 = buffer.create(n90)

	buffer.copy(buf47, 0, buf, 0, n90)

	return buf47
end
function t204.decode(p135: buffer) -- line: 9163
	-- upvalues: t204 (copy), proto (copy), t1 (copy)
	local v1493 = t204.new()
	local n91 = 0

	while n91 < buffer.len(p135) do
		local v1495, v1496

		v1495, v1496, n91 = proto.readTag(p135, n91)

		if v1496 == proto.wireTypes.varint then
			local v1497

			v1497, n91 = proto.readVarInt(p135, n91)
		elseif v1496 == proto.wireTypes.lengthDelimited then
			if v1495 == 1 then
				local v1498

				v1498, n91 = proto.readBuffer(p135, n91)
				table.insert(v1493.options, t1.ColorStyleProp_ConditionalOption.decode(v1498))
			else
				local v1499, v1500 = proto.readVarInt(p135, n91)

				n91 = v1500 + v1499
			end
		elseif v1496 == proto.wireTypes.i32 then
			local v1501

			v1501, n91 = proto.readFixed32(p135, n91)
		elseif v1496 == proto.wireTypes.i64 then
			local v1502

			v1502, n91 = proto.readFixed64(p135, n91)
		else
			error("Unsupported wire type: " .. v1496)
		end
	end

	return v1493
end
function t204.jsonEncode(p136) -- line: 9206
	local t206 = {}

	if p136.options ~= nil and #p136.options > 0 then
		local t207 = {}

		for _, v1507 in p136.options do
			table.insert(t207, v1507:jsonEncode())
		end

		t206.options = t207
	end

	return t206
end
function t204.jsonDecode(t208: {[any]: any}) -- line: 9220
	-- upvalues: t204 (copy), t1 (copy)
	local v1509 = t204.new()

	if t208.options ~= nil then
		local t209 = {}

		for _, v1512 in t208.options do
			table.insert(t209, t1.ColorStyleProp_ConditionalOption.jsonDecode(v1512))
		end

		v1509.options = t209
	end

	return v1509
end

t204.descriptor = {
	name = "ColorStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.ColorStyleProp_ConditionalOptions = t204
typeRegistry.default:register(t1.ColorStyleProp_ConditionalOptions)

local t210 = {}

t210.__index = t210

function t210.new(t211: {[any]: any}?) -- line: 9251
	-- upvalues: t210 (copy)
	return (setmetatable({
		kind = if t211 ~= nil and t211.kind ~= nil then t211.kind else nil
	}, t210))
end
function t210.encode(p137) -- line: 9257
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n92 = 0

	if p137.kind ~= nil then
		if p137.kind.type == "literal" then
			local v1517, v1518 = proto.writeTag(buf, n92, 1, proto.wireTypes.lengthDelimited)

			buf, n92 = proto.writeString(v1517, v1518, p137.kind.value)
		elseif p137.kind.type == "conditional" then
			local v1519 = p137.kind.value:encode()
			local v1520, v1521 = proto.writeTag(buf, n92, 2, proto.wireTypes.lengthDelimited)

			buf, n92 = proto.writeBuffer(v1520, v1521, v1519, buffer.len(v1519))
		elseif p137.kind.type == "binding_path" then
			local v1522, v1523 = proto.writeTag(buf, n92, 3, proto.wireTypes.lengthDelimited)

			buf, n92 = proto.writeString(v1522, v1523, p137.kind.value)
		end
	end

	local buf48 = buffer.create(n92)

	buffer.copy(buf48, 0, buf, 0, n92)

	return buf48
end
function t210.decode(p138: buffer) -- line: 9280
	-- upvalues: t210 (copy), proto (copy), t1 (copy)
	local v1526 = t210.new()
	local n93 = 0

	while n93 < buffer.len(p138) do
		local v1528, v1529

		v1528, v1529, n93 = proto.readTag(p138, n93)

		if v1529 == proto.wireTypes.varint then
			local v1530

			v1530, n93 = proto.readVarInt(p138, n93)
		elseif v1529 == proto.wireTypes.lengthDelimited then
			if v1528 == 1 then
				local v1531

				v1531, n93 = proto.readBuffer(p138, n93)
				v1526.kind = {
					type = "literal",
					value = buffer.tostring(v1531)
				}
			elseif v1528 == 2 then
				local v1532

				v1532, n93 = proto.readBuffer(p138, n93)
				v1526.kind = {
					type = "conditional",
					value = t1.FillBehaviorProp_ConditionalOptions.decode(v1532)
				}
			elseif v1528 == 3 then
				local v1533

				v1533, n93 = proto.readBuffer(p138, n93)
				v1526.kind = {
					type = "binding_path",
					value = buffer.tostring(v1533)
				}
			else
				local v1534, v1535 = proto.readVarInt(p138, n93)

				n93 = v1535 + v1534
			end
		elseif v1529 == proto.wireTypes.i32 then
			local v1536

			v1536, n93 = proto.readFixed32(p138, n93)
		elseif v1529 == proto.wireTypes.i64 then
			local v1537

			v1537, n93 = proto.readFixed64(p138, n93)
		else
			error("Unsupported wire type: " .. v1529)
		end
	end

	return v1526
end
function t210.jsonEncode(p139) -- line: 9334
	local t212 = {}

	if p139.kind ~= nil then
		if p139.kind.type == "literal" then
			t212.literal = p139.kind.value

			return t212
		end

		if p139.kind.type == "conditional" then
			t212.conditional = p139.kind.value:jsonEncode()

			return t212
		end

		if p139.kind.type == "binding_path" then
			t212.bindingPath = p139.kind.value
		end
	end

	return t212
end
function t210.jsonDecode(t213: {[any]: any}) -- line: 9350
	-- upvalues: t210 (copy), t1 (copy)
	local v1541 = t210.new()

	if t213.literal ~= nil then
		v1541.kind = {
			type = "literal",
			value = t213.literal
		}
	end

	if t213.conditional ~= nil then
		v1541.kind = {
			type = "conditional",
			value = t1.FillBehaviorProp_ConditionalOptions.jsonDecode(t213.conditional)
		}
	end

	if t213.binding_path ~= nil then
		v1541.kind = {
			type = "binding_path",
			value = t213.binding_path
		}
	end

	if t213.bindingPath ~= nil then
		v1541.kind = {
			type = "binding_path",
			value = t213.bindingPath
		}
	end

	return v1541
end

t210.descriptor = {
	name = "FillBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
}
t1.FillBehaviorProp = t210
typeRegistry.default:register(t1.FillBehaviorProp)

local t214 = {}

t214.__index = t214

function t214.new(t215: {[any]: any}?) -- line: 9389
	-- upvalues: t214 (copy)
	return (setmetatable({
		condition = if t215 ~= nil and t215.condition ~= nil then t215.condition else nil,
		kind = if t215 ~= nil and t215.kind ~= nil then t215.kind else nil
	}, t214))
end
function t214.encode(p140) -- line: 9398
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n94 = 0

	if p140.condition ~= nil then
		local v1546 = p140.condition:encode()
		local v1547, v1548 = proto.writeTag(buf, n94, 1, proto.wireTypes.lengthDelimited)

		buf, n94 = proto.writeBuffer(v1547, v1548, v1546, buffer.len(v1546))
	end

	if p140.kind ~= nil then
		if p140.kind.type == "literal" then
			local v1549, v1550 = proto.writeTag(buf, n94, 2, proto.wireTypes.lengthDelimited)

			buf, n94 = proto.writeString(v1549, v1550, p140.kind.value)
		elseif p140.kind.type == "binding_path" then
			local v1551, v1552 = proto.writeTag(buf, n94, 3, proto.wireTypes.lengthDelimited)

			buf, n94 = proto.writeString(v1551, v1552, p140.kind.value)
		end
	end

	local buf49 = buffer.create(n94)

	buffer.copy(buf49, 0, buf, 0, n94)

	return buf49
end
function t214.decode(p141: buffer) -- line: 9423
	-- upvalues: t214 (copy), proto (copy), prop_condition (copy)
	local v1555 = t214.new()
	local n95 = 0

	while n95 < buffer.len(p141) do
		local v1557, v1558

		v1557, v1558, n95 = proto.readTag(p141, n95)

		if v1558 == proto.wireTypes.varint then
			local v1559

			v1559, n95 = proto.readVarInt(p141, n95)
		elseif v1558 == proto.wireTypes.lengthDelimited then
			if v1557 == 1 then
				local v1560

				v1560, n95 = proto.readBuffer(p141, n95)
				v1555.condition = prop_condition.PropCondition.decode(v1560)
			elseif v1557 == 2 then
				local v1561

				v1561, n95 = proto.readBuffer(p141, n95)
				v1555.kind = {
					type = "literal",
					value = buffer.tostring(v1561)
				}
			elseif v1557 == 3 then
				local v1562

				v1562, n95 = proto.readBuffer(p141, n95)
				v1555.kind = {
					type = "binding_path",
					value = buffer.tostring(v1562)
				}
			else
				local v1563, v1564 = proto.readVarInt(p141, n95)

				n95 = v1564 + v1563
			end
		elseif v1558 == proto.wireTypes.i32 then
			local v1565

			v1565, n95 = proto.readFixed32(p141, n95)
		elseif v1558 == proto.wireTypes.i64 then
			local v1566

			v1566, n95 = proto.readFixed64(p141, n95)
		else
			error("Unsupported wire type: " .. v1558)
		end
	end

	return v1555
end
function t214.jsonEncode(p142) -- line: 9476
	local t216 = {}

	if p142.condition ~= nil then
		t216.condition = p142.condition:jsonEncode()
	end

	if p142.kind ~= nil then
		if p142.kind.type == "literal" then
			t216.literal = p142.kind.value

			return t216
		end

		if p142.kind.type == "binding_path" then
			t216.bindingPath = p142.kind.value
		end
	end

	return t216
end
function t214.jsonDecode(t217: {[any]: any}) -- line: 9494
	-- upvalues: t214 (copy), prop_condition (copy)
	local v1570 = t214.new()

	if t217.condition ~= nil then
		v1570.condition = prop_condition.PropCondition.jsonDecode(t217.condition)
	end

	if t217.literal ~= nil then
		v1570.kind = {
			type = "literal",
			value = t217.literal
		}
	end

	if t217.binding_path ~= nil then
		v1570.kind = {
			type = "binding_path",
			value = t217.binding_path
		}
	end

	if t217.bindingPath ~= nil then
		v1570.kind = {
			type = "binding_path",
			value = t217.bindingPath
		}
	end

	return v1570
end

t214.descriptor = {
	name = "FillBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.FillBehaviorProp_ConditionalOption = t214
typeRegistry.default:register(t1.FillBehaviorProp_ConditionalOption)

local t218 = {}

t218.__index = t218

function t218.new(t219: {[any]: any}?) -- line: 9533
	-- upvalues: t218 (copy)
	return (setmetatable({
		options = if t219 ~= nil and t219.options ~= nil then t219.options else {}
	}, t218))
end
function t218.encode(p143) -- line: 9541
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n96 = 0

	if p143.options ~= nil and #p143.options > 0 then
		for _, v1576 in p143.options do
			local v1577 = v1576:encode()
			local v1578, v1579 = proto.writeTag(buf, n96, 1, proto.wireTypes.lengthDelimited)

			buf, n96 = proto.writeBuffer(v1578, v1579, v1577, buffer.len(v1577))
		end
	end

	local buf50 = buffer.create(n96)

	buffer.copy(buf50, 0, buf, 0, n96)

	return buf50
end
function t218.decode(p144: buffer) -- line: 9558
	-- upvalues: t218 (copy), proto (copy), t1 (copy)
	local v1582 = t218.new()
	local n97 = 0

	while n97 < buffer.len(p144) do
		local v1584, v1585

		v1584, v1585, n97 = proto.readTag(p144, n97)

		if v1585 == proto.wireTypes.varint then
			local v1586

			v1586, n97 = proto.readVarInt(p144, n97)
		elseif v1585 == proto.wireTypes.lengthDelimited then
			if v1584 == 1 then
				local v1587

				v1587, n97 = proto.readBuffer(p144, n97)
				table.insert(v1582.options, t1.FillBehaviorProp_ConditionalOption.decode(v1587))
			else
				local v1588, v1589 = proto.readVarInt(p144, n97)

				n97 = v1589 + v1588
			end
		elseif v1585 == proto.wireTypes.i32 then
			local v1590

			v1590, n97 = proto.readFixed32(p144, n97)
		elseif v1585 == proto.wireTypes.i64 then
			local v1591

			v1591, n97 = proto.readFixed64(p144, n97)
		else
			error("Unsupported wire type: " .. v1585)
		end
	end

	return v1582
end
function t218.jsonEncode(p145) -- line: 9601
	local t220 = {}

	if p145.options ~= nil and #p145.options > 0 then
		local t221 = {}

		for _, v1596 in p145.options do
			table.insert(t221, v1596:jsonEncode())
		end

		t220.options = t221
	end

	return t220
end
function t218.jsonDecode(t222: {[any]: any}) -- line: 9615
	-- upvalues: t218 (copy), t1 (copy)
	local v1598 = t218.new()

	if t222.options ~= nil then
		local t223 = {}

		for _, v1601 in t222.options do
			table.insert(t223, t1.FillBehaviorProp_ConditionalOption.jsonDecode(v1601))
		end

		v1598.options = t223
	end

	return v1598
end

t218.descriptor = {
	name = "FillBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.FillBehaviorProp_ConditionalOptions = t218
typeRegistry.default:register(t1.FillBehaviorProp_ConditionalOptions)

local t224 = {}

t224.__index = t224

function t224.new(t225: {[any]: any}?) -- line: 9646
	-- upvalues: t224 (copy)
	return (setmetatable({
		kind = if t225 ~= nil and t225.kind ~= nil then t225.kind else nil
	}, t224))
end
function t224.encode(p146) -- line: 9652
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n98 = 0

	if p146.kind ~= nil then
		if p146.kind.type == "literal" then
			local v1606, v1607 = proto.writeTag(buf, n98, 1, proto.wireTypes.lengthDelimited)

			buf, n98 = proto.writeString(v1606, v1607, p146.kind.value)
		elseif p146.kind.type == "conditional" then
			local v1608 = p146.kind.value:encode()
			local v1609, v1610 = proto.writeTag(buf, n98, 2, proto.wireTypes.lengthDelimited)

			buf, n98 = proto.writeBuffer(v1609, v1610, v1608, buffer.len(v1608))
		elseif p146.kind.type == "binding_path" then
			local v1611, v1612 = proto.writeTag(buf, n98, 3, proto.wireTypes.lengthDelimited)

			buf, n98 = proto.writeString(v1611, v1612, p146.kind.value)
		end
	end

	local buf51 = buffer.create(n98)

	buffer.copy(buf51, 0, buf, 0, n98)

	return buf51
end
function t224.decode(p147: buffer) -- line: 9675
	-- upvalues: t224 (copy), proto (copy), t1 (copy)
	local v1615 = t224.new()
	local n99 = 0

	while n99 < buffer.len(p147) do
		local v1617, v1618

		v1617, v1618, n99 = proto.readTag(p147, n99)

		if v1618 == proto.wireTypes.varint then
			local v1619

			v1619, n99 = proto.readVarInt(p147, n99)
		elseif v1618 == proto.wireTypes.lengthDelimited then
			if v1617 == 1 then
				local v1620

				v1620, n99 = proto.readBuffer(p147, n99)
				v1615.kind = {
					type = "literal",
					value = buffer.tostring(v1620)
				}
			elseif v1617 == 2 then
				local v1621

				v1621, n99 = proto.readBuffer(p147, n99)
				v1615.kind = {
					type = "conditional",
					value = t1.InputSizeProp_ConditionalOptions.decode(v1621)
				}
			elseif v1617 == 3 then
				local v1622

				v1622, n99 = proto.readBuffer(p147, n99)
				v1615.kind = {
					type = "binding_path",
					value = buffer.tostring(v1622)
				}
			else
				local v1623, v1624 = proto.readVarInt(p147, n99)

				n99 = v1624 + v1623
			end
		elseif v1618 == proto.wireTypes.i32 then
			local v1625

			v1625, n99 = proto.readFixed32(p147, n99)
		elseif v1618 == proto.wireTypes.i64 then
			local v1626

			v1626, n99 = proto.readFixed64(p147, n99)
		else
			error("Unsupported wire type: " .. v1618)
		end
	end

	return v1615
end
function t224.jsonEncode(p148) -- line: 9729
	local t226 = {}

	if p148.kind ~= nil then
		if p148.kind.type == "literal" then
			t226.literal = p148.kind.value

			return t226
		end

		if p148.kind.type == "conditional" then
			t226.conditional = p148.kind.value:jsonEncode()

			return t226
		end

		if p148.kind.type == "binding_path" then
			t226.bindingPath = p148.kind.value
		end
	end

	return t226
end
function t224.jsonDecode(t227: {[any]: any}) -- line: 9745
	-- upvalues: t224 (copy), t1 (copy)
	local v1630 = t224.new()

	if t227.literal ~= nil then
		v1630.kind = {
			type = "literal",
			value = t227.literal
		}
	end

	if t227.conditional ~= nil then
		v1630.kind = {
			type = "conditional",
			value = t1.InputSizeProp_ConditionalOptions.jsonDecode(t227.conditional)
		}
	end

	if t227.binding_path ~= nil then
		v1630.kind = {
			type = "binding_path",
			value = t227.binding_path
		}
	end

	if t227.bindingPath ~= nil then
		v1630.kind = {
			type = "binding_path",
			value = t227.bindingPath
		}
	end

	return v1630
end

t224.descriptor = {
	name = "InputSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
}
t1.InputSizeProp = t224
typeRegistry.default:register(t1.InputSizeProp)

local t228 = {}

t228.__index = t228

function t228.new(t229: {[any]: any}?) -- line: 9784
	-- upvalues: t228 (copy)
	return (setmetatable({
		condition = if t229 ~= nil and t229.condition ~= nil then t229.condition else nil,
		kind = if t229 ~= nil and t229.kind ~= nil then t229.kind else nil
	}, t228))
end
function t228.encode(p149) -- line: 9793
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n100 = 0

	if p149.condition ~= nil then
		local v1635 = p149.condition:encode()
		local v1636, v1637 = proto.writeTag(buf, n100, 1, proto.wireTypes.lengthDelimited)

		buf, n100 = proto.writeBuffer(v1636, v1637, v1635, buffer.len(v1635))
	end

	if p149.kind ~= nil then
		if p149.kind.type == "literal" then
			local v1638, v1639 = proto.writeTag(buf, n100, 2, proto.wireTypes.lengthDelimited)

			buf, n100 = proto.writeString(v1638, v1639, p149.kind.value)
		elseif p149.kind.type == "binding_path" then
			local v1640, v1641 = proto.writeTag(buf, n100, 3, proto.wireTypes.lengthDelimited)

			buf, n100 = proto.writeString(v1640, v1641, p149.kind.value)
		end
	end

	local buf52 = buffer.create(n100)

	buffer.copy(buf52, 0, buf, 0, n100)

	return buf52
end
function t228.decode(p150: buffer) -- line: 9818
	-- upvalues: t228 (copy), proto (copy), prop_condition (copy)
	local v1644 = t228.new()
	local n101 = 0

	while n101 < buffer.len(p150) do
		local v1646, v1647

		v1646, v1647, n101 = proto.readTag(p150, n101)

		if v1647 == proto.wireTypes.varint then
			local v1648

			v1648, n101 = proto.readVarInt(p150, n101)
		elseif v1647 == proto.wireTypes.lengthDelimited then
			if v1646 == 1 then
				local v1649

				v1649, n101 = proto.readBuffer(p150, n101)
				v1644.condition = prop_condition.PropCondition.decode(v1649)
			elseif v1646 == 2 then
				local v1650

				v1650, n101 = proto.readBuffer(p150, n101)
				v1644.kind = {
					type = "literal",
					value = buffer.tostring(v1650)
				}
			elseif v1646 == 3 then
				local v1651

				v1651, n101 = proto.readBuffer(p150, n101)
				v1644.kind = {
					type = "binding_path",
					value = buffer.tostring(v1651)
				}
			else
				local v1652, v1653 = proto.readVarInt(p150, n101)

				n101 = v1653 + v1652
			end
		elseif v1647 == proto.wireTypes.i32 then
			local v1654

			v1654, n101 = proto.readFixed32(p150, n101)
		elseif v1647 == proto.wireTypes.i64 then
			local v1655

			v1655, n101 = proto.readFixed64(p150, n101)
		else
			error("Unsupported wire type: " .. v1647)
		end
	end

	return v1644
end
function t228.jsonEncode(p151) -- line: 9871
	local t230 = {}

	if p151.condition ~= nil then
		t230.condition = p151.condition:jsonEncode()
	end

	if p151.kind ~= nil then
		if p151.kind.type == "literal" then
			t230.literal = p151.kind.value

			return t230
		end

		if p151.kind.type == "binding_path" then
			t230.bindingPath = p151.kind.value
		end
	end

	return t230
end
function t228.jsonDecode(t231: {[any]: any}) -- line: 9889
	-- upvalues: t228 (copy), prop_condition (copy)
	local v1659 = t228.new()

	if t231.condition ~= nil then
		v1659.condition = prop_condition.PropCondition.jsonDecode(t231.condition)
	end

	if t231.literal ~= nil then
		v1659.kind = {
			type = "literal",
			value = t231.literal
		}
	end

	if t231.binding_path ~= nil then
		v1659.kind = {
			type = "binding_path",
			value = t231.binding_path
		}
	end

	if t231.bindingPath ~= nil then
		v1659.kind = {
			type = "binding_path",
			value = t231.bindingPath
		}
	end

	return v1659
end

t228.descriptor = {
	name = "InputSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.InputSizeProp_ConditionalOption = t228
typeRegistry.default:register(t1.InputSizeProp_ConditionalOption)

local t232 = {}

t232.__index = t232

function t232.new(t233: {[any]: any}?) -- line: 9926
	-- upvalues: t232 (copy)
	return (setmetatable({
		options = if t233 ~= nil and t233.options ~= nil then t233.options else {}
	}, t232))
end
function t232.encode(p152) -- line: 9934
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n102 = 0

	if p152.options ~= nil and #p152.options > 0 then
		for _, v1665 in p152.options do
			local v1666 = v1665:encode()
			local v1667, v1668 = proto.writeTag(buf, n102, 1, proto.wireTypes.lengthDelimited)

			buf, n102 = proto.writeBuffer(v1667, v1668, v1666, buffer.len(v1666))
		end
	end

	local buf53 = buffer.create(n102)

	buffer.copy(buf53, 0, buf, 0, n102)

	return buf53
end
function t232.decode(p153: buffer) -- line: 9951
	-- upvalues: t232 (copy), proto (copy), t1 (copy)
	local v1671 = t232.new()
	local n103 = 0

	while n103 < buffer.len(p153) do
		local v1673, v1674

		v1673, v1674, n103 = proto.readTag(p153, n103)

		if v1674 == proto.wireTypes.varint then
			local v1675

			v1675, n103 = proto.readVarInt(p153, n103)
		elseif v1674 == proto.wireTypes.lengthDelimited then
			if v1673 == 1 then
				local v1676

				v1676, n103 = proto.readBuffer(p153, n103)
				table.insert(v1671.options, t1.InputSizeProp_ConditionalOption.decode(v1676))
			else
				local v1677, v1678 = proto.readVarInt(p153, n103)

				n103 = v1678 + v1677
			end
		elseif v1674 == proto.wireTypes.i32 then
			local v1679

			v1679, n103 = proto.readFixed32(p153, n103)
		elseif v1674 == proto.wireTypes.i64 then
			local v1680

			v1680, n103 = proto.readFixed64(p153, n103)
		else
			error("Unsupported wire type: " .. v1674)
		end
	end

	return v1671
end
function t232.jsonEncode(p154) -- line: 9994
	local t234 = {}

	if p154.options ~= nil and #p154.options > 0 then
		local t235 = {}

		for _, v1685 in p154.options do
			table.insert(t235, v1685:jsonEncode())
		end

		t234.options = t235
	end

	return t234
end
function t232.jsonDecode(t236: {[any]: any}) -- line: 10008
	-- upvalues: t232 (copy), t1 (copy)
	local v1687 = t232.new()

	if t236.options ~= nil then
		local t237 = {}

		for _, v1690 in t236.options do
			table.insert(t237, t1.InputSizeProp_ConditionalOption.jsonDecode(v1690))
		end

		v1687.options = t237
	end

	return v1687
end

t232.descriptor = {
	name = "InputSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.InputSizeProp_ConditionalOptions = t232
typeRegistry.default:register(t1.InputSizeProp_ConditionalOptions)

local t238 = {}

t238.__index = t238

function t238.new(t239: {[any]: any}?) -- line: 10039
	-- upvalues: t238 (copy)
	return (setmetatable({
		kind = if t239 ~= nil and t239.kind ~= nil then t239.kind else nil
	}, t238))
end
function t238.encode(p155) -- line: 10045
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n104 = 0

	if p155.kind ~= nil then
		if p155.kind.type == "literal" then
			local v1695, v1696 = proto.writeTag(buf, n104, 1, proto.wireTypes.lengthDelimited)

			buf, n104 = proto.writeString(v1695, v1696, p155.kind.value)
		elseif p155.kind.type == "token" then
			local v1697, v1698 = proto.writeTag(buf, n104, 2, proto.wireTypes.lengthDelimited)

			buf, n104 = proto.writeString(v1697, v1698, p155.kind.value)
		elseif p155.kind.type == "conditional" then
			local v1699 = p155.kind.value:encode()
			local v1700, v1701 = proto.writeTag(buf, n104, 3, proto.wireTypes.lengthDelimited)

			buf, n104 = proto.writeBuffer(v1700, v1701, v1699, buffer.len(v1699))
		elseif p155.kind.type == "binding_path" then
			local v1702, v1703 = proto.writeTag(buf, n104, 4, proto.wireTypes.lengthDelimited)

			buf, n104 = proto.writeString(v1702, v1703, p155.kind.value)
		end
	end

	local buf54 = buffer.create(n104)

	buffer.copy(buf54, 0, buf, 0, n104)

	return buf54
end
function t238.decode(p156: buffer) -- line: 10071
	-- upvalues: t238 (copy), proto (copy), t1 (copy)
	local v1706 = t238.new()
	local n105 = 0

	while n105 < buffer.len(p156) do
		local v1708, v1709

		v1708, v1709, n105 = proto.readTag(p156, n105)

		if v1709 == proto.wireTypes.varint then
			local v1710

			v1710, n105 = proto.readVarInt(p156, n105)
		elseif v1709 == proto.wireTypes.lengthDelimited then
			if v1708 == 1 then
				local v1711

				v1711, n105 = proto.readBuffer(p156, n105)
				v1706.kind = {
					type = "literal",
					value = buffer.tostring(v1711)
				}
			elseif v1708 == 2 then
				local v1712

				v1712, n105 = proto.readBuffer(p156, n105)
				v1706.kind = {
					type = "token",
					value = buffer.tostring(v1712)
				}
			elseif v1708 == 3 then
				local v1713

				v1713, n105 = proto.readBuffer(p156, n105)
				v1706.kind = {
					type = "conditional",
					value = t1.UDimProp_ConditionalOptions.decode(v1713)
				}
			elseif v1708 == 4 then
				local v1714

				v1714, n105 = proto.readBuffer(p156, n105)
				v1706.kind = {
					type = "binding_path",
					value = buffer.tostring(v1714)
				}
			else
				local v1715, v1716 = proto.readVarInt(p156, n105)

				n105 = v1716 + v1715
			end
		elseif v1709 == proto.wireTypes.i32 then
			local v1717

			v1717, n105 = proto.readFixed32(p156, n105)
		elseif v1709 == proto.wireTypes.i64 then
			local v1718

			v1718, n105 = proto.readFixed64(p156, n105)
		else
			error("Unsupported wire type: " .. v1709)
		end
	end

	return v1706
end
function t238.jsonEncode(p157) -- line: 10129
	local t240 = {}

	if p157.kind ~= nil then
		if p157.kind.type == "literal" then
			t240.literal = p157.kind.value

			return t240
		end

		if p157.kind.type == "token" then
			t240.token = p157.kind.value

			return t240
		end

		if p157.kind.type == "conditional" then
			t240.conditional = p157.kind.value:jsonEncode()

			return t240
		end

		if p157.kind.type == "binding_path" then
			t240.bindingPath = p157.kind.value
		end
	end

	return t240
end
function t238.jsonDecode(t241: {[any]: any}) -- line: 10147
	-- upvalues: t238 (copy), t1 (copy)
	local v1722 = t238.new()

	if t241.literal ~= nil then
		v1722.kind = {
			type = "literal",
			value = t241.literal
		}
	end

	if t241.token ~= nil then
		v1722.kind = {
			type = "token",
			value = t241.token
		}
	end

	if t241.conditional ~= nil then
		v1722.kind = {
			type = "conditional",
			value = t1.UDimProp_ConditionalOptions.jsonDecode(t241.conditional)
		}
	end

	if t241.binding_path ~= nil then
		v1722.kind = {
			type = "binding_path",
			value = t241.binding_path
		}
	end

	if t241.bindingPath ~= nil then
		v1722.kind = {
			type = "binding_path",
			value = t241.bindingPath
		}
	end

	return v1722
end

t238.descriptor = {
	name = "UDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
}
t1.UDimProp = t238
typeRegistry.default:register(t1.UDimProp)

local t242 = {}

t242.__index = t242

function t242.new(t243: {[any]: any}?) -- line: 10188
	-- upvalues: t242 (copy)
	return (setmetatable({
		condition = if t243 ~= nil and t243.condition ~= nil then t243.condition else nil,
		kind = if t243 ~= nil and t243.kind ~= nil then t243.kind else nil
	}, t242))
end
function t242.encode(p158) -- line: 10197
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n106 = 0

	if p158.condition ~= nil then
		local v1727 = p158.condition:encode()
		local v1728, v1729 = proto.writeTag(buf, n106, 1, proto.wireTypes.lengthDelimited)

		buf, n106 = proto.writeBuffer(v1728, v1729, v1727, buffer.len(v1727))
	end

	if p158.kind ~= nil then
		if p158.kind.type == "literal" then
			local v1730, v1731 = proto.writeTag(buf, n106, 2, proto.wireTypes.lengthDelimited)

			buf, n106 = proto.writeString(v1730, v1731, p158.kind.value)
		elseif p158.kind.type == "token" then
			local v1732, v1733 = proto.writeTag(buf, n106, 3, proto.wireTypes.lengthDelimited)

			buf, n106 = proto.writeString(v1732, v1733, p158.kind.value)
		elseif p158.kind.type == "binding_path" then
			local v1734, v1735 = proto.writeTag(buf, n106, 4, proto.wireTypes.lengthDelimited)

			buf, n106 = proto.writeString(v1734, v1735, p158.kind.value)
		end
	end

	local buf55 = buffer.create(n106)

	buffer.copy(buf55, 0, buf, 0, n106)

	return buf55
end
function t242.decode(p159: buffer) -- line: 10225
	-- upvalues: t242 (copy), proto (copy), prop_condition (copy)
	local v1738 = t242.new()
	local n107 = 0

	while n107 < buffer.len(p159) do
		local v1740, v1741

		v1740, v1741, n107 = proto.readTag(p159, n107)

		if v1741 == proto.wireTypes.varint then
			local v1742

			v1742, n107 = proto.readVarInt(p159, n107)
		elseif v1741 == proto.wireTypes.lengthDelimited then
			if v1740 == 1 then
				local v1743

				v1743, n107 = proto.readBuffer(p159, n107)
				v1738.condition = prop_condition.PropCondition.decode(v1743)
			elseif v1740 == 2 then
				local v1744

				v1744, n107 = proto.readBuffer(p159, n107)
				v1738.kind = {
					type = "literal",
					value = buffer.tostring(v1744)
				}
			elseif v1740 == 3 then
				local v1745

				v1745, n107 = proto.readBuffer(p159, n107)
				v1738.kind = {
					type = "token",
					value = buffer.tostring(v1745)
				}
			elseif v1740 == 4 then
				local v1746

				v1746, n107 = proto.readBuffer(p159, n107)
				v1738.kind = {
					type = "binding_path",
					value = buffer.tostring(v1746)
				}
			else
				local v1747, v1748 = proto.readVarInt(p159, n107)

				n107 = v1748 + v1747
			end
		elseif v1741 == proto.wireTypes.i32 then
			local v1749

			v1749, n107 = proto.readFixed32(p159, n107)
		elseif v1741 == proto.wireTypes.i64 then
			local v1750

			v1750, n107 = proto.readFixed64(p159, n107)
		else
			error("Unsupported wire type: " .. v1741)
		end
	end

	return v1738
end
function t242.jsonEncode(p160) -- line: 10283
	local t244 = {}

	if p160.condition ~= nil then
		t244.condition = p160.condition:jsonEncode()
	end

	if p160.kind ~= nil then
		if p160.kind.type == "literal" then
			t244.literal = p160.kind.value

			return t244
		end

		if p160.kind.type == "token" then
			t244.token = p160.kind.value

			return t244
		end

		if p160.kind.type == "binding_path" then
			t244.bindingPath = p160.kind.value
		end
	end

	return t244
end
function t242.jsonDecode(t245: {[any]: any}) -- line: 10303
	-- upvalues: t242 (copy), prop_condition (copy)
	local v1754 = t242.new()

	if t245.condition ~= nil then
		v1754.condition = prop_condition.PropCondition.jsonDecode(t245.condition)
	end

	if t245.literal ~= nil then
		v1754.kind = {
			type = "literal",
			value = t245.literal
		}
	end

	if t245.token ~= nil then
		v1754.kind = {
			type = "token",
			value = t245.token
		}
	end

	if t245.binding_path ~= nil then
		v1754.kind = {
			type = "binding_path",
			value = t245.binding_path
		}
	end

	if t245.bindingPath ~= nil then
		v1754.kind = {
			type = "binding_path",
			value = t245.bindingPath
		}
	end

	return v1754
end

t242.descriptor = {
	name = "UDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.UDimProp_ConditionalOption = t242
typeRegistry.default:register(t1.UDimProp_ConditionalOption)

local t246 = {}

t246.__index = t246

function t246.new(t247: {[any]: any}?) -- line: 10344
	-- upvalues: t246 (copy)
	return (setmetatable({
		options = if t247 ~= nil and t247.options ~= nil then t247.options else {}
	}, t246))
end
function t246.encode(p161) -- line: 10352
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n108 = 0

	if p161.options ~= nil and #p161.options > 0 then
		for _, v1760 in p161.options do
			local v1761 = v1760:encode()
			local v1762, v1763 = proto.writeTag(buf, n108, 1, proto.wireTypes.lengthDelimited)

			buf, n108 = proto.writeBuffer(v1762, v1763, v1761, buffer.len(v1761))
		end
	end

	local buf56 = buffer.create(n108)

	buffer.copy(buf56, 0, buf, 0, n108)

	return buf56
end
function t246.decode(p162: buffer) -- line: 10369
	-- upvalues: t246 (copy), proto (copy), t1 (copy)
	local v1766 = t246.new()
	local n109 = 0

	while n109 < buffer.len(p162) do
		local v1768, v1769

		v1768, v1769, n109 = proto.readTag(p162, n109)

		if v1769 == proto.wireTypes.varint then
			local v1770

			v1770, n109 = proto.readVarInt(p162, n109)
		elseif v1769 == proto.wireTypes.lengthDelimited then
			if v1768 == 1 then
				local v1771

				v1771, n109 = proto.readBuffer(p162, n109)
				table.insert(v1766.options, t1.UDimProp_ConditionalOption.decode(v1771))
			else
				local v1772, v1773 = proto.readVarInt(p162, n109)

				n109 = v1773 + v1772
			end
		elseif v1769 == proto.wireTypes.i32 then
			local v1774

			v1774, n109 = proto.readFixed32(p162, n109)
		elseif v1769 == proto.wireTypes.i64 then
			local v1775

			v1775, n109 = proto.readFixed64(p162, n109)
		else
			error("Unsupported wire type: " .. v1769)
		end
	end

	return v1766
end
function t246.jsonEncode(p163) -- line: 10412
	local t248 = {}

	if p163.options ~= nil and #p163.options > 0 then
		local t249 = {}

		for _, v1780 in p163.options do
			table.insert(t249, v1780:jsonEncode())
		end

		t248.options = t249
	end

	return t248
end
function t246.jsonDecode(t250: {[any]: any}) -- line: 10426
	-- upvalues: t246 (copy), t1 (copy)
	local v1782 = t246.new()

	if t250.options ~= nil then
		local t251 = {}

		for _, v1785 in t250.options do
			table.insert(t251, t1.UDimProp_ConditionalOption.jsonDecode(v1785))
		end

		v1782.options = t251
	end

	return v1782
end

t246.descriptor = {
	name = "UDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.UDimProp_ConditionalOptions = t246
typeRegistry.default:register(t1.UDimProp_ConditionalOptions)

local t252 = {}

t252.__index = t252

function t252.new(t253: {[any]: any}?) -- line: 10455
	-- upvalues: t252 (copy)
	return (setmetatable({
		kind = if t253 ~= nil and t253.kind ~= nil then t253.kind else nil
	}, t252))
end
function t252.encode(p164) -- line: 10461
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n110 = 0

	if p164.kind ~= nil then
		if p164.kind.type == "literal" then
			local v1790, v1791 = proto.writeTag(buf, n110, 1, proto.wireTypes.lengthDelimited)

			buf, n110 = proto.writeString(v1790, v1791, p164.kind.value)
		elseif p164.kind.type == "token" then
			local v1792, v1793 = proto.writeTag(buf, n110, 2, proto.wireTypes.lengthDelimited)

			buf, n110 = proto.writeString(v1792, v1793, p164.kind.value)
		elseif p164.kind.type == "conditional" then
			local v1794 = p164.kind.value:encode()
			local v1795, v1796 = proto.writeTag(buf, n110, 3, proto.wireTypes.lengthDelimited)

			buf, n110 = proto.writeBuffer(v1795, v1796, v1794, buffer.len(v1794))
		elseif p164.kind.type == "binding_path" then
			local v1797, v1798 = proto.writeTag(buf, n110, 4, proto.wireTypes.lengthDelimited)

			buf, n110 = proto.writeString(v1797, v1798, p164.kind.value)
		end
	end

	local buf57 = buffer.create(n110)

	buffer.copy(buf57, 0, buf, 0, n110)

	return buf57
end
function t252.decode(p165: buffer) -- line: 10487
	-- upvalues: t252 (copy), proto (copy), t1 (copy)
	local v1801 = t252.new()
	local n111 = 0

	while n111 < buffer.len(p165) do
		local v1803, v1804

		v1803, v1804, n111 = proto.readTag(p165, n111)

		if v1804 == proto.wireTypes.varint then
			local v1805

			v1805, n111 = proto.readVarInt(p165, n111)
		elseif v1804 == proto.wireTypes.lengthDelimited then
			if v1803 == 1 then
				local v1806

				v1806, n111 = proto.readBuffer(p165, n111)
				v1801.kind = {
					type = "literal",
					value = buffer.tostring(v1806)
				}
			elseif v1803 == 2 then
				local v1807

				v1807, n111 = proto.readBuffer(p165, n111)
				v1801.kind = {
					type = "token",
					value = buffer.tostring(v1807)
				}
			elseif v1803 == 3 then
				local v1808

				v1808, n111 = proto.readBuffer(p165, n111)
				v1801.kind = {
					type = "conditional",
					value = t1.UDim2Prop_ConditionalOptions.decode(v1808)
				}
			elseif v1803 == 4 then
				local v1809

				v1809, n111 = proto.readBuffer(p165, n111)
				v1801.kind = {
					type = "binding_path",
					value = buffer.tostring(v1809)
				}
			else
				local v1810, v1811 = proto.readVarInt(p165, n111)

				n111 = v1811 + v1810
			end
		elseif v1804 == proto.wireTypes.i32 then
			local v1812

			v1812, n111 = proto.readFixed32(p165, n111)
		elseif v1804 == proto.wireTypes.i64 then
			local v1813

			v1813, n111 = proto.readFixed64(p165, n111)
		else
			error("Unsupported wire type: " .. v1804)
		end
	end

	return v1801
end
function t252.jsonEncode(p166) -- line: 10545
	local t254 = {}

	if p166.kind ~= nil then
		if p166.kind.type == "literal" then
			t254.literal = p166.kind.value

			return t254
		end

		if p166.kind.type == "token" then
			t254.token = p166.kind.value

			return t254
		end

		if p166.kind.type == "conditional" then
			t254.conditional = p166.kind.value:jsonEncode()

			return t254
		end

		if p166.kind.type == "binding_path" then
			t254.bindingPath = p166.kind.value
		end
	end

	return t254
end
function t252.jsonDecode(t255: {[any]: any}) -- line: 10563
	-- upvalues: t252 (copy), t1 (copy)
	local v1817 = t252.new()

	if t255.literal ~= nil then
		v1817.kind = {
			type = "literal",
			value = t255.literal
		}
	end

	if t255.token ~= nil then
		v1817.kind = {
			type = "token",
			value = t255.token
		}
	end

	if t255.conditional ~= nil then
		v1817.kind = {
			type = "conditional",
			value = t1.UDim2Prop_ConditionalOptions.jsonDecode(t255.conditional)
		}
	end

	if t255.binding_path ~= nil then
		v1817.kind = {
			type = "binding_path",
			value = t255.binding_path
		}
	end

	if t255.bindingPath ~= nil then
		v1817.kind = {
			type = "binding_path",
			value = t255.bindingPath
		}
	end

	return v1817
end

t252.descriptor = {
	name = "UDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
}
t1.UDim2Prop = t252
typeRegistry.default:register(t1.UDim2Prop)

local t256 = {}

t256.__index = t256

function t256.new(t257: {[any]: any}?) -- line: 10604
	-- upvalues: t256 (copy)
	return (setmetatable({
		condition = if t257 ~= nil and t257.condition ~= nil then t257.condition else nil,
		kind = if t257 ~= nil and t257.kind ~= nil then t257.kind else nil
	}, t256))
end
function t256.encode(p167) -- line: 10613
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n112 = 0

	if p167.condition ~= nil then
		local v1822 = p167.condition:encode()
		local v1823, v1824 = proto.writeTag(buf, n112, 1, proto.wireTypes.lengthDelimited)

		buf, n112 = proto.writeBuffer(v1823, v1824, v1822, buffer.len(v1822))
	end

	if p167.kind ~= nil then
		if p167.kind.type == "literal" then
			local v1825, v1826 = proto.writeTag(buf, n112, 2, proto.wireTypes.lengthDelimited)

			buf, n112 = proto.writeString(v1825, v1826, p167.kind.value)
		elseif p167.kind.type == "token" then
			local v1827, v1828 = proto.writeTag(buf, n112, 3, proto.wireTypes.lengthDelimited)

			buf, n112 = proto.writeString(v1827, v1828, p167.kind.value)
		elseif p167.kind.type == "binding_path" then
			local v1829, v1830 = proto.writeTag(buf, n112, 4, proto.wireTypes.lengthDelimited)

			buf, n112 = proto.writeString(v1829, v1830, p167.kind.value)
		end
	end

	local buf58 = buffer.create(n112)

	buffer.copy(buf58, 0, buf, 0, n112)

	return buf58
end
function t256.decode(p168: buffer) -- line: 10641
	-- upvalues: t256 (copy), proto (copy), prop_condition (copy)
	local v1833 = t256.new()
	local n113 = 0

	while n113 < buffer.len(p168) do
		local v1835, v1836

		v1835, v1836, n113 = proto.readTag(p168, n113)

		if v1836 == proto.wireTypes.varint then
			local v1837

			v1837, n113 = proto.readVarInt(p168, n113)
		elseif v1836 == proto.wireTypes.lengthDelimited then
			if v1835 == 1 then
				local v1838

				v1838, n113 = proto.readBuffer(p168, n113)
				v1833.condition = prop_condition.PropCondition.decode(v1838)
			elseif v1835 == 2 then
				local v1839

				v1839, n113 = proto.readBuffer(p168, n113)
				v1833.kind = {
					type = "literal",
					value = buffer.tostring(v1839)
				}
			elseif v1835 == 3 then
				local v1840

				v1840, n113 = proto.readBuffer(p168, n113)
				v1833.kind = {
					type = "token",
					value = buffer.tostring(v1840)
				}
			elseif v1835 == 4 then
				local v1841

				v1841, n113 = proto.readBuffer(p168, n113)
				v1833.kind = {
					type = "binding_path",
					value = buffer.tostring(v1841)
				}
			else
				local v1842, v1843 = proto.readVarInt(p168, n113)

				n113 = v1843 + v1842
			end
		elseif v1836 == proto.wireTypes.i32 then
			local v1844

			v1844, n113 = proto.readFixed32(p168, n113)
		elseif v1836 == proto.wireTypes.i64 then
			local v1845

			v1845, n113 = proto.readFixed64(p168, n113)
		else
			error("Unsupported wire type: " .. v1836)
		end
	end

	return v1833
end
function t256.jsonEncode(p169) -- line: 10699
	local t258 = {}

	if p169.condition ~= nil then
		t258.condition = p169.condition:jsonEncode()
	end

	if p169.kind ~= nil then
		if p169.kind.type == "literal" then
			t258.literal = p169.kind.value

			return t258
		end

		if p169.kind.type == "token" then
			t258.token = p169.kind.value

			return t258
		end

		if p169.kind.type == "binding_path" then
			t258.bindingPath = p169.kind.value
		end
	end

	return t258
end
function t256.jsonDecode(t259: {[any]: any}) -- line: 10719
	-- upvalues: t256 (copy), prop_condition (copy)
	local v1849 = t256.new()

	if t259.condition ~= nil then
		v1849.condition = prop_condition.PropCondition.jsonDecode(t259.condition)
	end

	if t259.literal ~= nil then
		v1849.kind = {
			type = "literal",
			value = t259.literal
		}
	end

	if t259.token ~= nil then
		v1849.kind = {
			type = "token",
			value = t259.token
		}
	end

	if t259.binding_path ~= nil then
		v1849.kind = {
			type = "binding_path",
			value = t259.binding_path
		}
	end

	if t259.bindingPath ~= nil then
		v1849.kind = {
			type = "binding_path",
			value = t259.bindingPath
		}
	end

	return v1849
end

t256.descriptor = {
	name = "UDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.UDim2Prop_ConditionalOption = t256
typeRegistry.default:register(t1.UDim2Prop_ConditionalOption)

local t260 = {}

t260.__index = t260

function t260.new(t261: {[any]: any}?) -- line: 10760
	-- upvalues: t260 (copy)
	return (setmetatable({
		options = if t261 ~= nil and t261.options ~= nil then t261.options else {}
	}, t260))
end
function t260.encode(p170) -- line: 10768
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n114 = 0

	if p170.options ~= nil and #p170.options > 0 then
		for _, v1855 in p170.options do
			local v1856 = v1855:encode()
			local v1857, v1858 = proto.writeTag(buf, n114, 1, proto.wireTypes.lengthDelimited)

			buf, n114 = proto.writeBuffer(v1857, v1858, v1856, buffer.len(v1856))
		end
	end

	local buf59 = buffer.create(n114)

	buffer.copy(buf59, 0, buf, 0, n114)

	return buf59
end
function t260.decode(p171: buffer) -- line: 10785
	-- upvalues: t260 (copy), proto (copy), t1 (copy)
	local v1861 = t260.new()
	local n115 = 0

	while n115 < buffer.len(p171) do
		local v1863, v1864

		v1863, v1864, n115 = proto.readTag(p171, n115)

		if v1864 == proto.wireTypes.varint then
			local v1865

			v1865, n115 = proto.readVarInt(p171, n115)
		elseif v1864 == proto.wireTypes.lengthDelimited then
			if v1863 == 1 then
				local v1866

				v1866, n115 = proto.readBuffer(p171, n115)
				table.insert(v1861.options, t1.UDim2Prop_ConditionalOption.decode(v1866))
			else
				local v1867, v1868 = proto.readVarInt(p171, n115)

				n115 = v1868 + v1867
			end
		elseif v1864 == proto.wireTypes.i32 then
			local v1869

			v1869, n115 = proto.readFixed32(p171, n115)
		elseif v1864 == proto.wireTypes.i64 then
			local v1870

			v1870, n115 = proto.readFixed64(p171, n115)
		else
			error("Unsupported wire type: " .. v1864)
		end
	end

	return v1861
end
function t260.jsonEncode(p172) -- line: 10828
	local t262 = {}

	if p172.options ~= nil and #p172.options > 0 then
		local t263 = {}

		for _, v1875 in p172.options do
			table.insert(t263, v1875:jsonEncode())
		end

		t262.options = t263
	end

	return t262
end
function t260.jsonDecode(t264: {[any]: any}) -- line: 10842
	-- upvalues: t260 (copy), t1 (copy)
	local v1877 = t260.new()

	if t264.options ~= nil then
		local t265 = {}

		for _, v1880 in t264.options do
			table.insert(t265, t1.UDim2Prop_ConditionalOption.jsonDecode(v1880))
		end

		v1877.options = t265
	end

	return v1877
end

t260.descriptor = {
	name = "UDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.UDim2Prop_ConditionalOptions = t260
typeRegistry.default:register(t1.UDim2Prop_ConditionalOptions)

local t266 = {}

t266.__index = t266

function t266.new(t267: {[any]: any}?) -- line: 10871
	-- upvalues: t266 (copy)
	return (setmetatable({
		kind = if t267 ~= nil and t267.kind ~= nil then t267.kind else nil
	}, t266))
end
function t266.encode(p173) -- line: 10877
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n116 = 0

	if p173.kind ~= nil then
		if p173.kind.type == "literal" then
			local v1885, v1886 = proto.writeTag(buf, n116, 1, proto.wireTypes.lengthDelimited)

			buf, n116 = proto.writeString(v1885, v1886, p173.kind.value)
		elseif p173.kind.type == "token" then
			local v1887, v1888 = proto.writeTag(buf, n116, 2, proto.wireTypes.lengthDelimited)

			buf, n116 = proto.writeString(v1887, v1888, p173.kind.value)
		elseif p173.kind.type == "conditional" then
			local v1889 = p173.kind.value:encode()
			local v1890, v1891 = proto.writeTag(buf, n116, 3, proto.wireTypes.lengthDelimited)

			buf, n116 = proto.writeBuffer(v1890, v1891, v1889, buffer.len(v1889))
		elseif p173.kind.type == "binding_path" then
			local v1892, v1893 = proto.writeTag(buf, n116, 4, proto.wireTypes.lengthDelimited)

			buf, n116 = proto.writeString(v1892, v1893, p173.kind.value)
		end
	end

	local buf60 = buffer.create(n116)

	buffer.copy(buf60, 0, buf, 0, n116)

	return buf60
end
function t266.decode(p174: buffer) -- line: 10903
	-- upvalues: t266 (copy), proto (copy), t1 (copy)
	local v1896 = t266.new()
	local n117 = 0

	while n117 < buffer.len(p174) do
		local v1898, v1899

		v1898, v1899, n117 = proto.readTag(p174, n117)

		if v1899 == proto.wireTypes.varint then
			local v1900

			v1900, n117 = proto.readVarInt(p174, n117)
		elseif v1899 == proto.wireTypes.lengthDelimited then
			if v1898 == 1 then
				local v1901

				v1901, n117 = proto.readBuffer(p174, n117)
				v1896.kind = {
					type = "literal",
					value = buffer.tostring(v1901)
				}
			elseif v1898 == 2 then
				local v1902

				v1902, n117 = proto.readBuffer(p174, n117)
				v1896.kind = {
					type = "token",
					value = buffer.tostring(v1902)
				}
			elseif v1898 == 3 then
				local v1903

				v1903, n117 = proto.readBuffer(p174, n117)
				v1896.kind = {
					type = "conditional",
					value = t1.Vector2Prop_ConditionalOptions.decode(v1903)
				}
			elseif v1898 == 4 then
				local v1904

				v1904, n117 = proto.readBuffer(p174, n117)
				v1896.kind = {
					type = "binding_path",
					value = buffer.tostring(v1904)
				}
			else
				local v1905, v1906 = proto.readVarInt(p174, n117)

				n117 = v1906 + v1905
			end
		elseif v1899 == proto.wireTypes.i32 then
			local v1907

			v1907, n117 = proto.readFixed32(p174, n117)
		elseif v1899 == proto.wireTypes.i64 then
			local v1908

			v1908, n117 = proto.readFixed64(p174, n117)
		else
			error("Unsupported wire type: " .. v1899)
		end
	end

	return v1896
end
function t266.jsonEncode(p175) -- line: 10961
	local t268 = {}

	if p175.kind ~= nil then
		if p175.kind.type == "literal" then
			t268.literal = p175.kind.value

			return t268
		end

		if p175.kind.type == "token" then
			t268.token = p175.kind.value

			return t268
		end

		if p175.kind.type == "conditional" then
			t268.conditional = p175.kind.value:jsonEncode()

			return t268
		end

		if p175.kind.type == "binding_path" then
			t268.bindingPath = p175.kind.value
		end
	end

	return t268
end
function t266.jsonDecode(t269: {[any]: any}) -- line: 10979
	-- upvalues: t266 (copy), t1 (copy)
	local v1912 = t266.new()

	if t269.literal ~= nil then
		v1912.kind = {
			type = "literal",
			value = t269.literal
		}
	end

	if t269.token ~= nil then
		v1912.kind = {
			type = "token",
			value = t269.token
		}
	end

	if t269.conditional ~= nil then
		v1912.kind = {
			type = "conditional",
			value = t1.Vector2Prop_ConditionalOptions.jsonDecode(t269.conditional)
		}
	end

	if t269.binding_path ~= nil then
		v1912.kind = {
			type = "binding_path",
			value = t269.binding_path
		}
	end

	if t269.bindingPath ~= nil then
		v1912.kind = {
			type = "binding_path",
			value = t269.bindingPath
		}
	end

	return v1912
end

t266.descriptor = {
	name = "Vector2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
}
t1.Vector2Prop = t266
typeRegistry.default:register(t1.Vector2Prop)

local t270 = {}

t270.__index = t270

function t270.new(t271: {[any]: any}?) -- line: 11020
	-- upvalues: t270 (copy)
	return (setmetatable({
		condition = if t271 ~= nil and t271.condition ~= nil then t271.condition else nil,
		kind = if t271 ~= nil and t271.kind ~= nil then t271.kind else nil
	}, t270))
end
function t270.encode(p176) -- line: 11029
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n118 = 0

	if p176.condition ~= nil then
		local v1917 = p176.condition:encode()
		local v1918, v1919 = proto.writeTag(buf, n118, 1, proto.wireTypes.lengthDelimited)

		buf, n118 = proto.writeBuffer(v1918, v1919, v1917, buffer.len(v1917))
	end

	if p176.kind ~= nil then
		if p176.kind.type == "literal" then
			local v1920, v1921 = proto.writeTag(buf, n118, 2, proto.wireTypes.lengthDelimited)

			buf, n118 = proto.writeString(v1920, v1921, p176.kind.value)
		elseif p176.kind.type == "token" then
			local v1922, v1923 = proto.writeTag(buf, n118, 3, proto.wireTypes.lengthDelimited)

			buf, n118 = proto.writeString(v1922, v1923, p176.kind.value)
		elseif p176.kind.type == "binding_path" then
			local v1924, v1925 = proto.writeTag(buf, n118, 4, proto.wireTypes.lengthDelimited)

			buf, n118 = proto.writeString(v1924, v1925, p176.kind.value)
		end
	end

	local buf61 = buffer.create(n118)

	buffer.copy(buf61, 0, buf, 0, n118)

	return buf61
end
function t270.decode(p177: buffer) -- line: 11057
	-- upvalues: t270 (copy), proto (copy), prop_condition (copy)
	local v1928 = t270.new()
	local n119 = 0

	while n119 < buffer.len(p177) do
		local v1930, v1931

		v1930, v1931, n119 = proto.readTag(p177, n119)

		if v1931 == proto.wireTypes.varint then
			local v1932

			v1932, n119 = proto.readVarInt(p177, n119)
		elseif v1931 == proto.wireTypes.lengthDelimited then
			if v1930 == 1 then
				local v1933

				v1933, n119 = proto.readBuffer(p177, n119)
				v1928.condition = prop_condition.PropCondition.decode(v1933)
			elseif v1930 == 2 then
				local v1934

				v1934, n119 = proto.readBuffer(p177, n119)
				v1928.kind = {
					type = "literal",
					value = buffer.tostring(v1934)
				}
			elseif v1930 == 3 then
				local v1935

				v1935, n119 = proto.readBuffer(p177, n119)
				v1928.kind = {
					type = "token",
					value = buffer.tostring(v1935)
				}
			elseif v1930 == 4 then
				local v1936

				v1936, n119 = proto.readBuffer(p177, n119)
				v1928.kind = {
					type = "binding_path",
					value = buffer.tostring(v1936)
				}
			else
				local v1937, v1938 = proto.readVarInt(p177, n119)

				n119 = v1938 + v1937
			end
		elseif v1931 == proto.wireTypes.i32 then
			local v1939

			v1939, n119 = proto.readFixed32(p177, n119)
		elseif v1931 == proto.wireTypes.i64 then
			local v1940

			v1940, n119 = proto.readFixed64(p177, n119)
		else
			error("Unsupported wire type: " .. v1931)
		end
	end

	return v1928
end
function t270.jsonEncode(p178) -- line: 11115
	local t272 = {}

	if p178.condition ~= nil then
		t272.condition = p178.condition:jsonEncode()
	end

	if p178.kind ~= nil then
		if p178.kind.type == "literal" then
			t272.literal = p178.kind.value

			return t272
		end

		if p178.kind.type == "token" then
			t272.token = p178.kind.value

			return t272
		end

		if p178.kind.type == "binding_path" then
			t272.bindingPath = p178.kind.value
		end
	end

	return t272
end
function t270.jsonDecode(t273: {[any]: any}) -- line: 11135
	-- upvalues: t270 (copy), prop_condition (copy)
	local v1944 = t270.new()

	if t273.condition ~= nil then
		v1944.condition = prop_condition.PropCondition.jsonDecode(t273.condition)
	end

	if t273.literal ~= nil then
		v1944.kind = {
			type = "literal",
			value = t273.literal
		}
	end

	if t273.token ~= nil then
		v1944.kind = {
			type = "token",
			value = t273.token
		}
	end

	if t273.binding_path ~= nil then
		v1944.kind = {
			type = "binding_path",
			value = t273.binding_path
		}
	end

	if t273.bindingPath ~= nil then
		v1944.kind = {
			type = "binding_path",
			value = t273.bindingPath
		}
	end

	return v1944
end

t270.descriptor = {
	name = "Vector2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.Vector2Prop_ConditionalOption = t270
typeRegistry.default:register(t1.Vector2Prop_ConditionalOption)

local t274 = {}

t274.__index = t274

function t274.new(t275: {[any]: any}?) -- line: 11176
	-- upvalues: t274 (copy)
	return (setmetatable({
		options = if t275 ~= nil and t275.options ~= nil then t275.options else {}
	}, t274))
end
function t274.encode(p179) -- line: 11184
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n120 = 0

	if p179.options ~= nil and #p179.options > 0 then
		for _, v1950 in p179.options do
			local v1951 = v1950:encode()
			local v1952, v1953 = proto.writeTag(buf, n120, 1, proto.wireTypes.lengthDelimited)

			buf, n120 = proto.writeBuffer(v1952, v1953, v1951, buffer.len(v1951))
		end
	end

	local buf62 = buffer.create(n120)

	buffer.copy(buf62, 0, buf, 0, n120)

	return buf62
end
function t274.decode(p180: buffer) -- line: 11201
	-- upvalues: t274 (copy), proto (copy), t1 (copy)
	local v1956 = t274.new()
	local n121 = 0

	while n121 < buffer.len(p180) do
		local v1958, v1959

		v1958, v1959, n121 = proto.readTag(p180, n121)

		if v1959 == proto.wireTypes.varint then
			local v1960

			v1960, n121 = proto.readVarInt(p180, n121)
		elseif v1959 == proto.wireTypes.lengthDelimited then
			if v1958 == 1 then
				local v1961

				v1961, n121 = proto.readBuffer(p180, n121)
				table.insert(v1956.options, t1.Vector2Prop_ConditionalOption.decode(v1961))
			else
				local v1962, v1963 = proto.readVarInt(p180, n121)

				n121 = v1963 + v1962
			end
		elseif v1959 == proto.wireTypes.i32 then
			local v1964

			v1964, n121 = proto.readFixed32(p180, n121)
		elseif v1959 == proto.wireTypes.i64 then
			local v1965

			v1965, n121 = proto.readFixed64(p180, n121)
		else
			error("Unsupported wire type: " .. v1959)
		end
	end

	return v1956
end
function t274.jsonEncode(p181) -- line: 11244
	local t276 = {}

	if p181.options ~= nil and #p181.options > 0 then
		local t277 = {}

		for _, v1970 in p181.options do
			table.insert(t277, v1970:jsonEncode())
		end

		t276.options = t277
	end

	return t276
end
function t274.jsonDecode(t278: {[any]: any}) -- line: 11258
	-- upvalues: t274 (copy), t1 (copy)
	local v1972 = t274.new()

	if t278.options ~= nil then
		local t279 = {}

		for _, v1975 in t278.options do
			table.insert(t279, t1.Vector2Prop_ConditionalOption.jsonDecode(v1975))
		end

		v1972.options = t279
	end

	return v1972
end

t274.descriptor = {
	name = "Vector2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.Vector2Prop_ConditionalOptions = t274
typeRegistry.default:register(t1.Vector2Prop_ConditionalOptions)

local t280 = {}

t280.__index = t280

function t280.new(t281: {[any]: any}?) -- line: 11287
	-- upvalues: t280 (copy)
	return (setmetatable({
		kind = if t281 ~= nil and t281.kind ~= nil then t281.kind else nil
	}, t280))
end
function t280.encode(p182) -- line: 11293
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n122 = 0

	if p182.kind ~= nil then
		if p182.kind.type == "literal" then
			local v1980 = p182.kind.value:encode()
			local v1981, v1982 = proto.writeTag(buf, n122, 1, proto.wireTypes.lengthDelimited)

			buf, n122 = proto.writeBuffer(v1981, v1982, v1980, buffer.len(v1980))
		elseif p182.kind.type == "binding_path" then
			local v1983, v1984 = proto.writeTag(buf, n122, 2, proto.wireTypes.lengthDelimited)

			buf, n122 = proto.writeString(v1983, v1984, p182.kind.value)
		elseif p182.kind.type == "translation" then
			local v1985 = p182.kind.value:encode()
			local v1986, v1987 = proto.writeTag(buf, n122, 3, proto.wireTypes.lengthDelimited)

			buf, n122 = proto.writeBuffer(v1986, v1987, v1985, buffer.len(v1985))
		elseif p182.kind.type == "format" then
			local v1988 = p182.kind.value:encode()
			local v1989, v1990 = proto.writeTag(buf, n122, 4, proto.wireTypes.lengthDelimited)

			buf, n122 = proto.writeBuffer(v1989, v1990, v1988, buffer.len(v1988))
		end
	end

	local buf63 = buffer.create(n122)

	buffer.copy(buf63, 0, buf, 0, n122)

	return buf63
end
function t280.decode(p183: buffer) -- line: 11321
	-- upvalues: t280 (copy), proto (copy), t1 (copy)
	local v1993 = t280.new()
	local n123 = 0

	while n123 < buffer.len(p183) do
		local v1995, v1996

		v1995, v1996, n123 = proto.readTag(p183, n123)

		if v1996 == proto.wireTypes.varint then
			local v1997

			v1997, n123 = proto.readVarInt(p183, n123)
		elseif v1996 == proto.wireTypes.lengthDelimited then
			if v1995 == 1 then
				local v1998

				v1998, n123 = proto.readBuffer(p183, n123)
				v1993.kind = {
					type = "literal",
					value = t1.TemplateArg_LiteralValue.decode(v1998)
				}
			elseif v1995 == 2 then
				local v1999

				v1999, n123 = proto.readBuffer(p183, n123)
				v1993.kind = {
					type = "binding_path",
					value = buffer.tostring(v1999)
				}
			elseif v1995 == 3 then
				local v2000

				v2000, n123 = proto.readBuffer(p183, n123)
				v1993.kind = {
					type = "translation",
					value = t1.TranslationRef.decode(v2000)
				}
			elseif v1995 == 4 then
				local v2001

				v2001, n123 = proto.readBuffer(p183, n123)
				v1993.kind = {
					type = "format",
					value = t1.StringFormat.decode(v2001)
				}
			else
				local v2002, v2003 = proto.readVarInt(p183, n123)

				n123 = v2003 + v2002
			end
		elseif v1996 == proto.wireTypes.i32 then
			local v2004

			v2004, n123 = proto.readFixed32(p183, n123)
		elseif v1996 == proto.wireTypes.i64 then
			local v2005

			v2005, n123 = proto.readFixed64(p183, n123)
		else
			error("Unsupported wire type: " .. v1996)
		end
	end

	return v1993
end
function t280.jsonEncode(p184) -- line: 11379
	local t282 = {}

	if p184.kind ~= nil then
		if p184.kind.type == "literal" then
			t282.literal = p184.kind.value:jsonEncode()

			return t282
		end

		if p184.kind.type == "binding_path" then
			t282.bindingPath = p184.kind.value

			return t282
		end

		if p184.kind.type == "translation" then
			t282.translation = p184.kind.value:jsonEncode()

			return t282
		end

		if p184.kind.type == "format" then
			t282.format = p184.kind.value:jsonEncode()
		end
	end

	return t282
end
function t280.jsonDecode(t283: {[any]: any}) -- line: 11397
	-- upvalues: t280 (copy), t1 (copy)
	local v2009 = t280.new()

	if t283.literal ~= nil then
		v2009.kind = {
			type = "literal",
			value = t1.TemplateArg_LiteralValue.jsonDecode(t283.literal)
		}
	end

	if t283.binding_path ~= nil then
		v2009.kind = {
			type = "binding_path",
			value = t283.binding_path
		}
	end

	if t283.bindingPath ~= nil then
		v2009.kind = {
			type = "binding_path",
			value = t283.bindingPath
		}
	end

	if t283.translation ~= nil then
		v2009.kind = {
			type = "translation",
			value = t1.TranslationRef.jsonDecode(t283.translation)
		}
	end

	if t283.format ~= nil then
		v2009.kind = {
			type = "format",
			value = t1.StringFormat.jsonDecode(t283.format)
		}
	end

	return v2009
end

t280.descriptor = {
	name = "TemplateArg",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateArg"
}
t1.TemplateArg = t280
typeRegistry.default:register(t1.TemplateArg)

local t284 = {}

t284.__index = t284

function t284.new(t285: {[any]: any}?) -- line: 11437
	-- upvalues: t284 (copy)
	return (setmetatable({
		kind = if t285 ~= nil and t285.kind ~= nil then t285.kind else nil
	}, t284))
end
function t284.encode(p185) -- line: 11443
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n124 = 0

	if p185.kind ~= nil then
		if p185.kind.type == "string_value" then
			local v2014, v2015 = proto.writeTag(buf, n124, 1, proto.wireTypes.lengthDelimited)

			buf, n124 = proto.writeString(v2014, v2015, p185.kind.value)
		elseif p185.kind.type == "int32_value" then
			local v2016, v2017 = proto.writeTag(buf, n124, 2, proto.wireTypes.varint)

			buf, n124 = proto.writeVarInt(v2016, v2017, p185.kind.value)
		elseif p185.kind.type == "int64_value" then
			local v2018, v2019 = proto.writeTag(buf, n124, 3, proto.wireTypes.varint)

			buf, n124 = proto.writeVarInt(v2018, v2019, p185.kind.value)
		elseif p185.kind.type == "float_value" then
			local v2020, v2021 = proto.writeTag(buf, n124, 4, proto.wireTypes.i32)

			buf, n124 = proto.writeFloat(v2020, v2021, p185.kind.value)
		elseif p185.kind.type == "double_value" then
			local v2022, v2023 = proto.writeTag(buf, n124, 5, proto.wireTypes.i64)

			buf, n124 = proto.writeDouble(v2022, v2023, p185.kind.value)
		elseif p185.kind.type == "bool_value" then
			local v2024, v2025 = proto.writeTag(buf, n124, 6, proto.wireTypes.varint)

			buf, n124 = proto.writeVarInt(v2024, v2025, not p185.kind.value and 0 or 1)
		end
	end

	local buf64 = buffer.create(n124)

	buffer.copy(buf64, 0, buf, 0, n124)

	return buf64
end
function t284.decode(p186: buffer) -- line: 11474
	-- upvalues: t284 (copy), proto (copy)
	local v2028 = t284.new()
	local n125 = 0

	while n125 < buffer.len(p186) do
		local v2030, v2031

		v2030, v2031, n125 = proto.readTag(p186, n125)

		if v2031 == proto.wireTypes.varint then
			if v2030 == 2 then
				local v2032

				v2032, n125 = proto.readVarIntI32(p186, n125)
				v2028.kind = {
					type = "int32_value",
					value = v2032
				}
			elseif v2030 == 3 then
				local v2033

				v2033, n125 = proto.readVarIntI64(p186, n125)
				v2028.kind = {
					type = "int64_value",
					value = v2033
				}
			elseif v2030 == 6 then
				local v2034

				v2034, n125 = proto.readVarInt(p186, n125)
				v2028.kind = {
					type = "bool_value",
					value = v2034 ~= 0
				}
			else
				local v2035

				v2035, n125 = proto.readVarInt(p186, n125)
			end
		elseif v2031 == proto.wireTypes.lengthDelimited then
			if v2030 == 1 then
				local v2036

				v2036, n125 = proto.readBuffer(p186, n125)
				v2028.kind = {
					type = "string_value",
					value = buffer.tostring(v2036)
				}
			else
				local v2037, v2038 = proto.readVarInt(p186, n125)

				n125 = v2038 + v2037
			end
		elseif v2031 == proto.wireTypes.i32 then
			if v2030 == 4 then
				local v2039

				v2039, n125 = proto.readFloat(p186, n125)
				v2028.kind = {
					type = "float_value",
					value = v2039
				}
			else
				local v2040

				v2040, n125 = proto.readFixed32(p186, n125)
			end
		elseif v2031 == proto.wireTypes.i64 then
			if v2030 == 5 then
				local v2041

				v2041, n125 = proto.readDouble(p186, n125)
				v2028.kind = {
					type = "double_value",
					value = v2041
				}
			else
				local v2042

				v2042, n125 = proto.readFixed64(p186, n125)
			end
		else
			error("Unsupported wire type: " .. v2031)
		end
	end

	return v2028
end
function t284.jsonEncode(p187) -- line: 11542
	-- upvalues: proto (copy)
	local t286 = {}

	if p187.kind ~= nil then
		if p187.kind.type == "string_value" then
			t286.stringValue = p187.kind.value

			return t286
		end

		if p187.kind.type == "int32_value" then
			t286.int32Value = p187.kind.value

			return t286
		end

		if p187.kind.type == "int64_value" then
			t286.int64Value = p187.kind.value

			return t286
		end

		if p187.kind.type == "float_value" then
			t286.floatValue = proto.json.serializeNumber(p187.kind.value)

			return t286
		end

		if p187.kind.type == "double_value" then
			t286.doubleValue = proto.json.serializeNumber(p187.kind.value)

			return t286
		end

		if p187.kind.type == "bool_value" then
			t286.boolValue = p187.kind.value
		end
	end

	return t286
end
function t284.jsonDecode(t287: {[any]: any}) -- line: 11564
	-- upvalues: t284 (copy), proto (copy)
	local v2046 = t284.new()

	if t287.string_value ~= nil then
		v2046.kind = {
			type = "string_value",
			value = t287.string_value
		}
	end

	if t287.stringValue ~= nil then
		v2046.kind = {
			type = "string_value",
			value = t287.stringValue
		}
	end

	if t287.int32_value ~= nil then
		v2046.kind = {
			type = "int32_value",
			value = t287.int32_value
		}
	end

	if t287.int32Value ~= nil then
		v2046.kind = {
			type = "int32_value",
			value = t287.int32Value
		}
	end

	if t287.int64_value ~= nil then
		v2046.kind = {
			type = "int64_value",
			value = t287.int64_value
		}
	end

	if t287.int64Value ~= nil then
		v2046.kind = {
			type = "int64_value",
			value = t287.int64Value
		}
	end

	if t287.float_value ~= nil then
		v2046.kind = {
			type = "float_value",
			value = proto.json.deserializeNumber(t287.float_value)
		}
	end

	if t287.floatValue ~= nil then
		v2046.kind = {
			type = "float_value",
			value = proto.json.deserializeNumber(t287.floatValue)
		}
	end

	if t287.double_value ~= nil then
		v2046.kind = {
			type = "double_value",
			value = proto.json.deserializeNumber(t287.double_value)
		}
	end

	if t287.doubleValue ~= nil then
		v2046.kind = {
			type = "double_value",
			value = proto.json.deserializeNumber(t287.doubleValue)
		}
	end

	if t287.bool_value ~= nil then
		v2046.kind = {
			type = "bool_value",
			value = t287.bool_value
		}
	end

	if t287.boolValue ~= nil then
		v2046.kind = {
			type = "bool_value",
			value = t287.boolValue
		}
	end

	return v2046
end

t284.descriptor = {
	name = "TemplateArg_LiteralValue",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
}
t1.TemplateArg_LiteralValue = t284
typeRegistry.default:register(t1.TemplateArg_LiteralValue)

local t288 = {}

t288.__index = t288

function t288.new(t289: {[any]: any}?) -- line: 11632
	-- upvalues: t288 (copy)
	return (setmetatable({
		kind = if t289 ~= nil and t289.kind ~= nil then t289.kind else nil
	}, t288))
end
function t288.encode(p188) -- line: 11638
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n126 = 0

	if p188.kind ~= nil then
		if p188.kind.type == "literal" then
			local v2051 = p188.kind.value:encode()
			local v2052, v2053 = proto.writeTag(buf, n126, 1, proto.wireTypes.lengthDelimited)

			buf, n126 = proto.writeBuffer(v2052, v2053, v2051, buffer.len(v2051))
		elseif p188.kind.type == "conditional" then
			local v2054 = p188.kind.value:encode()
			local v2055, v2056 = proto.writeTag(buf, n126, 2, proto.wireTypes.lengthDelimited)

			buf, n126 = proto.writeBuffer(v2055, v2056, v2054, buffer.len(v2054))
		end
	end

	local buf65 = buffer.create(n126)

	buffer.copy(buf65, 0, buf, 0, n126)

	return buf65
end
function t288.decode(p189: buffer) -- line: 11659
	-- upvalues: t288 (copy), proto (copy), t1 (copy)
	local v2059 = t288.new()
	local n127 = 0

	while n127 < buffer.len(p189) do
		local v2061, v2062

		v2061, v2062, n127 = proto.readTag(p189, n127)

		if v2062 == proto.wireTypes.varint then
			local v2063

			v2063, n127 = proto.readVarInt(p189, n127)
		elseif v2062 == proto.wireTypes.lengthDelimited then
			if v2061 == 1 then
				local v2064

				v2064, n127 = proto.readBuffer(p189, n127)
				v2059.kind = {
					type = "literal",
					value = t1.NestedComponentProp_TemplateData.decode(v2064)
				}
			elseif v2061 == 2 then
				local v2065

				v2065, n127 = proto.readBuffer(p189, n127)
				v2059.kind = {
					type = "conditional",
					value = t1.NestedComponentProp_ConditionalOptions.decode(v2065)
				}
			else
				local v2066, v2067 = proto.readVarInt(p189, n127)

				n127 = v2067 + v2066
			end
		elseif v2062 == proto.wireTypes.i32 then
			local v2068

			v2068, n127 = proto.readFixed32(p189, n127)
		elseif v2062 == proto.wireTypes.i64 then
			local v2069

			v2069, n127 = proto.readFixed64(p189, n127)
		else
			error("Unsupported wire type: " .. v2062)
		end
	end

	return v2059
end
function t288.jsonEncode(p190) -- line: 11708
	local t290 = {}

	if p190.kind ~= nil then
		if p190.kind.type == "literal" then
			t290.literal = p190.kind.value:jsonEncode()

			return t290
		end

		if p190.kind.type == "conditional" then
			t290.conditional = p190.kind.value:jsonEncode()
		end
	end

	return t290
end
function t288.jsonDecode(t291: {[any]: any}) -- line: 11722
	-- upvalues: t288 (copy), t1 (copy)
	local v2073 = t288.new()

	if t291.literal ~= nil then
		v2073.kind = {
			type = "literal",
			value = t1.NestedComponentProp_TemplateData.jsonDecode(t291.literal)
		}
	end

	if t291.conditional ~= nil then
		v2073.kind = {
			type = "conditional",
			value = t1.NestedComponentProp_ConditionalOptions.jsonDecode(t291.conditional)
		}
	end

	return v2073
end

t288.descriptor = {
	name = "NestedComponentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.NestedComponentProp"
}
t1.NestedComponentProp = t288
typeRegistry.default:register(t1.NestedComponentProp)

local t292 = {}

t292.__index = t292

function t292.new(t293: {[any]: any}?) -- line: 11754
	-- upvalues: t292 (copy)
	return (setmetatable({
		condition = if t293 ~= nil and t293.condition ~= nil then t293.condition else nil,
		kind = if t293 ~= nil and t293.kind ~= nil then t293.kind else nil
	}, t292))
end
function t292.encode(p191) -- line: 11763
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n128 = 0

	if p191.condition ~= nil then
		local v2078 = p191.condition:encode()
		local v2079, v2080 = proto.writeTag(buf, n128, 1, proto.wireTypes.lengthDelimited)

		buf, n128 = proto.writeBuffer(v2079, v2080, v2078, buffer.len(v2078))
	end

	if p191.kind ~= nil and p191.kind.type == "literal" then
		local v2081 = p191.kind.value:encode()
		local v2082, v2083 = proto.writeTag(buf, n128, 2, proto.wireTypes.lengthDelimited)

		buf, n128 = proto.writeBuffer(v2082, v2083, v2081, buffer.len(v2081))
	end

	local buf66 = buffer.create(n128)

	buffer.copy(buf66, 0, buf, 0, n128)

	return buf66
end
function t292.decode(p192: buffer) -- line: 11786
	-- upvalues: t292 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v2086 = t292.new()
	local n129 = 0

	while n129 < buffer.len(p192) do
		local v2088, v2089

		v2088, v2089, n129 = proto.readTag(p192, n129)

		if v2089 == proto.wireTypes.varint then
			local v2090

			v2090, n129 = proto.readVarInt(p192, n129)
		elseif v2089 == proto.wireTypes.lengthDelimited then
			if v2088 == 1 then
				local v2091

				v2091, n129 = proto.readBuffer(p192, n129)
				v2086.condition = prop_condition.PropCondition.decode(v2091)
			elseif v2088 == 2 then
				local v2092

				v2092, n129 = proto.readBuffer(p192, n129)
				v2086.kind = {
					type = "literal",
					value = t1.NestedComponentProp_TemplateData.decode(v2092)
				}
			else
				local v2093, v2094 = proto.readVarInt(p192, n129)

				n129 = v2094 + v2093
			end
		elseif v2089 == proto.wireTypes.i32 then
			local v2095

			v2095, n129 = proto.readFixed32(p192, n129)
		elseif v2089 == proto.wireTypes.i64 then
			local v2096

			v2096, n129 = proto.readFixed64(p192, n129)
		else
			error("Unsupported wire type: " .. v2089)
		end
	end

	return v2086
end
function t292.jsonEncode(p193) -- line: 11834
	local t294 = {}

	if p193.condition ~= nil then
		t294.condition = p193.condition:jsonEncode()
	end

	if p193.kind ~= nil and p193.kind.type == "literal" then
		t294.literal = p193.kind.value:jsonEncode()
	end

	return t294
end
function t292.jsonDecode(t295: {[any]: any}) -- line: 11850
	-- upvalues: t292 (copy), prop_condition (copy), t1 (copy)
	local v2100 = t292.new()

	if t295.condition ~= nil then
		v2100.condition = prop_condition.PropCondition.jsonDecode(t295.condition)
	end

	if t295.literal ~= nil then
		v2100.kind = {
			type = "literal",
			value = t1.NestedComponentProp_TemplateData.jsonDecode(t295.literal)
		}
	end

	return v2100
end

t292.descriptor = {
	name = "NestedComponentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.NestedComponentProp_ConditionalOption = t292
typeRegistry.default:register(t1.NestedComponentProp_ConditionalOption)

local t296 = {}

t296.__index = t296

function t296.new(t297: {[any]: any}?) -- line: 11882
	-- upvalues: t296 (copy)
	return (setmetatable({
		options = if t297 ~= nil and t297.options ~= nil then t297.options else {}
	}, t296))
end
function t296.encode(p194) -- line: 11890
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n130 = 0

	if p194.options ~= nil and #p194.options > 0 then
		for _, v2106 in p194.options do
			local v2107 = v2106:encode()
			local v2108, v2109 = proto.writeTag(buf, n130, 1, proto.wireTypes.lengthDelimited)

			buf, n130 = proto.writeBuffer(v2108, v2109, v2107, buffer.len(v2107))
		end
	end

	local buf67 = buffer.create(n130)

	buffer.copy(buf67, 0, buf, 0, n130)

	return buf67
end
function t296.decode(p195: buffer) -- line: 11907
	-- upvalues: t296 (copy), proto (copy), t1 (copy)
	local v2112 = t296.new()
	local n131 = 0

	while n131 < buffer.len(p195) do
		local v2114, v2115

		v2114, v2115, n131 = proto.readTag(p195, n131)

		if v2115 == proto.wireTypes.varint then
			local v2116

			v2116, n131 = proto.readVarInt(p195, n131)
		elseif v2115 == proto.wireTypes.lengthDelimited then
			if v2114 == 1 then
				local v2117

				v2117, n131 = proto.readBuffer(p195, n131)
				table.insert(v2112.options, t1.NestedComponentProp_ConditionalOption.decode(v2117))
			else
				local v2118, v2119 = proto.readVarInt(p195, n131)

				n131 = v2119 + v2118
			end
		elseif v2115 == proto.wireTypes.i32 then
			local v2120

			v2120, n131 = proto.readFixed32(p195, n131)
		elseif v2115 == proto.wireTypes.i64 then
			local v2121

			v2121, n131 = proto.readFixed64(p195, n131)
		else
			error("Unsupported wire type: " .. v2115)
		end
	end

	return v2112
end
function t296.jsonEncode(p196) -- line: 11950
	local t298 = {}

	if p196.options ~= nil and #p196.options > 0 then
		local t299 = {}

		for _, v2126 in p196.options do
			table.insert(t299, v2126:jsonEncode())
		end

		t298.options = t299
	end

	return t298
end
function t296.jsonDecode(t300: {[any]: any}) -- line: 11964
	-- upvalues: t296 (copy), t1 (copy)
	local v2128 = t296.new()

	if t300.options ~= nil then
		local t301 = {}

		for _, v2131 in t300.options do
			table.insert(t301, t1.NestedComponentProp_ConditionalOption.jsonDecode(v2131))
		end

		v2128.options = t301
	end

	return v2128
end

t296.descriptor = {
	name = "NestedComponentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.NestedComponentProp_ConditionalOptions = t296
typeRegistry.default:register(t1.NestedComponentProp_ConditionalOptions)

local t302 = {}

t302.__index = t302

function t302.new(t303: {[any]: any}?) -- line: 11995
	-- upvalues: t302 (copy)
	return (setmetatable({
		inputs = if t303 ~= nil and t303.inputs ~= nil then t303.inputs else {},
		roblox_component = if t303 ~= nil and t303.roblox_component ~= nil then t303.roblox_component else ""
	}, t302))
end
function t302.encode(p197) -- line: 12004
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n132 = 0

	if p197.inputs ~= nil and next(p197.inputs) ~= nil then
		for v2136, v2137 in p197.inputs do
			local buf68 = buffer.create(0)
			local v2139, v2140 = proto.writeTag(buf68, 0, 1, proto.wireTypes.lengthDelimited)
			local v2141, v2142 = proto.writeString(v2139, v2140, v2136)
			local v2143 = v2137:encode()
			local v2144, v2145 = proto.writeTag(v2141, v2142, 2, proto.wireTypes.lengthDelimited)
			local v2146, v2147 = proto.writeBuffer(v2144, v2145, v2143, buffer.len(v2143))
			local v2148, v2149 = proto.writeTag(buf, n132, 1, proto.wireTypes.lengthDelimited)

			buf, n132 = proto.writeBuffer(v2148, v2149, v2146, v2147)
		end
	end

	if p197.roblox_component ~= nil and p197.roblox_component ~= "" then
		local v2150, v2151 = proto.writeTag(buf, n132, 2, proto.wireTypes.lengthDelimited)

		buf, n132 = proto.writeString(v2150, v2151, p197.roblox_component)
	end

	local buf69 = buffer.create(n132)

	buffer.copy(buf69, 0, buf, 0, n132)

	return buf69
end
function t302.decode(p198: buffer) -- line: 12032
	-- upvalues: t302 (copy), proto (copy), t1 (copy)
	local v2154 = t302.new()
	local n133 = 0

	while n133 < buffer.len(p198) do
		local v2156, v2157

		v2156, v2157, n133 = proto.readTag(p198, n133)

		if v2157 == proto.wireTypes.varint then
			local v2158

			v2158, n133 = proto.readVarInt(p198, n133)
		elseif v2157 == proto.wireTypes.lengthDelimited then
			if v2156 == 1 then
				local v2159

				v2159, n133 = proto.readBuffer(p198, n133)

				local v2160 = t1.NestedComponentProp_TemplateData_InputsEntry.decode(v2159)
				local v2161 = t1.TemplateArg.new()

				v2154.inputs[v2160.key or ""] = v2160.value or v2161
			elseif v2156 == 2 then
				local v2162

				v2162, n133 = proto.readBuffer(p198, n133)
				v2154.roblox_component = buffer.tostring(v2162)
			else
				local v2163, v2164 = proto.readVarInt(p198, n133)

				n133 = v2164 + v2163
			end
		elseif v2157 == proto.wireTypes.i32 then
			local v2165

			v2165, n133 = proto.readFixed32(p198, n133)
		elseif v2157 == proto.wireTypes.i64 then
			local v2166

			v2166, n133 = proto.readFixed64(p198, n133)
		else
			error("Unsupported wire type: " .. v2157)
		end
	end

	return v2154
end
function t302.jsonEncode(p199) -- line: 12087
	local t304 = {}

	if p199.inputs ~= nil and next(p199.inputs) ~= nil then
		local t305 = {}

		for v2170, v2171 in p199.inputs do
			t305[v2170] = v2171:jsonEncode()
		end

		t304.inputs = t305
	end

	if p199.roblox_component ~= nil and p199.roblox_component ~= "" then
		t304.robloxComponent = p199.roblox_component
	end

	return t304
end
function t302.jsonDecode(t306: {[any]: any}) -- line: 12105
	-- upvalues: t302 (copy), t1 (copy)
	local v2173 = t302.new()

	if t306.inputs ~= nil then
		local t307 = {}

		for v2175, v2176 in t306.inputs do
			t307[v2175] = t1.TemplateArg.jsonDecode(v2176)
		end

		v2173.inputs = t307
	end

	if t306.roblox_component ~= nil then
		v2173.roblox_component = t306.roblox_component
	end

	if t306.robloxComponent ~= nil then
		v2173.roblox_component = t306.robloxComponent
	end

	return v2173
end

t302.descriptor = {
	name = "NestedComponentProp_TemplateData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateData"
}
t1.NestedComponentProp_TemplateData = t302
typeRegistry.default:register(t1.NestedComponentProp_TemplateData)

local t308 = {}

t308.__index = t308

function t308.new(t309: {[any]: any}?) -- line: 12144
	-- upvalues: t308 (copy)
	return (setmetatable({
		key = if t309 ~= nil and t309.key ~= nil then t309.key else "",
		value = if t309 ~= nil and t309.value ~= nil then t309.value else nil
	}, t308))
end
function t308.encode(p200) -- line: 12153
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n134 = 0

	if p200.key ~= nil and p200.key ~= "" then
		local v2181, v2182 = proto.writeTag(buf, n134, 1, proto.wireTypes.lengthDelimited)

		buf, n134 = proto.writeString(v2181, v2182, p200.key)
	end

	if p200.value ~= nil then
		local v2183 = p200.value:encode()
		local v2184, v2185 = proto.writeTag(buf, n134, 2, proto.wireTypes.lengthDelimited)

		buf, n134 = proto.writeBuffer(v2184, v2185, v2183, buffer.len(v2183))
	end

	local buf70 = buffer.create(n134)

	buffer.copy(buf70, 0, buf, 0, n134)

	return buf70
end
function t308.decode(p201: buffer) -- line: 12175
	-- upvalues: t308 (copy), proto (copy), t1 (copy)
	local v2188 = t308.new()
	local n135 = 0

	while n135 < buffer.len(p201) do
		local v2190, v2191

		v2190, v2191, n135 = proto.readTag(p201, n135)

		if v2191 == proto.wireTypes.varint then
			local v2192

			v2192, n135 = proto.readVarInt(p201, n135)
		elseif v2191 == proto.wireTypes.lengthDelimited then
			if v2190 == 1 then
				local v2193

				v2193, n135 = proto.readBuffer(p201, n135)
				v2188.key = buffer.tostring(v2193)
			elseif v2190 == 2 then
				local v2194

				v2194, n135 = proto.readBuffer(p201, n135)
				v2188.value = t1.TemplateArg.decode(v2194)
			else
				local v2195, v2196 = proto.readVarInt(p201, n135)

				n135 = v2196 + v2195
			end
		elseif v2191 == proto.wireTypes.i32 then
			local v2197

			v2197, n135 = proto.readFixed32(p201, n135)
		elseif v2191 == proto.wireTypes.i64 then
			local v2198

			v2198, n135 = proto.readFixed64(p201, n135)
		else
			error("Unsupported wire type: " .. v2191)
		end
	end

	return v2188
end
function t308.jsonEncode(p202) -- line: 12225
	local t310 = {}

	if p202.key ~= nil and p202.key ~= "" then
		t310.key = p202.key
	end

	if p202.value ~= nil then
		t310.value = p202.value:jsonEncode()
	end

	return t310
end
function t308.jsonDecode(t311: {[any]: any}) -- line: 12241
	-- upvalues: t308 (copy), t1 (copy)
	local v2202 = t308.new()

	if t311.key ~= nil then
		v2202.key = t311.key
	end

	if t311.value ~= nil then
		v2202.value = t1.TemplateArg.jsonDecode(t311.value)
	end

	return v2202
end

t308.descriptor = {
	name = "NestedComponentProp_TemplateData_InputsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputsEntry"
}
t1.NestedComponentProp_TemplateData_InputsEntry = t308
typeRegistry.default:register(t1.NestedComponentProp_TemplateData_InputsEntry)

local t312 = {}

t312.__index = t312

function t312.new(t313: {[any]: any}?) -- line: 12271
	-- upvalues: t312 (copy)
	return (setmetatable({
		kind = if t313 ~= nil and t313.kind ~= nil then t313.kind else nil
	}, t312))
end
function t312.encode(p203) -- line: 12279
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n136 = 0

	if p203.kind ~= nil then
		if p203.kind.type == "array_map" then
			local v2207 = p203.kind.value:encode()
			local v2208, v2209 = proto.writeTag(buf, n136, 1, proto.wireTypes.lengthDelimited)

			buf, n136 = proto.writeBuffer(v2208, v2209, v2207, buffer.len(v2207))
		elseif p203.kind.type == "item_list" then
			local v2210 = p203.kind.value:encode()
			local v2211, v2212 = proto.writeTag(buf, n136, 2, proto.wireTypes.lengthDelimited)

			buf, n136 = proto.writeBuffer(v2211, v2212, v2210, buffer.len(v2210))
		elseif p203.kind.type == "conditional" then
			local v2213 = p203.kind.value:encode()
			local v2214, v2215 = proto.writeTag(buf, n136, 3, proto.wireTypes.lengthDelimited)

			buf, n136 = proto.writeBuffer(v2214, v2215, v2213, buffer.len(v2213))
		elseif p203.kind.type == "ordered_template_data" then
			local v2216 = p203.kind.value:encode()
			local v2217, v2218 = proto.writeTag(buf, n136, 4, proto.wireTypes.lengthDelimited)

			buf, n136 = proto.writeBuffer(v2217, v2218, v2216, buffer.len(v2216))
		end
	end

	local buf71 = buffer.create(n136)

	buffer.copy(buf71, 0, buf, 0, n136)

	return buf71
end
function t312.decode(p204: buffer) -- line: 12308
	-- upvalues: t312 (copy), proto (copy), t1 (copy)
	local v2221 = t312.new()
	local n137 = 0

	while n137 < buffer.len(p204) do
		local v2223, v2224

		v2223, v2224, n137 = proto.readTag(p204, n137)

		if v2224 == proto.wireTypes.varint then
			local v2225

			v2225, n137 = proto.readVarInt(p204, n137)
		elseif v2224 == proto.wireTypes.lengthDelimited then
			if v2223 == 1 then
				local v2226

				v2226, n137 = proto.readBuffer(p204, n137)
				v2221.kind = {
					type = "array_map",
					value = t1.LazyNestedComponentListProp_TemplateData.decode(v2226)
				}
			elseif v2223 == 2 then
				local v2227

				v2227, n137 = proto.readBuffer(p204, n137)
				v2221.kind = {
					type = "item_list",
					value = t1.LazyNestedComponentListProp_TemplateDataList.decode(v2227)
				}
			elseif v2223 == 3 then
				local v2228

				v2228, n137 = proto.readBuffer(p204, n137)
				v2221.kind = {
					type = "conditional",
					value = t1.LazyNestedComponentListProp_ConditionalOptions.decode(v2228)
				}
			elseif v2223 == 4 then
				local v2229

				v2229, n137 = proto.readBuffer(p204, n137)
				v2221.kind = {
					type = "ordered_template_data",
					value = t1.LazyNestedComponentListProp_OrderedTemplateData.decode(v2229)
				}
			else
				local v2230, v2231 = proto.readVarInt(p204, n137)

				n137 = v2231 + v2230
			end
		elseif v2224 == proto.wireTypes.i32 then
			local v2232

			v2232, n137 = proto.readFixed32(p204, n137)
		elseif v2224 == proto.wireTypes.i64 then
			local v2233

			v2233, n137 = proto.readFixed64(p204, n137)
		else
			error("Unsupported wire type: " .. v2224)
		end
	end

	return v2221
end
function t312.jsonEncode(p205) -- line: 12376
	local t314 = {}

	if p205.kind ~= nil then
		if p205.kind.type == "array_map" then
			t314.arrayMap = p205.kind.value:jsonEncode()

			return t314
		end

		if p205.kind.type == "item_list" then
			t314.itemList = p205.kind.value:jsonEncode()

			return t314
		end

		if p205.kind.type == "conditional" then
			t314.conditional = p205.kind.value:jsonEncode()

			return t314
		end

		if p205.kind.type == "ordered_template_data" then
			t314.orderedTemplateData = p205.kind.value:jsonEncode()
		end
	end

	return t314
end
function t312.jsonDecode(t315: {[any]: any}) -- line: 12394
	-- upvalues: t312 (copy), t1 (copy)
	local v2237 = t312.new()

	if t315.array_map ~= nil then
		v2237.kind = {
			type = "array_map",
			value = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(t315.array_map)
		}
	end

	if t315.arrayMap ~= nil then
		v2237.kind = {
			type = "array_map",
			value = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(t315.arrayMap)
		}
	end

	if t315.item_list ~= nil then
		v2237.kind = {
			type = "item_list",
			value = t1.LazyNestedComponentListProp_TemplateDataList.jsonDecode(t315.item_list)
		}
	end

	if t315.itemList ~= nil then
		v2237.kind = {
			type = "item_list",
			value = t1.LazyNestedComponentListProp_TemplateDataList.jsonDecode(t315.itemList)
		}
	end

	if t315.conditional ~= nil then
		v2237.kind = {
			type = "conditional",
			value = t1.LazyNestedComponentListProp_ConditionalOptions.jsonDecode(t315.conditional)
		}
	end

	if t315.ordered_template_data ~= nil then
		v2237.kind = {
			type = "ordered_template_data",
			value = t1.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(t315.ordered_template_data)
		}
	end

	if t315.orderedTemplateData ~= nil then
		v2237.kind = {
			type = "ordered_template_data",
			value = t1.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(t315.orderedTemplateData)
		}
	end

	return v2237
end

t312.descriptor = {
	name = "LazyNestedComponentListProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.LazyNestedComponentListProp"
}
t1.LazyNestedComponentListProp = t312
typeRegistry.default:register(t1.LazyNestedComponentListProp)

local t316 = {}

t316.__index = t316

function t316.new(t317: {[any]: any}?) -- line: 12465
	-- upvalues: t316 (copy)
	return (setmetatable({
		condition = if t317 ~= nil and t317.condition ~= nil then t317.condition else nil,
		kind = if t317 ~= nil and t317.kind ~= nil then t317.kind else nil
	}, t316))
end
function t316.encode(p206) -- line: 12474
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n138 = 0

	if p206.condition ~= nil then
		local v2242 = p206.condition:encode()
		local v2243, v2244 = proto.writeTag(buf, n138, 1, proto.wireTypes.lengthDelimited)

		buf, n138 = proto.writeBuffer(v2243, v2244, v2242, buffer.len(v2242))
	end

	if p206.kind ~= nil then
		if p206.kind.type == "literal" then
			local v2245 = p206.kind.value:encode()
			local v2246, v2247 = proto.writeTag(buf, n138, 2, proto.wireTypes.lengthDelimited)

			buf, n138 = proto.writeBuffer(v2246, v2247, v2245, buffer.len(v2245))
		elseif p206.kind.type == "item_list" then
			local v2248 = p206.kind.value:encode()
			local v2249, v2250 = proto.writeTag(buf, n138, 3, proto.wireTypes.lengthDelimited)

			buf, n138 = proto.writeBuffer(v2249, v2250, v2248, buffer.len(v2248))
		end
	end

	local buf72 = buffer.create(n138)

	buffer.copy(buf72, 0, buf, 0, n138)

	return buf72
end
function t316.decode(p207: buffer) -- line: 12503
	-- upvalues: t316 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v2253 = t316.new()
	local n139 = 0

	while n139 < buffer.len(p207) do
		local v2255, v2256

		v2255, v2256, n139 = proto.readTag(p207, n139)

		if v2256 == proto.wireTypes.varint then
			local v2257

			v2257, n139 = proto.readVarInt(p207, n139)
		elseif v2256 == proto.wireTypes.lengthDelimited then
			if v2255 == 1 then
				local v2258

				v2258, n139 = proto.readBuffer(p207, n139)
				v2253.condition = prop_condition.PropCondition.decode(v2258)
			elseif v2255 == 2 then
				local v2259

				v2259, n139 = proto.readBuffer(p207, n139)
				v2253.kind = {
					type = "literal",
					value = t1.LazyNestedComponentListProp_TemplateData.decode(v2259)
				}
			elseif v2255 == 3 then
				local v2260

				v2260, n139 = proto.readBuffer(p207, n139)
				v2253.kind = {
					type = "item_list",
					value = t1.LazyNestedComponentListProp_TemplateDataList.decode(v2260)
				}
			else
				local v2261, v2262 = proto.readVarInt(p207, n139)

				n139 = v2262 + v2261
			end
		elseif v2256 == proto.wireTypes.i32 then
			local v2263

			v2263, n139 = proto.readFixed32(p207, n139)
		elseif v2256 == proto.wireTypes.i64 then
			local v2264

			v2264, n139 = proto.readFixed64(p207, n139)
		else
			error("Unsupported wire type: " .. v2256)
		end
	end

	return v2253
end
function t316.jsonEncode(p208) -- line: 12562
	local t318 = {}

	if p208.condition ~= nil then
		t318.condition = p208.condition:jsonEncode()
	end

	if p208.kind ~= nil then
		if p208.kind.type == "literal" then
			t318.literal = p208.kind.value:jsonEncode()

			return t318
		end

		if p208.kind.type == "item_list" then
			t318.itemList = p208.kind.value:jsonEncode()
		end
	end

	return t318
end
function t316.jsonDecode(t319: {[any]: any}) -- line: 12582
	-- upvalues: t316 (copy), prop_condition (copy), t1 (copy)
	local v2268 = t316.new()

	if t319.condition ~= nil then
		v2268.condition = prop_condition.PropCondition.jsonDecode(t319.condition)
	end

	if t319.literal ~= nil then
		v2268.kind = {
			type = "literal",
			value = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(t319.literal)
		}
	end

	if t319.item_list ~= nil then
		v2268.kind = {
			type = "item_list",
			value = t1.LazyNestedComponentListProp_TemplateDataList.jsonDecode(t319.item_list)
		}
	end

	if t319.itemList ~= nil then
		v2268.kind = {
			type = "item_list",
			value = t1.LazyNestedComponentListProp_TemplateDataList.jsonDecode(t319.itemList)
		}
	end

	return v2268
end

t316.descriptor = {
	name = "LazyNestedComponentListProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.LazyNestedComponentListProp_ConditionalOption = t316
typeRegistry.default:register(t1.LazyNestedComponentListProp_ConditionalOption)

local t320 = {}

t320.__index = t320

function t320.new(t321: {[any]: any}?) -- line: 12630
	-- upvalues: t320 (copy)
	return (setmetatable({
		options = if t321 ~= nil and t321.options ~= nil then t321.options else {}
	}, t320))
end
function t320.encode(p209) -- line: 12638
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n140 = 0

	if p209.options ~= nil and #p209.options > 0 then
		for _, v2274 in p209.options do
			local v2275 = v2274:encode()
			local v2276, v2277 = proto.writeTag(buf, n140, 1, proto.wireTypes.lengthDelimited)

			buf, n140 = proto.writeBuffer(v2276, v2277, v2275, buffer.len(v2275))
		end
	end

	local buf73 = buffer.create(n140)

	buffer.copy(buf73, 0, buf, 0, n140)

	return buf73
end
function t320.decode(p210: buffer) -- line: 12657
	-- upvalues: t320 (copy), proto (copy), t1 (copy)
	local v2280 = t320.new()
	local n141 = 0

	while n141 < buffer.len(p210) do
		local v2282, v2283

		v2282, v2283, n141 = proto.readTag(p210, n141)

		if v2283 == proto.wireTypes.varint then
			local v2284

			v2284, n141 = proto.readVarInt(p210, n141)
		elseif v2283 == proto.wireTypes.lengthDelimited then
			if v2282 == 1 then
				local v2285

				v2285, n141 = proto.readBuffer(p210, n141)
				table.insert(v2280.options, t1.LazyNestedComponentListProp_ConditionalOption.decode(v2285))
			else
				local v2286, v2287 = proto.readVarInt(p210, n141)

				n141 = v2287 + v2286
			end
		elseif v2283 == proto.wireTypes.i32 then
			local v2288

			v2288, n141 = proto.readFixed32(p210, n141)
		elseif v2283 == proto.wireTypes.i64 then
			local v2289

			v2289, n141 = proto.readFixed64(p210, n141)
		else
			error("Unsupported wire type: " .. v2283)
		end
	end

	return v2280
end
function t320.jsonEncode(p211) -- line: 12702
	local t322 = {}

	if p211.options ~= nil and #p211.options > 0 then
		local t323 = {}

		for _, v2294 in p211.options do
			table.insert(t323, v2294:jsonEncode())
		end

		t322.options = t323
	end

	return t322
end
function t320.jsonDecode(t324: {[any]: any}) -- line: 12718
	-- upvalues: t320 (copy), t1 (copy)
	local v2296 = t320.new()

	if t324.options ~= nil then
		local t325 = {}

		for _, v2299 in t324.options do
			table.insert(t325, t1.LazyNestedComponentListProp_ConditionalOption.jsonDecode(v2299))
		end

		v2296.options = t325
	end

	return v2296
end

t320.descriptor = {
	name = "LazyNestedComponentListProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.LazyNestedComponentListProp_ConditionalOptions = t320
typeRegistry.default:register(t1.LazyNestedComponentListProp_ConditionalOptions)

local t326 = {}

t326.__index = t326

function t326.new(t327: {[any]: any}?) -- line: 12749
	-- upvalues: t326 (copy)
	return (setmetatable({
		binding_path = if t327 ~= nil and t327.binding_path ~= nil then t327.binding_path else "",
		roblox_component = if t327 ~= nil and t327.roblox_component ~= nil then t327.roblox_component else "",
		inputs = if t327 ~= nil and t327.inputs ~= nil then t327.inputs else {}
	}, t326))
end
function t326.encode(p212) -- line: 12759
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n142 = 0

	if p212.binding_path ~= nil and p212.binding_path ~= "" then
		local v2304, v2305 = proto.writeTag(buf, n142, 1, proto.wireTypes.lengthDelimited)

		buf, n142 = proto.writeString(v2304, v2305, p212.binding_path)
	end

	if p212.roblox_component ~= nil and p212.roblox_component ~= "" then
		local v2306, v2307 = proto.writeTag(buf, n142, 2, proto.wireTypes.lengthDelimited)

		buf, n142 = proto.writeString(v2306, v2307, p212.roblox_component)
	end

	if p212.inputs ~= nil and next(p212.inputs) ~= nil then
		for v2308, v2309 in p212.inputs do
			local buf74 = buffer.create(0)
			local v2311, v2312 = proto.writeTag(buf74, 0, 1, proto.wireTypes.lengthDelimited)
			local v2313, v2314 = proto.writeString(v2311, v2312, v2308)
			local v2315 = v2309:encode()
			local v2316, v2317 = proto.writeTag(v2313, v2314, 2, proto.wireTypes.lengthDelimited)
			local v2318, v2319 = proto.writeBuffer(v2316, v2317, v2315, buffer.len(v2315))
			local v2320, v2321 = proto.writeTag(buf, n142, 3, proto.wireTypes.lengthDelimited)

			buf, n142 = proto.writeBuffer(v2320, v2321, v2318, v2319)
		end
	end

	local buf75 = buffer.create(n142)

	buffer.copy(buf75, 0, buf, 0, n142)

	return buf75
end
function t326.decode(p213: buffer) -- line: 12794
	-- upvalues: t326 (copy), proto (copy), t1 (copy)
	local v2324 = t326.new()
	local n143 = 0

	while n143 < buffer.len(p213) do
		local v2326, v2327

		v2326, v2327, n143 = proto.readTag(p213, n143)

		if v2327 == proto.wireTypes.varint then
			local v2328

			v2328, n143 = proto.readVarInt(p213, n143)
		elseif v2327 == proto.wireTypes.lengthDelimited then
			if v2326 == 1 then
				local v2329

				v2329, n143 = proto.readBuffer(p213, n143)
				v2324.binding_path = buffer.tostring(v2329)
			elseif v2326 == 2 then
				local v2330

				v2330, n143 = proto.readBuffer(p213, n143)
				v2324.roblox_component = buffer.tostring(v2330)
			elseif v2326 == 3 then
				local v2331

				v2331, n143 = proto.readBuffer(p213, n143)

				local v2332 = t1.LazyNestedComponentListProp_TemplateData_InputsEntry.decode(v2331)
				local v2333 = t1.TemplateArg.new()

				v2324.inputs[v2332.key or ""] = v2332.value or v2333
			else
				local v2334, v2335 = proto.readVarInt(p213, n143)

				n143 = v2335 + v2334
			end
		elseif v2327 == proto.wireTypes.i32 then
			local v2336

			v2336, n143 = proto.readFixed32(p213, n143)
		elseif v2327 == proto.wireTypes.i64 then
			local v2337

			v2337, n143 = proto.readFixed64(p213, n143)
		else
			error("Unsupported wire type: " .. v2327)
		end
	end

	return v2324
end
function t326.jsonEncode(p214) -- line: 12856
	local t328 = {}

	if p214.binding_path ~= nil and p214.binding_path ~= "" then
		t328.bindingPath = p214.binding_path
	end

	if p214.roblox_component ~= nil and p214.roblox_component ~= "" then
		t328.robloxComponent = p214.roblox_component
	end

	if p214.inputs ~= nil and next(p214.inputs) ~= nil then
		local t329 = {}

		for v2341, v2342 in p214.inputs do
			t329[v2341] = v2342:jsonEncode()
		end

		t328.inputs = t329
	end

	return t328
end
function t326.jsonDecode(t330: {[any]: any}) -- line: 12880
	-- upvalues: t326 (copy), t1 (copy)
	local v2344 = t326.new()

	if t330.binding_path ~= nil then
		v2344.binding_path = t330.binding_path
	end

	if t330.bindingPath ~= nil then
		v2344.binding_path = t330.bindingPath
	end

	if t330.roblox_component ~= nil then
		v2344.roblox_component = t330.roblox_component
	end

	if t330.robloxComponent ~= nil then
		v2344.roblox_component = t330.robloxComponent
	end

	if t330.inputs ~= nil then
		local t331 = {}

		for v2346, v2347 in t330.inputs do
			t331[v2346] = t1.TemplateArg.jsonDecode(v2347)
		end

		v2344.inputs = t331
	end

	return v2344
end

t326.descriptor = {
	name = "LazyNestedComponentListProp_TemplateData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateData"
}
t1.LazyNestedComponentListProp_TemplateData = t326
typeRegistry.default:register(t1.LazyNestedComponentListProp_TemplateData)

local t332 = {}

t332.__index = t332

function t332.new(t333: {[any]: any}?) -- line: 12928
	-- upvalues: t332 (copy)
	return (setmetatable({
		key = if t333 ~= nil and t333.key ~= nil then t333.key else "",
		value = if t333 ~= nil and t333.value ~= nil then t333.value else nil
	}, t332))
end
function t332.encode(p215) -- line: 12940
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n144 = 0

	if p215.key ~= nil and p215.key ~= "" then
		local v2352, v2353 = proto.writeTag(buf, n144, 1, proto.wireTypes.lengthDelimited)

		buf, n144 = proto.writeString(v2352, v2353, p215.key)
	end

	if p215.value ~= nil then
		local v2354 = p215.value:encode()
		local v2355, v2356 = proto.writeTag(buf, n144, 2, proto.wireTypes.lengthDelimited)

		buf, n144 = proto.writeBuffer(v2355, v2356, v2354, buffer.len(v2354))
	end

	local buf76 = buffer.create(n144)

	buffer.copy(buf76, 0, buf, 0, n144)

	return buf76
end
function t332.decode(p216: buffer) -- line: 12962
	-- upvalues: t332 (copy), proto (copy), t1 (copy)
	local v2359 = t332.new()
	local n145 = 0

	while n145 < buffer.len(p216) do
		local v2361, v2362

		v2361, v2362, n145 = proto.readTag(p216, n145)

		if v2362 == proto.wireTypes.varint then
			local v2363

			v2363, n145 = proto.readVarInt(p216, n145)
		elseif v2362 == proto.wireTypes.lengthDelimited then
			if v2361 == 1 then
				local v2364

				v2364, n145 = proto.readBuffer(p216, n145)
				v2359.key = buffer.tostring(v2364)
			elseif v2361 == 2 then
				local v2365

				v2365, n145 = proto.readBuffer(p216, n145)
				v2359.value = t1.TemplateArg.decode(v2365)
			else
				local v2366, v2367 = proto.readVarInt(p216, n145)

				n145 = v2367 + v2366
			end
		elseif v2362 == proto.wireTypes.i32 then
			local v2368

			v2368, n145 = proto.readFixed32(p216, n145)
		elseif v2362 == proto.wireTypes.i64 then
			local v2369

			v2369, n145 = proto.readFixed64(p216, n145)
		else
			error("Unsupported wire type: " .. v2362)
		end
	end

	return v2359
end
function t332.jsonEncode(p217) -- line: 13012
	local t334 = {}

	if p217.key ~= nil and p217.key ~= "" then
		t334.key = p217.key
	end

	if p217.value ~= nil then
		t334.value = p217.value:jsonEncode()
	end

	return t334
end
function t332.jsonDecode(t335: {[any]: any}) -- line: 13028
	-- upvalues: t332 (copy), t1 (copy)
	local v2373 = t332.new()

	if t335.key ~= nil then
		v2373.key = t335.key
	end

	if t335.value ~= nil then
		v2373.value = t1.TemplateArg.jsonDecode(t335.value)
	end

	return v2373
end

t332.descriptor = {
	name = "LazyNestedComponentListProp_TemplateData_InputsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputsEntry"
}
t1.LazyNestedComponentListProp_TemplateData_InputsEntry = t332
typeRegistry.default:register(t1.LazyNestedComponentListProp_TemplateData_InputsEntry)

local t336 = {}

t336.__index = t336

function t336.new(t337: {[any]: any}?) -- line: 13059
	-- upvalues: t336 (copy)
	return (setmetatable({
		items = if t337 ~= nil and t337.items ~= nil then t337.items else {}
	}, t336))
end
function t336.encode(p218) -- line: 13067
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n146 = 0

	if p218.items ~= nil and #p218.items > 0 then
		for _, v2379 in p218.items do
			local v2380 = v2379:encode()
			local v2381, v2382 = proto.writeTag(buf, n146, 1, proto.wireTypes.lengthDelimited)

			buf, n146 = proto.writeBuffer(v2381, v2382, v2380, buffer.len(v2380))
		end
	end

	local buf77 = buffer.create(n146)

	buffer.copy(buf77, 0, buf, 0, n146)

	return buf77
end
function t336.decode(p219: buffer) -- line: 13086
	-- upvalues: t336 (copy), proto (copy), t1 (copy)
	local v2385 = t336.new()
	local n147 = 0

	while n147 < buffer.len(p219) do
		local v2387, v2388

		v2387, v2388, n147 = proto.readTag(p219, n147)

		if v2388 == proto.wireTypes.varint then
			local v2389

			v2389, n147 = proto.readVarInt(p219, n147)
		elseif v2388 == proto.wireTypes.lengthDelimited then
			if v2387 == 1 then
				local v2390

				v2390, n147 = proto.readBuffer(p219, n147)
				table.insert(v2385.items, t1.LazyNestedComponentListProp_TemplateData.decode(v2390))
			else
				local v2391, v2392 = proto.readVarInt(p219, n147)

				n147 = v2392 + v2391
			end
		elseif v2388 == proto.wireTypes.i32 then
			local v2393

			v2393, n147 = proto.readFixed32(p219, n147)
		elseif v2388 == proto.wireTypes.i64 then
			local v2394

			v2394, n147 = proto.readFixed64(p219, n147)
		else
			error("Unsupported wire type: " .. v2388)
		end
	end

	return v2385
end
function t336.jsonEncode(p220) -- line: 13131
	local t338 = {}

	if p220.items ~= nil and #p220.items > 0 then
		local t339 = {}

		for _, v2399 in p220.items do
			table.insert(t339, v2399:jsonEncode())
		end

		t338.items = t339
	end

	return t338
end
function t336.jsonDecode(t340: {[any]: any}) -- line: 13147
	-- upvalues: t336 (copy), t1 (copy)
	local v2401 = t336.new()

	if t340.items ~= nil then
		local t341 = {}

		for _, v2404 in t340.items do
			table.insert(t341, t1.LazyNestedComponentListProp_TemplateData.jsonDecode(v2404))
		end

		v2401.items = t341
	end

	return v2401
end

t336.descriptor = {
	name = "LazyNestedComponentListProp_TemplateDataList",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateDataList"
}
t1.LazyNestedComponentListProp_TemplateDataList = t336
typeRegistry.default:register(t1.LazyNestedComponentListProp_TemplateDataList)

local t342 = {}

t342.__index = t342

function t342.new(t343: {[any]: any}?) -- line: 13178
	-- upvalues: t342 (copy)
	return (setmetatable({
		entry_map_path = if t343 ~= nil and t343.entry_map_path ~= nil then t343.entry_map_path else "",
		entry_order = if t343 ~= nil and t343.entry_order ~= nil then t343.entry_order else nil,
		template_data_map = if t343 ~= nil and t343.template_data_map ~= nil then t343.template_data_map else {}
	}, t342))
end
function t342.encode(p221) -- line: 13188
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n148 = 0

	if p221.entry_map_path ~= nil and p221.entry_map_path ~= "" then
		local v2409, v2410 = proto.writeTag(buf, n148, 1, proto.wireTypes.lengthDelimited)

		buf, n148 = proto.writeString(v2409, v2410, p221.entry_map_path)
	end

	if p221.entry_order ~= nil then
		local v2411 = p221.entry_order:encode()
		local v2412, v2413 = proto.writeTag(buf, n148, 2, proto.wireTypes.lengthDelimited)

		buf, n148 = proto.writeBuffer(v2412, v2413, v2411, buffer.len(v2411))
	end

	if p221.template_data_map ~= nil and next(p221.template_data_map) ~= nil then
		for v2414, v2415 in p221.template_data_map do
			local buf78 = buffer.create(0)
			local v2417, v2418 = proto.writeTag(buf78, 0, 1, proto.wireTypes.lengthDelimited)
			local v2419, v2420 = proto.writeString(v2417, v2418, v2414)
			local v2421 = v2415:encode()
			local v2422, v2423 = proto.writeTag(v2419, v2420, 2, proto.wireTypes.lengthDelimited)
			local v2424, v2425 = proto.writeBuffer(v2422, v2423, v2421, buffer.len(v2421))
			local v2426, v2427 = proto.writeTag(buf, n148, 3, proto.wireTypes.lengthDelimited)

			buf, n148 = proto.writeBuffer(v2426, v2427, v2424, v2425)
		end
	end

	local buf79 = buffer.create(n148)

	buffer.copy(buf79, 0, buf, 0, n148)

	return buf79
end
function t342.decode(p222: buffer) -- line: 13224
	-- upvalues: t342 (copy), proto (copy), t1 (copy)
	local v2430 = t342.new()
	local n149 = 0

	while n149 < buffer.len(p222) do
		local v2432, v2433

		v2432, v2433, n149 = proto.readTag(p222, n149)

		if v2433 == proto.wireTypes.varint then
			local v2434

			v2434, n149 = proto.readVarInt(p222, n149)
		elseif v2433 == proto.wireTypes.lengthDelimited then
			if v2432 == 1 then
				local v2435

				v2435, n149 = proto.readBuffer(p222, n149)
				v2430.entry_map_path = buffer.tostring(v2435)
			elseif v2432 == 2 then
				local v2436

				v2436, n149 = proto.readBuffer(p222, n149)
				v2430.entry_order = t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData.decode(v2436)
			elseif v2432 == 3 then
				local v2437

				v2437, n149 = proto.readBuffer(p222, n149)

				local v2438 = t1.LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry.decode(v2437)
				local v2439 = t1.LazyNestedComponentListProp_TemplateData.new()

				v2430.template_data_map[v2438.key or ""] = v2438.value or v2439
			else
				local v2440, v2441 = proto.readVarInt(p222, n149)

				n149 = v2441 + v2440
			end
		elseif v2433 == proto.wireTypes.i32 then
			local v2442

			v2442, n149 = proto.readFixed32(p222, n149)
		elseif v2433 == proto.wireTypes.i64 then
			local v2443

			v2443, n149 = proto.readFixed64(p222, n149)
		else
			error("Unsupported wire type: " .. v2433)
		end
	end

	return v2430
end
function t342.jsonEncode(p223) -- line: 13288
	local t344 = {}

	if p223.entry_map_path ~= nil and p223.entry_map_path ~= "" then
		t344.entryMapPath = p223.entry_map_path
	end

	if p223.entry_order ~= nil then
		t344.entryOrder = p223.entry_order:jsonEncode()
	end

	if p223.template_data_map ~= nil and next(p223.template_data_map) ~= nil then
		local t345 = {}

		for v2447, v2448 in p223.template_data_map do
			t345[v2447] = v2448:jsonEncode()
		end

		t344.templateDataMap = t345
	end

	return t344
end
function t342.jsonDecode(t346: {[any]: any}) -- line: 13312
	-- upvalues: t342 (copy), t1 (copy)
	local v2450 = t342.new()

	if t346.entry_map_path ~= nil then
		v2450.entry_map_path = t346.entry_map_path
	end

	if t346.entryMapPath ~= nil then
		v2450.entry_map_path = t346.entryMapPath
	end

	if t346.entry_order ~= nil then
		v2450.entry_order = t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData.jsonDecode(t346.entry_order)
	end

	if t346.entryOrder ~= nil then
		v2450.entry_order = t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData.jsonDecode(t346.entryOrder)
	end

	if t346.template_data_map ~= nil then
		local t347 = {}

		for v2452, v2453 in t346.template_data_map do
			t347[v2452] = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(v2453)
		end

		v2450.template_data_map = t347
	end

	if t346.templateDataMap ~= nil then
		local t348 = {}

		for v2455, v2456 in t346.templateDataMap do
			t348[v2455] = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(v2456)
		end

		v2450.template_data_map = t348
	end

	return v2450
end

t342.descriptor = {
	name = "LazyNestedComponentListProp_OrderedTemplateData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OrderedTemplateData"
}
t1.LazyNestedComponentListProp_OrderedTemplateData = t342
typeRegistry.default:register(t1.LazyNestedComponentListProp_OrderedTemplateData)

local t349 = {}

t349.__index = t349

function t349.new(t350: {[any]: any}?) -- line: 13372
	-- upvalues: t349 (copy)
	return (setmetatable({
		kind = if t350 ~= nil and t350.kind ~= nil then t350.kind else nil
	}, t349))
end
function t349.encode(p224) -- line: 13383
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n150 = 0

	if p224.kind ~= nil then
		if p224.kind.type == "literal" then
			local v2461 = p224.kind.value:encode()
			local v2462, v2463 = proto.writeTag(buf, n150, 1, proto.wireTypes.lengthDelimited)

			buf, n150 = proto.writeBuffer(v2462, v2463, v2461, buffer.len(v2461))
		elseif p224.kind.type == "binding_path" then
			local v2464, v2465 = proto.writeTag(buf, n150, 2, proto.wireTypes.lengthDelimited)

			buf, n150 = proto.writeString(v2464, v2465, p224.kind.value)
		end
	end

	local buf80 = buffer.create(n150)

	buffer.copy(buf80, 0, buf, 0, n150)

	return buf80
end
function t349.decode(p225: buffer) -- line: 13405
	-- upvalues: t349 (copy), proto (copy), t1 (copy)
	local v2468 = t349.new()
	local n151 = 0

	while n151 < buffer.len(p225) do
		local v2470, v2471

		v2470, v2471, n151 = proto.readTag(p225, n151)

		if v2471 == proto.wireTypes.varint then
			local v2472

			v2472, n151 = proto.readVarInt(p225, n151)
		elseif v2471 == proto.wireTypes.lengthDelimited then
			if v2470 == 1 then
				local v2473

				v2473, n151 = proto.readBuffer(p225, n151)
				v2468.kind = {
					type = "literal",
					value = t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue.decode(v2473)
				}
			elseif v2470 == 2 then
				local v2474

				v2474, n151 = proto.readBuffer(p225, n151)
				v2468.kind = {
					type = "binding_path",
					value = buffer.tostring(v2474)
				}
			else
				local v2475, v2476 = proto.readVarInt(p225, n151)

				n151 = v2476 + v2475
			end
		elseif v2471 == proto.wireTypes.i32 then
			local v2477

			v2477, n151 = proto.readFixed32(p225, n151)
		elseif v2471 == proto.wireTypes.i64 then
			local v2478

			v2478, n151 = proto.readFixed64(p225, n151)
		else
			error("Unsupported wire type: " .. v2471)
		end
	end

	return v2468
end
function t349.jsonEncode(p226) -- line: 13460
	local t351 = {}

	if p226.kind ~= nil then
		if p226.kind.type == "literal" then
			t351.literal = p226.kind.value:jsonEncode()

			return t351
		end

		if p226.kind.type == "binding_path" then
			t351.bindingPath = p226.kind.value
		end
	end

	return t351
end
function t349.jsonDecode(t352: {[any]: any}) -- line: 13476
	-- upvalues: t349 (copy), t1 (copy)
	local v2482 = t349.new()

	if t352.literal ~= nil then
		v2482.kind = {
			type = "literal",
			value = t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue.jsonDecode(t352.literal)
		}
	end

	if t352.binding_path ~= nil then
		v2482.kind = {
			type = "binding_path",
			value = t352.binding_path
		}
	end

	if t352.bindingPath ~= nil then
		v2482.kind = {
			type = "binding_path",
			value = t352.bindingPath
		}
	end

	return v2482
end

t349.descriptor = {
	name = "LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderData"
}
t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData = t349
typeRegistry.default:register(t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData)

local t353 = {}

t353.__index = t353

function t353.new(t354: {[any]: any}?) -- line: 13517
	-- upvalues: t353 (copy)
	return (setmetatable({
		items = if t354 ~= nil and t354.items ~= nil then t354.items else {}
	}, t353))
end
function t353.encode(p227) -- line: 13528
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n152 = 0

	if p227.items ~= nil and #p227.items > 0 then
		for _, v2488 in p227.items do
			local v2489, v2490 = proto.writeTag(buf, n152, 1, proto.wireTypes.lengthDelimited)

			buf, n152 = proto.writeString(v2489, v2490, v2488)
		end
	end

	local buf81 = buffer.create(n152)

	buffer.copy(buf81, 0, buf, 0, n152)

	return buf81
end
function t353.decode(p228: buffer) -- line: 13546
	-- upvalues: t353 (copy), proto (copy)
	local v2493 = t353.new()
	local n153 = 0

	while n153 < buffer.len(p228) do
		local v2495, v2496

		v2495, v2496, n153 = proto.readTag(p228, n153)

		if v2496 == proto.wireTypes.varint then
			local v2497

			v2497, n153 = proto.readVarInt(p228, n153)
		elseif v2496 == proto.wireTypes.lengthDelimited then
			if v2495 == 1 then
				local v2498

				v2498, n153 = proto.readBuffer(p228, n153)
				table.insert(v2493.items, buffer.tostring(v2498))
			else
				local v2499, v2500 = proto.readVarInt(p228, n153)

				n153 = v2500 + v2499
			end
		elseif v2496 == proto.wireTypes.i32 then
			local v2501

			v2501, n153 = proto.readFixed32(p228, n153)
		elseif v2496 == proto.wireTypes.i64 then
			local v2502

			v2502, n153 = proto.readFixed64(p228, n153)
		else
			error("Unsupported wire type: " .. v2496)
		end
	end

	return v2493
end
function t353.jsonEncode(p229) -- line: 13591
	local t355 = {}

	if p229.items ~= nil and #p229.items > 0 then
		local t356 = {}

		for _, v2507 in p229.items do
			table.insert(t356, v2507)
		end

		t355.items = t356
	end

	return t355
end
function t353.jsonDecode(t357: {[any]: any}) -- line: 13607
	-- upvalues: t353 (copy)
	local v2509 = t353.new()

	if t357.items ~= nil then
		local t358 = {}

		for _, v2512 in t357.items do
			table.insert(t358, v2512)
		end

		v2509.items = t358
	end

	return v2509
end

t353.descriptor = {
	name = "LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
}
t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue = t353
typeRegistry.default:register(t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue)

local t359 = {}

t359.__index = t359

function t359.new(t360: {[any]: any}?) -- line: 13642
	-- upvalues: t359 (copy)
	return (setmetatable({
		key = if t360 ~= nil and t360.key ~= nil then t360.key else "",
		value = if t360 ~= nil and t360.value ~= nil then t360.value else nil
	}, t359))
end
function t359.encode(p230) -- line: 13654
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n154 = 0

	if p230.key ~= nil and p230.key ~= "" then
		local v2517, v2518 = proto.writeTag(buf, n154, 1, proto.wireTypes.lengthDelimited)

		buf, n154 = proto.writeString(v2517, v2518, p230.key)
	end

	if p230.value ~= nil then
		local v2519 = p230.value:encode()
		local v2520, v2521 = proto.writeTag(buf, n154, 2, proto.wireTypes.lengthDelimited)

		buf, n154 = proto.writeBuffer(v2520, v2521, v2519, buffer.len(v2519))
	end

	local buf82 = buffer.create(n154)

	buffer.copy(buf82, 0, buf, 0, n154)

	return buf82
end
function t359.decode(p231: buffer) -- line: 13676
	-- upvalues: t359 (copy), proto (copy), t1 (copy)
	local v2524 = t359.new()
	local n155 = 0

	while n155 < buffer.len(p231) do
		local v2526, v2527

		v2526, v2527, n155 = proto.readTag(p231, n155)

		if v2527 == proto.wireTypes.varint then
			local v2528

			v2528, n155 = proto.readVarInt(p231, n155)
		elseif v2527 == proto.wireTypes.lengthDelimited then
			if v2526 == 1 then
				local v2529

				v2529, n155 = proto.readBuffer(p231, n155)
				v2524.key = buffer.tostring(v2529)
			elseif v2526 == 2 then
				local v2530

				v2530, n155 = proto.readBuffer(p231, n155)
				v2524.value = t1.LazyNestedComponentListProp_TemplateData.decode(v2530)
			else
				local v2531, v2532 = proto.readVarInt(p231, n155)

				n155 = v2532 + v2531
			end
		elseif v2527 == proto.wireTypes.i32 then
			local v2533

			v2533, n155 = proto.readFixed32(p231, n155)
		elseif v2527 == proto.wireTypes.i64 then
			local v2534

			v2534, n155 = proto.readFixed64(p231, n155)
		else
			error("Unsupported wire type: " .. v2527)
		end
	end

	return v2524
end
function t359.jsonEncode(p232) -- line: 13726
	local t361 = {}

	if p232.key ~= nil and p232.key ~= "" then
		t361.key = p232.key
	end

	if p232.value ~= nil then
		t361.value = p232.value:jsonEncode()
	end

	return t361
end
function t359.jsonDecode(t362: {[any]: any}) -- line: 13742
	-- upvalues: t359 (copy), t1 (copy)
	local v2538 = t359.new()

	if t362.key ~= nil then
		v2538.key = t362.key
	end

	if t362.value ~= nil then
		v2538.value = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(t362.value)
	end

	return v2538
end

t359.descriptor = {
	name = "LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateDataMapEntry"
}
t1.LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry = t359
typeRegistry.default:register(t1.LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry)

local t363 = {}

t363.__index = t363

function t363.new(t364: {[any]: any}?) -- line: 13773
	-- upvalues: t363 (copy)
	return (setmetatable({
		kind = if t364 ~= nil and t364.kind ~= nil then t364.kind else nil
	}, t363))
end
function t363.encode(p233) -- line: 13779
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n156 = 0

	if p233.kind ~= nil then
		if p233.kind.type == "array_map" then
			local v2543 = p233.kind.value:encode()
			local v2544, v2545 = proto.writeTag(buf, n156, 1, proto.wireTypes.lengthDelimited)

			buf, n156 = proto.writeBuffer(v2544, v2545, v2543, buffer.len(v2543))
		elseif p233.kind.type == "item_list" then
			local v2546 = p233.kind.value:encode()
			local v2547, v2548 = proto.writeTag(buf, n156, 2, proto.wireTypes.lengthDelimited)

			buf, n156 = proto.writeBuffer(v2547, v2548, v2546, buffer.len(v2546))
		elseif p233.kind.type == "conditional" then
			local v2549 = p233.kind.value:encode()
			local v2550, v2551 = proto.writeTag(buf, n156, 3, proto.wireTypes.lengthDelimited)

			buf, n156 = proto.writeBuffer(v2550, v2551, v2549, buffer.len(v2549))
		elseif p233.kind.type == "ordered_template_data" then
			local v2552 = p233.kind.value:encode()
			local v2553, v2554 = proto.writeTag(buf, n156, 4, proto.wireTypes.lengthDelimited)

			buf, n156 = proto.writeBuffer(v2553, v2554, v2552, buffer.len(v2552))
		end
	end

	local buf83 = buffer.create(n156)

	buffer.copy(buf83, 0, buf, 0, n156)

	return buf83
end
function t363.decode(p234: buffer) -- line: 13808
	-- upvalues: t363 (copy), proto (copy), t1 (copy)
	local v2557 = t363.new()
	local n157 = 0

	while n157 < buffer.len(p234) do
		local v2559, v2560

		v2559, v2560, n157 = proto.readTag(p234, n157)

		if v2560 == proto.wireTypes.varint then
			local v2561

			v2561, n157 = proto.readVarInt(p234, n157)
		elseif v2560 == proto.wireTypes.lengthDelimited then
			if v2559 == 1 then
				local v2562

				v2562, n157 = proto.readBuffer(p234, n157)
				v2557.kind = {
					type = "array_map",
					value = t1.LazyNestedComponentListProp_TemplateData.decode(v2562)
				}
			elseif v2559 == 2 then
				local v2563

				v2563, n157 = proto.readBuffer(p234, n157)
				v2557.kind = {
					type = "item_list",
					value = t1.LazyNestedComponentListProp_TemplateDataList.decode(v2563)
				}
			elseif v2559 == 3 then
				local v2564

				v2564, n157 = proto.readBuffer(p234, n157)
				v2557.kind = {
					type = "conditional",
					value = t1.LazyNestedComponentListProp_ConditionalOptions.decode(v2564)
				}
			elseif v2559 == 4 then
				local v2565

				v2565, n157 = proto.readBuffer(p234, n157)
				v2557.kind = {
					type = "ordered_template_data",
					value = t1.LazyNestedComponentListProp_OrderedTemplateData.decode(v2565)
				}
			else
				local v2566, v2567 = proto.readVarInt(p234, n157)

				n157 = v2567 + v2566
			end
		elseif v2560 == proto.wireTypes.i32 then
			local v2568

			v2568, n157 = proto.readFixed32(p234, n157)
		elseif v2560 == proto.wireTypes.i64 then
			local v2569

			v2569, n157 = proto.readFixed64(p234, n157)
		else
			error("Unsupported wire type: " .. v2560)
		end
	end

	return v2557
end
function t363.jsonEncode(p235) -- line: 13876
	local t365 = {}

	if p235.kind ~= nil then
		if p235.kind.type == "array_map" then
			t365.arrayMap = p235.kind.value:jsonEncode()

			return t365
		end

		if p235.kind.type == "item_list" then
			t365.itemList = p235.kind.value:jsonEncode()

			return t365
		end

		if p235.kind.type == "conditional" then
			t365.conditional = p235.kind.value:jsonEncode()

			return t365
		end

		if p235.kind.type == "ordered_template_data" then
			t365.orderedTemplateData = p235.kind.value:jsonEncode()
		end
	end

	return t365
end
function t363.jsonDecode(t366: {[any]: any}) -- line: 13894
	-- upvalues: t363 (copy), t1 (copy)
	local v2573 = t363.new()

	if t366.array_map ~= nil then
		v2573.kind = {
			type = "array_map",
			value = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(t366.array_map)
		}
	end

	if t366.arrayMap ~= nil then
		v2573.kind = {
			type = "array_map",
			value = t1.LazyNestedComponentListProp_TemplateData.jsonDecode(t366.arrayMap)
		}
	end

	if t366.item_list ~= nil then
		v2573.kind = {
			type = "item_list",
			value = t1.LazyNestedComponentListProp_TemplateDataList.jsonDecode(t366.item_list)
		}
	end

	if t366.itemList ~= nil then
		v2573.kind = {
			type = "item_list",
			value = t1.LazyNestedComponentListProp_TemplateDataList.jsonDecode(t366.itemList)
		}
	end

	if t366.conditional ~= nil then
		v2573.kind = {
			type = "conditional",
			value = t1.LazyNestedComponentListProp_ConditionalOptions.jsonDecode(t366.conditional)
		}
	end

	if t366.ordered_template_data ~= nil then
		v2573.kind = {
			type = "ordered_template_data",
			value = t1.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(t366.ordered_template_data)
		}
	end

	if t366.orderedTemplateData ~= nil then
		v2573.kind = {
			type = "ordered_template_data",
			value = t1.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(t366.orderedTemplateData)
		}
	end

	return v2573
end

t363.descriptor = {
	name = "NestedComponentListProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.NestedComponentListProp"
}
t1.NestedComponentListProp = t363
typeRegistry.default:register(t1.NestedComponentListProp)

local t367 = {}

t367.__index = t367

function t367.new(t368: {[any]: any}?) -- line: 13965
	-- upvalues: t367 (copy)
	return (setmetatable({
		kind = if t368 ~= nil and t368.kind ~= nil then t368.kind else nil
	}, t367))
end
function t367.encode(p236) -- line: 13971
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n158 = 0

	if p236.kind ~= nil then
		if p236.kind.type == "literal" then
			local v2578, v2579 = proto.writeTag(buf, n158, 1, proto.wireTypes.lengthDelimited)

			buf, n158 = proto.writeString(v2578, v2579, p236.kind.value)
		elseif p236.kind.type == "binding_path" then
			local v2580, v2581 = proto.writeTag(buf, n158, 2, proto.wireTypes.lengthDelimited)

			buf, n158 = proto.writeString(v2580, v2581, p236.kind.value)
		elseif p236.kind.type == "conditional" then
			local v2582 = p236.kind.value:encode()
			local v2583, v2584 = proto.writeTag(buf, n158, 3, proto.wireTypes.lengthDelimited)

			buf, n158 = proto.writeBuffer(v2583, v2584, v2582, buffer.len(v2582))
		end
	end

	local buf84 = buffer.create(n158)

	buffer.copy(buf84, 0, buf, 0, n158)

	return buf84
end
function t367.decode(p237: buffer) -- line: 13994
	-- upvalues: t367 (copy), proto (copy), t1 (copy)
	local v2587 = t367.new()
	local n159 = 0

	while n159 < buffer.len(p237) do
		local v2589, v2590

		v2589, v2590, n159 = proto.readTag(p237, n159)

		if v2590 == proto.wireTypes.varint then
			local v2591

			v2591, n159 = proto.readVarInt(p237, n159)
		elseif v2590 == proto.wireTypes.lengthDelimited then
			if v2589 == 1 then
				local v2592

				v2592, n159 = proto.readBuffer(p237, n159)
				v2587.kind = {
					type = "literal",
					value = buffer.tostring(v2592)
				}
			elseif v2589 == 2 then
				local v2593

				v2593, n159 = proto.readBuffer(p237, n159)
				v2587.kind = {
					type = "binding_path",
					value = buffer.tostring(v2593)
				}
			elseif v2589 == 3 then
				local v2594

				v2594, n159 = proto.readBuffer(p237, n159)
				v2587.kind = {
					type = "conditional",
					value = t1.IconProp_ConditionalOptions.decode(v2594)
				}
			else
				local v2595, v2596 = proto.readVarInt(p237, n159)

				n159 = v2596 + v2595
			end
		elseif v2590 == proto.wireTypes.i32 then
			local v2597

			v2597, n159 = proto.readFixed32(p237, n159)
		elseif v2590 == proto.wireTypes.i64 then
			local v2598

			v2598, n159 = proto.readFixed64(p237, n159)
		else
			error("Unsupported wire type: " .. v2590)
		end
	end

	return v2587
end
function t367.jsonEncode(p238) -- line: 14047
	local t369 = {}

	if p238.kind ~= nil then
		if p238.kind.type == "literal" then
			t369.literal = p238.kind.value

			return t369
		end

		if p238.kind.type == "binding_path" then
			t369.bindingPath = p238.kind.value

			return t369
		end

		if p238.kind.type == "conditional" then
			t369.conditional = p238.kind.value:jsonEncode()
		end
	end

	return t369
end
function t367.jsonDecode(t370: {[any]: any}) -- line: 14063
	-- upvalues: t367 (copy), t1 (copy)
	local v2602 = t367.new()

	if t370.literal ~= nil then
		v2602.kind = {
			type = "literal",
			value = t370.literal
		}
	end

	if t370.binding_path ~= nil then
		v2602.kind = {
			type = "binding_path",
			value = t370.binding_path
		}
	end

	if t370.bindingPath ~= nil then
		v2602.kind = {
			type = "binding_path",
			value = t370.bindingPath
		}
	end

	if t370.conditional ~= nil then
		v2602.kind = {
			type = "conditional",
			value = t1.IconProp_ConditionalOptions.jsonDecode(t370.conditional)
		}
	end

	return v2602
end

t367.descriptor = {
	name = "IconProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
}
t1.IconProp = t367
typeRegistry.default:register(t1.IconProp)

local t371 = {}

t371.__index = t371

function t371.new(t372: {[any]: any}?) -- line: 14100
	-- upvalues: t371 (copy)
	return (setmetatable({
		condition = if t372 ~= nil and t372.condition ~= nil then t372.condition else nil,
		kind = if t372 ~= nil and t372.kind ~= nil then t372.kind else nil
	}, t371))
end
function t371.encode(p239) -- line: 14109
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n160 = 0

	if p239.condition ~= nil then
		local v2607 = p239.condition:encode()
		local v2608, v2609 = proto.writeTag(buf, n160, 1, proto.wireTypes.lengthDelimited)

		buf, n160 = proto.writeBuffer(v2608, v2609, v2607, buffer.len(v2607))
	end

	if p239.kind ~= nil then
		if p239.kind.type == "literal" then
			local v2610, v2611 = proto.writeTag(buf, n160, 2, proto.wireTypes.lengthDelimited)

			buf, n160 = proto.writeString(v2610, v2611, p239.kind.value)
		elseif p239.kind.type == "binding_path" then
			local v2612, v2613 = proto.writeTag(buf, n160, 3, proto.wireTypes.lengthDelimited)

			buf, n160 = proto.writeString(v2612, v2613, p239.kind.value)
		end
	end

	local buf85 = buffer.create(n160)

	buffer.copy(buf85, 0, buf, 0, n160)

	return buf85
end
function t371.decode(p240: buffer) -- line: 14134
	-- upvalues: t371 (copy), proto (copy), prop_condition (copy)
	local v2616 = t371.new()
	local n161 = 0

	while n161 < buffer.len(p240) do
		local v2618, v2619

		v2618, v2619, n161 = proto.readTag(p240, n161)

		if v2619 == proto.wireTypes.varint then
			local v2620

			v2620, n161 = proto.readVarInt(p240, n161)
		elseif v2619 == proto.wireTypes.lengthDelimited then
			if v2618 == 1 then
				local v2621

				v2621, n161 = proto.readBuffer(p240, n161)
				v2616.condition = prop_condition.PropCondition.decode(v2621)
			elseif v2618 == 2 then
				local v2622

				v2622, n161 = proto.readBuffer(p240, n161)
				v2616.kind = {
					type = "literal",
					value = buffer.tostring(v2622)
				}
			elseif v2618 == 3 then
				local v2623

				v2623, n161 = proto.readBuffer(p240, n161)
				v2616.kind = {
					type = "binding_path",
					value = buffer.tostring(v2623)
				}
			else
				local v2624, v2625 = proto.readVarInt(p240, n161)

				n161 = v2625 + v2624
			end
		elseif v2619 == proto.wireTypes.i32 then
			local v2626

			v2626, n161 = proto.readFixed32(p240, n161)
		elseif v2619 == proto.wireTypes.i64 then
			local v2627

			v2627, n161 = proto.readFixed64(p240, n161)
		else
			error("Unsupported wire type: " .. v2619)
		end
	end

	return v2616
end
function t371.jsonEncode(p241) -- line: 14187
	local t373 = {}

	if p241.condition ~= nil then
		t373.condition = p241.condition:jsonEncode()
	end

	if p241.kind ~= nil then
		if p241.kind.type == "literal" then
			t373.literal = p241.kind.value

			return t373
		end

		if p241.kind.type == "binding_path" then
			t373.bindingPath = p241.kind.value
		end
	end

	return t373
end
function t371.jsonDecode(t374: {[any]: any}) -- line: 14205
	-- upvalues: t371 (copy), prop_condition (copy)
	local v2631 = t371.new()

	if t374.condition ~= nil then
		v2631.condition = prop_condition.PropCondition.jsonDecode(t374.condition)
	end

	if t374.literal ~= nil then
		v2631.kind = {
			type = "literal",
			value = t374.literal
		}
	end

	if t374.binding_path ~= nil then
		v2631.kind = {
			type = "binding_path",
			value = t374.binding_path
		}
	end

	if t374.bindingPath ~= nil then
		v2631.kind = {
			type = "binding_path",
			value = t374.bindingPath
		}
	end

	return v2631
end

t371.descriptor = {
	name = "IconProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.IconProp_ConditionalOption = t371
typeRegistry.default:register(t1.IconProp_ConditionalOption)

local t375 = {}

t375.__index = t375

function t375.new(t376: {[any]: any}?) -- line: 14242
	-- upvalues: t375 (copy)
	return (setmetatable({
		options = if t376 ~= nil and t376.options ~= nil then t376.options else {}
	}, t375))
end
function t375.encode(p242) -- line: 14250
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n162 = 0

	if p242.options ~= nil and #p242.options > 0 then
		for _, v2637 in p242.options do
			local v2638 = v2637:encode()
			local v2639, v2640 = proto.writeTag(buf, n162, 1, proto.wireTypes.lengthDelimited)

			buf, n162 = proto.writeBuffer(v2639, v2640, v2638, buffer.len(v2638))
		end
	end

	local buf86 = buffer.create(n162)

	buffer.copy(buf86, 0, buf, 0, n162)

	return buf86
end
function t375.decode(p243: buffer) -- line: 14267
	-- upvalues: t375 (copy), proto (copy), t1 (copy)
	local v2643 = t375.new()
	local n163 = 0

	while n163 < buffer.len(p243) do
		local v2645, v2646

		v2645, v2646, n163 = proto.readTag(p243, n163)

		if v2646 == proto.wireTypes.varint then
			local v2647

			v2647, n163 = proto.readVarInt(p243, n163)
		elseif v2646 == proto.wireTypes.lengthDelimited then
			if v2645 == 1 then
				local v2648

				v2648, n163 = proto.readBuffer(p243, n163)
				table.insert(v2643.options, t1.IconProp_ConditionalOption.decode(v2648))
			else
				local v2649, v2650 = proto.readVarInt(p243, n163)

				n163 = v2650 + v2649
			end
		elseif v2646 == proto.wireTypes.i32 then
			local v2651

			v2651, n163 = proto.readFixed32(p243, n163)
		elseif v2646 == proto.wireTypes.i64 then
			local v2652

			v2652, n163 = proto.readFixed64(p243, n163)
		else
			error("Unsupported wire type: " .. v2646)
		end
	end

	return v2643
end
function t375.jsonEncode(p244) -- line: 14310
	local t377 = {}

	if p244.options ~= nil and #p244.options > 0 then
		local t378 = {}

		for _, v2657 in p244.options do
			table.insert(t378, v2657:jsonEncode())
		end

		t377.options = t378
	end

	return t377
end
function t375.jsonDecode(t379: {[any]: any}) -- line: 14324
	-- upvalues: t375 (copy), t1 (copy)
	local v2659 = t375.new()

	if t379.options ~= nil then
		local t380 = {}

		for _, v2662 in t379.options do
			table.insert(t380, t1.IconProp_ConditionalOption.jsonDecode(v2662))
		end

		v2659.options = t380
	end

	return v2659
end

t375.descriptor = {
	name = "IconProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.IconProp_ConditionalOptions = t375
typeRegistry.default:register(t1.IconProp_ConditionalOptions)

local t381 = {}

t381.__index = t381

function t381.new(t382: {[any]: any}?) -- line: 14353
	-- upvalues: t381 (copy)
	return (setmetatable({
		oneof_prop = if t382 ~= nil and t382.oneof_prop ~= nil then t382.oneof_prop else nil
	}, t381))
end
function t381.encode(p245) -- line: 14359
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n164 = 0

	if p245.oneof_prop ~= nil then
		if p245.oneof_prop.type == "string_prop" then
			local v2667 = p245.oneof_prop.value:encode()
			local v2668, v2669 = proto.writeTag(buf, n164, 1, proto.wireTypes.lengthDelimited)

			buf, n164 = proto.writeBuffer(v2668, v2669, v2667, buffer.len(v2667))
		elseif p245.oneof_prop.type == "int32_prop" then
			local v2670 = p245.oneof_prop.value:encode()
			local v2671, v2672 = proto.writeTag(buf, n164, 2, proto.wireTypes.lengthDelimited)

			buf, n164 = proto.writeBuffer(v2671, v2672, v2670, buffer.len(v2670))
		end
	end

	local buf87 = buffer.create(n164)

	buffer.copy(buf87, 0, buf, 0, n164)

	return buf87
end
function t381.decode(p246: buffer) -- line: 14380
	-- upvalues: t381 (copy), proto (copy), t1 (copy)
	local v2675 = t381.new()
	local n165 = 0

	while n165 < buffer.len(p246) do
		local v2677, v2678

		v2677, v2678, n165 = proto.readTag(p246, n165)

		if v2678 == proto.wireTypes.varint then
			local v2679

			v2679, n165 = proto.readVarInt(p246, n165)
		elseif v2678 == proto.wireTypes.lengthDelimited then
			if v2677 == 1 then
				local v2680

				v2680, n165 = proto.readBuffer(p246, n165)
				v2675.oneof_prop = {
					type = "string_prop",
					value = t1.StringProp.decode(v2680)
				}
			elseif v2677 == 2 then
				local v2681

				v2681, n165 = proto.readBuffer(p246, n165)
				v2675.oneof_prop = {
					type = "int32_prop",
					value = t1.Int32Prop.decode(v2681)
				}
			else
				local v2682, v2683 = proto.readVarInt(p246, n165)

				n165 = v2683 + v2682
			end
		elseif v2678 == proto.wireTypes.i32 then
			local v2684

			v2684, n165 = proto.readFixed32(p246, n165)
		elseif v2678 == proto.wireTypes.i64 then
			local v2685

			v2685, n165 = proto.readFixed64(p246, n165)
		else
			error("Unsupported wire type: " .. v2678)
		end
	end

	return v2675
end
function t381.jsonEncode(p247) -- line: 14428
	local t383 = {}

	if p247.oneof_prop ~= nil then
		if p247.oneof_prop.type == "string_prop" then
			t383.stringProp = p247.oneof_prop.value:jsonEncode()

			return t383
		end

		if p247.oneof_prop.type == "int32_prop" then
			t383.int32Prop = p247.oneof_prop.value:jsonEncode()
		end
	end

	return t383
end
function t381.jsonDecode(t384: {[any]: any}) -- line: 14442
	-- upvalues: t381 (copy), t1 (copy)
	local v2689 = t381.new()

	if t384.string_prop ~= nil then
		v2689.oneof_prop = {
			type = "string_prop",
			value = t1.StringProp.jsonDecode(t384.string_prop)
		}
	end

	if t384.stringProp ~= nil then
		v2689.oneof_prop = {
			type = "string_prop",
			value = t1.StringProp.jsonDecode(t384.stringProp)
		}
	end

	if t384.int32_prop ~= nil then
		v2689.oneof_prop = {
			type = "int32_prop",
			value = t1.Int32Prop.jsonDecode(t384.int32_prop)
		}
	end

	if t384.int32Prop ~= nil then
		v2689.oneof_prop = {
			type = "int32_prop",
			value = t1.Int32Prop.jsonDecode(t384.int32Prop)
		}
	end

	return v2689
end

t381.descriptor = {
	name = "IconSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconSizeProp"
}
t1.IconSizeProp = t381
typeRegistry.default:register(t1.IconSizeProp)

local t385 = {}

t385.__index = t385

function t385.new(t386: {[any]: any}?) -- line: 14478
	-- upvalues: t385 (copy)
	return (setmetatable({
		kind = if t386 ~= nil and t386.kind ~= nil then t386.kind else nil
	}, t385))
end
function t385.encode(p248) -- line: 14484
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n166 = 0

	if p248.kind ~= nil then
		if p248.kind.type == "literal" then
			local v2694 = p248.kind.value:encode()
			local v2695, v2696 = proto.writeTag(buf, n166, 1, proto.wireTypes.lengthDelimited)

			buf, n166 = proto.writeBuffer(v2695, v2696, v2694, buffer.len(v2694))
		elseif p248.kind.type == "conditional" then
			local v2697 = p248.kind.value:encode()
			local v2698, v2699 = proto.writeTag(buf, n166, 2, proto.wireTypes.lengthDelimited)

			buf, n166 = proto.writeBuffer(v2698, v2699, v2697, buffer.len(v2697))
		end
	end

	local buf88 = buffer.create(n166)

	buffer.copy(buf88, 0, buf, 0, n166)

	return buf88
end
function t385.decode(p249: buffer) -- line: 14505
	-- upvalues: t385 (copy), proto (copy), t1 (copy)
	local v2702 = t385.new()
	local n167 = 0

	while n167 < buffer.len(p249) do
		local v2704, v2705

		v2704, v2705, n167 = proto.readTag(p249, n167)

		if v2705 == proto.wireTypes.varint then
			local v2706

			v2706, n167 = proto.readVarInt(p249, n167)
		elseif v2705 == proto.wireTypes.lengthDelimited then
			if v2704 == 1 then
				local v2707

				v2707, n167 = proto.readBuffer(p249, n167)
				v2702.kind = {
					type = "literal",
					value = t1.GradientProp_GradientData.decode(v2707)
				}
			elseif v2704 == 2 then
				local v2708

				v2708, n167 = proto.readBuffer(p249, n167)
				v2702.kind = {
					type = "conditional",
					value = t1.GradientProp_ConditionalOptions.decode(v2708)
				}
			else
				local v2709, v2710 = proto.readVarInt(p249, n167)

				n167 = v2710 + v2709
			end
		elseif v2705 == proto.wireTypes.i32 then
			local v2711

			v2711, n167 = proto.readFixed32(p249, n167)
		elseif v2705 == proto.wireTypes.i64 then
			local v2712

			v2712, n167 = proto.readFixed64(p249, n167)
		else
			error("Unsupported wire type: " .. v2705)
		end
	end

	return v2702
end
function t385.jsonEncode(p250) -- line: 14553
	local t387 = {}

	if p250.kind ~= nil then
		if p250.kind.type == "literal" then
			t387.literal = p250.kind.value:jsonEncode()

			return t387
		end

		if p250.kind.type == "conditional" then
			t387.conditional = p250.kind.value:jsonEncode()
		end
	end

	return t387
end
function t385.jsonDecode(t388: {[any]: any}) -- line: 14567
	-- upvalues: t385 (copy), t1 (copy)
	local v2716 = t385.new()

	if t388.literal ~= nil then
		v2716.kind = {
			type = "literal",
			value = t1.GradientProp_GradientData.jsonDecode(t388.literal)
		}
	end

	if t388.conditional ~= nil then
		v2716.kind = {
			type = "conditional",
			value = t1.GradientProp_ConditionalOptions.jsonDecode(t388.conditional)
		}
	end

	return v2716
end

t385.descriptor = {
	name = "GradientProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
}
t1.GradientProp = t385
typeRegistry.default:register(t1.GradientProp)

local t389 = {}

t389.__index = t389

function t389.new(t390: {[any]: any}?) -- line: 14596
	-- upvalues: t389 (copy)
	return (setmetatable({
		condition = if t390 ~= nil and t390.condition ~= nil then t390.condition else nil,
		kind = if t390 ~= nil and t390.kind ~= nil then t390.kind else nil
	}, t389))
end
function t389.encode(p251) -- line: 14605
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n168 = 0

	if p251.condition ~= nil then
		local v2721 = p251.condition:encode()
		local v2722, v2723 = proto.writeTag(buf, n168, 1, proto.wireTypes.lengthDelimited)

		buf, n168 = proto.writeBuffer(v2722, v2723, v2721, buffer.len(v2721))
	end

	if p251.kind ~= nil and p251.kind.type == "literal" then
		local v2724 = p251.kind.value:encode()
		local v2725, v2726 = proto.writeTag(buf, n168, 2, proto.wireTypes.lengthDelimited)

		buf, n168 = proto.writeBuffer(v2725, v2726, v2724, buffer.len(v2724))
	end

	local buf89 = buffer.create(n168)

	buffer.copy(buf89, 0, buf, 0, n168)

	return buf89
end
function t389.decode(p252: buffer) -- line: 14628
	-- upvalues: t389 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v2729 = t389.new()
	local n169 = 0

	while n169 < buffer.len(p252) do
		local v2731, v2732

		v2731, v2732, n169 = proto.readTag(p252, n169)

		if v2732 == proto.wireTypes.varint then
			local v2733

			v2733, n169 = proto.readVarInt(p252, n169)
		elseif v2732 == proto.wireTypes.lengthDelimited then
			if v2731 == 1 then
				local v2734

				v2734, n169 = proto.readBuffer(p252, n169)
				v2729.condition = prop_condition.PropCondition.decode(v2734)
			elseif v2731 == 2 then
				local v2735

				v2735, n169 = proto.readBuffer(p252, n169)
				v2729.kind = {
					type = "literal",
					value = t1.GradientProp_GradientData.decode(v2735)
				}
			else
				local v2736, v2737 = proto.readVarInt(p252, n169)

				n169 = v2737 + v2736
			end
		elseif v2732 == proto.wireTypes.i32 then
			local v2738

			v2738, n169 = proto.readFixed32(p252, n169)
		elseif v2732 == proto.wireTypes.i64 then
			local v2739

			v2739, n169 = proto.readFixed64(p252, n169)
		else
			error("Unsupported wire type: " .. v2732)
		end
	end

	return v2729
end
function t389.jsonEncode(p253) -- line: 14676
	local t391 = {}

	if p253.condition ~= nil then
		t391.condition = p253.condition:jsonEncode()
	end

	if p253.kind ~= nil and p253.kind.type == "literal" then
		t391.literal = p253.kind.value:jsonEncode()
	end

	return t391
end
function t389.jsonDecode(t392: {[any]: any}) -- line: 14692
	-- upvalues: t389 (copy), prop_condition (copy), t1 (copy)
	local v2743 = t389.new()

	if t392.condition ~= nil then
		v2743.condition = prop_condition.PropCondition.jsonDecode(t392.condition)
	end

	if t392.literal ~= nil then
		v2743.kind = {
			type = "literal",
			value = t1.GradientProp_GradientData.jsonDecode(t392.literal)
		}
	end

	return v2743
end

t389.descriptor = {
	name = "GradientProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.GradientProp_ConditionalOption = t389
typeRegistry.default:register(t1.GradientProp_ConditionalOption)

local t393 = {}

t393.__index = t393

function t393.new(t394: {[any]: any}?) -- line: 14721
	-- upvalues: t393 (copy)
	return (setmetatable({
		options = if t394 ~= nil and t394.options ~= nil then t394.options else {}
	}, t393))
end
function t393.encode(p254) -- line: 14729
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n170 = 0

	if p254.options ~= nil and #p254.options > 0 then
		for _, v2749 in p254.options do
			local v2750 = v2749:encode()
			local v2751, v2752 = proto.writeTag(buf, n170, 1, proto.wireTypes.lengthDelimited)

			buf, n170 = proto.writeBuffer(v2751, v2752, v2750, buffer.len(v2750))
		end
	end

	local buf90 = buffer.create(n170)

	buffer.copy(buf90, 0, buf, 0, n170)

	return buf90
end
function t393.decode(p255: buffer) -- line: 14746
	-- upvalues: t393 (copy), proto (copy), t1 (copy)
	local v2755 = t393.new()
	local n171 = 0

	while n171 < buffer.len(p255) do
		local v2757, v2758

		v2757, v2758, n171 = proto.readTag(p255, n171)

		if v2758 == proto.wireTypes.varint then
			local v2759

			v2759, n171 = proto.readVarInt(p255, n171)
		elseif v2758 == proto.wireTypes.lengthDelimited then
			if v2757 == 1 then
				local v2760

				v2760, n171 = proto.readBuffer(p255, n171)
				table.insert(v2755.options, t1.GradientProp_ConditionalOption.decode(v2760))
			else
				local v2761, v2762 = proto.readVarInt(p255, n171)

				n171 = v2762 + v2761
			end
		elseif v2758 == proto.wireTypes.i32 then
			local v2763

			v2763, n171 = proto.readFixed32(p255, n171)
		elseif v2758 == proto.wireTypes.i64 then
			local v2764

			v2764, n171 = proto.readFixed64(p255, n171)
		else
			error("Unsupported wire type: " .. v2758)
		end
	end

	return v2755
end
function t393.jsonEncode(p256) -- line: 14789
	local t395 = {}

	if p256.options ~= nil and #p256.options > 0 then
		local t396 = {}

		for _, v2769 in p256.options do
			table.insert(t396, v2769:jsonEncode())
		end

		t395.options = t396
	end

	return t395
end
function t393.jsonDecode(t397: {[any]: any}) -- line: 14803
	-- upvalues: t393 (copy), t1 (copy)
	local v2771 = t393.new()

	if t397.options ~= nil then
		local t398 = {}

		for _, v2774 in t397.options do
			table.insert(t398, t1.GradientProp_ConditionalOption.jsonDecode(v2774))
		end

		v2771.options = t398
	end

	return v2771
end

t393.descriptor = {
	name = "GradientProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.GradientProp_ConditionalOptions = t393
typeRegistry.default:register(t1.GradientProp_ConditionalOptions)

local t399 = {}

t399.__index = t399

function t399.new(t400: {[any]: any}?) -- line: 14832
	-- upvalues: t399 (copy)
	return (setmetatable({
		start_color = if t400 ~= nil and t400.start_color ~= nil then t400.start_color else "",
		end_color = if t400 ~= nil and t400.end_color ~= nil then t400.end_color else "",
		start_opacity = if t400 ~= nil and t400.start_opacity ~= nil then t400.start_opacity else 0,
		end_opacity = if t400 ~= nil and t400.end_opacity ~= nil then t400.end_opacity else 0,
		degree = if t400 ~= nil and t400.degree ~= nil then t400.degree else 0
	}, t399))
end
function t399.encode(p257) -- line: 14844
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n172 = 0

	if p257.start_color ~= nil and p257.start_color ~= "" then
		local v2779, v2780 = proto.writeTag(buf, n172, 1, proto.wireTypes.lengthDelimited)

		buf, n172 = proto.writeString(v2779, v2780, p257.start_color)
	end

	if p257.end_color ~= nil and p257.end_color ~= "" then
		local v2781, v2782 = proto.writeTag(buf, n172, 2, proto.wireTypes.lengthDelimited)

		buf, n172 = proto.writeString(v2781, v2782, p257.end_color)
	end

	if p257.start_opacity ~= nil and p257.start_opacity ~= 0 then
		local v2783, v2784 = proto.writeTag(buf, n172, 3, proto.wireTypes.i32)

		buf, n172 = proto.writeFloat(v2783, v2784, p257.start_opacity)
	end

	if p257.end_opacity ~= nil and p257.end_opacity ~= 0 then
		local v2785, v2786 = proto.writeTag(buf, n172, 4, proto.wireTypes.i32)

		buf, n172 = proto.writeFloat(v2785, v2786, p257.end_opacity)
	end

	if p257.degree ~= nil and p257.degree ~= 0 then
		local v2787, v2788 = proto.writeTag(buf, n172, 5, proto.wireTypes.varint)

		buf, n172 = proto.writeVarInt(v2787, v2788, p257.degree)
	end

	local buf91 = buffer.create(n172)

	buffer.copy(buf91, 0, buf, 0, n172)

	return buf91
end
function t399.decode(p258: buffer) -- line: 14878
	-- upvalues: t399 (copy), proto (copy)
	local v2791 = t399.new()
	local n173 = 0

	while n173 < buffer.len(p258) do
		local v2793, v2794

		v2793, v2794, n173 = proto.readTag(p258, n173)

		if v2794 == proto.wireTypes.varint then
			if v2793 == 5 then
				local v2795

				v2795, n173 = proto.readVarIntI32(p258, n173)
				v2791.degree = v2795
			else
				local v2796

				v2796, n173 = proto.readVarInt(p258, n173)
			end
		elseif v2794 == proto.wireTypes.lengthDelimited then
			if v2793 == 1 then
				local v2797

				v2797, n173 = proto.readBuffer(p258, n173)
				v2791.start_color = buffer.tostring(v2797)
			elseif v2793 == 2 then
				local v2798

				v2798, n173 = proto.readBuffer(p258, n173)
				v2791.end_color = buffer.tostring(v2798)
			else
				local v2799, v2800 = proto.readVarInt(p258, n173)

				n173 = v2800 + v2799
			end
		elseif v2794 == proto.wireTypes.i32 then
			if v2793 == 3 then
				local v2801

				v2801, n173 = proto.readFloat(p258, n173)
				v2791.start_opacity = v2801
			elseif v2793 == 4 then
				local v2802

				v2802, n173 = proto.readFloat(p258, n173)
				v2791.end_opacity = v2802
			else
				local v2803

				v2803, n173 = proto.readFixed32(p258, n173)
			end
		elseif v2794 == proto.wireTypes.i64 then
			local v2804

			v2804, n173 = proto.readFixed64(p258, n173)
		else
			error("Unsupported wire type: " .. v2794)
		end
	end

	return v2791
end
function t399.jsonEncode(p259) -- line: 14941
	-- upvalues: proto (copy)
	local t401 = {}

	if p259.start_color ~= nil and p259.start_color ~= "" then
		t401.startColor = p259.start_color
	end

	if p259.end_color ~= nil and p259.end_color ~= "" then
		t401.endColor = p259.end_color
	end

	if p259.start_opacity ~= nil and p259.start_opacity ~= 0 then
		t401.startOpacity = proto.json.serializeNumber(p259.start_opacity)
	end

	if p259.end_opacity ~= nil and p259.end_opacity ~= 0 then
		t401.endOpacity = proto.json.serializeNumber(p259.end_opacity)
	end

	if p259.degree ~= nil and p259.degree ~= 0 then
		t401.degree = p259.degree
	end

	return t401
end
function t399.jsonDecode(t402: {[any]: any}) -- line: 14967
	-- upvalues: t399 (copy), proto (copy)
	local v2808 = t399.new()

	if t402.start_color ~= nil then
		v2808.start_color = t402.start_color
	end

	if t402.startColor ~= nil then
		v2808.start_color = t402.startColor
	end

	if t402.end_color ~= nil then
		v2808.end_color = t402.end_color
	end

	if t402.endColor ~= nil then
		v2808.end_color = t402.endColor
	end

	if t402.start_opacity ~= nil then
		v2808.start_opacity = proto.json.deserializeNumber(t402.start_opacity)
	end

	if t402.startOpacity ~= nil then
		v2808.start_opacity = proto.json.deserializeNumber(t402.startOpacity)
	end

	if t402.end_opacity ~= nil then
		v2808.end_opacity = proto.json.deserializeNumber(t402.end_opacity)
	end

	if t402.endOpacity ~= nil then
		v2808.end_opacity = proto.json.deserializeNumber(t402.endOpacity)
	end

	if t402.degree ~= nil then
		v2808.degree = t402.degree
	end

	return v2808
end

t399.descriptor = {
	name = "GradientProp_GradientData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
}
t1.GradientProp_GradientData = t399
typeRegistry.default:register(t1.GradientProp_GradientData)

local t403 = {}

t403.__index = t403

function t403.new(t404: {[any]: any}?) -- line: 15023
	-- upvalues: t403 (copy)
	return (setmetatable({
		kind = if t404 ~= nil and t404.kind ~= nil then t404.kind else nil
	}, t403))
end
function t403.encode(p260) -- line: 15029
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n174 = 0

	if p260.kind ~= nil then
		if p260.kind.type == "literal" then
			local v2813 = p260.kind.value:encode()
			local v2814, v2815 = proto.writeTag(buf, n174, 1, proto.wireTypes.lengthDelimited)

			buf, n174 = proto.writeBuffer(v2814, v2815, v2813, buffer.len(v2813))
		elseif p260.kind.type == "binding_path" then
			local v2816, v2817 = proto.writeTag(buf, n174, 2, proto.wireTypes.lengthDelimited)

			buf, n174 = proto.writeString(v2816, v2817, p260.kind.value)
		elseif p260.kind.type == "conditional" then
			local v2818 = p260.kind.value:encode()
			local v2819, v2820 = proto.writeTag(buf, n174, 3, proto.wireTypes.lengthDelimited)

			buf, n174 = proto.writeBuffer(v2819, v2820, v2818, buffer.len(v2818))
		end
	end

	local buf92 = buffer.create(n174)

	buffer.copy(buf92, 0, buf, 0, n174)

	return buf92
end
function t403.decode(p261: buffer) -- line: 15053
	-- upvalues: t403 (copy), proto (copy), t1 (copy)
	local v2823 = t403.new()
	local n175 = 0

	while n175 < buffer.len(p261) do
		local v2825, v2826

		v2825, v2826, n175 = proto.readTag(p261, n175)

		if v2826 == proto.wireTypes.varint then
			local v2827

			v2827, n175 = proto.readVarInt(p261, n175)
		elseif v2826 == proto.wireTypes.lengthDelimited then
			if v2825 == 1 then
				local v2828

				v2828, n175 = proto.readBuffer(p261, n175)
				v2823.kind = {
					type = "literal",
					value = t1.ArrayOfStructProp_ArrayOfStructs.decode(v2828)
				}
			elseif v2825 == 2 then
				local v2829

				v2829, n175 = proto.readBuffer(p261, n175)
				v2823.kind = {
					type = "binding_path",
					value = buffer.tostring(v2829)
				}
			elseif v2825 == 3 then
				local v2830

				v2830, n175 = proto.readBuffer(p261, n175)
				v2823.kind = {
					type = "conditional",
					value = t1.ArrayOfStructProp_ConditionalOptions.decode(v2830)
				}
			else
				local v2831, v2832 = proto.readVarInt(p261, n175)

				n175 = v2832 + v2831
			end
		elseif v2826 == proto.wireTypes.i32 then
			local v2833

			v2833, n175 = proto.readFixed32(p261, n175)
		elseif v2826 == proto.wireTypes.i64 then
			local v2834

			v2834, n175 = proto.readFixed64(p261, n175)
		else
			error("Unsupported wire type: " .. v2826)
		end
	end

	return v2823
end
function t403.jsonEncode(p262) -- line: 15107
	local t405 = {}

	if p262.kind ~= nil then
		if p262.kind.type == "literal" then
			t405.literal = p262.kind.value:jsonEncode()

			return t405
		end

		if p262.kind.type == "binding_path" then
			t405.bindingPath = p262.kind.value

			return t405
		end

		if p262.kind.type == "conditional" then
			t405.conditional = p262.kind.value:jsonEncode()
		end
	end

	return t405
end
function t403.jsonDecode(t406: {[any]: any}) -- line: 15123
	-- upvalues: t403 (copy), t1 (copy)
	local v2838 = t403.new()

	if t406.literal ~= nil then
		v2838.kind = {
			type = "literal",
			value = t1.ArrayOfStructProp_ArrayOfStructs.jsonDecode(t406.literal)
		}
	end

	if t406.binding_path ~= nil then
		v2838.kind = {
			type = "binding_path",
			value = t406.binding_path
		}
	end

	if t406.bindingPath ~= nil then
		v2838.kind = {
			type = "binding_path",
			value = t406.bindingPath
		}
	end

	if t406.conditional ~= nil then
		v2838.kind = {
			type = "conditional",
			value = t1.ArrayOfStructProp_ConditionalOptions.jsonDecode(t406.conditional)
		}
	end

	return v2838
end

t403.descriptor = {
	name = "ArrayOfStructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
}
t1.ArrayOfStructProp = t403
typeRegistry.default:register(t1.ArrayOfStructProp)

local t407 = {}

t407.__index = t407

function t407.new(t408: {[any]: any}?) -- line: 15163
	-- upvalues: t407 (copy)
	return (setmetatable({
		condition = if t408 ~= nil and t408.condition ~= nil then t408.condition else nil,
		kind = if t408 ~= nil and t408.kind ~= nil then t408.kind else nil
	}, t407))
end
function t407.encode(p263) -- line: 15172
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n176 = 0

	if p263.condition ~= nil then
		local v2843 = p263.condition:encode()
		local v2844, v2845 = proto.writeTag(buf, n176, 1, proto.wireTypes.lengthDelimited)

		buf, n176 = proto.writeBuffer(v2844, v2845, v2843, buffer.len(v2843))
	end

	if p263.kind ~= nil then
		if p263.kind.type == "literal" then
			local v2846 = p263.kind.value:encode()
			local v2847, v2848 = proto.writeTag(buf, n176, 2, proto.wireTypes.lengthDelimited)

			buf, n176 = proto.writeBuffer(v2847, v2848, v2846, buffer.len(v2846))
		elseif p263.kind.type == "binding_path" then
			local v2849, v2850 = proto.writeTag(buf, n176, 3, proto.wireTypes.lengthDelimited)

			buf, n176 = proto.writeString(v2849, v2850, p263.kind.value)
		end
	end

	local buf93 = buffer.create(n176)

	buffer.copy(buf93, 0, buf, 0, n176)

	return buf93
end
function t407.decode(p264: buffer) -- line: 15198
	-- upvalues: t407 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v2853 = t407.new()
	local n177 = 0

	while n177 < buffer.len(p264) do
		local v2855, v2856

		v2855, v2856, n177 = proto.readTag(p264, n177)

		if v2856 == proto.wireTypes.varint then
			local v2857

			v2857, n177 = proto.readVarInt(p264, n177)
		elseif v2856 == proto.wireTypes.lengthDelimited then
			if v2855 == 1 then
				local v2858

				v2858, n177 = proto.readBuffer(p264, n177)
				v2853.condition = prop_condition.PropCondition.decode(v2858)
			elseif v2855 == 2 then
				local v2859

				v2859, n177 = proto.readBuffer(p264, n177)
				v2853.kind = {
					type = "literal",
					value = t1.ArrayOfStructProp_ArrayOfStructs.decode(v2859)
				}
			elseif v2855 == 3 then
				local v2860

				v2860, n177 = proto.readBuffer(p264, n177)
				v2853.kind = {
					type = "binding_path",
					value = buffer.tostring(v2860)
				}
			else
				local v2861, v2862 = proto.readVarInt(p264, n177)

				n177 = v2862 + v2861
			end
		elseif v2856 == proto.wireTypes.i32 then
			local v2863

			v2863, n177 = proto.readFixed32(p264, n177)
		elseif v2856 == proto.wireTypes.i64 then
			local v2864

			v2864, n177 = proto.readFixed64(p264, n177)
		else
			error("Unsupported wire type: " .. v2856)
		end
	end

	return v2853
end
function t407.jsonEncode(p265) -- line: 15251
	local t409 = {}

	if p265.condition ~= nil then
		t409.condition = p265.condition:jsonEncode()
	end

	if p265.kind ~= nil then
		if p265.kind.type == "literal" then
			t409.literal = p265.kind.value:jsonEncode()

			return t409
		end

		if p265.kind.type == "binding_path" then
			t409.bindingPath = p265.kind.value
		end
	end

	return t409
end
function t407.jsonDecode(t410: {[any]: any}) -- line: 15269
	-- upvalues: t407 (copy), prop_condition (copy), t1 (copy)
	local v2868 = t407.new()

	if t410.condition ~= nil then
		v2868.condition = prop_condition.PropCondition.jsonDecode(t410.condition)
	end

	if t410.literal ~= nil then
		v2868.kind = {
			type = "literal",
			value = t1.ArrayOfStructProp_ArrayOfStructs.jsonDecode(t410.literal)
		}
	end

	if t410.binding_path ~= nil then
		v2868.kind = {
			type = "binding_path",
			value = t410.binding_path
		}
	end

	if t410.bindingPath ~= nil then
		v2868.kind = {
			type = "binding_path",
			value = t410.bindingPath
		}
	end

	return v2868
end

t407.descriptor = {
	name = "ArrayOfStructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.ArrayOfStructProp_ConditionalOption = t407
typeRegistry.default:register(t1.ArrayOfStructProp_ConditionalOption)

local t411 = {}

t411.__index = t411

function t411.new(t412: {[any]: any}?) -- line: 15309
	-- upvalues: t411 (copy)
	return (setmetatable({
		options = if t412 ~= nil and t412.options ~= nil then t412.options else {}
	}, t411))
end
function t411.encode(p266) -- line: 15317
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n178 = 0

	if p266.options ~= nil and #p266.options > 0 then
		for _, v2874 in p266.options do
			local v2875 = v2874:encode()
			local v2876, v2877 = proto.writeTag(buf, n178, 1, proto.wireTypes.lengthDelimited)

			buf, n178 = proto.writeBuffer(v2876, v2877, v2875, buffer.len(v2875))
		end
	end

	local buf94 = buffer.create(n178)

	buffer.copy(buf94, 0, buf, 0, n178)

	return buf94
end
function t411.decode(p267: buffer) -- line: 15334
	-- upvalues: t411 (copy), proto (copy), t1 (copy)
	local v2880 = t411.new()
	local n179 = 0

	while n179 < buffer.len(p267) do
		local v2882, v2883

		v2882, v2883, n179 = proto.readTag(p267, n179)

		if v2883 == proto.wireTypes.varint then
			local v2884

			v2884, n179 = proto.readVarInt(p267, n179)
		elseif v2883 == proto.wireTypes.lengthDelimited then
			if v2882 == 1 then
				local v2885

				v2885, n179 = proto.readBuffer(p267, n179)
				table.insert(v2880.options, t1.ArrayOfStructProp_ConditionalOption.decode(v2885))
			else
				local v2886, v2887 = proto.readVarInt(p267, n179)

				n179 = v2887 + v2886
			end
		elseif v2883 == proto.wireTypes.i32 then
			local v2888

			v2888, n179 = proto.readFixed32(p267, n179)
		elseif v2883 == proto.wireTypes.i64 then
			local v2889

			v2889, n179 = proto.readFixed64(p267, n179)
		else
			error("Unsupported wire type: " .. v2883)
		end
	end

	return v2880
end
function t411.jsonEncode(p268) -- line: 15377
	local t413 = {}

	if p268.options ~= nil and #p268.options > 0 then
		local t414 = {}

		for _, v2894 in p268.options do
			table.insert(t414, v2894:jsonEncode())
		end

		t413.options = t414
	end

	return t413
end
function t411.jsonDecode(t415: {[any]: any}) -- line: 15391
	-- upvalues: t411 (copy), t1 (copy)
	local v2896 = t411.new()

	if t415.options ~= nil then
		local t416 = {}

		for _, v2899 in t415.options do
			table.insert(t416, t1.ArrayOfStructProp_ConditionalOption.jsonDecode(v2899))
		end

		v2896.options = t416
	end

	return v2896
end

t411.descriptor = {
	name = "ArrayOfStructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.ArrayOfStructProp_ConditionalOptions = t411
typeRegistry.default:register(t1.ArrayOfStructProp_ConditionalOptions)

local t417 = {}

t417.__index = t417

function t417.new(t418: {[any]: any}?) -- line: 15422
	-- upvalues: t417 (copy)
	return (setmetatable({
		entry = if t418 ~= nil and t418.entry ~= nil then t418.entry else {}
	}, t417))
end
function t417.encode(p269) -- line: 15430
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n180 = 0

	if p269.entry ~= nil and #p269.entry > 0 then
		for _, v2905 in p269.entry do
			local v2906 = v2905:encode()
			local v2907, v2908 = proto.writeTag(buf, n180, 1, proto.wireTypes.lengthDelimited)

			buf, n180 = proto.writeBuffer(v2907, v2908, v2906, buffer.len(v2906))
		end
	end

	local buf95 = buffer.create(n180)

	buffer.copy(buf95, 0, buf, 0, n180)

	return buf95
end
function t417.decode(p270: buffer) -- line: 15447
	-- upvalues: t417 (copy), proto (copy), struct (copy)
	local v2911 = t417.new()
	local n181 = 0

	while n181 < buffer.len(p270) do
		local v2913, v2914

		v2913, v2914, n181 = proto.readTag(p270, n181)

		if v2914 == proto.wireTypes.varint then
			local v2915

			v2915, n181 = proto.readVarInt(p270, n181)
		elseif v2914 == proto.wireTypes.lengthDelimited then
			if v2913 == 1 then
				local v2916

				v2916, n181 = proto.readBuffer(p270, n181)
				table.insert(v2911.entry, struct.Struct.decode(v2916))
			else
				local v2917, v2918 = proto.readVarInt(p270, n181)

				n181 = v2918 + v2917
			end
		elseif v2914 == proto.wireTypes.i32 then
			local v2919

			v2919, n181 = proto.readFixed32(p270, n181)
		elseif v2914 == proto.wireTypes.i64 then
			local v2920

			v2920, n181 = proto.readFixed64(p270, n181)
		else
			error("Unsupported wire type: " .. v2914)
		end
	end

	return v2911
end
function t417.jsonEncode(p271) -- line: 15490
	local t419 = {}

	if p271.entry ~= nil and #p271.entry > 0 then
		local t420 = {}

		for _, v2925 in p271.entry do
			table.insert(t420, v2925:jsonEncode())
		end

		t419.entry = t420
	end

	return t419
end
function t417.jsonDecode(t421: {[any]: any}) -- line: 15504
	-- upvalues: t417 (copy), struct (copy)
	local v2927 = t417.new()

	if t421.entry ~= nil then
		local t422 = {}

		for _, v2930 in t421.entry do
			table.insert(t422, struct.Struct.jsonDecode(v2930))
		end

		v2927.entry = t422
	end

	return v2927
end

t417.descriptor = {
	name = "ArrayOfStructProp_ArrayOfStructs",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
}
t1.ArrayOfStructProp_ArrayOfStructs = t417
typeRegistry.default:register(t1.ArrayOfStructProp_ArrayOfStructs)

local t423 = {}

t423.__index = t423

function t423.new(t424: {[any]: any}?) -- line: 15535
	-- upvalues: t423 (copy)
	return (setmetatable({
		kind = if t424 ~= nil and t424.kind ~= nil then t424.kind else nil
	}, t423))
end
function t423.encode(p272) -- line: 15541
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n182 = 0

	if p272.kind ~= nil then
		if p272.kind.type == "literal" then
			local v2935, v2936 = proto.writeTag(buf, n182, 1, proto.wireTypes.lengthDelimited)

			buf, n182 = proto.writeString(v2935, v2936, p272.kind.value)
		elseif p272.kind.type == "token" then
			local v2937, v2938 = proto.writeTag(buf, n182, 2, proto.wireTypes.lengthDelimited)

			buf, n182 = proto.writeString(v2937, v2938, p272.kind.value)
		elseif p272.kind.type == "conditional" then
			local v2939 = p272.kind.value:encode()
			local v2940, v2941 = proto.writeTag(buf, n182, 3, proto.wireTypes.lengthDelimited)

			buf, n182 = proto.writeBuffer(v2940, v2941, v2939, buffer.len(v2939))
		elseif p272.kind.type == "binding_path" then
			local v2942, v2943 = proto.writeTag(buf, n182, 4, proto.wireTypes.lengthDelimited)

			buf, n182 = proto.writeString(v2942, v2943, p272.kind.value)
		end
	end

	local buf96 = buffer.create(n182)

	buffer.copy(buf96, 0, buf, 0, n182)

	return buf96
end
function t423.decode(p273: buffer) -- line: 15567
	-- upvalues: t423 (copy), proto (copy), t1 (copy)
	local v2946 = t423.new()
	local n183 = 0

	while n183 < buffer.len(p273) do
		local v2948, v2949

		v2948, v2949, n183 = proto.readTag(p273, n183)

		if v2949 == proto.wireTypes.varint then
			local v2950

			v2950, n183 = proto.readVarInt(p273, n183)
		elseif v2949 == proto.wireTypes.lengthDelimited then
			if v2948 == 1 then
				local v2951

				v2951, n183 = proto.readBuffer(p273, n183)
				v2946.kind = {
					type = "literal",
					value = buffer.tostring(v2951)
				}
			elseif v2948 == 2 then
				local v2952

				v2952, n183 = proto.readBuffer(p273, n183)
				v2946.kind = {
					type = "token",
					value = buffer.tostring(v2952)
				}
			elseif v2948 == 3 then
				local v2953

				v2953, n183 = proto.readBuffer(p273, n183)
				v2946.kind = {
					type = "conditional",
					value = t1.UiScaledFloatProp_ConditionalOptions.decode(v2953)
				}
			elseif v2948 == 4 then
				local v2954

				v2954, n183 = proto.readBuffer(p273, n183)
				v2946.kind = {
					type = "binding_path",
					value = buffer.tostring(v2954)
				}
			else
				local v2955, v2956 = proto.readVarInt(p273, n183)

				n183 = v2956 + v2955
			end
		elseif v2949 == proto.wireTypes.i32 then
			local v2957

			v2957, n183 = proto.readFixed32(p273, n183)
		elseif v2949 == proto.wireTypes.i64 then
			local v2958

			v2958, n183 = proto.readFixed64(p273, n183)
		else
			error("Unsupported wire type: " .. v2949)
		end
	end

	return v2946
end
function t423.jsonEncode(p274) -- line: 15626
	local t425 = {}

	if p274.kind ~= nil then
		if p274.kind.type == "literal" then
			t425.literal = p274.kind.value

			return t425
		end

		if p274.kind.type == "token" then
			t425.token = p274.kind.value

			return t425
		end

		if p274.kind.type == "conditional" then
			t425.conditional = p274.kind.value:jsonEncode()

			return t425
		end

		if p274.kind.type == "binding_path" then
			t425.bindingPath = p274.kind.value
		end
	end

	return t425
end
function t423.jsonDecode(t426: {[any]: any}) -- line: 15644
	-- upvalues: t423 (copy), t1 (copy)
	local v2962 = t423.new()

	if t426.literal ~= nil then
		v2962.kind = {
			type = "literal",
			value = t426.literal
		}
	end

	if t426.token ~= nil then
		v2962.kind = {
			type = "token",
			value = t426.token
		}
	end

	if t426.conditional ~= nil then
		v2962.kind = {
			type = "conditional",
			value = t1.UiScaledFloatProp_ConditionalOptions.jsonDecode(t426.conditional)
		}
	end

	if t426.binding_path ~= nil then
		v2962.kind = {
			type = "binding_path",
			value = t426.binding_path
		}
	end

	if t426.bindingPath ~= nil then
		v2962.kind = {
			type = "binding_path",
			value = t426.bindingPath
		}
	end

	return v2962
end

t423.descriptor = {
	name = "UiScaledFloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
}
t1.UiScaledFloatProp = t423
typeRegistry.default:register(t1.UiScaledFloatProp)

local t427 = {}

t427.__index = t427

function t427.new(t428: {[any]: any}?) -- line: 15687
	-- upvalues: t427 (copy)
	return (setmetatable({
		condition = if t428 ~= nil and t428.condition ~= nil then t428.condition else nil,
		kind = if t428 ~= nil and t428.kind ~= nil then t428.kind else nil
	}, t427))
end
function t427.encode(p275) -- line: 15696
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n184 = 0

	if p275.condition ~= nil then
		local v2967 = p275.condition:encode()
		local v2968, v2969 = proto.writeTag(buf, n184, 1, proto.wireTypes.lengthDelimited)

		buf, n184 = proto.writeBuffer(v2968, v2969, v2967, buffer.len(v2967))
	end

	if p275.kind ~= nil then
		if p275.kind.type == "literal" then
			local v2970, v2971 = proto.writeTag(buf, n184, 2, proto.wireTypes.lengthDelimited)

			buf, n184 = proto.writeString(v2970, v2971, p275.kind.value)
		elseif p275.kind.type == "token" then
			local v2972, v2973 = proto.writeTag(buf, n184, 3, proto.wireTypes.lengthDelimited)

			buf, n184 = proto.writeString(v2972, v2973, p275.kind.value)
		elseif p275.kind.type == "binding_path" then
			local v2974, v2975 = proto.writeTag(buf, n184, 4, proto.wireTypes.lengthDelimited)

			buf, n184 = proto.writeString(v2974, v2975, p275.kind.value)
		end
	end

	local buf97 = buffer.create(n184)

	buffer.copy(buf97, 0, buf, 0, n184)

	return buf97
end
function t427.decode(p276: buffer) -- line: 15724
	-- upvalues: t427 (copy), proto (copy), prop_condition (copy)
	local v2978 = t427.new()
	local n185 = 0

	while n185 < buffer.len(p276) do
		local v2980, v2981

		v2980, v2981, n185 = proto.readTag(p276, n185)

		if v2981 == proto.wireTypes.varint then
			local v2982

			v2982, n185 = proto.readVarInt(p276, n185)
		elseif v2981 == proto.wireTypes.lengthDelimited then
			if v2980 == 1 then
				local v2983

				v2983, n185 = proto.readBuffer(p276, n185)
				v2978.condition = prop_condition.PropCondition.decode(v2983)
			elseif v2980 == 2 then
				local v2984

				v2984, n185 = proto.readBuffer(p276, n185)
				v2978.kind = {
					type = "literal",
					value = buffer.tostring(v2984)
				}
			elseif v2980 == 3 then
				local v2985

				v2985, n185 = proto.readBuffer(p276, n185)
				v2978.kind = {
					type = "token",
					value = buffer.tostring(v2985)
				}
			elseif v2980 == 4 then
				local v2986

				v2986, n185 = proto.readBuffer(p276, n185)
				v2978.kind = {
					type = "binding_path",
					value = buffer.tostring(v2986)
				}
			else
				local v2987, v2988 = proto.readVarInt(p276, n185)

				n185 = v2988 + v2987
			end
		elseif v2981 == proto.wireTypes.i32 then
			local v2989

			v2989, n185 = proto.readFixed32(p276, n185)
		elseif v2981 == proto.wireTypes.i64 then
			local v2990

			v2990, n185 = proto.readFixed64(p276, n185)
		else
			error("Unsupported wire type: " .. v2981)
		end
	end

	return v2978
end
function t427.jsonEncode(p277) -- line: 15782
	local t429 = {}

	if p277.condition ~= nil then
		t429.condition = p277.condition:jsonEncode()
	end

	if p277.kind ~= nil then
		if p277.kind.type == "literal" then
			t429.literal = p277.kind.value

			return t429
		end

		if p277.kind.type == "token" then
			t429.token = p277.kind.value

			return t429
		end

		if p277.kind.type == "binding_path" then
			t429.bindingPath = p277.kind.value
		end
	end

	return t429
end
function t427.jsonDecode(t430: {[any]: any}) -- line: 15802
	-- upvalues: t427 (copy), prop_condition (copy)
	local v2994 = t427.new()

	if t430.condition ~= nil then
		v2994.condition = prop_condition.PropCondition.jsonDecode(t430.condition)
	end

	if t430.literal ~= nil then
		v2994.kind = {
			type = "literal",
			value = t430.literal
		}
	end

	if t430.token ~= nil then
		v2994.kind = {
			type = "token",
			value = t430.token
		}
	end

	if t430.binding_path ~= nil then
		v2994.kind = {
			type = "binding_path",
			value = t430.binding_path
		}
	end

	if t430.bindingPath ~= nil then
		v2994.kind = {
			type = "binding_path",
			value = t430.bindingPath
		}
	end

	return v2994
end

t427.descriptor = {
	name = "UiScaledFloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.UiScaledFloatProp_ConditionalOption = t427
typeRegistry.default:register(t1.UiScaledFloatProp_ConditionalOption)

local t431 = {}

t431.__index = t431

function t431.new(t432: {[any]: any}?) -- line: 15845
	-- upvalues: t431 (copy)
	return (setmetatable({
		options = if t432 ~= nil and t432.options ~= nil then t432.options else {}
	}, t431))
end
function t431.encode(p278) -- line: 15853
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n186 = 0

	if p278.options ~= nil and #p278.options > 0 then
		for _, v3000 in p278.options do
			local v3001 = v3000:encode()
			local v3002, v3003 = proto.writeTag(buf, n186, 1, proto.wireTypes.lengthDelimited)

			buf, n186 = proto.writeBuffer(v3002, v3003, v3001, buffer.len(v3001))
		end
	end

	local buf98 = buffer.create(n186)

	buffer.copy(buf98, 0, buf, 0, n186)

	return buf98
end
function t431.decode(p279: buffer) -- line: 15870
	-- upvalues: t431 (copy), proto (copy), t1 (copy)
	local v3006 = t431.new()
	local n187 = 0

	while n187 < buffer.len(p279) do
		local v3008, v3009

		v3008, v3009, n187 = proto.readTag(p279, n187)

		if v3009 == proto.wireTypes.varint then
			local v3010

			v3010, n187 = proto.readVarInt(p279, n187)
		elseif v3009 == proto.wireTypes.lengthDelimited then
			if v3008 == 1 then
				local v3011

				v3011, n187 = proto.readBuffer(p279, n187)
				table.insert(v3006.options, t1.UiScaledFloatProp_ConditionalOption.decode(v3011))
			else
				local v3012, v3013 = proto.readVarInt(p279, n187)

				n187 = v3013 + v3012
			end
		elseif v3009 == proto.wireTypes.i32 then
			local v3014

			v3014, n187 = proto.readFixed32(p279, n187)
		elseif v3009 == proto.wireTypes.i64 then
			local v3015

			v3015, n187 = proto.readFixed64(p279, n187)
		else
			error("Unsupported wire type: " .. v3009)
		end
	end

	return v3006
end
function t431.jsonEncode(p280) -- line: 15913
	local t433 = {}

	if p280.options ~= nil and #p280.options > 0 then
		local t434 = {}

		for _, v3020 in p280.options do
			table.insert(t434, v3020:jsonEncode())
		end

		t433.options = t434
	end

	return t433
end
function t431.jsonDecode(t435: {[any]: any}) -- line: 15927
	-- upvalues: t431 (copy), t1 (copy)
	local v3022 = t431.new()

	if t435.options ~= nil then
		local t436 = {}

		for _, v3025 in t435.options do
			table.insert(t436, t1.UiScaledFloatProp_ConditionalOption.jsonDecode(v3025))
		end

		v3022.options = t436
	end

	return v3022
end

t431.descriptor = {
	name = "UiScaledFloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.UiScaledFloatProp_ConditionalOptions = t431
typeRegistry.default:register(t1.UiScaledFloatProp_ConditionalOptions)

local t437 = {}

t437.__index = t437

function t437.new(t438: {[any]: any}?) -- line: 15958
	-- upvalues: t437 (copy)
	return (setmetatable({
		kind = if t438 ~= nil and t438.kind ~= nil then t438.kind else nil
	}, t437))
end
function t437.encode(p281) -- line: 15964
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n188 = 0

	if p281.kind ~= nil then
		if p281.kind.type == "literal" then
			local v3030, v3031 = proto.writeTag(buf, n188, 1, proto.wireTypes.lengthDelimited)

			buf, n188 = proto.writeString(v3030, v3031, p281.kind.value)
		elseif p281.kind.type == "token" then
			local v3032, v3033 = proto.writeTag(buf, n188, 2, proto.wireTypes.lengthDelimited)

			buf, n188 = proto.writeString(v3032, v3033, p281.kind.value)
		elseif p281.kind.type == "conditional" then
			local v3034 = p281.kind.value:encode()
			local v3035, v3036 = proto.writeTag(buf, n188, 3, proto.wireTypes.lengthDelimited)

			buf, n188 = proto.writeBuffer(v3035, v3036, v3034, buffer.len(v3034))
		elseif p281.kind.type == "binding_path" then
			local v3037, v3038 = proto.writeTag(buf, n188, 4, proto.wireTypes.lengthDelimited)

			buf, n188 = proto.writeString(v3037, v3038, p281.kind.value)
		end
	end

	local buf99 = buffer.create(n188)

	buffer.copy(buf99, 0, buf, 0, n188)

	return buf99
end
function t437.decode(p282: buffer) -- line: 15990
	-- upvalues: t437 (copy), proto (copy), t1 (copy)
	local v3041 = t437.new()
	local n189 = 0

	while n189 < buffer.len(p282) do
		local v3043, v3044

		v3043, v3044, n189 = proto.readTag(p282, n189)

		if v3044 == proto.wireTypes.varint then
			local v3045

			v3045, n189 = proto.readVarInt(p282, n189)
		elseif v3044 == proto.wireTypes.lengthDelimited then
			if v3043 == 1 then
				local v3046

				v3046, n189 = proto.readBuffer(p282, n189)
				v3041.kind = {
					type = "literal",
					value = buffer.tostring(v3046)
				}
			elseif v3043 == 2 then
				local v3047

				v3047, n189 = proto.readBuffer(p282, n189)
				v3041.kind = {
					type = "token",
					value = buffer.tostring(v3047)
				}
			elseif v3043 == 3 then
				local v3048

				v3048, n189 = proto.readBuffer(p282, n189)
				v3041.kind = {
					type = "conditional",
					value = t1.UiScaledUDimProp_ConditionalOptions.decode(v3048)
				}
			elseif v3043 == 4 then
				local v3049

				v3049, n189 = proto.readBuffer(p282, n189)
				v3041.kind = {
					type = "binding_path",
					value = buffer.tostring(v3049)
				}
			else
				local v3050, v3051 = proto.readVarInt(p282, n189)

				n189 = v3051 + v3050
			end
		elseif v3044 == proto.wireTypes.i32 then
			local v3052

			v3052, n189 = proto.readFixed32(p282, n189)
		elseif v3044 == proto.wireTypes.i64 then
			local v3053

			v3053, n189 = proto.readFixed64(p282, n189)
		else
			error("Unsupported wire type: " .. v3044)
		end
	end

	return v3041
end
function t437.jsonEncode(p283) -- line: 16049
	local t439 = {}

	if p283.kind ~= nil then
		if p283.kind.type == "literal" then
			t439.literal = p283.kind.value

			return t439
		end

		if p283.kind.type == "token" then
			t439.token = p283.kind.value

			return t439
		end

		if p283.kind.type == "conditional" then
			t439.conditional = p283.kind.value:jsonEncode()

			return t439
		end

		if p283.kind.type == "binding_path" then
			t439.bindingPath = p283.kind.value
		end
	end

	return t439
end
function t437.jsonDecode(t440: {[any]: any}) -- line: 16067
	-- upvalues: t437 (copy), t1 (copy)
	local v3057 = t437.new()

	if t440.literal ~= nil then
		v3057.kind = {
			type = "literal",
			value = t440.literal
		}
	end

	if t440.token ~= nil then
		v3057.kind = {
			type = "token",
			value = t440.token
		}
	end

	if t440.conditional ~= nil then
		v3057.kind = {
			type = "conditional",
			value = t1.UiScaledUDimProp_ConditionalOptions.jsonDecode(t440.conditional)
		}
	end

	if t440.binding_path ~= nil then
		v3057.kind = {
			type = "binding_path",
			value = t440.binding_path
		}
	end

	if t440.bindingPath ~= nil then
		v3057.kind = {
			type = "binding_path",
			value = t440.bindingPath
		}
	end

	return v3057
end

t437.descriptor = {
	name = "UiScaledUDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
}
t1.UiScaledUDimProp = t437
typeRegistry.default:register(t1.UiScaledUDimProp)

local t441 = {}

t441.__index = t441

function t441.new(t442: {[any]: any}?) -- line: 16110
	-- upvalues: t441 (copy)
	return (setmetatable({
		condition = if t442 ~= nil and t442.condition ~= nil then t442.condition else nil,
		kind = if t442 ~= nil and t442.kind ~= nil then t442.kind else nil
	}, t441))
end
function t441.encode(p284) -- line: 16119
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n190 = 0

	if p284.condition ~= nil then
		local v3062 = p284.condition:encode()
		local v3063, v3064 = proto.writeTag(buf, n190, 1, proto.wireTypes.lengthDelimited)

		buf, n190 = proto.writeBuffer(v3063, v3064, v3062, buffer.len(v3062))
	end

	if p284.kind ~= nil then
		if p284.kind.type == "literal" then
			local v3065, v3066 = proto.writeTag(buf, n190, 2, proto.wireTypes.lengthDelimited)

			buf, n190 = proto.writeString(v3065, v3066, p284.kind.value)
		elseif p284.kind.type == "token" then
			local v3067, v3068 = proto.writeTag(buf, n190, 3, proto.wireTypes.lengthDelimited)

			buf, n190 = proto.writeString(v3067, v3068, p284.kind.value)
		elseif p284.kind.type == "binding_path" then
			local v3069, v3070 = proto.writeTag(buf, n190, 4, proto.wireTypes.lengthDelimited)

			buf, n190 = proto.writeString(v3069, v3070, p284.kind.value)
		end
	end

	local buf100 = buffer.create(n190)

	buffer.copy(buf100, 0, buf, 0, n190)

	return buf100
end
function t441.decode(p285: buffer) -- line: 16147
	-- upvalues: t441 (copy), proto (copy), prop_condition (copy)
	local v3073 = t441.new()
	local n191 = 0

	while n191 < buffer.len(p285) do
		local v3075, v3076

		v3075, v3076, n191 = proto.readTag(p285, n191)

		if v3076 == proto.wireTypes.varint then
			local v3077

			v3077, n191 = proto.readVarInt(p285, n191)
		elseif v3076 == proto.wireTypes.lengthDelimited then
			if v3075 == 1 then
				local v3078

				v3078, n191 = proto.readBuffer(p285, n191)
				v3073.condition = prop_condition.PropCondition.decode(v3078)
			elseif v3075 == 2 then
				local v3079

				v3079, n191 = proto.readBuffer(p285, n191)
				v3073.kind = {
					type = "literal",
					value = buffer.tostring(v3079)
				}
			elseif v3075 == 3 then
				local v3080

				v3080, n191 = proto.readBuffer(p285, n191)
				v3073.kind = {
					type = "token",
					value = buffer.tostring(v3080)
				}
			elseif v3075 == 4 then
				local v3081

				v3081, n191 = proto.readBuffer(p285, n191)
				v3073.kind = {
					type = "binding_path",
					value = buffer.tostring(v3081)
				}
			else
				local v3082, v3083 = proto.readVarInt(p285, n191)

				n191 = v3083 + v3082
			end
		elseif v3076 == proto.wireTypes.i32 then
			local v3084

			v3084, n191 = proto.readFixed32(p285, n191)
		elseif v3076 == proto.wireTypes.i64 then
			local v3085

			v3085, n191 = proto.readFixed64(p285, n191)
		else
			error("Unsupported wire type: " .. v3076)
		end
	end

	return v3073
end
function t441.jsonEncode(p286) -- line: 16205
	local t443 = {}

	if p286.condition ~= nil then
		t443.condition = p286.condition:jsonEncode()
	end

	if p286.kind ~= nil then
		if p286.kind.type == "literal" then
			t443.literal = p286.kind.value

			return t443
		end

		if p286.kind.type == "token" then
			t443.token = p286.kind.value

			return t443
		end

		if p286.kind.type == "binding_path" then
			t443.bindingPath = p286.kind.value
		end
	end

	return t443
end
function t441.jsonDecode(t444: {[any]: any}) -- line: 16225
	-- upvalues: t441 (copy), prop_condition (copy)
	local v3089 = t441.new()

	if t444.condition ~= nil then
		v3089.condition = prop_condition.PropCondition.jsonDecode(t444.condition)
	end

	if t444.literal ~= nil then
		v3089.kind = {
			type = "literal",
			value = t444.literal
		}
	end

	if t444.token ~= nil then
		v3089.kind = {
			type = "token",
			value = t444.token
		}
	end

	if t444.binding_path ~= nil then
		v3089.kind = {
			type = "binding_path",
			value = t444.binding_path
		}
	end

	if t444.bindingPath ~= nil then
		v3089.kind = {
			type = "binding_path",
			value = t444.bindingPath
		}
	end

	return v3089
end

t441.descriptor = {
	name = "UiScaledUDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.UiScaledUDimProp_ConditionalOption = t441
typeRegistry.default:register(t1.UiScaledUDimProp_ConditionalOption)

local t445 = {}

t445.__index = t445

function t445.new(t446: {[any]: any}?) -- line: 16268
	-- upvalues: t445 (copy)
	return (setmetatable({
		options = if t446 ~= nil and t446.options ~= nil then t446.options else {}
	}, t445))
end
function t445.encode(p287) -- line: 16276
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n192 = 0

	if p287.options ~= nil and #p287.options > 0 then
		for _, v3095 in p287.options do
			local v3096 = v3095:encode()
			local v3097, v3098 = proto.writeTag(buf, n192, 1, proto.wireTypes.lengthDelimited)

			buf, n192 = proto.writeBuffer(v3097, v3098, v3096, buffer.len(v3096))
		end
	end

	local buf101 = buffer.create(n192)

	buffer.copy(buf101, 0, buf, 0, n192)

	return buf101
end
function t445.decode(p288: buffer) -- line: 16293
	-- upvalues: t445 (copy), proto (copy), t1 (copy)
	local v3101 = t445.new()
	local n193 = 0

	while n193 < buffer.len(p288) do
		local v3103, v3104

		v3103, v3104, n193 = proto.readTag(p288, n193)

		if v3104 == proto.wireTypes.varint then
			local v3105

			v3105, n193 = proto.readVarInt(p288, n193)
		elseif v3104 == proto.wireTypes.lengthDelimited then
			if v3103 == 1 then
				local v3106

				v3106, n193 = proto.readBuffer(p288, n193)
				table.insert(v3101.options, t1.UiScaledUDimProp_ConditionalOption.decode(v3106))
			else
				local v3107, v3108 = proto.readVarInt(p288, n193)

				n193 = v3108 + v3107
			end
		elseif v3104 == proto.wireTypes.i32 then
			local v3109

			v3109, n193 = proto.readFixed32(p288, n193)
		elseif v3104 == proto.wireTypes.i64 then
			local v3110

			v3110, n193 = proto.readFixed64(p288, n193)
		else
			error("Unsupported wire type: " .. v3104)
		end
	end

	return v3101
end
function t445.jsonEncode(p289) -- line: 16336
	local t447 = {}

	if p289.options ~= nil and #p289.options > 0 then
		local t448 = {}

		for _, v3115 in p289.options do
			table.insert(t448, v3115:jsonEncode())
		end

		t447.options = t448
	end

	return t447
end
function t445.jsonDecode(t449: {[any]: any}) -- line: 16350
	-- upvalues: t445 (copy), t1 (copy)
	local v3117 = t445.new()

	if t449.options ~= nil then
		local t450 = {}

		for _, v3120 in t449.options do
			table.insert(t450, t1.UiScaledUDimProp_ConditionalOption.jsonDecode(v3120))
		end

		v3117.options = t450
	end

	return v3117
end

t445.descriptor = {
	name = "UiScaledUDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.UiScaledUDimProp_ConditionalOptions = t445
typeRegistry.default:register(t1.UiScaledUDimProp_ConditionalOptions)

local t451 = {}

t451.__index = t451

function t451.new(t452: {[any]: any}?) -- line: 16381
	-- upvalues: t451 (copy)
	return (setmetatable({
		kind = if t452 ~= nil and t452.kind ~= nil then t452.kind else nil
	}, t451))
end
function t451.encode(p290) -- line: 16387
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n194 = 0

	if p290.kind ~= nil then
		if p290.kind.type == "literal" then
			local v3125, v3126 = proto.writeTag(buf, n194, 1, proto.wireTypes.lengthDelimited)

			buf, n194 = proto.writeString(v3125, v3126, p290.kind.value)
		elseif p290.kind.type == "token" then
			local v3127, v3128 = proto.writeTag(buf, n194, 2, proto.wireTypes.lengthDelimited)

			buf, n194 = proto.writeString(v3127, v3128, p290.kind.value)
		elseif p290.kind.type == "conditional" then
			local v3129 = p290.kind.value:encode()
			local v3130, v3131 = proto.writeTag(buf, n194, 3, proto.wireTypes.lengthDelimited)

			buf, n194 = proto.writeBuffer(v3130, v3131, v3129, buffer.len(v3129))
		elseif p290.kind.type == "binding_path" then
			local v3132, v3133 = proto.writeTag(buf, n194, 4, proto.wireTypes.lengthDelimited)

			buf, n194 = proto.writeString(v3132, v3133, p290.kind.value)
		end
	end

	local buf102 = buffer.create(n194)

	buffer.copy(buf102, 0, buf, 0, n194)

	return buf102
end
function t451.decode(p291: buffer) -- line: 16413
	-- upvalues: t451 (copy), proto (copy), t1 (copy)
	local v3136 = t451.new()
	local n195 = 0

	while n195 < buffer.len(p291) do
		local v3138, v3139

		v3138, v3139, n195 = proto.readTag(p291, n195)

		if v3139 == proto.wireTypes.varint then
			local v3140

			v3140, n195 = proto.readVarInt(p291, n195)
		elseif v3139 == proto.wireTypes.lengthDelimited then
			if v3138 == 1 then
				local v3141

				v3141, n195 = proto.readBuffer(p291, n195)
				v3136.kind = {
					type = "literal",
					value = buffer.tostring(v3141)
				}
			elseif v3138 == 2 then
				local v3142

				v3142, n195 = proto.readBuffer(p291, n195)
				v3136.kind = {
					type = "token",
					value = buffer.tostring(v3142)
				}
			elseif v3138 == 3 then
				local v3143

				v3143, n195 = proto.readBuffer(p291, n195)
				v3136.kind = {
					type = "conditional",
					value = t1.UiScaledUDim2Prop_ConditionalOptions.decode(v3143)
				}
			elseif v3138 == 4 then
				local v3144

				v3144, n195 = proto.readBuffer(p291, n195)
				v3136.kind = {
					type = "binding_path",
					value = buffer.tostring(v3144)
				}
			else
				local v3145, v3146 = proto.readVarInt(p291, n195)

				n195 = v3146 + v3145
			end
		elseif v3139 == proto.wireTypes.i32 then
			local v3147

			v3147, n195 = proto.readFixed32(p291, n195)
		elseif v3139 == proto.wireTypes.i64 then
			local v3148

			v3148, n195 = proto.readFixed64(p291, n195)
		else
			error("Unsupported wire type: " .. v3139)
		end
	end

	return v3136
end
function t451.jsonEncode(p292) -- line: 16472
	local t453 = {}

	if p292.kind ~= nil then
		if p292.kind.type == "literal" then
			t453.literal = p292.kind.value

			return t453
		end

		if p292.kind.type == "token" then
			t453.token = p292.kind.value

			return t453
		end

		if p292.kind.type == "conditional" then
			t453.conditional = p292.kind.value:jsonEncode()

			return t453
		end

		if p292.kind.type == "binding_path" then
			t453.bindingPath = p292.kind.value
		end
	end

	return t453
end
function t451.jsonDecode(t454: {[any]: any}) -- line: 16490
	-- upvalues: t451 (copy), t1 (copy)
	local v3152 = t451.new()

	if t454.literal ~= nil then
		v3152.kind = {
			type = "literal",
			value = t454.literal
		}
	end

	if t454.token ~= nil then
		v3152.kind = {
			type = "token",
			value = t454.token
		}
	end

	if t454.conditional ~= nil then
		v3152.kind = {
			type = "conditional",
			value = t1.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(t454.conditional)
		}
	end

	if t454.binding_path ~= nil then
		v3152.kind = {
			type = "binding_path",
			value = t454.binding_path
		}
	end

	if t454.bindingPath ~= nil then
		v3152.kind = {
			type = "binding_path",
			value = t454.bindingPath
		}
	end

	return v3152
end

t451.descriptor = {
	name = "UiScaledUDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
}
t1.UiScaledUDim2Prop = t451
typeRegistry.default:register(t1.UiScaledUDim2Prop)

local t455 = {}

t455.__index = t455

function t455.new(t456: {[any]: any}?) -- line: 16533
	-- upvalues: t455 (copy)
	return (setmetatable({
		condition = if t456 ~= nil and t456.condition ~= nil then t456.condition else nil,
		kind = if t456 ~= nil and t456.kind ~= nil then t456.kind else nil
	}, t455))
end
function t455.encode(p293) -- line: 16542
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n196 = 0

	if p293.condition ~= nil then
		local v3157 = p293.condition:encode()
		local v3158, v3159 = proto.writeTag(buf, n196, 1, proto.wireTypes.lengthDelimited)

		buf, n196 = proto.writeBuffer(v3158, v3159, v3157, buffer.len(v3157))
	end

	if p293.kind ~= nil then
		if p293.kind.type == "literal" then
			local v3160, v3161 = proto.writeTag(buf, n196, 2, proto.wireTypes.lengthDelimited)

			buf, n196 = proto.writeString(v3160, v3161, p293.kind.value)
		elseif p293.kind.type == "token" then
			local v3162, v3163 = proto.writeTag(buf, n196, 3, proto.wireTypes.lengthDelimited)

			buf, n196 = proto.writeString(v3162, v3163, p293.kind.value)
		elseif p293.kind.type == "binding_path" then
			local v3164, v3165 = proto.writeTag(buf, n196, 4, proto.wireTypes.lengthDelimited)

			buf, n196 = proto.writeString(v3164, v3165, p293.kind.value)
		end
	end

	local buf103 = buffer.create(n196)

	buffer.copy(buf103, 0, buf, 0, n196)

	return buf103
end
function t455.decode(p294: buffer) -- line: 16570
	-- upvalues: t455 (copy), proto (copy), prop_condition (copy)
	local v3168 = t455.new()
	local n197 = 0

	while n197 < buffer.len(p294) do
		local v3170, v3171

		v3170, v3171, n197 = proto.readTag(p294, n197)

		if v3171 == proto.wireTypes.varint then
			local v3172

			v3172, n197 = proto.readVarInt(p294, n197)
		elseif v3171 == proto.wireTypes.lengthDelimited then
			if v3170 == 1 then
				local v3173

				v3173, n197 = proto.readBuffer(p294, n197)
				v3168.condition = prop_condition.PropCondition.decode(v3173)
			elseif v3170 == 2 then
				local v3174

				v3174, n197 = proto.readBuffer(p294, n197)
				v3168.kind = {
					type = "literal",
					value = buffer.tostring(v3174)
				}
			elseif v3170 == 3 then
				local v3175

				v3175, n197 = proto.readBuffer(p294, n197)
				v3168.kind = {
					type = "token",
					value = buffer.tostring(v3175)
				}
			elseif v3170 == 4 then
				local v3176

				v3176, n197 = proto.readBuffer(p294, n197)
				v3168.kind = {
					type = "binding_path",
					value = buffer.tostring(v3176)
				}
			else
				local v3177, v3178 = proto.readVarInt(p294, n197)

				n197 = v3178 + v3177
			end
		elseif v3171 == proto.wireTypes.i32 then
			local v3179

			v3179, n197 = proto.readFixed32(p294, n197)
		elseif v3171 == proto.wireTypes.i64 then
			local v3180

			v3180, n197 = proto.readFixed64(p294, n197)
		else
			error("Unsupported wire type: " .. v3171)
		end
	end

	return v3168
end
function t455.jsonEncode(p295) -- line: 16628
	local t457 = {}

	if p295.condition ~= nil then
		t457.condition = p295.condition:jsonEncode()
	end

	if p295.kind ~= nil then
		if p295.kind.type == "literal" then
			t457.literal = p295.kind.value

			return t457
		end

		if p295.kind.type == "token" then
			t457.token = p295.kind.value

			return t457
		end

		if p295.kind.type == "binding_path" then
			t457.bindingPath = p295.kind.value
		end
	end

	return t457
end
function t455.jsonDecode(t458: {[any]: any}) -- line: 16648
	-- upvalues: t455 (copy), prop_condition (copy)
	local v3184 = t455.new()

	if t458.condition ~= nil then
		v3184.condition = prop_condition.PropCondition.jsonDecode(t458.condition)
	end

	if t458.literal ~= nil then
		v3184.kind = {
			type = "literal",
			value = t458.literal
		}
	end

	if t458.token ~= nil then
		v3184.kind = {
			type = "token",
			value = t458.token
		}
	end

	if t458.binding_path ~= nil then
		v3184.kind = {
			type = "binding_path",
			value = t458.binding_path
		}
	end

	if t458.bindingPath ~= nil then
		v3184.kind = {
			type = "binding_path",
			value = t458.bindingPath
		}
	end

	return v3184
end

t455.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.UiScaledUDim2Prop_ConditionalOption = t455
typeRegistry.default:register(t1.UiScaledUDim2Prop_ConditionalOption)

local t459 = {}

t459.__index = t459

function t459.new(t460: {[any]: any}?) -- line: 16691
	-- upvalues: t459 (copy)
	return (setmetatable({
		options = if t460 ~= nil and t460.options ~= nil then t460.options else {}
	}, t459))
end
function t459.encode(p296) -- line: 16699
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n198 = 0

	if p296.options ~= nil and #p296.options > 0 then
		for _, v3190 in p296.options do
			local v3191 = v3190:encode()
			local v3192, v3193 = proto.writeTag(buf, n198, 1, proto.wireTypes.lengthDelimited)

			buf, n198 = proto.writeBuffer(v3192, v3193, v3191, buffer.len(v3191))
		end
	end

	local buf104 = buffer.create(n198)

	buffer.copy(buf104, 0, buf, 0, n198)

	return buf104
end
function t459.decode(p297: buffer) -- line: 16716
	-- upvalues: t459 (copy), proto (copy), t1 (copy)
	local v3196 = t459.new()
	local n199 = 0

	while n199 < buffer.len(p297) do
		local v3198, v3199

		v3198, v3199, n199 = proto.readTag(p297, n199)

		if v3199 == proto.wireTypes.varint then
			local v3200

			v3200, n199 = proto.readVarInt(p297, n199)
		elseif v3199 == proto.wireTypes.lengthDelimited then
			if v3198 == 1 then
				local v3201

				v3201, n199 = proto.readBuffer(p297, n199)
				table.insert(v3196.options, t1.UiScaledUDim2Prop_ConditionalOption.decode(v3201))
			else
				local v3202, v3203 = proto.readVarInt(p297, n199)

				n199 = v3203 + v3202
			end
		elseif v3199 == proto.wireTypes.i32 then
			local v3204

			v3204, n199 = proto.readFixed32(p297, n199)
		elseif v3199 == proto.wireTypes.i64 then
			local v3205

			v3205, n199 = proto.readFixed64(p297, n199)
		else
			error("Unsupported wire type: " .. v3199)
		end
	end

	return v3196
end
function t459.jsonEncode(p298) -- line: 16759
	local t461 = {}

	if p298.options ~= nil and #p298.options > 0 then
		local t462 = {}

		for _, v3210 in p298.options do
			table.insert(t462, v3210:jsonEncode())
		end

		t461.options = t462
	end

	return t461
end
function t459.jsonDecode(t463: {[any]: any}) -- line: 16773
	-- upvalues: t459 (copy), t1 (copy)
	local v3212 = t459.new()

	if t463.options ~= nil then
		local t464 = {}

		for _, v3215 in t463.options do
			table.insert(t464, t1.UiScaledUDim2Prop_ConditionalOption.jsonDecode(v3215))
		end

		v3212.options = t464
	end

	return v3212
end

t459.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.UiScaledUDim2Prop_ConditionalOptions = t459
typeRegistry.default:register(t1.UiScaledUDim2Prop_ConditionalOptions)

return {
	TranslationRef = t1.TranslationRef,
	StringFormat = t1.StringFormat,
	StringFormat_FormatArg = t1.StringFormat_FormatArg,
	StringFormat_FormatArg_Formatter = t1.StringFormat_FormatArg_Formatter,
	StringFormat_FormatArg_Formatter_DateConfig = t1.StringFormat_FormatArg_Formatter_DateConfig,
	StringFormat_FormatArg_Formatter_Type = t1.StringFormat_FormatArg_Formatter_Type,
	StringProp = t1.StringProp,
	StringProp_ConditionalOption = t1.StringProp_ConditionalOption,
	StringProp_ConditionalOptions = t1.StringProp_ConditionalOptions,
	FloatProp = t1.FloatProp,
	FloatProp_ConditionalOption = t1.FloatProp_ConditionalOption,
	FloatProp_ConditionalOptions = t1.FloatProp_ConditionalOptions,
	DoubleProp = t1.DoubleProp,
	DoubleProp_ConditionalOption = t1.DoubleProp_ConditionalOption,
	DoubleProp_ConditionalOptions = t1.DoubleProp_ConditionalOptions,
	Int32Prop = t1.Int32Prop,
	Int32Prop_ConditionalOption = t1.Int32Prop_ConditionalOption,
	Int32Prop_ConditionalOptions = t1.Int32Prop_ConditionalOptions,
	Int64Prop = t1.Int64Prop,
	Int64Prop_ConditionalOption = t1.Int64Prop_ConditionalOption,
	Int64Prop_ConditionalOptions = t1.Int64Prop_ConditionalOptions,
	BoolProp = t1.BoolProp,
	BoolProp_ConditionalOption = t1.BoolProp_ConditionalOption,
	BoolProp_ConditionalOptions = t1.BoolProp_ConditionalOptions,
	StructProp = t1.StructProp,
	StructProp_ConditionalOption = t1.StructProp_ConditionalOption,
	StructProp_ConditionalOptions = t1.StructProp_ConditionalOptions,
	ImageStringProp = t1.ImageStringProp,
	ImageStringProp_ConditionalOption = t1.ImageStringProp_ConditionalOption,
	ImageStringProp_ConditionalOptions = t1.ImageStringProp_ConditionalOptions,
	ImageSetProp = t1.ImageSetProp,
	ImageSetProp_ConditionalOption = t1.ImageSetProp_ConditionalOption,
	ImageSetProp_ConditionalOptions = t1.ImageSetProp_ConditionalOptions,
	ColorProp = t1.ColorProp,
	ColorProp_ConditionalOption = t1.ColorProp_ConditionalOption,
	ColorProp_ConditionalOptions = t1.ColorProp_ConditionalOptions,
	TypographyProp = t1.TypographyProp,
	TypographyProp_ConditionalOption = t1.TypographyProp_ConditionalOption,
	TypographyProp_ConditionalOptions = t1.TypographyProp_ConditionalOptions,
	TypographyFontProp = t1.TypographyFontProp,
	TypographyFontProp_ConditionalOption = t1.TypographyFontProp_ConditionalOption,
	TypographyFontProp_ConditionalOptions = t1.TypographyFontProp_ConditionalOptions,
	ColorStyleProp = t1.ColorStyleProp,
	ColorStyleProp_ConditionalOption = t1.ColorStyleProp_ConditionalOption,
	ColorStyleProp_ConditionalOptions = t1.ColorStyleProp_ConditionalOptions,
	FillBehaviorProp = t1.FillBehaviorProp,
	FillBehaviorProp_ConditionalOption = t1.FillBehaviorProp_ConditionalOption,
	FillBehaviorProp_ConditionalOptions = t1.FillBehaviorProp_ConditionalOptions,
	InputSizeProp = t1.InputSizeProp,
	InputSizeProp_ConditionalOption = t1.InputSizeProp_ConditionalOption,
	InputSizeProp_ConditionalOptions = t1.InputSizeProp_ConditionalOptions,
	UDimProp = t1.UDimProp,
	UDimProp_ConditionalOption = t1.UDimProp_ConditionalOption,
	UDimProp_ConditionalOptions = t1.UDimProp_ConditionalOptions,
	UDim2Prop = t1.UDim2Prop,
	UDim2Prop_ConditionalOption = t1.UDim2Prop_ConditionalOption,
	UDim2Prop_ConditionalOptions = t1.UDim2Prop_ConditionalOptions,
	Vector2Prop = t1.Vector2Prop,
	Vector2Prop_ConditionalOption = t1.Vector2Prop_ConditionalOption,
	Vector2Prop_ConditionalOptions = t1.Vector2Prop_ConditionalOptions,
	TemplateArg = t1.TemplateArg,
	TemplateArg_LiteralValue = t1.TemplateArg_LiteralValue,
	NestedComponentProp = t1.NestedComponentProp,
	NestedComponentProp_ConditionalOption = t1.NestedComponentProp_ConditionalOption,
	NestedComponentProp_ConditionalOptions = t1.NestedComponentProp_ConditionalOptions,
	NestedComponentProp_TemplateData = t1.NestedComponentProp_TemplateData,
	LazyNestedComponentListProp = t1.LazyNestedComponentListProp,
	LazyNestedComponentListProp_ConditionalOption = t1.LazyNestedComponentListProp_ConditionalOption,
	LazyNestedComponentListProp_ConditionalOptions = t1.LazyNestedComponentListProp_ConditionalOptions,
	LazyNestedComponentListProp_TemplateData = t1.LazyNestedComponentListProp_TemplateData,
	LazyNestedComponentListProp_TemplateDataList = t1.LazyNestedComponentListProp_TemplateDataList,
	LazyNestedComponentListProp_OrderedTemplateData = t1.LazyNestedComponentListProp_OrderedTemplateData,
	LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData = t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData,
	LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue = t1.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue,
	NestedComponentListProp = t1.NestedComponentListProp,
	IconProp = t1.IconProp,
	IconProp_ConditionalOption = t1.IconProp_ConditionalOption,
	IconProp_ConditionalOptions = t1.IconProp_ConditionalOptions,
	IconSizeProp = t1.IconSizeProp,
	GradientProp = t1.GradientProp,
	GradientProp_ConditionalOption = t1.GradientProp_ConditionalOption,
	GradientProp_ConditionalOptions = t1.GradientProp_ConditionalOptions,
	GradientProp_GradientData = t1.GradientProp_GradientData,
	ArrayOfStructProp = t1.ArrayOfStructProp,
	ArrayOfStructProp_ConditionalOption = t1.ArrayOfStructProp_ConditionalOption,
	ArrayOfStructProp_ConditionalOptions = t1.ArrayOfStructProp_ConditionalOptions,
	ArrayOfStructProp_ArrayOfStructs = t1.ArrayOfStructProp_ArrayOfStructs,
	UiScaledFloatProp = t1.UiScaledFloatProp,
	UiScaledFloatProp_ConditionalOption = t1.UiScaledFloatProp_ConditionalOption,
	UiScaledFloatProp_ConditionalOptions = t1.UiScaledFloatProp_ConditionalOptions,
	UiScaledUDimProp = t1.UiScaledUDimProp,
	UiScaledUDimProp_ConditionalOption = t1.UiScaledUDimProp_ConditionalOption,
	UiScaledUDimProp_ConditionalOptions = t1.UiScaledUDimProp_ConditionalOptions,
	UiScaledUDim2Prop = t1.UiScaledUDim2Prop,
	UiScaledUDim2Prop_ConditionalOption = t1.UiScaledUDim2Prop_ConditionalOption,
	UiScaledUDim2Prop_ConditionalOptions = t1.UiScaledUDim2Prop_ConditionalOptions
}
