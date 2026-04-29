local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local struct = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local prop_condition = require(script.Parent.prop_condition)
local prop_types = require(script.Parent.prop_types)
local share_link_data = require(script.Parent.share_link_data)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 2508
	-- upvalues: t1 (copy), t2 (copy)
	return (setmetatable({
		action_type = if t3 ~= nil and t3.action_type ~= nil then t3.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t3 ~= nil and t3.action_params ~= nil then t3.action_params else nil
	}, t2))
end
function t2.encode(p1) -- line: 2517
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.action_type ~= nil and (p1.action_type ~= nil and p1.action_type ~= 0 or p1.action_type ~= t1.ActionType.fromNumber(0)) then
		local v95, v96 = proto.writeTag(buf, n1, 1, proto.wireTypes.varint)

		buf, n1 = proto.writeVarInt(v95, v96, t1.ActionType.toNumber(p1.action_type))
	end

	if p1.action_params ~= nil then
		local v97 = p1.action_params:encode()
		local v98, v99 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v98, v99, v97, buffer.len(v97))
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 2543
	-- upvalues: t2 (copy), proto (copy), t1 (copy)
	local v102 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v104, v105

		v104, v105, n2 = proto.readTag(p2, n2)

		if v105 == proto.wireTypes.varint then
			if v104 == 1 then
				local v106

				v106, n2 = proto.readVarIntI32(p2, n2)
				v102.action_type = t1.ActionType.fromNumber(v106) or v106
			else
				local v107

				v107, n2 = proto.readVarInt(p2, n2)
			end
		elseif v105 == proto.wireTypes.lengthDelimited then
			if v104 == 2 then
				local v108

				v108, n2 = proto.readBuffer(p2, n2)
				v102.action_params = t1.DismissDialogAction_Params.decode(v108)
			else
				local v109, v110 = proto.readVarInt(p2, n2)

				n2 = v110 + v109
			end
		elseif v105 == proto.wireTypes.i32 then
			local v111

			v111, n2 = proto.readFixed32(p2, n2)
		elseif v105 == proto.wireTypes.i64 then
			local v112

			v112, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v105)
		end
	end

	return v102
end
function t2.jsonEncode(p3) -- line: 2591
	-- upvalues: t1 (copy)
	local t4 = {}

	if p3.action_type ~= nil and (p3.action_type ~= nil and p3.action_type ~= 0 or p3.action_type ~= t1.ActionType.fromNumber(0)) then
		t4.actionType = if typeof(p3.action_type) ~= "number" then t1.ActionType.toNumber(p3.action_type) else p3.action_type
	end

	if p3.action_params ~= nil then
		t4.actionParams = p3.action_params:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 2613
	-- upvalues: t2 (copy), t1 (copy)
	local v116 = t2.new()

	if t5.action_type ~= nil then
		v116.action_type = if typeof(t5.action_type) ~= "number" then t1.ActionType.fromName(t5.action_type) or t5.action_type else t1.ActionType.fromNumber(t5.action_type) or t5.action_type
	end

	if t5.actionType ~= nil then
		v116.action_type = if typeof(t5.actionType) ~= "number" then t1.ActionType.fromName(t5.actionType) or t5.actionType else t1.ActionType.fromNumber(t5.actionType) or t5.actionType
	end

	if t5.action_params ~= nil then
		v116.action_params = t1.DismissDialogAction_Params.jsonDecode(t5.action_params)
	end

	if t5.actionParams ~= nil then
		v116.action_params = t1.DismissDialogAction_Params.jsonDecode(t5.actionParams)
	end

	return v116
end

t2.descriptor = {
	name = "DismissDialogAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
}
t1.DismissDialogAction = t2
typeRegistry.default:register(t1.DismissDialogAction)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 2653
	-- upvalues: t6 (copy)
	return (setmetatable({
		dialog_type = if t7 ~= nil and t7.dialog_type ~= nil then t7.dialog_type else nil
	}, t6))
end
function t6.encode(p4) -- line: 2661
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.dialog_type ~= nil then
		local v121 = p4.dialog_type:encode()
		local v122, v123 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v122, v123, v121, buffer.len(v121))
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 2676
	-- upvalues: t6 (copy), proto (copy), prop_types (copy)
	local v126 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v128, v129

		v128, v129, n4 = proto.readTag(p5, n4)

		if v129 == proto.wireTypes.varint then
			local v130

			v130, n4 = proto.readVarInt(p5, n4)
		elseif v129 == proto.wireTypes.lengthDelimited then
			if v128 == 1 then
				local v131

				v131, n4 = proto.readBuffer(p5, n4)
				v126.dialog_type = prop_types.StringProp.decode(v131)
			else
				local v132, v133 = proto.readVarInt(p5, n4)

				n4 = v133 + v132
			end
		elseif v129 == proto.wireTypes.i32 then
			local v134

			v134, n4 = proto.readFixed32(p5, n4)
		elseif v129 == proto.wireTypes.i64 then
			local v135

			v135, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v129)
		end
	end

	return v126
end
function t6.jsonEncode(p6) -- line: 2719
	local t8 = {}

	if p6.dialog_type ~= nil then
		t8.dialogType = p6.dialog_type:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 2729
	-- upvalues: t6 (copy), prop_types (copy)
	local v139 = t6.new()

	if t9.dialog_type ~= nil then
		v139.dialog_type = prop_types.StringProp.jsonDecode(t9.dialog_type)
	end

	if t9.dialogType ~= nil then
		v139.dialog_type = prop_types.StringProp.jsonDecode(t9.dialogType)
	end

	return v139
end

t6.descriptor = {
	name = "DismissDialogAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.DismissDialogAction_Params = t6
typeRegistry.default:register(t1.DismissDialogAction_Params)

local t10 = {}

t10.__index = t10

function t10.new(t11: {[any]: any}?) -- line: 2758
	-- upvalues: t1 (copy), t10 (copy)
	return (setmetatable({
		action_type = if t11 ~= nil and t11.action_type ~= nil then t11.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t11 ~= nil and t11.action_params ~= nil then t11.action_params else nil
	}, t10))
end
function t10.encode(p7) -- line: 2767
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n5 = 0

	if p7.action_type ~= nil and (p7.action_type ~= nil and p7.action_type ~= 0 or p7.action_type ~= t1.ActionType.fromNumber(0)) then
		local v144, v145 = proto.writeTag(buf, n5, 1, proto.wireTypes.varint)

		buf, n5 = proto.writeVarInt(v144, v145, t1.ActionType.toNumber(p7.action_type))
	end

	if p7.action_params ~= nil then
		local v146 = p7.action_params:encode()
		local v147, v148 = proto.writeTag(buf, n5, 2, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeBuffer(v147, v148, v146, buffer.len(v146))
	end

	local buf4 = buffer.create(n5)

	buffer.copy(buf4, 0, buf, 0, n5)

	return buf4
end
function t10.decode(p8: buffer) -- line: 2793
	-- upvalues: t10 (copy), proto (copy), t1 (copy)
	local v151 = t10.new()
	local n6 = 0

	while n6 < buffer.len(p8) do
		local v153, v154

		v153, v154, n6 = proto.readTag(p8, n6)

		if v154 == proto.wireTypes.varint then
			if v153 == 1 then
				local v155

				v155, n6 = proto.readVarIntI32(p8, n6)
				v151.action_type = t1.ActionType.fromNumber(v155) or v155
			else
				local v156

				v156, n6 = proto.readVarInt(p8, n6)
			end
		elseif v154 == proto.wireTypes.lengthDelimited then
			if v153 == 2 then
				local v157

				v157, n6 = proto.readBuffer(p8, n6)
				v151.action_params = t1.LinkAction_Params.decode(v157)
			else
				local v158, v159 = proto.readVarInt(p8, n6)

				n6 = v159 + v158
			end
		elseif v154 == proto.wireTypes.i32 then
			local v160

			v160, n6 = proto.readFixed32(p8, n6)
		elseif v154 == proto.wireTypes.i64 then
			local v161

			v161, n6 = proto.readFixed64(p8, n6)
		else
			error("Unsupported wire type: " .. v154)
		end
	end

	return v151
end
function t10.jsonEncode(p9) -- line: 2841
	-- upvalues: t1 (copy)
	local t12 = {}

	if p9.action_type ~= nil and (p9.action_type ~= nil and p9.action_type ~= 0 or p9.action_type ~= t1.ActionType.fromNumber(0)) then
		t12.actionType = if typeof(p9.action_type) ~= "number" then t1.ActionType.toNumber(p9.action_type) else p9.action_type
	end

	if p9.action_params ~= nil then
		t12.actionParams = p9.action_params:jsonEncode()
	end

	return t12
end
function t10.jsonDecode(t13: {[any]: any}) -- line: 2863
	-- upvalues: t10 (copy), t1 (copy)
	local v165 = t10.new()

	if t13.action_type ~= nil then
		v165.action_type = if typeof(t13.action_type) ~= "number" then t1.ActionType.fromName(t13.action_type) or t13.action_type else t1.ActionType.fromNumber(t13.action_type) or t13.action_type
	end

	if t13.actionType ~= nil then
		v165.action_type = if typeof(t13.actionType) ~= "number" then t1.ActionType.fromName(t13.actionType) or t13.actionType else t1.ActionType.fromNumber(t13.actionType) or t13.actionType
	end

	if t13.action_params ~= nil then
		v165.action_params = t1.LinkAction_Params.jsonDecode(t13.action_params)
	end

	if t13.actionParams ~= nil then
		v165.action_params = t1.LinkAction_Params.jsonDecode(t13.actionParams)
	end

	return v165
end

t10.descriptor = {
	name = "LinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
}
t1.LinkAction = t10
typeRegistry.default:register(t1.LinkAction)

local t14 = {}

t14.__index = t14

function t14.new(t15: {[any]: any}?) -- line: 2903
	-- upvalues: t14 (copy)
	return (setmetatable({
		url = if t15 ~= nil and t15.url ~= nil then t15.url else nil,
		title_key = if t15 ~= nil and t15.title_key ~= nil then t15.title_key else nil
	}, t14))
end
function t14.encode(p10) -- line: 2910
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n7 = 0

	if p10.url ~= nil then
		local v170 = p10.url:encode()
		local v171, v172 = proto.writeTag(buf, n7, 1, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeBuffer(v171, v172, v170, buffer.len(v170))
	end

	if p10.title_key ~= nil then
		local v173 = p10.title_key:encode()
		local v174, v175 = proto.writeTag(buf, n7, 2, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeBuffer(v174, v175, v173, buffer.len(v173))
	end

	local buf5 = buffer.create(n7)

	buffer.copy(buf5, 0, buf, 0, n7)

	return buf5
end
function t14.decode(p11: buffer) -- line: 2931
	-- upvalues: t14 (copy), proto (copy), prop_types (copy)
	local v178 = t14.new()
	local n8 = 0

	while n8 < buffer.len(p11) do
		local v180, v181

		v180, v181, n8 = proto.readTag(p11, n8)

		if v181 == proto.wireTypes.varint then
			local v182

			v182, n8 = proto.readVarInt(p11, n8)
		elseif v181 == proto.wireTypes.lengthDelimited then
			if v180 == 1 then
				local v183

				v183, n8 = proto.readBuffer(p11, n8)
				v178.url = prop_types.StringProp.decode(v183)
			elseif v180 == 2 then
				local v184

				v184, n8 = proto.readBuffer(p11, n8)
				v178.title_key = prop_types.StringProp.decode(v184)
			else
				local v185, v186 = proto.readVarInt(p11, n8)

				n8 = v186 + v185
			end
		elseif v181 == proto.wireTypes.i32 then
			local v187

			v187, n8 = proto.readFixed32(p11, n8)
		elseif v181 == proto.wireTypes.i64 then
			local v188

			v188, n8 = proto.readFixed64(p11, n8)
		else
			error("Unsupported wire type: " .. v181)
		end
	end

	return v178
end
function t14.jsonEncode(p12) -- line: 2979
	local t16 = {}

	if p12.url ~= nil then
		t16.url = p12.url:jsonEncode()
	end

	if p12.title_key ~= nil then
		t16.titleKey = p12.title_key:jsonEncode()
	end

	return t16
end
function t14.jsonDecode(t17: {[any]: any}) -- line: 2993
	-- upvalues: t14 (copy), prop_types (copy)
	local v192 = t14.new()

	if t17.url ~= nil then
		v192.url = prop_types.StringProp.jsonDecode(t17.url)
	end

	if t17.title_key ~= nil then
		v192.title_key = prop_types.StringProp.jsonDecode(t17.title_key)
	end

	if t17.titleKey ~= nil then
		v192.title_key = prop_types.StringProp.jsonDecode(t17.titleKey)
	end

	return v192
end

t14.descriptor = {
	name = "LinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.LinkAction_Params = t14
typeRegistry.default:register(t1.LinkAction_Params)

local t18 = {}

t18.__index = t18

function t18.new(t19: {[any]: any}?) -- line: 3025
	-- upvalues: t1 (copy), t18 (copy)
	return (setmetatable({
		action_type = if t19 ~= nil and t19.action_type ~= nil then t19.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t19 ~= nil and t19.action_params ~= nil then t19.action_params else nil
	}, t18))
end
function t18.encode(p13) -- line: 3034
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n9 = 0

	if p13.action_type ~= nil and (p13.action_type ~= nil and p13.action_type ~= 0 or p13.action_type ~= t1.ActionType.fromNumber(0)) then
		local v197, v198 = proto.writeTag(buf, n9, 1, proto.wireTypes.varint)

		buf, n9 = proto.writeVarInt(v197, v198, t1.ActionType.toNumber(p13.action_type))
	end

	if p13.action_params ~= nil then
		local v199 = p13.action_params:encode()
		local v200, v201 = proto.writeTag(buf, n9, 2, proto.wireTypes.lengthDelimited)

		buf, n9 = proto.writeBuffer(v200, v201, v199, buffer.len(v199))
	end

	local buf6 = buffer.create(n9)

	buffer.copy(buf6, 0, buf, 0, n9)

	return buf6
end
function t18.decode(p14: buffer) -- line: 3060
	-- upvalues: t18 (copy), proto (copy), t1 (copy)
	local v204 = t18.new()
	local n10 = 0

	while n10 < buffer.len(p14) do
		local v206, v207

		v206, v207, n10 = proto.readTag(p14, n10)

		if v207 == proto.wireTypes.varint then
			if v206 == 1 then
				local v208

				v208, n10 = proto.readVarIntI32(p14, n10)
				v204.action_type = t1.ActionType.fromNumber(v208) or v208
			else
				local v209

				v209, n10 = proto.readVarInt(p14, n10)
			end
		elseif v207 == proto.wireTypes.lengthDelimited then
			if v206 == 2 then
				local v210

				v210, n10 = proto.readBuffer(p14, n10)
				v204.action_params = t1.OpenSocialLinkAction_Params.decode(v210)
			else
				local v211, v212 = proto.readVarInt(p14, n10)

				n10 = v212 + v211
			end
		elseif v207 == proto.wireTypes.i32 then
			local v213

			v213, n10 = proto.readFixed32(p14, n10)
		elseif v207 == proto.wireTypes.i64 then
			local v214

			v214, n10 = proto.readFixed64(p14, n10)
		else
			error("Unsupported wire type: " .. v207)
		end
	end

	return v204
end
function t18.jsonEncode(p15) -- line: 3108
	-- upvalues: t1 (copy)
	local t20 = {}

	if p15.action_type ~= nil and (p15.action_type ~= nil and p15.action_type ~= 0 or p15.action_type ~= t1.ActionType.fromNumber(0)) then
		t20.actionType = if typeof(p15.action_type) ~= "number" then t1.ActionType.toNumber(p15.action_type) else p15.action_type
	end

	if p15.action_params ~= nil then
		t20.actionParams = p15.action_params:jsonEncode()
	end

	return t20
end
function t18.jsonDecode(t21: {[any]: any}) -- line: 3130
	-- upvalues: t18 (copy), t1 (copy)
	local v218 = t18.new()

	if t21.action_type ~= nil then
		v218.action_type = if typeof(t21.action_type) ~= "number" then t1.ActionType.fromName(t21.action_type) or t21.action_type else t1.ActionType.fromNumber(t21.action_type) or t21.action_type
	end

	if t21.actionType ~= nil then
		v218.action_type = if typeof(t21.actionType) ~= "number" then t1.ActionType.fromName(t21.actionType) or t21.actionType else t1.ActionType.fromNumber(t21.actionType) or t21.actionType
	end

	if t21.action_params ~= nil then
		v218.action_params = t1.OpenSocialLinkAction_Params.jsonDecode(t21.action_params)
	end

	if t21.actionParams ~= nil then
		v218.action_params = t1.OpenSocialLinkAction_Params.jsonDecode(t21.actionParams)
	end

	return v218
end

t18.descriptor = {
	name = "OpenSocialLinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
}
t1.OpenSocialLinkAction = t18
typeRegistry.default:register(t1.OpenSocialLinkAction)

local t22 = {}

t22.__index = t22

function t22.new(t23: {[any]: any}?) -- line: 3170
	-- upvalues: t22 (copy)
	return (setmetatable({
		assignment_id = if t23 ~= nil and t23.assignment_id ~= nil then t23.assignment_id else nil,
		assignment_type = if t23 ~= nil and t23.assignment_type ~= nil then t23.assignment_type else nil,
		social_link_type = if t23 ~= nil and t23.social_link_type ~= nil then t23.social_link_type else nil,
		social_link_url = if t23 ~= nil and t23.social_link_url ~= nil then t23.social_link_url else nil,
		social_link_display_type = if t23 ~= nil and t23.social_link_display_type ~= nil then t23.social_link_display_type else nil
	}, t22))
end
function t22.encode(p16) -- line: 3184
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n11 = 0

	if p16.assignment_id ~= nil then
		local v223 = p16.assignment_id:encode()
		local v224, v225 = proto.writeTag(buf, n11, 1, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v224, v225, v223, buffer.len(v223))
	end

	if p16.assignment_type ~= nil then
		local v226 = p16.assignment_type:encode()
		local v227, v228 = proto.writeTag(buf, n11, 2, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v227, v228, v226, buffer.len(v226))
	end

	if p16.social_link_type ~= nil then
		local v229 = p16.social_link_type:encode()
		local v230, v231 = proto.writeTag(buf, n11, 3, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v230, v231, v229, buffer.len(v229))
	end

	if p16.social_link_url ~= nil then
		local v232 = p16.social_link_url:encode()
		local v233, v234 = proto.writeTag(buf, n11, 4, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v233, v234, v232, buffer.len(v232))
	end

	if p16.social_link_display_type ~= nil then
		local v235 = p16.social_link_display_type:encode()
		local v236, v237 = proto.writeTag(buf, n11, 5, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v236, v237, v235, buffer.len(v235))
	end

	local buf7 = buffer.create(n11)

	buffer.copy(buf7, 0, buf, 0, n11)

	return buf7
end
function t22.decode(p17: buffer) -- line: 3223
	-- upvalues: t22 (copy), proto (copy), prop_types (copy)
	local v240 = t22.new()
	local n12 = 0

	while n12 < buffer.len(p17) do
		local v242, v243

		v242, v243, n12 = proto.readTag(p17, n12)

		if v243 == proto.wireTypes.varint then
			local v244

			v244, n12 = proto.readVarInt(p17, n12)
		elseif v243 == proto.wireTypes.lengthDelimited then
			if v242 == 1 then
				local v245

				v245, n12 = proto.readBuffer(p17, n12)
				v240.assignment_id = prop_types.StringProp.decode(v245)
			elseif v242 == 2 then
				local v246

				v246, n12 = proto.readBuffer(p17, n12)
				v240.assignment_type = prop_types.StringProp.decode(v246)
			elseif v242 == 3 then
				local v247

				v247, n12 = proto.readBuffer(p17, n12)
				v240.social_link_type = prop_types.StringProp.decode(v247)
			elseif v242 == 4 then
				local v248

				v248, n12 = proto.readBuffer(p17, n12)
				v240.social_link_url = prop_types.StringProp.decode(v248)
			elseif v242 == 5 then
				local v249

				v249, n12 = proto.readBuffer(p17, n12)
				v240.social_link_display_type = prop_types.StringProp.decode(v249)
			else
				local v250, v251 = proto.readVarInt(p17, n12)

				n12 = v251 + v250
			end
		elseif v243 == proto.wireTypes.i32 then
			local v252

			v252, n12 = proto.readFixed32(p17, n12)
		elseif v243 == proto.wireTypes.i64 then
			local v253

			v253, n12 = proto.readFixed64(p17, n12)
		else
			error("Unsupported wire type: " .. v243)
		end
	end

	return v240
end
function t22.jsonEncode(p18) -- line: 3287
	local t24 = {}

	if p18.assignment_id ~= nil then
		t24.assignmentId = p18.assignment_id:jsonEncode()
	end

	if p18.assignment_type ~= nil then
		t24.assignmentType = p18.assignment_type:jsonEncode()
	end

	if p18.social_link_type ~= nil then
		t24.socialLinkType = p18.social_link_type:jsonEncode()
	end

	if p18.social_link_url ~= nil then
		t24.socialLinkUrl = p18.social_link_url:jsonEncode()
	end

	if p18.social_link_display_type ~= nil then
		t24.socialLinkDisplayType = p18.social_link_display_type:jsonEncode()
	end

	return t24
end
function t22.jsonDecode(t25: {[any]: any}) -- line: 3313
	-- upvalues: t22 (copy), prop_types (copy)
	local v257 = t22.new()

	if t25.assignment_id ~= nil then
		v257.assignment_id = prop_types.StringProp.jsonDecode(t25.assignment_id)
	end

	if t25.assignmentId ~= nil then
		v257.assignment_id = prop_types.StringProp.jsonDecode(t25.assignmentId)
	end

	if t25.assignment_type ~= nil then
		v257.assignment_type = prop_types.StringProp.jsonDecode(t25.assignment_type)
	end

	if t25.assignmentType ~= nil then
		v257.assignment_type = prop_types.StringProp.jsonDecode(t25.assignmentType)
	end

	if t25.social_link_type ~= nil then
		v257.social_link_type = prop_types.StringProp.jsonDecode(t25.social_link_type)
	end

	if t25.socialLinkType ~= nil then
		v257.social_link_type = prop_types.StringProp.jsonDecode(t25.socialLinkType)
	end

	if t25.social_link_url ~= nil then
		v257.social_link_url = prop_types.StringProp.jsonDecode(t25.social_link_url)
	end

	if t25.socialLinkUrl ~= nil then
		v257.social_link_url = prop_types.StringProp.jsonDecode(t25.socialLinkUrl)
	end

	if t25.social_link_display_type ~= nil then
		v257.social_link_display_type = prop_types.StringProp.jsonDecode(t25.social_link_display_type)
	end

	if t25.socialLinkDisplayType ~= nil then
		v257.social_link_display_type = prop_types.StringProp.jsonDecode(t25.socialLinkDisplayType)
	end

	return v257
end

t22.descriptor = {
	name = "OpenSocialLinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenSocialLinkAction_Params = t22
typeRegistry.default:register(t1.OpenSocialLinkAction_Params)

local t26 = {}

t26.__index = t26

function t26.new(t27: {[any]: any}?) -- line: 3383
	-- upvalues: t1 (copy), t26 (copy)
	return (setmetatable({
		action_type = if t27 ~= nil and t27.action_type ~= nil then t27.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t27 ~= nil and t27.action_params ~= nil then t27.action_params else nil
	}, t26))
end
function t26.encode(p19) -- line: 3392
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n13 = 0

	if p19.action_type ~= nil and (p19.action_type ~= nil and p19.action_type ~= 0 or p19.action_type ~= t1.ActionType.fromNumber(0)) then
		local v262, v263 = proto.writeTag(buf, n13, 1, proto.wireTypes.varint)

		buf, n13 = proto.writeVarInt(v262, v263, t1.ActionType.toNumber(p19.action_type))
	end

	if p19.action_params ~= nil then
		local v264 = p19.action_params:encode()
		local v265, v266 = proto.writeTag(buf, n13, 2, proto.wireTypes.lengthDelimited)

		buf, n13 = proto.writeBuffer(v265, v266, v264, buffer.len(v264))
	end

	local buf8 = buffer.create(n13)

	buffer.copy(buf8, 0, buf, 0, n13)

	return buf8
end
function t26.decode(p20: buffer) -- line: 3418
	-- upvalues: t26 (copy), proto (copy), t1 (copy)
	local v269 = t26.new()
	local n14 = 0

	while n14 < buffer.len(p20) do
		local v271, v272

		v271, v272, n14 = proto.readTag(p20, n14)

		if v272 == proto.wireTypes.varint then
			if v271 == 1 then
				local v273

				v273, n14 = proto.readVarIntI32(p20, n14)
				v269.action_type = t1.ActionType.fromNumber(v273) or v273
			else
				local v274

				v274, n14 = proto.readVarInt(p20, n14)
			end
		elseif v272 == proto.wireTypes.lengthDelimited then
			if v271 == 2 then
				local v275

				v275, n14 = proto.readBuffer(p20, n14)
				v269.action_params = t1.OpenGameDetailsAction_Params.decode(v275)
			else
				local v276, v277 = proto.readVarInt(p20, n14)

				n14 = v277 + v276
			end
		elseif v272 == proto.wireTypes.i32 then
			local v278

			v278, n14 = proto.readFixed32(p20, n14)
		elseif v272 == proto.wireTypes.i64 then
			local v279

			v279, n14 = proto.readFixed64(p20, n14)
		else
			error("Unsupported wire type: " .. v272)
		end
	end

	return v269
end
function t26.jsonEncode(p21) -- line: 3466
	-- upvalues: t1 (copy)
	local t28 = {}

	if p21.action_type ~= nil and (p21.action_type ~= nil and p21.action_type ~= 0 or p21.action_type ~= t1.ActionType.fromNumber(0)) then
		t28.actionType = if typeof(p21.action_type) ~= "number" then t1.ActionType.toNumber(p21.action_type) else p21.action_type
	end

	if p21.action_params ~= nil then
		t28.actionParams = p21.action_params:jsonEncode()
	end

	return t28
end
function t26.jsonDecode(t29: {[any]: any}) -- line: 3488
	-- upvalues: t26 (copy), t1 (copy)
	local v283 = t26.new()

	if t29.action_type ~= nil then
		v283.action_type = if typeof(t29.action_type) ~= "number" then t1.ActionType.fromName(t29.action_type) or t29.action_type else t1.ActionType.fromNumber(t29.action_type) or t29.action_type
	end

	if t29.actionType ~= nil then
		v283.action_type = if typeof(t29.actionType) ~= "number" then t1.ActionType.fromName(t29.actionType) or t29.actionType else t1.ActionType.fromNumber(t29.actionType) or t29.actionType
	end

	if t29.action_params ~= nil then
		v283.action_params = t1.OpenGameDetailsAction_Params.jsonDecode(t29.action_params)
	end

	if t29.actionParams ~= nil then
		v283.action_params = t1.OpenGameDetailsAction_Params.jsonDecode(t29.actionParams)
	end

	return v283
end

t26.descriptor = {
	name = "OpenGameDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
}
t1.OpenGameDetailsAction = t26
typeRegistry.default:register(t1.OpenGameDetailsAction)

local t30 = {}

t30.__index = t30

function t30.new(t31: {[any]: any}?) -- line: 3528
	-- upvalues: t30 (copy)
	return (setmetatable({
		place_id = if t31 ~= nil and t31.place_id ~= nil then t31.place_id else nil,
		universe_id = if t31 ~= nil and t31.universe_id ~= nil then t31.universe_id else nil
	}, t30))
end
function t30.encode(p22) -- line: 3537
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n15 = 0

	if p22.place_id ~= nil then
		local v288 = p22.place_id:encode()
		local v289, v290 = proto.writeTag(buf, n15, 1, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeBuffer(v289, v290, v288, buffer.len(v288))
	end

	if p22.universe_id ~= nil then
		local v291 = p22.universe_id:encode()
		local v292, v293 = proto.writeTag(buf, n15, 2, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeBuffer(v292, v293, v291, buffer.len(v291))
	end

	local buf9 = buffer.create(n15)

	buffer.copy(buf9, 0, buf, 0, n15)

	return buf9
end
function t30.decode(p23: buffer) -- line: 3558
	-- upvalues: t30 (copy), proto (copy), prop_types (copy)
	local v296 = t30.new()
	local n16 = 0

	while n16 < buffer.len(p23) do
		local v298, v299

		v298, v299, n16 = proto.readTag(p23, n16)

		if v299 == proto.wireTypes.varint then
			local v300

			v300, n16 = proto.readVarInt(p23, n16)
		elseif v299 == proto.wireTypes.lengthDelimited then
			if v298 == 1 then
				local v301

				v301, n16 = proto.readBuffer(p23, n16)
				v296.place_id = prop_types.StringProp.decode(v301)
			elseif v298 == 2 then
				local v302

				v302, n16 = proto.readBuffer(p23, n16)
				v296.universe_id = prop_types.StringProp.decode(v302)
			else
				local v303, v304 = proto.readVarInt(p23, n16)

				n16 = v304 + v303
			end
		elseif v299 == proto.wireTypes.i32 then
			local v305

			v305, n16 = proto.readFixed32(p23, n16)
		elseif v299 == proto.wireTypes.i64 then
			local v306

			v306, n16 = proto.readFixed64(p23, n16)
		else
			error("Unsupported wire type: " .. v299)
		end
	end

	return v296
end
function t30.jsonEncode(p24) -- line: 3606
	local t32 = {}

	if p24.place_id ~= nil then
		t32.placeId = p24.place_id:jsonEncode()
	end

	if p24.universe_id ~= nil then
		t32.universeId = p24.universe_id:jsonEncode()
	end

	return t32
end
function t30.jsonDecode(t33: {[any]: any}) -- line: 3620
	-- upvalues: t30 (copy), prop_types (copy)
	local v310 = t30.new()

	if t33.place_id ~= nil then
		v310.place_id = prop_types.StringProp.jsonDecode(t33.place_id)
	end

	if t33.placeId ~= nil then
		v310.place_id = prop_types.StringProp.jsonDecode(t33.placeId)
	end

	if t33.universe_id ~= nil then
		v310.universe_id = prop_types.StringProp.jsonDecode(t33.universe_id)
	end

	if t33.universeId ~= nil then
		v310.universe_id = prop_types.StringProp.jsonDecode(t33.universeId)
	end

	return v310
end

t30.descriptor = {
	name = "OpenGameDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenGameDetailsAction_Params = t30
typeRegistry.default:register(t1.OpenGameDetailsAction_Params)

local t34 = {}

t34.__index = t34

function t34.new(t35: {[any]: any}?) -- line: 3657
	-- upvalues: t1 (copy), t34 (copy)
	return (setmetatable({
		action_type = if t35 ~= nil and t35.action_type ~= nil then t35.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t35 ~= nil and t35.action_params ~= nil then t35.action_params else nil
	}, t34))
end
function t34.encode(p25) -- line: 3666
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n17 = 0

	if p25.action_type ~= nil and (p25.action_type ~= nil and p25.action_type ~= 0 or p25.action_type ~= t1.ActionType.fromNumber(0)) then
		local v315, v316 = proto.writeTag(buf, n17, 1, proto.wireTypes.varint)

		buf, n17 = proto.writeVarInt(v315, v316, t1.ActionType.toNumber(p25.action_type))
	end

	if p25.action_params ~= nil then
		local v317 = p25.action_params:encode()
		local v318, v319 = proto.writeTag(buf, n17, 2, proto.wireTypes.lengthDelimited)

		buf, n17 = proto.writeBuffer(v318, v319, v317, buffer.len(v317))
	end

	local buf10 = buffer.create(n17)

	buffer.copy(buf10, 0, buf, 0, n17)

	return buf10
end
function t34.decode(p26: buffer) -- line: 3692
	-- upvalues: t34 (copy), proto (copy), t1 (copy)
	local v322 = t34.new()
	local n18 = 0

	while n18 < buffer.len(p26) do
		local v324, v325

		v324, v325, n18 = proto.readTag(p26, n18)

		if v325 == proto.wireTypes.varint then
			if v324 == 1 then
				local v326

				v326, n18 = proto.readVarIntI32(p26, n18)
				v322.action_type = t1.ActionType.fromNumber(v326) or v326
			else
				local v327

				v327, n18 = proto.readVarInt(p26, n18)
			end
		elseif v325 == proto.wireTypes.lengthDelimited then
			if v324 == 2 then
				local v328

				v328, n18 = proto.readBuffer(p26, n18)
				v322.action_params = t1.OpenJoinFriendsAction_Params.decode(v328)
			else
				local v329, v330 = proto.readVarInt(p26, n18)

				n18 = v330 + v329
			end
		elseif v325 == proto.wireTypes.i32 then
			local v331

			v331, n18 = proto.readFixed32(p26, n18)
		elseif v325 == proto.wireTypes.i64 then
			local v332

			v332, n18 = proto.readFixed64(p26, n18)
		else
			error("Unsupported wire type: " .. v325)
		end
	end

	return v322
end
function t34.jsonEncode(p27) -- line: 3740
	-- upvalues: t1 (copy)
	local t36 = {}

	if p27.action_type ~= nil and (p27.action_type ~= nil and p27.action_type ~= 0 or p27.action_type ~= t1.ActionType.fromNumber(0)) then
		t36.actionType = if typeof(p27.action_type) ~= "number" then t1.ActionType.toNumber(p27.action_type) else p27.action_type
	end

	if p27.action_params ~= nil then
		t36.actionParams = p27.action_params:jsonEncode()
	end

	return t36
end
function t34.jsonDecode(t37: {[any]: any}) -- line: 3762
	-- upvalues: t34 (copy), t1 (copy)
	local v336 = t34.new()

	if t37.action_type ~= nil then
		v336.action_type = if typeof(t37.action_type) ~= "number" then t1.ActionType.fromName(t37.action_type) or t37.action_type else t1.ActionType.fromNumber(t37.action_type) or t37.action_type
	end

	if t37.actionType ~= nil then
		v336.action_type = if typeof(t37.actionType) ~= "number" then t1.ActionType.fromName(t37.actionType) or t37.actionType else t1.ActionType.fromNumber(t37.actionType) or t37.actionType
	end

	if t37.action_params ~= nil then
		v336.action_params = t1.OpenJoinFriendsAction_Params.jsonDecode(t37.action_params)
	end

	if t37.actionParams ~= nil then
		v336.action_params = t1.OpenJoinFriendsAction_Params.jsonDecode(t37.actionParams)
	end

	return v336
end

t34.descriptor = {
	name = "OpenJoinFriendsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
}
t1.OpenJoinFriendsAction = t34
typeRegistry.default:register(t1.OpenJoinFriendsAction)

local t38 = {}

t38.__index = t38

function t38.new(t39: {[any]: any}?) -- line: 3802
	-- upvalues: t38 (copy)
	return (setmetatable({
		place_id = if t39 ~= nil and t39.place_id ~= nil then t39.place_id else nil,
		universe_id = if t39 ~= nil and t39.universe_id ~= nil then t39.universe_id else nil
	}, t38))
end
function t38.encode(p28) -- line: 3811
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n19 = 0

	if p28.place_id ~= nil then
		local v341 = p28.place_id:encode()
		local v342, v343 = proto.writeTag(buf, n19, 1, proto.wireTypes.lengthDelimited)

		buf, n19 = proto.writeBuffer(v342, v343, v341, buffer.len(v341))
	end

	if p28.universe_id ~= nil then
		local v344 = p28.universe_id:encode()
		local v345, v346 = proto.writeTag(buf, n19, 2, proto.wireTypes.lengthDelimited)

		buf, n19 = proto.writeBuffer(v345, v346, v344, buffer.len(v344))
	end

	local buf11 = buffer.create(n19)

	buffer.copy(buf11, 0, buf, 0, n19)

	return buf11
end
function t38.decode(p29: buffer) -- line: 3832
	-- upvalues: t38 (copy), proto (copy), prop_types (copy)
	local v349 = t38.new()
	local n20 = 0

	while n20 < buffer.len(p29) do
		local v351, v352

		v351, v352, n20 = proto.readTag(p29, n20)

		if v352 == proto.wireTypes.varint then
			local v353

			v353, n20 = proto.readVarInt(p29, n20)
		elseif v352 == proto.wireTypes.lengthDelimited then
			if v351 == 1 then
				local v354

				v354, n20 = proto.readBuffer(p29, n20)
				v349.place_id = prop_types.StringProp.decode(v354)
			elseif v351 == 2 then
				local v355

				v355, n20 = proto.readBuffer(p29, n20)
				v349.universe_id = prop_types.StringProp.decode(v355)
			else
				local v356, v357 = proto.readVarInt(p29, n20)

				n20 = v357 + v356
			end
		elseif v352 == proto.wireTypes.i32 then
			local v358

			v358, n20 = proto.readFixed32(p29, n20)
		elseif v352 == proto.wireTypes.i64 then
			local v359

			v359, n20 = proto.readFixed64(p29, n20)
		else
			error("Unsupported wire type: " .. v352)
		end
	end

	return v349
end
function t38.jsonEncode(p30) -- line: 3880
	local t40 = {}

	if p30.place_id ~= nil then
		t40.placeId = p30.place_id:jsonEncode()
	end

	if p30.universe_id ~= nil then
		t40.universeId = p30.universe_id:jsonEncode()
	end

	return t40
end
function t38.jsonDecode(t41: {[any]: any}) -- line: 3894
	-- upvalues: t38 (copy), prop_types (copy)
	local v363 = t38.new()

	if t41.place_id ~= nil then
		v363.place_id = prop_types.StringProp.jsonDecode(t41.place_id)
	end

	if t41.placeId ~= nil then
		v363.place_id = prop_types.StringProp.jsonDecode(t41.placeId)
	end

	if t41.universe_id ~= nil then
		v363.universe_id = prop_types.StringProp.jsonDecode(t41.universe_id)
	end

	if t41.universeId ~= nil then
		v363.universe_id = prop_types.StringProp.jsonDecode(t41.universeId)
	end

	return v363
end

t38.descriptor = {
	name = "OpenJoinFriendsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenJoinFriendsAction_Params = t38
typeRegistry.default:register(t1.OpenJoinFriendsAction_Params)

local t42 = {}

t42.__index = t42

function t42.new(t43: {[any]: any}?) -- line: 3931
	-- upvalues: t1 (copy), t42 (copy)
	return (setmetatable({
		action_type = if t43 ~= nil and t43.action_type ~= nil then t43.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t43 ~= nil and t43.action_params ~= nil then t43.action_params else nil
	}, t42))
end
function t42.encode(p31) -- line: 3942
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n21 = 0

	if p31.action_type ~= nil and (p31.action_type ~= nil and p31.action_type ~= 0 or p31.action_type ~= t1.ActionType.fromNumber(0)) then
		local v368, v369 = proto.writeTag(buf, n21, 1, proto.wireTypes.varint)

		buf, n21 = proto.writeVarInt(v368, v369, t1.ActionType.toNumber(p31.action_type))
	end

	if p31.action_params ~= nil then
		local v370 = p31.action_params:encode()
		local v371, v372 = proto.writeTag(buf, n21, 2, proto.wireTypes.lengthDelimited)

		buf, n21 = proto.writeBuffer(v371, v372, v370, buffer.len(v370))
	end

	local buf12 = buffer.create(n21)

	buffer.copy(buf12, 0, buf, 0, n21)

	return buf12
end
function t42.decode(p32: buffer) -- line: 3968
	-- upvalues: t42 (copy), proto (copy), t1 (copy)
	local v375 = t42.new()
	local n22 = 0

	while n22 < buffer.len(p32) do
		local v377, v378

		v377, v378, n22 = proto.readTag(p32, n22)

		if v378 == proto.wireTypes.varint then
			if v377 == 1 then
				local v379

				v379, n22 = proto.readVarIntI32(p32, n22)
				v375.action_type = t1.ActionType.fromNumber(v379) or v379
			else
				local v380

				v380, n22 = proto.readVarInt(p32, n22)
			end
		elseif v378 == proto.wireTypes.lengthDelimited then
			if v377 == 2 then
				local v381

				v381, n22 = proto.readBuffer(p32, n22)
				v375.action_params = t1.OpenMarketplaceTryOnAction_Params.decode(v381)
			else
				local v382, v383 = proto.readVarInt(p32, n22)

				n22 = v383 + v382
			end
		elseif v378 == proto.wireTypes.i32 then
			local v384

			v384, n22 = proto.readFixed32(p32, n22)
		elseif v378 == proto.wireTypes.i64 then
			local v385

			v385, n22 = proto.readFixed64(p32, n22)
		else
			error("Unsupported wire type: " .. v378)
		end
	end

	return v375
end
function t42.jsonEncode(p33) -- line: 4016
	-- upvalues: t1 (copy)
	local t44 = {}

	if p33.action_type ~= nil and (p33.action_type ~= nil and p33.action_type ~= 0 or p33.action_type ~= t1.ActionType.fromNumber(0)) then
		t44.actionType = if typeof(p33.action_type) ~= "number" then t1.ActionType.toNumber(p33.action_type) else p33.action_type
	end

	if p33.action_params ~= nil then
		t44.actionParams = p33.action_params:jsonEncode()
	end

	return t44
end
function t42.jsonDecode(t45: {[any]: any}) -- line: 4038
	-- upvalues: t42 (copy), t1 (copy)
	local v389 = t42.new()

	if t45.action_type ~= nil then
		v389.action_type = if typeof(t45.action_type) ~= "number" then t1.ActionType.fromName(t45.action_type) or t45.action_type else t1.ActionType.fromNumber(t45.action_type) or t45.action_type
	end

	if t45.actionType ~= nil then
		v389.action_type = if typeof(t45.actionType) ~= "number" then t1.ActionType.fromName(t45.actionType) or t45.actionType else t1.ActionType.fromNumber(t45.actionType) or t45.actionType
	end

	if t45.action_params ~= nil then
		v389.action_params = t1.OpenMarketplaceTryOnAction_Params.jsonDecode(t45.action_params)
	end

	if t45.actionParams ~= nil then
		v389.action_params = t1.OpenMarketplaceTryOnAction_Params.jsonDecode(t45.actionParams)
	end

	return v389
end

t42.descriptor = {
	name = "OpenMarketplaceTryOnAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
}
t1.OpenMarketplaceTryOnAction = t42
typeRegistry.default:register(t1.OpenMarketplaceTryOnAction)

local t46 = {}

t46.__index = t46

function t46.new(t47: {[any]: any}?) -- line: 4078
	-- upvalues: t46 (copy)
	return (setmetatable({
		item_id = if t47 ~= nil and t47.item_id ~= nil then t47.item_id else nil,
		item_type = if t47 ~= nil and t47.item_type ~= nil then t47.item_type else nil,
		item_sub_type_name = if t47 ~= nil and t47.item_sub_type_name ~= nil then t47.item_sub_type_name else nil
	}, t46))
end
function t46.encode(p34) -- line: 4088
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n23 = 0

	if p34.item_id ~= nil then
		local v394 = p34.item_id:encode()
		local v395, v396 = proto.writeTag(buf, n23, 1, proto.wireTypes.lengthDelimited)

		buf, n23 = proto.writeBuffer(v395, v396, v394, buffer.len(v394))
	end

	if p34.item_type ~= nil then
		local v397 = p34.item_type:encode()
		local v398, v399 = proto.writeTag(buf, n23, 2, proto.wireTypes.lengthDelimited)

		buf, n23 = proto.writeBuffer(v398, v399, v397, buffer.len(v397))
	end

	if p34.item_sub_type_name ~= nil then
		local v400 = p34.item_sub_type_name:encode()
		local v401, v402 = proto.writeTag(buf, n23, 3, proto.wireTypes.lengthDelimited)

		buf, n23 = proto.writeBuffer(v401, v402, v400, buffer.len(v400))
	end

	local buf13 = buffer.create(n23)

	buffer.copy(buf13, 0, buf, 0, n23)

	return buf13
end
function t46.decode(p35: buffer) -- line: 4115
	-- upvalues: t46 (copy), proto (copy), prop_types (copy)
	local v405 = t46.new()
	local n24 = 0

	while n24 < buffer.len(p35) do
		local v407, v408

		v407, v408, n24 = proto.readTag(p35, n24)

		if v408 == proto.wireTypes.varint then
			local v409

			v409, n24 = proto.readVarInt(p35, n24)
		elseif v408 == proto.wireTypes.lengthDelimited then
			if v407 == 1 then
				local v410

				v410, n24 = proto.readBuffer(p35, n24)
				v405.item_id = prop_types.StringProp.decode(v410)
			elseif v407 == 2 then
				local v411

				v411, n24 = proto.readBuffer(p35, n24)
				v405.item_type = prop_types.StringProp.decode(v411)
			elseif v407 == 3 then
				local v412

				v412, n24 = proto.readBuffer(p35, n24)
				v405.item_sub_type_name = prop_types.StringProp.decode(v412)
			else
				local v413, v414 = proto.readVarInt(p35, n24)

				n24 = v414 + v413
			end
		elseif v408 == proto.wireTypes.i32 then
			local v415

			v415, n24 = proto.readFixed32(p35, n24)
		elseif v408 == proto.wireTypes.i64 then
			local v416

			v416, n24 = proto.readFixed64(p35, n24)
		else
			error("Unsupported wire type: " .. v408)
		end
	end

	return v405
end
function t46.jsonEncode(p36) -- line: 4168
	local t48 = {}

	if p36.item_id ~= nil then
		t48.itemId = p36.item_id:jsonEncode()
	end

	if p36.item_type ~= nil then
		t48.itemType = p36.item_type:jsonEncode()
	end

	if p36.item_sub_type_name ~= nil then
		t48.itemSubTypeName = p36.item_sub_type_name:jsonEncode()
	end

	return t48
end
function t46.jsonDecode(t49: {[any]: any}) -- line: 4186
	-- upvalues: t46 (copy), prop_types (copy)
	local v420 = t46.new()

	if t49.item_id ~= nil then
		v420.item_id = prop_types.StringProp.jsonDecode(t49.item_id)
	end

	if t49.itemId ~= nil then
		v420.item_id = prop_types.StringProp.jsonDecode(t49.itemId)
	end

	if t49.item_type ~= nil then
		v420.item_type = prop_types.StringProp.jsonDecode(t49.item_type)
	end

	if t49.itemType ~= nil then
		v420.item_type = prop_types.StringProp.jsonDecode(t49.itemType)
	end

	if t49.item_sub_type_name ~= nil then
		v420.item_sub_type_name = prop_types.StringProp.jsonDecode(t49.item_sub_type_name)
	end

	if t49.itemSubTypeName ~= nil then
		v420.item_sub_type_name = prop_types.StringProp.jsonDecode(t49.itemSubTypeName)
	end

	return v420
end

t46.descriptor = {
	name = "OpenMarketplaceTryOnAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenMarketplaceTryOnAction_Params = t46
typeRegistry.default:register(t1.OpenMarketplaceTryOnAction_Params)

local t50 = {}

t50.__index = t50

function t50.new(t51: {[any]: any}?) -- line: 4234
	-- upvalues: t1 (copy), t50 (copy)
	return (setmetatable({
		action_type = if t51 ~= nil and t51.action_type ~= nil then t51.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t51 ~= nil and t51.action_params ~= nil then t51.action_params else nil
	}, t50))
end
function t50.encode(p37) -- line: 4243
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n25 = 0

	if p37.action_type ~= nil and (p37.action_type ~= nil and p37.action_type ~= 0 or p37.action_type ~= t1.ActionType.fromNumber(0)) then
		local v425, v426 = proto.writeTag(buf, n25, 1, proto.wireTypes.varint)

		buf, n25 = proto.writeVarInt(v425, v426, t1.ActionType.toNumber(p37.action_type))
	end

	if p37.action_params ~= nil then
		local v427 = p37.action_params:encode()
		local v428, v429 = proto.writeTag(buf, n25, 2, proto.wireTypes.lengthDelimited)

		buf, n25 = proto.writeBuffer(v428, v429, v427, buffer.len(v427))
	end

	local buf14 = buffer.create(n25)

	buffer.copy(buf14, 0, buf, 0, n25)

	return buf14
end
function t50.decode(p38: buffer) -- line: 4269
	-- upvalues: t50 (copy), proto (copy), t1 (copy)
	local v432 = t50.new()
	local n26 = 0

	while n26 < buffer.len(p38) do
		local v434, v435

		v434, v435, n26 = proto.readTag(p38, n26)

		if v435 == proto.wireTypes.varint then
			if v434 == 1 then
				local v436

				v436, n26 = proto.readVarIntI32(p38, n26)
				v432.action_type = t1.ActionType.fromNumber(v436) or v436
			else
				local v437

				v437, n26 = proto.readVarInt(p38, n26)
			end
		elseif v435 == proto.wireTypes.lengthDelimited then
			if v434 == 2 then
				local v438

				v438, n26 = proto.readBuffer(p38, n26)
				v432.action_params = t1.OpenSeeAllAction_Params.decode(v438)
			else
				local v439, v440 = proto.readVarInt(p38, n26)

				n26 = v440 + v439
			end
		elseif v435 == proto.wireTypes.i32 then
			local v441

			v441, n26 = proto.readFixed32(p38, n26)
		elseif v435 == proto.wireTypes.i64 then
			local v442

			v442, n26 = proto.readFixed64(p38, n26)
		else
			error("Unsupported wire type: " .. v435)
		end
	end

	return v432
end
function t50.jsonEncode(p39) -- line: 4317
	-- upvalues: t1 (copy)
	local t52 = {}

	if p39.action_type ~= nil and (p39.action_type ~= nil and p39.action_type ~= 0 or p39.action_type ~= t1.ActionType.fromNumber(0)) then
		t52.actionType = if typeof(p39.action_type) ~= "number" then t1.ActionType.toNumber(p39.action_type) else p39.action_type
	end

	if p39.action_params ~= nil then
		t52.actionParams = p39.action_params:jsonEncode()
	end

	return t52
end
function t50.jsonDecode(t53: {[any]: any}) -- line: 4339
	-- upvalues: t50 (copy), t1 (copy)
	local v446 = t50.new()

	if t53.action_type ~= nil then
		v446.action_type = if typeof(t53.action_type) ~= "number" then t1.ActionType.fromName(t53.action_type) or t53.action_type else t1.ActionType.fromNumber(t53.action_type) or t53.action_type
	end

	if t53.actionType ~= nil then
		v446.action_type = if typeof(t53.actionType) ~= "number" then t1.ActionType.fromName(t53.actionType) or t53.actionType else t1.ActionType.fromNumber(t53.actionType) or t53.actionType
	end

	if t53.action_params ~= nil then
		v446.action_params = t1.OpenSeeAllAction_Params.jsonDecode(t53.action_params)
	end

	if t53.actionParams ~= nil then
		v446.action_params = t1.OpenSeeAllAction_Params.jsonDecode(t53.actionParams)
	end

	return v446
end

t50.descriptor = {
	name = "OpenSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
}
t1.OpenSeeAllAction = t50
typeRegistry.default:register(t1.OpenSeeAllAction)

local t54 = {}

t54.__index = t54

function t54.new(t55: {[any]: any}?) -- line: 4379
	-- upvalues: t54 (copy)
	return (setmetatable({
		collection_id = if t55 ~= nil and t55.collection_id ~= nil then t55.collection_id else nil,
		game_set_target_id = if t55 ~= nil and t55.game_set_target_id ~= nil then t55.game_set_target_id else nil,
		collection_position = if t55 ~= nil and t55.collection_position ~= nil then t55.collection_position else nil
	}, t54))
end
function t54.encode(p40) -- line: 4389
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n27 = 0

	if p40.collection_id ~= nil then
		local v451 = p40.collection_id:encode()
		local v452, v453 = proto.writeTag(buf, n27, 1, proto.wireTypes.lengthDelimited)

		buf, n27 = proto.writeBuffer(v452, v453, v451, buffer.len(v451))
	end

	if p40.game_set_target_id ~= nil then
		local v454 = p40.game_set_target_id:encode()
		local v455, v456 = proto.writeTag(buf, n27, 2, proto.wireTypes.lengthDelimited)

		buf, n27 = proto.writeBuffer(v455, v456, v454, buffer.len(v454))
	end

	if p40.collection_position ~= nil then
		local v457 = p40.collection_position:encode()
		local v458, v459 = proto.writeTag(buf, n27, 3, proto.wireTypes.lengthDelimited)

		buf, n27 = proto.writeBuffer(v458, v459, v457, buffer.len(v457))
	end

	local buf15 = buffer.create(n27)

	buffer.copy(buf15, 0, buf, 0, n27)

	return buf15
end
function t54.decode(p41: buffer) -- line: 4416
	-- upvalues: t54 (copy), proto (copy), prop_types (copy)
	local v462 = t54.new()
	local n28 = 0

	while n28 < buffer.len(p41) do
		local v464, v465

		v464, v465, n28 = proto.readTag(p41, n28)

		if v465 == proto.wireTypes.varint then
			local v466

			v466, n28 = proto.readVarInt(p41, n28)
		elseif v465 == proto.wireTypes.lengthDelimited then
			if v464 == 1 then
				local v467

				v467, n28 = proto.readBuffer(p41, n28)
				v462.collection_id = prop_types.StringProp.decode(v467)
			elseif v464 == 2 then
				local v468

				v468, n28 = proto.readBuffer(p41, n28)
				v462.game_set_target_id = prop_types.StringProp.decode(v468)
			elseif v464 == 3 then
				local v469

				v469, n28 = proto.readBuffer(p41, n28)
				v462.collection_position = prop_types.StringProp.decode(v469)
			else
				local v470, v471 = proto.readVarInt(p41, n28)

				n28 = v471 + v470
			end
		elseif v465 == proto.wireTypes.i32 then
			local v472

			v472, n28 = proto.readFixed32(p41, n28)
		elseif v465 == proto.wireTypes.i64 then
			local v473

			v473, n28 = proto.readFixed64(p41, n28)
		else
			error("Unsupported wire type: " .. v465)
		end
	end

	return v462
end
function t54.jsonEncode(p42) -- line: 4470
	local t56 = {}

	if p42.collection_id ~= nil then
		t56.collectionId = p42.collection_id:jsonEncode()
	end

	if p42.game_set_target_id ~= nil then
		t56.gameSetTargetId = p42.game_set_target_id:jsonEncode()
	end

	if p42.collection_position ~= nil then
		t56.collectionPosition = p42.collection_position:jsonEncode()
	end

	return t56
end
function t54.jsonDecode(t57: {[any]: any}) -- line: 4488
	-- upvalues: t54 (copy), prop_types (copy)
	local v477 = t54.new()

	if t57.collection_id ~= nil then
		v477.collection_id = prop_types.StringProp.jsonDecode(t57.collection_id)
	end

	if t57.collectionId ~= nil then
		v477.collection_id = prop_types.StringProp.jsonDecode(t57.collectionId)
	end

	if t57.game_set_target_id ~= nil then
		v477.game_set_target_id = prop_types.StringProp.jsonDecode(t57.game_set_target_id)
	end

	if t57.gameSetTargetId ~= nil then
		v477.game_set_target_id = prop_types.StringProp.jsonDecode(t57.gameSetTargetId)
	end

	if t57.collection_position ~= nil then
		v477.collection_position = prop_types.StringProp.jsonDecode(t57.collection_position)
	end

	if t57.collectionPosition ~= nil then
		v477.collection_position = prop_types.StringProp.jsonDecode(t57.collectionPosition)
	end

	return v477
end

t54.descriptor = {
	name = "OpenSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenSeeAllAction_Params = t54
typeRegistry.default:register(t1.OpenSeeAllAction_Params)

local t58 = {}

t58.__index = t58

function t58.new(t59: {[any]: any}?) -- line: 4538
	-- upvalues: t1 (copy), t58 (copy)
	return (setmetatable({
		action_type = if t59 ~= nil and t59.action_type ~= nil then t59.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t59 ~= nil and t59.action_params ~= nil then t59.action_params else nil
	}, t58))
end
function t58.encode(p43) -- line: 4549
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n29 = 0

	if p43.action_type ~= nil and (p43.action_type ~= nil and p43.action_type ~= 0 or p43.action_type ~= t1.ActionType.fromNumber(0)) then
		local v482, v483 = proto.writeTag(buf, n29, 1, proto.wireTypes.varint)

		buf, n29 = proto.writeVarInt(v482, v483, t1.ActionType.toNumber(p43.action_type))
	end

	if p43.action_params ~= nil then
		local v484 = p43.action_params:encode()
		local v485, v486 = proto.writeTag(buf, n29, 2, proto.wireTypes.lengthDelimited)

		buf, n29 = proto.writeBuffer(v485, v486, v484, buffer.len(v484))
	end

	local buf16 = buffer.create(n29)

	buffer.copy(buf16, 0, buf, 0, n29)

	return buf16
end
function t58.decode(p44: buffer) -- line: 4575
	-- upvalues: t58 (copy), proto (copy), t1 (copy)
	local v489 = t58.new()
	local n30 = 0

	while n30 < buffer.len(p44) do
		local v491, v492

		v491, v492, n30 = proto.readTag(p44, n30)

		if v492 == proto.wireTypes.varint then
			if v491 == 1 then
				local v493

				v493, n30 = proto.readVarIntI32(p44, n30)
				v489.action_type = t1.ActionType.fromNumber(v493) or v493
			else
				local v494

				v494, n30 = proto.readVarInt(p44, n30)
			end
		elseif v492 == proto.wireTypes.lengthDelimited then
			if v491 == 2 then
				local v495

				v495, n30 = proto.readBuffer(p44, n30)
				v489.action_params = t1.OpenSponsoredTooltipAction_Params.decode(v495)
			else
				local v496, v497 = proto.readVarInt(p44, n30)

				n30 = v497 + v496
			end
		elseif v492 == proto.wireTypes.i32 then
			local v498

			v498, n30 = proto.readFixed32(p44, n30)
		elseif v492 == proto.wireTypes.i64 then
			local v499

			v499, n30 = proto.readFixed64(p44, n30)
		else
			error("Unsupported wire type: " .. v492)
		end
	end

	return v489
end
function t58.jsonEncode(p45) -- line: 4623
	-- upvalues: t1 (copy)
	local t60 = {}

	if p45.action_type ~= nil and (p45.action_type ~= nil and p45.action_type ~= 0 or p45.action_type ~= t1.ActionType.fromNumber(0)) then
		t60.actionType = if typeof(p45.action_type) ~= "number" then t1.ActionType.toNumber(p45.action_type) else p45.action_type
	end

	if p45.action_params ~= nil then
		t60.actionParams = p45.action_params:jsonEncode()
	end

	return t60
end
function t58.jsonDecode(t61: {[any]: any}) -- line: 4645
	-- upvalues: t58 (copy), t1 (copy)
	local v503 = t58.new()

	if t61.action_type ~= nil then
		v503.action_type = if typeof(t61.action_type) ~= "number" then t1.ActionType.fromName(t61.action_type) or t61.action_type else t1.ActionType.fromNumber(t61.action_type) or t61.action_type
	end

	if t61.actionType ~= nil then
		v503.action_type = if typeof(t61.actionType) ~= "number" then t1.ActionType.fromName(t61.actionType) or t61.actionType else t1.ActionType.fromNumber(t61.actionType) or t61.actionType
	end

	if t61.action_params ~= nil then
		v503.action_params = t1.OpenSponsoredTooltipAction_Params.jsonDecode(t61.action_params)
	end

	if t61.actionParams ~= nil then
		v503.action_params = t1.OpenSponsoredTooltipAction_Params.jsonDecode(t61.actionParams)
	end

	return v503
end

t58.descriptor = {
	name = "OpenSponsoredTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
}
t1.OpenSponsoredTooltipAction = t58
typeRegistry.default:register(t1.OpenSponsoredTooltipAction)

local t62 = {}

t62.__index = t62

function t62.new(_: {[any]: any}?) -- line: 4685
	-- upvalues: t62 (copy)
	return (setmetatable({}, t62))
end
function t62.encode(_) -- line: 4691
	local buf = buffer.create(0)
	local buf17 = buffer.create(0)

	buffer.copy(buf17, 0, buf, 0, 0)

	return buf17
end
function t62.decode(p47: buffer) -- line: 4700
	-- upvalues: t62 (copy), proto (copy)
	local v509 = t62.new()
	local n31 = 0

	while n31 < buffer.len(p47) do
		local v511, v512

		v511, v512, n31 = proto.readTag(p47, n31)

		if v512 == proto.wireTypes.varint then
			local v513

			v513, n31 = proto.readVarInt(p47, n31)
		elseif v512 == proto.wireTypes.lengthDelimited then
			local v514, v515 = proto.readVarInt(p47, n31)

			n31 = v515 + v514
		elseif v512 == proto.wireTypes.i32 then
			local v516

			v516, n31 = proto.readFixed32(p47, n31)
		elseif v512 == proto.wireTypes.i64 then
			local v517

			v517, n31 = proto.readFixed64(p47, n31)
		else
			error("Unsupported wire type: " .. v512)
		end
	end

	return v509
end
function t62.jsonEncode(_) -- line: 4738
	return {}
end
function t62.jsonDecode(_: {[any]: any}) -- line: 4744
	-- upvalues: t62 (copy)
	return (t62.new())
end

t62.descriptor = {
	name = "OpenSponsoredTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenSponsoredTooltipAction_Params = t62
typeRegistry.default:register(t1.OpenSponsoredTooltipAction_Params)

local t65 = {}

t65.__index = t65

function t65.new(t66: {[any]: any}?) -- line: 4766
	-- upvalues: t1 (copy), t65 (copy)
	return (setmetatable({
		action_type = if t66 ~= nil and t66.action_type ~= nil then t66.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t66 ~= nil and t66.action_params ~= nil then t66.action_params else nil
	}, t65))
end
function t65.encode(p49) -- line: 4775
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n32 = 0

	if p49.action_type ~= nil and (p49.action_type ~= nil and p49.action_type ~= 0 or p49.action_type ~= t1.ActionType.fromNumber(0)) then
		local v524, v525 = proto.writeTag(buf, n32, 1, proto.wireTypes.varint)

		buf, n32 = proto.writeVarInt(v524, v525, t1.ActionType.toNumber(p49.action_type))
	end

	if p49.action_params ~= nil then
		local v526 = p49.action_params:encode()
		local v527, v528 = proto.writeTag(buf, n32, 2, proto.wireTypes.lengthDelimited)

		buf, n32 = proto.writeBuffer(v527, v528, v526, buffer.len(v526))
	end

	local buf18 = buffer.create(n32)

	buffer.copy(buf18, 0, buf, 0, n32)

	return buf18
end
function t65.decode(p50: buffer) -- line: 4801
	-- upvalues: t65 (copy), proto (copy), t1 (copy)
	local v531 = t65.new()
	local n33 = 0

	while n33 < buffer.len(p50) do
		local v533, v534

		v533, v534, n33 = proto.readTag(p50, n33)

		if v534 == proto.wireTypes.varint then
			if v533 == 1 then
				local v535

				v535, n33 = proto.readVarIntI32(p50, n33)
				v531.action_type = t1.ActionType.fromNumber(v535) or v535
			else
				local v536

				v536, n33 = proto.readVarInt(p50, n33)
			end
		elseif v534 == proto.wireTypes.lengthDelimited then
			if v533 == 2 then
				local v537

				v537, n33 = proto.readBuffer(p50, n33)
				v531.action_params = t1.PlayButtonClickAction_Params.decode(v537)
			else
				local v538, v539 = proto.readVarInt(p50, n33)

				n33 = v539 + v538
			end
		elseif v534 == proto.wireTypes.i32 then
			local v540

			v540, n33 = proto.readFixed32(p50, n33)
		elseif v534 == proto.wireTypes.i64 then
			local v541

			v541, n33 = proto.readFixed64(p50, n33)
		else
			error("Unsupported wire type: " .. v534)
		end
	end

	return v531
end
function t65.jsonEncode(p51) -- line: 4849
	-- upvalues: t1 (copy)
	local t67 = {}

	if p51.action_type ~= nil and (p51.action_type ~= nil and p51.action_type ~= 0 or p51.action_type ~= t1.ActionType.fromNumber(0)) then
		t67.actionType = if typeof(p51.action_type) ~= "number" then t1.ActionType.toNumber(p51.action_type) else p51.action_type
	end

	if p51.action_params ~= nil then
		t67.actionParams = p51.action_params:jsonEncode()
	end

	return t67
end
function t65.jsonDecode(t68: {[any]: any}) -- line: 4871
	-- upvalues: t65 (copy), t1 (copy)
	local v545 = t65.new()

	if t68.action_type ~= nil then
		v545.action_type = if typeof(t68.action_type) ~= "number" then t1.ActionType.fromName(t68.action_type) or t68.action_type else t1.ActionType.fromNumber(t68.action_type) or t68.action_type
	end

	if t68.actionType ~= nil then
		v545.action_type = if typeof(t68.actionType) ~= "number" then t1.ActionType.fromName(t68.actionType) or t68.actionType else t1.ActionType.fromNumber(t68.actionType) or t68.actionType
	end

	if t68.action_params ~= nil then
		v545.action_params = t1.PlayButtonClickAction_Params.jsonDecode(t68.action_params)
	end

	if t68.actionParams ~= nil then
		v545.action_params = t1.PlayButtonClickAction_Params.jsonDecode(t68.actionParams)
	end

	return v545
end

t65.descriptor = {
	name = "PlayButtonClickAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
}
t1.PlayButtonClickAction = t65
typeRegistry.default:register(t1.PlayButtonClickAction)

local t69 = {}

t69.__index = t69

function t69.new(_: {[any]: any}?) -- line: 4911
	-- upvalues: t69 (copy)
	return (setmetatable({}, t69))
end
function t69.encode(_) -- line: 4917
	local buf = buffer.create(0)
	local buf19 = buffer.create(0)

	buffer.copy(buf19, 0, buf, 0, 0)

	return buf19
end
function t69.decode(p53: buffer) -- line: 4926
	-- upvalues: t69 (copy), proto (copy)
	local v551 = t69.new()
	local n34 = 0

	while n34 < buffer.len(p53) do
		local v553, v554

		v553, v554, n34 = proto.readTag(p53, n34)

		if v554 == proto.wireTypes.varint then
			local v555

			v555, n34 = proto.readVarInt(p53, n34)
		elseif v554 == proto.wireTypes.lengthDelimited then
			local v556, v557 = proto.readVarInt(p53, n34)

			n34 = v557 + v556
		elseif v554 == proto.wireTypes.i32 then
			local v558

			v558, n34 = proto.readFixed32(p53, n34)
		elseif v554 == proto.wireTypes.i64 then
			local v559

			v559, n34 = proto.readFixed64(p53, n34)
		else
			error("Unsupported wire type: " .. v554)
		end
	end

	return v551
end
function t69.jsonEncode(_) -- line: 4964
	return {}
end
function t69.jsonDecode(_: {[any]: any}) -- line: 4970
	-- upvalues: t69 (copy)
	return (t69.new())
end

t69.descriptor = {
	name = "PlayButtonClickAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.PlayButtonClickAction_Params = t69
typeRegistry.default:register(t1.PlayButtonClickAction_Params)

local t72 = {}

t72.__index = t72

function t72.new(t73: {[any]: any}?) -- line: 4990
	-- upvalues: t1 (copy), t72 (copy)
	return (setmetatable({
		action_type = if t73 ~= nil and t73.action_type ~= nil then t73.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t73 ~= nil and t73.action_params ~= nil then t73.action_params else nil
	}, t72))
end
function t72.encode(p55) -- line: 4999
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n35 = 0

	if p55.action_type ~= nil and (p55.action_type ~= nil and p55.action_type ~= 0 or p55.action_type ~= t1.ActionType.fromNumber(0)) then
		local v566, v567 = proto.writeTag(buf, n35, 1, proto.wireTypes.varint)

		buf, n35 = proto.writeVarInt(v566, v567, t1.ActionType.toNumber(p55.action_type))
	end

	if p55.action_params ~= nil then
		local v568 = p55.action_params:encode()
		local v569, v570 = proto.writeTag(buf, n35, 2, proto.wireTypes.lengthDelimited)

		buf, n35 = proto.writeBuffer(v569, v570, v568, buffer.len(v568))
	end

	local buf20 = buffer.create(n35)

	buffer.copy(buf20, 0, buf, 0, n35)

	return buf20
end
function t72.decode(p56: buffer) -- line: 5025
	-- upvalues: t72 (copy), proto (copy), t1 (copy)
	local v573 = t72.new()
	local n36 = 0

	while n36 < buffer.len(p56) do
		local v575, v576

		v575, v576, n36 = proto.readTag(p56, n36)

		if v576 == proto.wireTypes.varint then
			if v575 == 1 then
				local v577

				v577, n36 = proto.readVarIntI32(p56, n36)
				v573.action_type = t1.ActionType.fromNumber(v577) or v577
			else
				local v578

				v578, n36 = proto.readVarInt(p56, n36)
			end
		elseif v576 == proto.wireTypes.lengthDelimited then
			if v575 == 2 then
				local v579

				v579, n36 = proto.readBuffer(p56, n36)
				v573.action_params = t1.UpdateUserSettingsAction_Params.decode(v579)
			else
				local v580, v581 = proto.readVarInt(p56, n36)

				n36 = v581 + v580
			end
		elseif v576 == proto.wireTypes.i32 then
			local v582

			v582, n36 = proto.readFixed32(p56, n36)
		elseif v576 == proto.wireTypes.i64 then
			local v583

			v583, n36 = proto.readFixed64(p56, n36)
		else
			error("Unsupported wire type: " .. v576)
		end
	end

	return v573
end
function t72.jsonEncode(p57) -- line: 5073
	-- upvalues: t1 (copy)
	local t74 = {}

	if p57.action_type ~= nil and (p57.action_type ~= nil and p57.action_type ~= 0 or p57.action_type ~= t1.ActionType.fromNumber(0)) then
		t74.actionType = if typeof(p57.action_type) ~= "number" then t1.ActionType.toNumber(p57.action_type) else p57.action_type
	end

	if p57.action_params ~= nil then
		t74.actionParams = p57.action_params:jsonEncode()
	end

	return t74
end
function t72.jsonDecode(t75: {[any]: any}) -- line: 5095
	-- upvalues: t72 (copy), t1 (copy)
	local v587 = t72.new()

	if t75.action_type ~= nil then
		v587.action_type = if typeof(t75.action_type) ~= "number" then t1.ActionType.fromName(t75.action_type) or t75.action_type else t1.ActionType.fromNumber(t75.action_type) or t75.action_type
	end

	if t75.actionType ~= nil then
		v587.action_type = if typeof(t75.actionType) ~= "number" then t1.ActionType.fromName(t75.actionType) or t75.actionType else t1.ActionType.fromNumber(t75.actionType) or t75.actionType
	end

	if t75.action_params ~= nil then
		v587.action_params = t1.UpdateUserSettingsAction_Params.jsonDecode(t75.action_params)
	end

	if t75.actionParams ~= nil then
		v587.action_params = t1.UpdateUserSettingsAction_Params.jsonDecode(t75.actionParams)
	end

	return v587
end

t72.descriptor = {
	name = "UpdateUserSettingsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
}
t1.UpdateUserSettingsAction = t72
typeRegistry.default:register(t1.UpdateUserSettingsAction)

local t76 = {}

t76.__index = t76

function t76.new(t77: {[any]: any}?) -- line: 5135
	-- upvalues: t76 (copy)
	return (setmetatable({
		settings = if t77 ~= nil and t77.settings ~= nil then t77.settings else nil,
		audit_data = if t77 ~= nil and t77.audit_data ~= nil then t77.audit_data else nil
	}, t76))
end
function t76.encode(p58) -- line: 5144
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n37 = 0

	if p58.settings ~= nil then
		local v592 = p58.settings:encode()
		local v593, v594 = proto.writeTag(buf, n37, 1, proto.wireTypes.lengthDelimited)

		buf, n37 = proto.writeBuffer(v593, v594, v592, buffer.len(v592))
	end

	if p58.audit_data ~= nil then
		local v595 = p58.audit_data:encode()
		local v596, v597 = proto.writeTag(buf, n37, 2, proto.wireTypes.lengthDelimited)

		buf, n37 = proto.writeBuffer(v596, v597, v595, buffer.len(v595))
	end

	local buf21 = buffer.create(n37)

	buffer.copy(buf21, 0, buf, 0, n37)

	return buf21
end
function t76.decode(p59: buffer) -- line: 5165
	-- upvalues: t76 (copy), proto (copy), prop_types (copy)
	local v600 = t76.new()
	local n38 = 0

	while n38 < buffer.len(p59) do
		local v602, v603

		v602, v603, n38 = proto.readTag(p59, n38)

		if v603 == proto.wireTypes.varint then
			local v604

			v604, n38 = proto.readVarInt(p59, n38)
		elseif v603 == proto.wireTypes.lengthDelimited then
			if v602 == 1 then
				local v605

				v605, n38 = proto.readBuffer(p59, n38)
				v600.settings = prop_types.StructProp.decode(v605)
			elseif v602 == 2 then
				local v606

				v606, n38 = proto.readBuffer(p59, n38)
				v600.audit_data = prop_types.StringProp.decode(v606)
			else
				local v607, v608 = proto.readVarInt(p59, n38)

				n38 = v608 + v607
			end
		elseif v603 == proto.wireTypes.i32 then
			local v609

			v609, n38 = proto.readFixed32(p59, n38)
		elseif v603 == proto.wireTypes.i64 then
			local v610

			v610, n38 = proto.readFixed64(p59, n38)
		else
			error("Unsupported wire type: " .. v603)
		end
	end

	return v600
end
function t76.jsonEncode(p60) -- line: 5213
	local t78 = {}

	if p60.settings ~= nil then
		t78.settings = p60.settings:jsonEncode()
	end

	if p60.audit_data ~= nil then
		t78.auditData = p60.audit_data:jsonEncode()
	end

	return t78
end
function t76.jsonDecode(t79: {[any]: any}) -- line: 5227
	-- upvalues: t76 (copy), prop_types (copy)
	local v614 = t76.new()

	if t79.settings ~= nil then
		v614.settings = prop_types.StructProp.jsonDecode(t79.settings)
	end

	if t79.audit_data ~= nil then
		v614.audit_data = prop_types.StringProp.jsonDecode(t79.audit_data)
	end

	if t79.auditData ~= nil then
		v614.audit_data = prop_types.StringProp.jsonDecode(t79.auditData)
	end

	return v614
end

t76.descriptor = {
	name = "UpdateUserSettingsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.UpdateUserSettingsAction_Params = t76
typeRegistry.default:register(t1.UpdateUserSettingsAction_Params)

local t80 = {}

t80.__index = t80

function t80.new(t81: {[any]: any}?) -- line: 5259
	-- upvalues: t1 (copy), t80 (copy)
	return (setmetatable({
		action_type = if t81 ~= nil and t81.action_type ~= nil then t81.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t81 ~= nil and t81.action_params ~= nil then t81.action_params else nil
	}, t80))
end
function t80.encode(p61) -- line: 5268
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n39 = 0

	if p61.action_type ~= nil and (p61.action_type ~= nil and p61.action_type ~= 0 or p61.action_type ~= t1.ActionType.fromNumber(0)) then
		local v619, v620 = proto.writeTag(buf, n39, 1, proto.wireTypes.varint)

		buf, n39 = proto.writeVarInt(v619, v620, t1.ActionType.toNumber(p61.action_type))
	end

	if p61.action_params ~= nil then
		local v621 = p61.action_params:encode()
		local v622, v623 = proto.writeTag(buf, n39, 2, proto.wireTypes.lengthDelimited)

		buf, n39 = proto.writeBuffer(v622, v623, v621, buffer.len(v621))
	end

	local buf22 = buffer.create(n39)

	buffer.copy(buf22, 0, buf, 0, n39)

	return buf22
end
function t80.decode(p62: buffer) -- line: 5294
	-- upvalues: t80 (copy), proto (copy), t1 (copy)
	local v626 = t80.new()
	local n40 = 0

	while n40 < buffer.len(p62) do
		local v628, v629

		v628, v629, n40 = proto.readTag(p62, n40)

		if v629 == proto.wireTypes.varint then
			if v628 == 1 then
				local v630

				v630, n40 = proto.readVarIntI32(p62, n40)
				v626.action_type = t1.ActionType.fromNumber(v630) or v630
			else
				local v631

				v631, n40 = proto.readVarInt(p62, n40)
			end
		elseif v629 == proto.wireTypes.lengthDelimited then
			if v628 == 2 then
				local v632

				v632, n40 = proto.readBuffer(p62, n40)
				v626.action_params = t1.OpenTooltipAction_Params.decode(v632)
			else
				local v633, v634 = proto.readVarInt(p62, n40)

				n40 = v634 + v633
			end
		elseif v629 == proto.wireTypes.i32 then
			local v635

			v635, n40 = proto.readFixed32(p62, n40)
		elseif v629 == proto.wireTypes.i64 then
			local v636

			v636, n40 = proto.readFixed64(p62, n40)
		else
			error("Unsupported wire type: " .. v629)
		end
	end

	return v626
end
function t80.jsonEncode(p63) -- line: 5342
	-- upvalues: t1 (copy)
	local t82 = {}

	if p63.action_type ~= nil and (p63.action_type ~= nil and p63.action_type ~= 0 or p63.action_type ~= t1.ActionType.fromNumber(0)) then
		t82.actionType = if typeof(p63.action_type) ~= "number" then t1.ActionType.toNumber(p63.action_type) else p63.action_type
	end

	if p63.action_params ~= nil then
		t82.actionParams = p63.action_params:jsonEncode()
	end

	return t82
end
function t80.jsonDecode(t83: {[any]: any}) -- line: 5364
	-- upvalues: t80 (copy), t1 (copy)
	local v640 = t80.new()

	if t83.action_type ~= nil then
		v640.action_type = if typeof(t83.action_type) ~= "number" then t1.ActionType.fromName(t83.action_type) or t83.action_type else t1.ActionType.fromNumber(t83.action_type) or t83.action_type
	end

	if t83.actionType ~= nil then
		v640.action_type = if typeof(t83.actionType) ~= "number" then t1.ActionType.fromName(t83.actionType) or t83.actionType else t1.ActionType.fromNumber(t83.actionType) or t83.actionType
	end

	if t83.action_params ~= nil then
		v640.action_params = t1.OpenTooltipAction_Params.jsonDecode(t83.action_params)
	end

	if t83.actionParams ~= nil then
		v640.action_params = t1.OpenTooltipAction_Params.jsonDecode(t83.actionParams)
	end

	return v640
end

t80.descriptor = {
	name = "OpenTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
}
t1.OpenTooltipAction = t80
typeRegistry.default:register(t1.OpenTooltipAction)

local t84 = {}

t84.__index = t84

function t84.new(t85: {[any]: any}?) -- line: 5404
	-- upvalues: t84 (copy)
	return (setmetatable({
		tooltip_title = if t85 ~= nil and t85.tooltip_title ~= nil then t85.tooltip_title else nil,
		tooltip_info_text = if t85 ~= nil and t85.tooltip_info_text ~= nil then t85.tooltip_info_text else nil
	}, t84))
end
function t84.encode(p64) -- line: 5411
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n41 = 0

	if p64.tooltip_title ~= nil then
		local v645 = p64.tooltip_title:encode()
		local v646, v647 = proto.writeTag(buf, n41, 1, proto.wireTypes.lengthDelimited)

		buf, n41 = proto.writeBuffer(v646, v647, v645, buffer.len(v645))
	end

	if p64.tooltip_info_text ~= nil then
		local v648 = p64.tooltip_info_text:encode()
		local v649, v650 = proto.writeTag(buf, n41, 2, proto.wireTypes.lengthDelimited)

		buf, n41 = proto.writeBuffer(v649, v650, v648, buffer.len(v648))
	end

	local buf23 = buffer.create(n41)

	buffer.copy(buf23, 0, buf, 0, n41)

	return buf23
end
function t84.decode(p65: buffer) -- line: 5432
	-- upvalues: t84 (copy), proto (copy), prop_types (copy)
	local v653 = t84.new()
	local n42 = 0

	while n42 < buffer.len(p65) do
		local v655, v656

		v655, v656, n42 = proto.readTag(p65, n42)

		if v656 == proto.wireTypes.varint then
			local v657

			v657, n42 = proto.readVarInt(p65, n42)
		elseif v656 == proto.wireTypes.lengthDelimited then
			if v655 == 1 then
				local v658

				v658, n42 = proto.readBuffer(p65, n42)
				v653.tooltip_title = prop_types.StringProp.decode(v658)
			elseif v655 == 2 then
				local v659

				v659, n42 = proto.readBuffer(p65, n42)
				v653.tooltip_info_text = prop_types.StringProp.decode(v659)
			else
				local v660, v661 = proto.readVarInt(p65, n42)

				n42 = v661 + v660
			end
		elseif v656 == proto.wireTypes.i32 then
			local v662

			v662, n42 = proto.readFixed32(p65, n42)
		elseif v656 == proto.wireTypes.i64 then
			local v663

			v663, n42 = proto.readFixed64(p65, n42)
		else
			error("Unsupported wire type: " .. v656)
		end
	end

	return v653
end
function t84.jsonEncode(p66) -- line: 5480
	local t86 = {}

	if p66.tooltip_title ~= nil then
		t86.tooltipTitle = p66.tooltip_title:jsonEncode()
	end

	if p66.tooltip_info_text ~= nil then
		t86.tooltipInfoText = p66.tooltip_info_text:jsonEncode()
	end

	return t86
end
function t84.jsonDecode(t87: {[any]: any}) -- line: 5494
	-- upvalues: t84 (copy), prop_types (copy)
	local v667 = t84.new()

	if t87.tooltip_title ~= nil then
		v667.tooltip_title = prop_types.StringProp.jsonDecode(t87.tooltip_title)
	end

	if t87.tooltipTitle ~= nil then
		v667.tooltip_title = prop_types.StringProp.jsonDecode(t87.tooltipTitle)
	end

	if t87.tooltip_info_text ~= nil then
		v667.tooltip_info_text = prop_types.StringProp.jsonDecode(t87.tooltip_info_text)
	end

	if t87.tooltipInfoText ~= nil then
		v667.tooltip_info_text = prop_types.StringProp.jsonDecode(t87.tooltipInfoText)
	end

	return v667
end

t84.descriptor = {
	name = "OpenTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenTooltipAction_Params = t84
typeRegistry.default:register(t1.OpenTooltipAction_Params)

local t88 = {}

t88.__index = t88

function t88.new(t89: {[any]: any}?) -- line: 5534
	-- upvalues: t1 (copy), t88 (copy)
	return (setmetatable({
		action_type = if t89 ~= nil and t89.action_type ~= nil then t89.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t89 ~= nil and t89.action_params ~= nil then t89.action_params else nil
	}, t88))
end
function t88.encode(p67) -- line: 5543
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n43 = 0

	if p67.action_type ~= nil and (p67.action_type ~= nil and p67.action_type ~= 0 or p67.action_type ~= t1.ActionType.fromNumber(0)) then
		local v672, v673 = proto.writeTag(buf, n43, 1, proto.wireTypes.varint)

		buf, n43 = proto.writeVarInt(v672, v673, t1.ActionType.toNumber(p67.action_type))
	end

	if p67.action_params ~= nil then
		local v674 = p67.action_params:encode()
		local v675, v676 = proto.writeTag(buf, n43, 2, proto.wireTypes.lengthDelimited)

		buf, n43 = proto.writeBuffer(v675, v676, v674, buffer.len(v674))
	end

	local buf24 = buffer.create(n43)

	buffer.copy(buf24, 0, buf, 0, n43)

	return buf24
end
function t88.decode(p68: buffer) -- line: 5569
	-- upvalues: t88 (copy), proto (copy), t1 (copy)
	local v679 = t88.new()
	local n44 = 0

	while n44 < buffer.len(p68) do
		local v681, v682

		v681, v682, n44 = proto.readTag(p68, n44)

		if v682 == proto.wireTypes.varint then
			if v681 == 1 then
				local v683

				v683, n44 = proto.readVarIntI32(p68, n44)
				v679.action_type = t1.ActionType.fromNumber(v683) or v683
			else
				local v684

				v684, n44 = proto.readVarInt(p68, n44)
			end
		elseif v682 == proto.wireTypes.lengthDelimited then
			if v681 == 2 then
				local v685

				v685, n44 = proto.readBuffer(p68, n44)
				v679.action_params = t1.OpenBadgeDetailsAction_Params.decode(v685)
			else
				local v686, v687 = proto.readVarInt(p68, n44)

				n44 = v687 + v686
			end
		elseif v682 == proto.wireTypes.i32 then
			local v688

			v688, n44 = proto.readFixed32(p68, n44)
		elseif v682 == proto.wireTypes.i64 then
			local v689

			v689, n44 = proto.readFixed64(p68, n44)
		else
			error("Unsupported wire type: " .. v682)
		end
	end

	return v679
end
function t88.jsonEncode(p69) -- line: 5617
	-- upvalues: t1 (copy)
	local t90 = {}

	if p69.action_type ~= nil and (p69.action_type ~= nil and p69.action_type ~= 0 or p69.action_type ~= t1.ActionType.fromNumber(0)) then
		t90.actionType = if typeof(p69.action_type) ~= "number" then t1.ActionType.toNumber(p69.action_type) else p69.action_type
	end

	if p69.action_params ~= nil then
		t90.actionParams = p69.action_params:jsonEncode()
	end

	return t90
end
function t88.jsonDecode(t91: {[any]: any}) -- line: 5639
	-- upvalues: t88 (copy), t1 (copy)
	local v693 = t88.new()

	if t91.action_type ~= nil then
		v693.action_type = if typeof(t91.action_type) ~= "number" then t1.ActionType.fromName(t91.action_type) or t91.action_type else t1.ActionType.fromNumber(t91.action_type) or t91.action_type
	end

	if t91.actionType ~= nil then
		v693.action_type = if typeof(t91.actionType) ~= "number" then t1.ActionType.fromName(t91.actionType) or t91.actionType else t1.ActionType.fromNumber(t91.actionType) or t91.actionType
	end

	if t91.action_params ~= nil then
		v693.action_params = t1.OpenBadgeDetailsAction_Params.jsonDecode(t91.action_params)
	end

	if t91.actionParams ~= nil then
		v693.action_params = t1.OpenBadgeDetailsAction_Params.jsonDecode(t91.actionParams)
	end

	return v693
end

t88.descriptor = {
	name = "OpenBadgeDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
}
t1.OpenBadgeDetailsAction = t88
typeRegistry.default:register(t1.OpenBadgeDetailsAction)

local t92 = {}

t92.__index = t92

function t92.new(t93: {[any]: any}?) -- line: 5679
	-- upvalues: t92 (copy)
	return (setmetatable({
		badge_id = if t93 ~= nil and t93.badge_id ~= nil then t93.badge_id else nil,
		title_text = if t93 ~= nil and t93.title_text ~= nil then t93.title_text else nil
	}, t92))
end
function t92.encode(p70) -- line: 5688
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n45 = 0

	if p70.badge_id ~= nil then
		local v698 = p70.badge_id:encode()
		local v699, v700 = proto.writeTag(buf, n45, 1, proto.wireTypes.lengthDelimited)

		buf, n45 = proto.writeBuffer(v699, v700, v698, buffer.len(v698))
	end

	if p70.title_text ~= nil then
		local v701 = p70.title_text:encode()
		local v702, v703 = proto.writeTag(buf, n45, 2, proto.wireTypes.lengthDelimited)

		buf, n45 = proto.writeBuffer(v702, v703, v701, buffer.len(v701))
	end

	local buf25 = buffer.create(n45)

	buffer.copy(buf25, 0, buf, 0, n45)

	return buf25
end
function t92.decode(p71: buffer) -- line: 5709
	-- upvalues: t92 (copy), proto (copy), prop_types (copy)
	local v706 = t92.new()
	local n46 = 0

	while n46 < buffer.len(p71) do
		local v708, v709

		v708, v709, n46 = proto.readTag(p71, n46)

		if v709 == proto.wireTypes.varint then
			local v710

			v710, n46 = proto.readVarInt(p71, n46)
		elseif v709 == proto.wireTypes.lengthDelimited then
			if v708 == 1 then
				local v711

				v711, n46 = proto.readBuffer(p71, n46)
				v706.badge_id = prop_types.StringProp.decode(v711)
			elseif v708 == 2 then
				local v712

				v712, n46 = proto.readBuffer(p71, n46)
				v706.title_text = prop_types.StringProp.decode(v712)
			else
				local v713, v714 = proto.readVarInt(p71, n46)

				n46 = v714 + v713
			end
		elseif v709 == proto.wireTypes.i32 then
			local v715

			v715, n46 = proto.readFixed32(p71, n46)
		elseif v709 == proto.wireTypes.i64 then
			local v716

			v716, n46 = proto.readFixed64(p71, n46)
		else
			error("Unsupported wire type: " .. v709)
		end
	end

	return v706
end
function t92.jsonEncode(p72) -- line: 5757
	local t94 = {}

	if p72.badge_id ~= nil then
		t94.badgeId = p72.badge_id:jsonEncode()
	end

	if p72.title_text ~= nil then
		t94.titleText = p72.title_text:jsonEncode()
	end

	return t94
end
function t92.jsonDecode(t95: {[any]: any}) -- line: 5771
	-- upvalues: t92 (copy), prop_types (copy)
	local v720 = t92.new()

	if t95.badge_id ~= nil then
		v720.badge_id = prop_types.StringProp.jsonDecode(t95.badge_id)
	end

	if t95.badgeId ~= nil then
		v720.badge_id = prop_types.StringProp.jsonDecode(t95.badgeId)
	end

	if t95.title_text ~= nil then
		v720.title_text = prop_types.StringProp.jsonDecode(t95.title_text)
	end

	if t95.titleText ~= nil then
		v720.title_text = prop_types.StringProp.jsonDecode(t95.titleText)
	end

	return v720
end

t92.descriptor = {
	name = "OpenBadgeDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenBadgeDetailsAction_Params = t92
typeRegistry.default:register(t1.OpenBadgeDetailsAction_Params)

local t96 = {}

t96.__index = t96

function t96.new(t97: {[any]: any}?) -- line: 5807
	-- upvalues: t1 (copy), t96 (copy)
	return (setmetatable({
		action_type = if t97 ~= nil and t97.action_type ~= nil then t97.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t97 ~= nil and t97.action_params ~= nil then t97.action_params else nil
	}, t96))
end
function t96.encode(p73) -- line: 5816
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n47 = 0

	if p73.action_type ~= nil and (p73.action_type ~= nil and p73.action_type ~= 0 or p73.action_type ~= t1.ActionType.fromNumber(0)) then
		local v725, v726 = proto.writeTag(buf, n47, 1, proto.wireTypes.varint)

		buf, n47 = proto.writeVarInt(v725, v726, t1.ActionType.toNumber(p73.action_type))
	end

	if p73.action_params ~= nil then
		local v727 = p73.action_params:encode()
		local v728, v729 = proto.writeTag(buf, n47, 2, proto.wireTypes.lengthDelimited)

		buf, n47 = proto.writeBuffer(v728, v729, v727, buffer.len(v727))
	end

	local buf26 = buffer.create(n47)

	buffer.copy(buf26, 0, buf, 0, n47)

	return buf26
end
function t96.decode(p74: buffer) -- line: 5842
	-- upvalues: t96 (copy), proto (copy), t1 (copy)
	local v732 = t96.new()
	local n48 = 0

	while n48 < buffer.len(p74) do
		local v734, v735

		v734, v735, n48 = proto.readTag(p74, n48)

		if v735 == proto.wireTypes.varint then
			if v734 == 1 then
				local v736

				v736, n48 = proto.readVarIntI32(p74, n48)
				v732.action_type = t1.ActionType.fromNumber(v736) or v736
			else
				local v737

				v737, n48 = proto.readVarInt(p74, n48)
			end
		elseif v735 == proto.wireTypes.lengthDelimited then
			if v734 == 2 then
				local v738

				v738, n48 = proto.readBuffer(p74, n48)
				v732.action_params = t1.LoadMoreFromApiAction_Params.decode(v738)
			else
				local v739, v740 = proto.readVarInt(p74, n48)

				n48 = v740 + v739
			end
		elseif v735 == proto.wireTypes.i32 then
			local v741

			v741, n48 = proto.readFixed32(p74, n48)
		elseif v735 == proto.wireTypes.i64 then
			local v742

			v742, n48 = proto.readFixed64(p74, n48)
		else
			error("Unsupported wire type: " .. v735)
		end
	end

	return v732
end
function t96.jsonEncode(p75) -- line: 5890
	-- upvalues: t1 (copy)
	local t98 = {}

	if p75.action_type ~= nil and (p75.action_type ~= nil and p75.action_type ~= 0 or p75.action_type ~= t1.ActionType.fromNumber(0)) then
		t98.actionType = if typeof(p75.action_type) ~= "number" then t1.ActionType.toNumber(p75.action_type) else p75.action_type
	end

	if p75.action_params ~= nil then
		t98.actionParams = p75.action_params:jsonEncode()
	end

	return t98
end
function t96.jsonDecode(t99: {[any]: any}) -- line: 5912
	-- upvalues: t96 (copy), t1 (copy)
	local v746 = t96.new()

	if t99.action_type ~= nil then
		v746.action_type = if typeof(t99.action_type) ~= "number" then t1.ActionType.fromName(t99.action_type) or t99.action_type else t1.ActionType.fromNumber(t99.action_type) or t99.action_type
	end

	if t99.actionType ~= nil then
		v746.action_type = if typeof(t99.actionType) ~= "number" then t1.ActionType.fromName(t99.actionType) or t99.actionType else t1.ActionType.fromNumber(t99.actionType) or t99.actionType
	end

	if t99.action_params ~= nil then
		v746.action_params = t1.LoadMoreFromApiAction_Params.jsonDecode(t99.action_params)
	end

	if t99.actionParams ~= nil then
		v746.action_params = t1.LoadMoreFromApiAction_Params.jsonDecode(t99.actionParams)
	end

	return v746
end

t96.descriptor = {
	name = "LoadMoreFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
}
t1.LoadMoreFromApiAction = t96
typeRegistry.default:register(t1.LoadMoreFromApiAction)

local t100 = {}

t100.__index = t100

function t100.new(t101: {[any]: any}?) -- line: 5952
	-- upvalues: t100 (copy)
	return (setmetatable({
		surface_key = if t101 ~= nil and t101.surface_key ~= nil then t101.surface_key else nil,
		config_key = if t101 ~= nil and t101.config_key ~= nil then t101.config_key else nil
	}, t100))
end
function t100.encode(p76) -- line: 5961
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n49 = 0

	if p76.surface_key ~= nil then
		local v751 = p76.surface_key:encode()
		local v752, v753 = proto.writeTag(buf, n49, 1, proto.wireTypes.lengthDelimited)

		buf, n49 = proto.writeBuffer(v752, v753, v751, buffer.len(v751))
	end

	if p76.config_key ~= nil then
		local v754 = p76.config_key:encode()
		local v755, v756 = proto.writeTag(buf, n49, 2, proto.wireTypes.lengthDelimited)

		buf, n49 = proto.writeBuffer(v755, v756, v754, buffer.len(v754))
	end

	local buf27 = buffer.create(n49)

	buffer.copy(buf27, 0, buf, 0, n49)

	return buf27
end
function t100.decode(p77: buffer) -- line: 5982
	-- upvalues: t100 (copy), proto (copy), prop_types (copy)
	local v759 = t100.new()
	local n50 = 0

	while n50 < buffer.len(p77) do
		local v761, v762

		v761, v762, n50 = proto.readTag(p77, n50)

		if v762 == proto.wireTypes.varint then
			local v763

			v763, n50 = proto.readVarInt(p77, n50)
		elseif v762 == proto.wireTypes.lengthDelimited then
			if v761 == 1 then
				local v764

				v764, n50 = proto.readBuffer(p77, n50)
				v759.surface_key = prop_types.StringProp.decode(v764)
			elseif v761 == 2 then
				local v765

				v765, n50 = proto.readBuffer(p77, n50)
				v759.config_key = prop_types.StringProp.decode(v765)
			else
				local v766, v767 = proto.readVarInt(p77, n50)

				n50 = v767 + v766
			end
		elseif v762 == proto.wireTypes.i32 then
			local v768

			v768, n50 = proto.readFixed32(p77, n50)
		elseif v762 == proto.wireTypes.i64 then
			local v769

			v769, n50 = proto.readFixed64(p77, n50)
		else
			error("Unsupported wire type: " .. v762)
		end
	end

	return v759
end
function t100.jsonEncode(p78) -- line: 6030
	local t102 = {}

	if p78.surface_key ~= nil then
		t102.surfaceKey = p78.surface_key:jsonEncode()
	end

	if p78.config_key ~= nil then
		t102.configKey = p78.config_key:jsonEncode()
	end

	return t102
end
function t100.jsonDecode(t103: {[any]: any}) -- line: 6044
	-- upvalues: t100 (copy), prop_types (copy)
	local v773 = t100.new()

	if t103.surface_key ~= nil then
		v773.surface_key = prop_types.StringProp.jsonDecode(t103.surface_key)
	end

	if t103.surfaceKey ~= nil then
		v773.surface_key = prop_types.StringProp.jsonDecode(t103.surfaceKey)
	end

	if t103.config_key ~= nil then
		v773.config_key = prop_types.StringProp.jsonDecode(t103.config_key)
	end

	if t103.configKey ~= nil then
		v773.config_key = prop_types.StringProp.jsonDecode(t103.configKey)
	end

	return v773
end

t100.descriptor = {
	name = "LoadMoreFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.LoadMoreFromApiAction_Params = t100
typeRegistry.default:register(t1.LoadMoreFromApiAction_Params)

local t104 = {}

t104.__index = t104

function t104.new(t105: {[any]: any}?) -- line: 6081
	-- upvalues: t1 (copy), t104 (copy)
	return (setmetatable({
		action_type = if t105 ~= nil and t105.action_type ~= nil then t105.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t105 ~= nil and t105.action_params ~= nil then t105.action_params else nil
	}, t104))
end
function t104.encode(p79) -- line: 6090
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n51 = 0

	if p79.action_type ~= nil and (p79.action_type ~= nil and p79.action_type ~= 0 or p79.action_type ~= t1.ActionType.fromNumber(0)) then
		local v778, v779 = proto.writeTag(buf, n51, 1, proto.wireTypes.varint)

		buf, n51 = proto.writeVarInt(v778, v779, t1.ActionType.toNumber(p79.action_type))
	end

	if p79.action_params ~= nil then
		local v780 = p79.action_params:encode()
		local v781, v782 = proto.writeTag(buf, n51, 2, proto.wireTypes.lengthDelimited)

		buf, n51 = proto.writeBuffer(v781, v782, v780, buffer.len(v780))
	end

	local buf28 = buffer.create(n51)

	buffer.copy(buf28, 0, buf, 0, n51)

	return buf28
end
function t104.decode(p80: buffer) -- line: 6116
	-- upvalues: t104 (copy), proto (copy), t1 (copy)
	local v785 = t104.new()
	local n52 = 0

	while n52 < buffer.len(p80) do
		local v787, v788

		v787, v788, n52 = proto.readTag(p80, n52)

		if v788 == proto.wireTypes.varint then
			if v787 == 1 then
				local v789

				v789, n52 = proto.readVarIntI32(p80, n52)
				v785.action_type = t1.ActionType.fromNumber(v789) or v789
			else
				local v790

				v790, n52 = proto.readVarInt(p80, n52)
			end
		elseif v788 == proto.wireTypes.lengthDelimited then
			if v787 == 2 then
				local v791

				v791, n52 = proto.readBuffer(p80, n52)
				v785.action_params = t1.ShareAction_Params.decode(v791)
			else
				local v792, v793 = proto.readVarInt(p80, n52)

				n52 = v793 + v792
			end
		elseif v788 == proto.wireTypes.i32 then
			local v794

			v794, n52 = proto.readFixed32(p80, n52)
		elseif v788 == proto.wireTypes.i64 then
			local v795

			v795, n52 = proto.readFixed64(p80, n52)
		else
			error("Unsupported wire type: " .. v788)
		end
	end

	return v785
end
function t104.jsonEncode(p81) -- line: 6164
	-- upvalues: t1 (copy)
	local t106 = {}

	if p81.action_type ~= nil and (p81.action_type ~= nil and p81.action_type ~= 0 or p81.action_type ~= t1.ActionType.fromNumber(0)) then
		t106.actionType = if typeof(p81.action_type) ~= "number" then t1.ActionType.toNumber(p81.action_type) else p81.action_type
	end

	if p81.action_params ~= nil then
		t106.actionParams = p81.action_params:jsonEncode()
	end

	return t106
end
function t104.jsonDecode(t107: {[any]: any}) -- line: 6186
	-- upvalues: t104 (copy), t1 (copy)
	local v799 = t104.new()

	if t107.action_type ~= nil then
		v799.action_type = if typeof(t107.action_type) ~= "number" then t1.ActionType.fromName(t107.action_type) or t107.action_type else t1.ActionType.fromNumber(t107.action_type) or t107.action_type
	end

	if t107.actionType ~= nil then
		v799.action_type = if typeof(t107.actionType) ~= "number" then t1.ActionType.fromName(t107.actionType) or t107.actionType else t1.ActionType.fromNumber(t107.actionType) or t107.actionType
	end

	if t107.action_params ~= nil then
		v799.action_params = t1.ShareAction_Params.jsonDecode(t107.action_params)
	end

	if t107.actionParams ~= nil then
		v799.action_params = t1.ShareAction_Params.jsonDecode(t107.actionParams)
	end

	return v799
end

t104.descriptor = {
	name = "ShareAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
}
t1.ShareAction = t104
typeRegistry.default:register(t1.ShareAction)

local t108 = {}

t108.__index = t108

function t108.new(t109: {[any]: any}?) -- line: 6226
	-- upvalues: t108 (copy)
	return (setmetatable({
		oneof_prop = if t109 ~= nil and t109.oneof_prop ~= nil then t109.oneof_prop else nil
	}, t108))
end
function t108.encode(p82) -- line: 6234
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n53 = 0

	if p82.oneof_prop ~= nil then
		if p82.oneof_prop.type == "generic_share_link_data" then
			local v804 = p82.oneof_prop.value:encode()
			local v805, v806 = proto.writeTag(buf, n53, 1, proto.wireTypes.lengthDelimited)

			buf, n53 = proto.writeBuffer(v805, v806, v804, buffer.len(v804))
		elseif p82.oneof_prop.type == "share_link_fetch_data" then
			local v807 = p82.oneof_prop.value:encode()
			local v808, v809 = proto.writeTag(buf, n53, 2, proto.wireTypes.lengthDelimited)

			buf, n53 = proto.writeBuffer(v808, v809, v807, buffer.len(v807))
		end
	end

	local buf29 = buffer.create(n53)

	buffer.copy(buf29, 0, buf, 0, n53)

	return buf29
end
function t108.decode(p83: buffer) -- line: 6255
	-- upvalues: t108 (copy), proto (copy), share_link_data (copy)
	local v812 = t108.new()
	local n54 = 0

	while n54 < buffer.len(p83) do
		local v814, v815

		v814, v815, n54 = proto.readTag(p83, n54)

		if v815 == proto.wireTypes.varint then
			local v816

			v816, n54 = proto.readVarInt(p83, n54)
		elseif v815 == proto.wireTypes.lengthDelimited then
			if v814 == 1 then
				local v817

				v817, n54 = proto.readBuffer(p83, n54)
				v812.oneof_prop = {
					type = "generic_share_link_data",
					value = share_link_data.GenericShareLinkData.decode(v817)
				}
			elseif v814 == 2 then
				local v818

				v818, n54 = proto.readBuffer(p83, n54)
				v812.oneof_prop = {
					type = "share_link_fetch_data",
					value = share_link_data.ShareLinkFetchData.decode(v818)
				}
			else
				local v819, v820 = proto.readVarInt(p83, n54)

				n54 = v820 + v819
			end
		elseif v815 == proto.wireTypes.i32 then
			local v821

			v821, n54 = proto.readFixed32(p83, n54)
		elseif v815 == proto.wireTypes.i64 then
			local v822

			v822, n54 = proto.readFixed64(p83, n54)
		else
			error("Unsupported wire type: " .. v815)
		end
	end

	return v812
end
function t108.jsonEncode(p84) -- line: 6311
	local t110 = {}

	if p84.oneof_prop ~= nil then
		if p84.oneof_prop.type == "generic_share_link_data" then
			t110.genericShareLinkData = p84.oneof_prop.value:jsonEncode()

			return t110
		end

		if p84.oneof_prop.type == "share_link_fetch_data" then
			t110.shareLinkFetchData = p84.oneof_prop.value:jsonEncode()
		end
	end

	return t110
end
function t108.jsonDecode(t111: {[any]: any}) -- line: 6325
	-- upvalues: t108 (copy), share_link_data (copy)
	local v826 = t108.new()

	if t111.generic_share_link_data ~= nil then
		v826.oneof_prop = {
			type = "generic_share_link_data",
			value = share_link_data.GenericShareLinkData.jsonDecode(t111.generic_share_link_data)
		}
	end

	if t111.genericShareLinkData ~= nil then
		v826.oneof_prop = {
			type = "generic_share_link_data",
			value = share_link_data.GenericShareLinkData.jsonDecode(t111.genericShareLinkData)
		}
	end

	if t111.share_link_fetch_data ~= nil then
		v826.oneof_prop = {
			type = "share_link_fetch_data",
			value = share_link_data.ShareLinkFetchData.jsonDecode(t111.share_link_fetch_data)
		}
	end

	if t111.shareLinkFetchData ~= nil then
		v826.oneof_prop = {
			type = "share_link_fetch_data",
			value = share_link_data.ShareLinkFetchData.jsonDecode(t111.shareLinkFetchData)
		}
	end

	return v826
end

t108.descriptor = {
	name = "ShareAction_ShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
}
t1.ShareAction_ShareLinkData = t108
typeRegistry.default:register(t1.ShareAction_ShareLinkData)

local t112 = {}

t112.__index = t112

function t112.new(t113: {[any]: any}?) -- line: 6381
	-- upvalues: t112 (copy)
	return (setmetatable({
		share_link_type = if t113 ~= nil and t113.share_link_type ~= nil then t113.share_link_type else nil,
		share_link_data = if t113 ~= nil and t113.share_link_data ~= nil then t113.share_link_data else nil,
		entry_point_key = if t113 ~= nil and t113.entry_point_key ~= nil then t113.entry_point_key else nil
	}, t112))
end
function t112.encode(p85) -- line: 6389
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n55 = 0

	if p85.share_link_type ~= nil then
		local v831 = p85.share_link_type:encode()
		local v832, v833 = proto.writeTag(buf, n55, 1, proto.wireTypes.lengthDelimited)

		buf, n55 = proto.writeBuffer(v832, v833, v831, buffer.len(v831))
	end

	if p85.share_link_data ~= nil then
		local v834 = p85.share_link_data:encode()
		local v835, v836 = proto.writeTag(buf, n55, 2, proto.wireTypes.lengthDelimited)

		buf, n55 = proto.writeBuffer(v835, v836, v834, buffer.len(v834))
	end

	if p85.entry_point_key ~= nil then
		local v837 = p85.entry_point_key:encode()
		local v838, v839 = proto.writeTag(buf, n55, 3, proto.wireTypes.lengthDelimited)

		buf, n55 = proto.writeBuffer(v838, v839, v837, buffer.len(v837))
	end

	local buf30 = buffer.create(n55)

	buffer.copy(buf30, 0, buf, 0, n55)

	return buf30
end
function t112.decode(p86: buffer) -- line: 6416
	-- upvalues: t112 (copy), proto (copy), prop_types (copy), t1 (copy)
	local v842 = t112.new()
	local n56 = 0

	while n56 < buffer.len(p86) do
		local v844, v845

		v844, v845, n56 = proto.readTag(p86, n56)

		if v845 == proto.wireTypes.varint then
			local v846

			v846, n56 = proto.readVarInt(p86, n56)
		elseif v845 == proto.wireTypes.lengthDelimited then
			if v844 == 1 then
				local v847

				v847, n56 = proto.readBuffer(p86, n56)
				v842.share_link_type = prop_types.StringProp.decode(v847)
			elseif v844 == 2 then
				local v848

				v848, n56 = proto.readBuffer(p86, n56)
				v842.share_link_data = t1.ShareAction_ShareLinkData.decode(v848)
			elseif v844 == 3 then
				local v849

				v849, n56 = proto.readBuffer(p86, n56)
				v842.entry_point_key = prop_types.StringProp.decode(v849)
			else
				local v850, v851 = proto.readVarInt(p86, n56)

				n56 = v851 + v850
			end
		elseif v845 == proto.wireTypes.i32 then
			local v852

			v852, n56 = proto.readFixed32(p86, n56)
		elseif v845 == proto.wireTypes.i64 then
			local v853

			v853, n56 = proto.readFixed64(p86, n56)
		else
			error("Unsupported wire type: " .. v845)
		end
	end

	return v842
end
function t112.jsonEncode(p87) -- line: 6469
	local t114 = {}

	if p87.share_link_type ~= nil then
		t114.shareLinkType = p87.share_link_type:jsonEncode()
	end

	if p87.share_link_data ~= nil then
		t114.shareLinkData = p87.share_link_data:jsonEncode()
	end

	if p87.entry_point_key ~= nil then
		t114.entryPointKey = p87.entry_point_key:jsonEncode()
	end

	return t114
end
function t112.jsonDecode(t115: {[any]: any}) -- line: 6487
	-- upvalues: t112 (copy), prop_types (copy), t1 (copy)
	local v857 = t112.new()

	if t115.share_link_type ~= nil then
		v857.share_link_type = prop_types.StringProp.jsonDecode(t115.share_link_type)
	end

	if t115.shareLinkType ~= nil then
		v857.share_link_type = prop_types.StringProp.jsonDecode(t115.shareLinkType)
	end

	if t115.share_link_data ~= nil then
		v857.share_link_data = t1.ShareAction_ShareLinkData.jsonDecode(t115.share_link_data)
	end

	if t115.shareLinkData ~= nil then
		v857.share_link_data = t1.ShareAction_ShareLinkData.jsonDecode(t115.shareLinkData)
	end

	if t115.entry_point_key ~= nil then
		v857.entry_point_key = prop_types.StringProp.jsonDecode(t115.entry_point_key)
	end

	if t115.entryPointKey ~= nil then
		v857.entry_point_key = prop_types.StringProp.jsonDecode(t115.entryPointKey)
	end

	return v857
end

t112.descriptor = {
	name = "ShareAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.ShareAction_Params = t112
typeRegistry.default:register(t1.ShareAction_Params)

local t116 = {}

t116.__index = t116

function t116.new(t117: {[any]: any}?) -- line: 6535
	-- upvalues: t1 (copy), t116 (copy)
	return (setmetatable({
		action_type = if t117 ~= nil and t117.action_type ~= nil then t117.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t117 ~= nil and t117.action_params ~= nil then t117.action_params else nil
	}, t116))
end
function t116.encode(p88) -- line: 6544
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n57 = 0

	if p88.action_type ~= nil and (p88.action_type ~= nil and p88.action_type ~= 0 or p88.action_type ~= t1.ActionType.fromNumber(0)) then
		local v862, v863 = proto.writeTag(buf, n57, 1, proto.wireTypes.varint)

		buf, n57 = proto.writeVarInt(v862, v863, t1.ActionType.toNumber(p88.action_type))
	end

	if p88.action_params ~= nil then
		local v864 = p88.action_params:encode()
		local v865, v866 = proto.writeTag(buf, n57, 2, proto.wireTypes.lengthDelimited)

		buf, n57 = proto.writeBuffer(v865, v866, v864, buffer.len(v864))
	end

	local buf31 = buffer.create(n57)

	buffer.copy(buf31, 0, buf, 0, n57)

	return buf31
end
function t116.decode(p89: buffer) -- line: 6570
	-- upvalues: t116 (copy), proto (copy), t1 (copy)
	local v869 = t116.new()
	local n58 = 0

	while n58 < buffer.len(p89) do
		local v871, v872

		v871, v872, n58 = proto.readTag(p89, n58)

		if v872 == proto.wireTypes.varint then
			if v871 == 1 then
				local v873

				v873, n58 = proto.readVarIntI32(p89, n58)
				v869.action_type = t1.ActionType.fromNumber(v873) or v873
			else
				local v874

				v874, n58 = proto.readVarInt(p89, n58)
			end
		elseif v872 == proto.wireTypes.lengthDelimited then
			if v871 == 2 then
				local v875

				v875, n58 = proto.readBuffer(p89, n58)
				v869.action_params = t1.OpenAbuseReportAction_Params.decode(v875)
			else
				local v876, v877 = proto.readVarInt(p89, n58)

				n58 = v877 + v876
			end
		elseif v872 == proto.wireTypes.i32 then
			local v878

			v878, n58 = proto.readFixed32(p89, n58)
		elseif v872 == proto.wireTypes.i64 then
			local v879

			v879, n58 = proto.readFixed64(p89, n58)
		else
			error("Unsupported wire type: " .. v872)
		end
	end

	return v869
end
function t116.jsonEncode(p90) -- line: 6618
	-- upvalues: t1 (copy)
	local t118 = {}

	if p90.action_type ~= nil and (p90.action_type ~= nil and p90.action_type ~= 0 or p90.action_type ~= t1.ActionType.fromNumber(0)) then
		t118.actionType = if typeof(p90.action_type) ~= "number" then t1.ActionType.toNumber(p90.action_type) else p90.action_type
	end

	if p90.action_params ~= nil then
		t118.actionParams = p90.action_params:jsonEncode()
	end

	return t118
end
function t116.jsonDecode(t119: {[any]: any}) -- line: 6640
	-- upvalues: t116 (copy), t1 (copy)
	local v883 = t116.new()

	if t119.action_type ~= nil then
		v883.action_type = if typeof(t119.action_type) ~= "number" then t1.ActionType.fromName(t119.action_type) or t119.action_type else t1.ActionType.fromNumber(t119.action_type) or t119.action_type
	end

	if t119.actionType ~= nil then
		v883.action_type = if typeof(t119.actionType) ~= "number" then t1.ActionType.fromName(t119.actionType) or t119.actionType else t1.ActionType.fromNumber(t119.actionType) or t119.actionType
	end

	if t119.action_params ~= nil then
		v883.action_params = t1.OpenAbuseReportAction_Params.jsonDecode(t119.action_params)
	end

	if t119.actionParams ~= nil then
		v883.action_params = t1.OpenAbuseReportAction_Params.jsonDecode(t119.actionParams)
	end

	return v883
end

t116.descriptor = {
	name = "OpenAbuseReportAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
}
t1.OpenAbuseReportAction = t116
typeRegistry.default:register(t1.OpenAbuseReportAction)

local t120 = {}

t120.__index = t120

function t120.new(t121: {[any]: any}?) -- line: 6680
	-- upvalues: t120 (copy)
	return (setmetatable({
		target_id = if t121 ~= nil and t121.target_id ~= nil then t121.target_id else nil,
		abuse_vector = if t121 ~= nil and t121.abuse_vector ~= nil then t121.abuse_vector else nil,
		asset_type_name = if t121 ~= nil and t121.asset_type_name ~= nil then t121.asset_type_name else nil,
		universe_id = if t121 ~= nil and t121.universe_id ~= nil then t121.universe_id else nil
	}, t120))
end
function t120.encode(p91) -- line: 6691
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n59 = 0

	if p91.target_id ~= nil then
		local v888 = p91.target_id:encode()
		local v889, v890 = proto.writeTag(buf, n59, 1, proto.wireTypes.lengthDelimited)

		buf, n59 = proto.writeBuffer(v889, v890, v888, buffer.len(v888))
	end

	if p91.abuse_vector ~= nil then
		local v891 = p91.abuse_vector:encode()
		local v892, v893 = proto.writeTag(buf, n59, 2, proto.wireTypes.lengthDelimited)

		buf, n59 = proto.writeBuffer(v892, v893, v891, buffer.len(v891))
	end

	if p91.asset_type_name ~= nil then
		local v894 = p91.asset_type_name:encode()
		local v895, v896 = proto.writeTag(buf, n59, 3, proto.wireTypes.lengthDelimited)

		buf, n59 = proto.writeBuffer(v895, v896, v894, buffer.len(v894))
	end

	if p91.universe_id ~= nil then
		local v897 = p91.universe_id:encode()
		local v898, v899 = proto.writeTag(buf, n59, 4, proto.wireTypes.lengthDelimited)

		buf, n59 = proto.writeBuffer(v898, v899, v897, buffer.len(v897))
	end

	local buf32 = buffer.create(n59)

	buffer.copy(buf32, 0, buf, 0, n59)

	return buf32
end
function t120.decode(p92: buffer) -- line: 6724
	-- upvalues: t120 (copy), proto (copy), prop_types (copy)
	local v902 = t120.new()
	local n60 = 0

	while n60 < buffer.len(p92) do
		local v904, v905

		v904, v905, n60 = proto.readTag(p92, n60)

		if v905 == proto.wireTypes.varint then
			local v906

			v906, n60 = proto.readVarInt(p92, n60)
		elseif v905 == proto.wireTypes.lengthDelimited then
			if v904 == 1 then
				local v907

				v907, n60 = proto.readBuffer(p92, n60)
				v902.target_id = prop_types.StringProp.decode(v907)
			elseif v904 == 2 then
				local v908

				v908, n60 = proto.readBuffer(p92, n60)
				v902.abuse_vector = prop_types.StringProp.decode(v908)
			elseif v904 == 3 then
				local v909

				v909, n60 = proto.readBuffer(p92, n60)
				v902.asset_type_name = prop_types.StringProp.decode(v909)
			elseif v904 == 4 then
				local v910

				v910, n60 = proto.readBuffer(p92, n60)
				v902.universe_id = prop_types.StringProp.decode(v910)
			else
				local v911, v912 = proto.readVarInt(p92, n60)

				n60 = v912 + v911
			end
		elseif v905 == proto.wireTypes.i32 then
			local v913

			v913, n60 = proto.readFixed32(p92, n60)
		elseif v905 == proto.wireTypes.i64 then
			local v914

			v914, n60 = proto.readFixed64(p92, n60)
		else
			error("Unsupported wire type: " .. v905)
		end
	end

	return v902
end
function t120.jsonEncode(p93) -- line: 6782
	local t122 = {}

	if p93.target_id ~= nil then
		t122.targetId = p93.target_id:jsonEncode()
	end

	if p93.abuse_vector ~= nil then
		t122.abuseVector = p93.abuse_vector:jsonEncode()
	end

	if p93.asset_type_name ~= nil then
		t122.assetTypeName = p93.asset_type_name:jsonEncode()
	end

	if p93.universe_id ~= nil then
		t122.universeId = p93.universe_id:jsonEncode()
	end

	return t122
end
function t120.jsonDecode(t123: {[any]: any}) -- line: 6804
	-- upvalues: t120 (copy), prop_types (copy)
	local v918 = t120.new()

	if t123.target_id ~= nil then
		v918.target_id = prop_types.StringProp.jsonDecode(t123.target_id)
	end

	if t123.targetId ~= nil then
		v918.target_id = prop_types.StringProp.jsonDecode(t123.targetId)
	end

	if t123.abuse_vector ~= nil then
		v918.abuse_vector = prop_types.StringProp.jsonDecode(t123.abuse_vector)
	end

	if t123.abuseVector ~= nil then
		v918.abuse_vector = prop_types.StringProp.jsonDecode(t123.abuseVector)
	end

	if t123.asset_type_name ~= nil then
		v918.asset_type_name = prop_types.StringProp.jsonDecode(t123.asset_type_name)
	end

	if t123.assetTypeName ~= nil then
		v918.asset_type_name = prop_types.StringProp.jsonDecode(t123.assetTypeName)
	end

	if t123.universe_id ~= nil then
		v918.universe_id = prop_types.StringProp.jsonDecode(t123.universe_id)
	end

	if t123.universeId ~= nil then
		v918.universe_id = prop_types.StringProp.jsonDecode(t123.universeId)
	end

	return v918
end

t120.descriptor = {
	name = "OpenAbuseReportAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenAbuseReportAction_Params = t120
typeRegistry.default:register(t1.OpenAbuseReportAction_Params)

local t124 = {}

t124.__index = t124

function t124.new(t125: {[any]: any}?) -- line: 6861
	-- upvalues: t1 (copy), t124 (copy)
	return (setmetatable({
		action_type = if t125 ~= nil and t125.action_type ~= nil then t125.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t125 ~= nil and t125.action_params ~= nil then t125.action_params else nil
	}, t124))
end
function t124.encode(p94) -- line: 6872
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n61 = 0

	if p94.action_type ~= nil and (p94.action_type ~= nil and p94.action_type ~= 0 or p94.action_type ~= t1.ActionType.fromNumber(0)) then
		local v923, v924 = proto.writeTag(buf, n61, 1, proto.wireTypes.varint)

		buf, n61 = proto.writeVarInt(v923, v924, t1.ActionType.toNumber(p94.action_type))
	end

	if p94.action_params ~= nil then
		local v925 = p94.action_params:encode()
		local v926, v927 = proto.writeTag(buf, n61, 2, proto.wireTypes.lengthDelimited)

		buf, n61 = proto.writeBuffer(v926, v927, v925, buffer.len(v925))
	end

	local buf33 = buffer.create(n61)

	buffer.copy(buf33, 0, buf, 0, n61)

	return buf33
end
function t124.decode(p95: buffer) -- line: 6898
	-- upvalues: t124 (copy), proto (copy), t1 (copy)
	local v930 = t124.new()
	local n62 = 0

	while n62 < buffer.len(p95) do
		local v932, v933

		v932, v933, n62 = proto.readTag(p95, n62)

		if v933 == proto.wireTypes.varint then
			if v932 == 1 then
				local v934

				v934, n62 = proto.readVarIntI32(p95, n62)
				v930.action_type = t1.ActionType.fromNumber(v934) or v934
			else
				local v935

				v935, n62 = proto.readVarInt(p95, n62)
			end
		elseif v933 == proto.wireTypes.lengthDelimited then
			if v932 == 2 then
				local v936

				v936, n62 = proto.readBuffer(p95, n62)
				v930.action_params = t1.RemoveBadgeFromInventoryAction_Params.decode(v936)
			else
				local v937, v938 = proto.readVarInt(p95, n62)

				n62 = v938 + v937
			end
		elseif v933 == proto.wireTypes.i32 then
			local v939

			v939, n62 = proto.readFixed32(p95, n62)
		elseif v933 == proto.wireTypes.i64 then
			local v940

			v940, n62 = proto.readFixed64(p95, n62)
		else
			error("Unsupported wire type: " .. v933)
		end
	end

	return v930
end
function t124.jsonEncode(p96) -- line: 6946
	-- upvalues: t1 (copy)
	local t126 = {}

	if p96.action_type ~= nil and (p96.action_type ~= nil and p96.action_type ~= 0 or p96.action_type ~= t1.ActionType.fromNumber(0)) then
		t126.actionType = if typeof(p96.action_type) ~= "number" then t1.ActionType.toNumber(p96.action_type) else p96.action_type
	end

	if p96.action_params ~= nil then
		t126.actionParams = p96.action_params:jsonEncode()
	end

	return t126
end
function t124.jsonDecode(t127: {[any]: any}) -- line: 6968
	-- upvalues: t124 (copy), t1 (copy)
	local v944 = t124.new()

	if t127.action_type ~= nil then
		v944.action_type = if typeof(t127.action_type) ~= "number" then t1.ActionType.fromName(t127.action_type) or t127.action_type else t1.ActionType.fromNumber(t127.action_type) or t127.action_type
	end

	if t127.actionType ~= nil then
		v944.action_type = if typeof(t127.actionType) ~= "number" then t1.ActionType.fromName(t127.actionType) or t127.actionType else t1.ActionType.fromNumber(t127.actionType) or t127.actionType
	end

	if t127.action_params ~= nil then
		v944.action_params = t1.RemoveBadgeFromInventoryAction_Params.jsonDecode(t127.action_params)
	end

	if t127.actionParams ~= nil then
		v944.action_params = t1.RemoveBadgeFromInventoryAction_Params.jsonDecode(t127.actionParams)
	end

	return v944
end

t124.descriptor = {
	name = "RemoveBadgeFromInventoryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
}
t1.RemoveBadgeFromInventoryAction = t124
typeRegistry.default:register(t1.RemoveBadgeFromInventoryAction)

local t128 = {}

t128.__index = t128

function t128.new(t129: {[any]: any}?) -- line: 7008
	-- upvalues: t128 (copy)
	return (setmetatable({
		asset_id = if t129 ~= nil and t129.asset_id ~= nil then t129.asset_id else nil
	}, t128))
end
function t128.encode(p97) -- line: 7016
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n63 = 0

	if p97.asset_id ~= nil then
		local v949 = p97.asset_id:encode()
		local v950, v951 = proto.writeTag(buf, n63, 1, proto.wireTypes.lengthDelimited)

		buf, n63 = proto.writeBuffer(v950, v951, v949, buffer.len(v949))
	end

	local buf34 = buffer.create(n63)

	buffer.copy(buf34, 0, buf, 0, n63)

	return buf34
end
function t128.decode(p98: buffer) -- line: 7031
	-- upvalues: t128 (copy), proto (copy), prop_types (copy)
	local v954 = t128.new()
	local n64 = 0

	while n64 < buffer.len(p98) do
		local v956, v957

		v956, v957, n64 = proto.readTag(p98, n64)

		if v957 == proto.wireTypes.varint then
			local v958

			v958, n64 = proto.readVarInt(p98, n64)
		elseif v957 == proto.wireTypes.lengthDelimited then
			if v956 == 1 then
				local v959

				v959, n64 = proto.readBuffer(p98, n64)
				v954.asset_id = prop_types.StringProp.decode(v959)
			else
				local v960, v961 = proto.readVarInt(p98, n64)

				n64 = v961 + v960
			end
		elseif v957 == proto.wireTypes.i32 then
			local v962

			v962, n64 = proto.readFixed32(p98, n64)
		elseif v957 == proto.wireTypes.i64 then
			local v963

			v963, n64 = proto.readFixed64(p98, n64)
		else
			error("Unsupported wire type: " .. v957)
		end
	end

	return v954
end
function t128.jsonEncode(p99) -- line: 7074
	local t130 = {}

	if p99.asset_id ~= nil then
		t130.assetId = p99.asset_id:jsonEncode()
	end

	return t130
end
function t128.jsonDecode(t131: {[any]: any}) -- line: 7084
	-- upvalues: t128 (copy), prop_types (copy)
	local v967 = t128.new()

	if t131.asset_id ~= nil then
		v967.asset_id = prop_types.StringProp.jsonDecode(t131.asset_id)
	end

	if t131.assetId ~= nil then
		v967.asset_id = prop_types.StringProp.jsonDecode(t131.assetId)
	end

	return v967
end

t128.descriptor = {
	name = "RemoveBadgeFromInventoryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.RemoveBadgeFromInventoryAction_Params = t128
typeRegistry.default:register(t1.RemoveBadgeFromInventoryAction_Params)

local t132 = {}

t132.__index = t132

function t132.new(t133: {[any]: any}?) -- line: 7114
	-- upvalues: t1 (copy), t132 (copy)
	return (setmetatable({
		action_type = if t133 ~= nil and t133.action_type ~= nil then t133.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t133 ~= nil and t133.action_params ~= nil then t133.action_params else nil
	}, t132))
end
function t132.encode(p100) -- line: 7123
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n65 = 0

	if p100.action_type ~= nil and (p100.action_type ~= nil and p100.action_type ~= 0 or p100.action_type ~= t1.ActionType.fromNumber(0)) then
		local v972, v973 = proto.writeTag(buf, n65, 1, proto.wireTypes.varint)

		buf, n65 = proto.writeVarInt(v972, v973, t1.ActionType.toNumber(p100.action_type))
	end

	if p100.action_params ~= nil then
		local v974 = p100.action_params:encode()
		local v975, v976 = proto.writeTag(buf, n65, 2, proto.wireTypes.lengthDelimited)

		buf, n65 = proto.writeBuffer(v975, v976, v974, buffer.len(v974))
	end

	local buf35 = buffer.create(n65)

	buffer.copy(buf35, 0, buf, 0, n65)

	return buf35
end
function t132.decode(p101: buffer) -- line: 7149
	-- upvalues: t132 (copy), proto (copy), t1 (copy)
	local v979 = t132.new()
	local n66 = 0

	while n66 < buffer.len(p101) do
		local v981, v982

		v981, v982, n66 = proto.readTag(p101, n66)

		if v982 == proto.wireTypes.varint then
			if v981 == 1 then
				local v983

				v983, n66 = proto.readVarIntI32(p101, n66)
				v979.action_type = t1.ActionType.fromNumber(v983) or v983
			else
				local v984

				v984, n66 = proto.readVarInt(p101, n66)
			end
		elseif v982 == proto.wireTypes.lengthDelimited then
			if v981 == 2 then
				local v985

				v985, n66 = proto.readBuffer(p101, n66)
				v979.action_params = t1.OpenProfileAction_Params.decode(v985)
			else
				local v986, v987 = proto.readVarInt(p101, n66)

				n66 = v987 + v986
			end
		elseif v982 == proto.wireTypes.i32 then
			local v988

			v988, n66 = proto.readFixed32(p101, n66)
		elseif v982 == proto.wireTypes.i64 then
			local v989

			v989, n66 = proto.readFixed64(p101, n66)
		else
			error("Unsupported wire type: " .. v982)
		end
	end

	return v979
end
function t132.jsonEncode(p102) -- line: 7197
	-- upvalues: t1 (copy)
	local t134 = {}

	if p102.action_type ~= nil and (p102.action_type ~= nil and p102.action_type ~= 0 or p102.action_type ~= t1.ActionType.fromNumber(0)) then
		t134.actionType = if typeof(p102.action_type) ~= "number" then t1.ActionType.toNumber(p102.action_type) else p102.action_type
	end

	if p102.action_params ~= nil then
		t134.actionParams = p102.action_params:jsonEncode()
	end

	return t134
end
function t132.jsonDecode(t135: {[any]: any}) -- line: 7219
	-- upvalues: t132 (copy), t1 (copy)
	local v993 = t132.new()

	if t135.action_type ~= nil then
		v993.action_type = if typeof(t135.action_type) ~= "number" then t1.ActionType.fromName(t135.action_type) or t135.action_type else t1.ActionType.fromNumber(t135.action_type) or t135.action_type
	end

	if t135.actionType ~= nil then
		v993.action_type = if typeof(t135.actionType) ~= "number" then t1.ActionType.fromName(t135.actionType) or t135.actionType else t1.ActionType.fromNumber(t135.actionType) or t135.actionType
	end

	if t135.action_params ~= nil then
		v993.action_params = t1.OpenProfileAction_Params.jsonDecode(t135.action_params)
	end

	if t135.actionParams ~= nil then
		v993.action_params = t1.OpenProfileAction_Params.jsonDecode(t135.actionParams)
	end

	return v993
end

t132.descriptor = {
	name = "OpenProfileAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
}
t1.OpenProfileAction = t132
typeRegistry.default:register(t1.OpenProfileAction)

local t136 = {}

t136.__index = t136

function t136.new(t137: {[any]: any}?) -- line: 7259
	-- upvalues: t136 (copy)
	return (setmetatable({
		profile_id = if t137 ~= nil and t137.profile_id ~= nil then t137.profile_id else nil,
		profile_type = if t137 ~= nil and t137.profile_type ~= nil then t137.profile_type else nil,
		source = if t137 ~= nil and t137.source ~= nil then t137.source else nil
	}, t136))
end
function t136.encode(p103) -- line: 7267
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n67 = 0

	if p103.profile_id ~= nil then
		local v998 = p103.profile_id:encode()
		local v999, v1000 = proto.writeTag(buf, n67, 1, proto.wireTypes.lengthDelimited)

		buf, n67 = proto.writeBuffer(v999, v1000, v998, buffer.len(v998))
	end

	if p103.profile_type ~= nil then
		local v1001 = p103.profile_type:encode()
		local v1002, v1003 = proto.writeTag(buf, n67, 2, proto.wireTypes.lengthDelimited)

		buf, n67 = proto.writeBuffer(v1002, v1003, v1001, buffer.len(v1001))
	end

	if p103.source ~= nil then
		local v1004 = p103.source:encode()
		local v1005, v1006 = proto.writeTag(buf, n67, 3, proto.wireTypes.lengthDelimited)

		buf, n67 = proto.writeBuffer(v1005, v1006, v1004, buffer.len(v1004))
	end

	local buf36 = buffer.create(n67)

	buffer.copy(buf36, 0, buf, 0, n67)

	return buf36
end
function t136.decode(p104: buffer) -- line: 7294
	-- upvalues: t136 (copy), proto (copy), prop_types (copy)
	local v1009 = t136.new()
	local n68 = 0

	while n68 < buffer.len(p104) do
		local v1011, v1012

		v1011, v1012, n68 = proto.readTag(p104, n68)

		if v1012 == proto.wireTypes.varint then
			local v1013

			v1013, n68 = proto.readVarInt(p104, n68)
		elseif v1012 == proto.wireTypes.lengthDelimited then
			if v1011 == 1 then
				local v1014

				v1014, n68 = proto.readBuffer(p104, n68)
				v1009.profile_id = prop_types.StringProp.decode(v1014)
			elseif v1011 == 2 then
				local v1015

				v1015, n68 = proto.readBuffer(p104, n68)
				v1009.profile_type = prop_types.StringProp.decode(v1015)
			elseif v1011 == 3 then
				local v1016

				v1016, n68 = proto.readBuffer(p104, n68)
				v1009.source = prop_types.StringProp.decode(v1016)
			else
				local v1017, v1018 = proto.readVarInt(p104, n68)

				n68 = v1018 + v1017
			end
		elseif v1012 == proto.wireTypes.i32 then
			local v1019

			v1019, n68 = proto.readFixed32(p104, n68)
		elseif v1012 == proto.wireTypes.i64 then
			local v1020

			v1020, n68 = proto.readFixed64(p104, n68)
		else
			error("Unsupported wire type: " .. v1012)
		end
	end

	return v1009
end
function t136.jsonEncode(p105) -- line: 7347
	local t138 = {}

	if p105.profile_id ~= nil then
		t138.profileId = p105.profile_id:jsonEncode()
	end

	if p105.profile_type ~= nil then
		t138.profileType = p105.profile_type:jsonEncode()
	end

	if p105.source ~= nil then
		t138.source = p105.source:jsonEncode()
	end

	return t138
end
function t136.jsonDecode(t139: {[any]: any}) -- line: 7365
	-- upvalues: t136 (copy), prop_types (copy)
	local v1024 = t136.new()

	if t139.profile_id ~= nil then
		v1024.profile_id = prop_types.StringProp.jsonDecode(t139.profile_id)
	end

	if t139.profileId ~= nil then
		v1024.profile_id = prop_types.StringProp.jsonDecode(t139.profileId)
	end

	if t139.profile_type ~= nil then
		v1024.profile_type = prop_types.StringProp.jsonDecode(t139.profile_type)
	end

	if t139.profileType ~= nil then
		v1024.profile_type = prop_types.StringProp.jsonDecode(t139.profileType)
	end

	if t139.source ~= nil then
		v1024.source = prop_types.StringProp.jsonDecode(t139.source)
	end

	return v1024
end

t136.descriptor = {
	name = "OpenProfileAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenProfileAction_Params = t136
typeRegistry.default:register(t1.OpenProfileAction_Params)

local t140 = {}

t140.__index = t140

function t140.new(t141: {[any]: any}?) -- line: 7407
	-- upvalues: t1 (copy), t140 (copy)
	return (setmetatable({
		action_type = if t141 ~= nil and t141.action_type ~= nil then t141.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t141 ~= nil and t141.action_params ~= nil then t141.action_params else nil
	}, t140))
end
function t140.encode(p106) -- line: 7418
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n69 = 0

	if p106.action_type ~= nil and (p106.action_type ~= nil and p106.action_type ~= 0 or p106.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1029, v1030 = proto.writeTag(buf, n69, 1, proto.wireTypes.varint)

		buf, n69 = proto.writeVarInt(v1029, v1030, t1.ActionType.toNumber(p106.action_type))
	end

	if p106.action_params ~= nil then
		local v1031 = p106.action_params:encode()
		local v1032, v1033 = proto.writeTag(buf, n69, 2, proto.wireTypes.lengthDelimited)

		buf, n69 = proto.writeBuffer(v1032, v1033, v1031, buffer.len(v1031))
	end

	local buf37 = buffer.create(n69)

	buffer.copy(buf37, 0, buf, 0, n69)

	return buf37
end
function t140.decode(p107: buffer) -- line: 7444
	-- upvalues: t140 (copy), proto (copy), t1 (copy)
	local v1036 = t140.new()
	local n70 = 0

	while n70 < buffer.len(p107) do
		local v1038, v1039

		v1038, v1039, n70 = proto.readTag(p107, n70)

		if v1039 == proto.wireTypes.varint then
			if v1038 == 1 then
				local v1040

				v1040, n70 = proto.readVarIntI32(p107, n70)
				v1036.action_type = t1.ActionType.fromNumber(v1040) or v1040
			else
				local v1041

				v1041, n70 = proto.readVarInt(p107, n70)
			end
		elseif v1039 == proto.wireTypes.lengthDelimited then
			if v1038 == 2 then
				local v1042

				v1042, n70 = proto.readBuffer(p107, n70)
				v1036.action_params = t1.OpenFacialAgeEstimationAction_Params.decode(v1042)
			else
				local v1043, v1044 = proto.readVarInt(p107, n70)

				n70 = v1044 + v1043
			end
		elseif v1039 == proto.wireTypes.i32 then
			local v1045

			v1045, n70 = proto.readFixed32(p107, n70)
		elseif v1039 == proto.wireTypes.i64 then
			local v1046

			v1046, n70 = proto.readFixed64(p107, n70)
		else
			error("Unsupported wire type: " .. v1039)
		end
	end

	return v1036
end
function t140.jsonEncode(p108) -- line: 7492
	-- upvalues: t1 (copy)
	local t142 = {}

	if p108.action_type ~= nil and (p108.action_type ~= nil and p108.action_type ~= 0 or p108.action_type ~= t1.ActionType.fromNumber(0)) then
		t142.actionType = if typeof(p108.action_type) ~= "number" then t1.ActionType.toNumber(p108.action_type) else p108.action_type
	end

	if p108.action_params ~= nil then
		t142.actionParams = p108.action_params:jsonEncode()
	end

	return t142
end
function t140.jsonDecode(t143: {[any]: any}) -- line: 7514
	-- upvalues: t140 (copy), t1 (copy)
	local v1050 = t140.new()

	if t143.action_type ~= nil then
		v1050.action_type = if typeof(t143.action_type) ~= "number" then t1.ActionType.fromName(t143.action_type) or t143.action_type else t1.ActionType.fromNumber(t143.action_type) or t143.action_type
	end

	if t143.actionType ~= nil then
		v1050.action_type = if typeof(t143.actionType) ~= "number" then t1.ActionType.fromName(t143.actionType) or t143.actionType else t1.ActionType.fromNumber(t143.actionType) or t143.actionType
	end

	if t143.action_params ~= nil then
		v1050.action_params = t1.OpenFacialAgeEstimationAction_Params.jsonDecode(t143.action_params)
	end

	if t143.actionParams ~= nil then
		v1050.action_params = t1.OpenFacialAgeEstimationAction_Params.jsonDecode(t143.actionParams)
	end

	return v1050
end

t140.descriptor = {
	name = "OpenFacialAgeEstimationAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
}
t1.OpenFacialAgeEstimationAction = t140
typeRegistry.default:register(t1.OpenFacialAgeEstimationAction)

local t144 = {}

t144.__index = t144

function t144.new(t145: {[any]: any}?) -- line: 7554
	-- upvalues: t144 (copy)
	return (setmetatable({
		user_id = if t145 ~= nil and t145.user_id ~= nil then t145.user_id else nil,
		source = if t145 ~= nil and t145.source ~= nil then t145.source else nil
	}, t144))
end
function t144.encode(p109) -- line: 7563
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n71 = 0

	if p109.user_id ~= nil then
		local v1055 = p109.user_id:encode()
		local v1056, v1057 = proto.writeTag(buf, n71, 1, proto.wireTypes.lengthDelimited)

		buf, n71 = proto.writeBuffer(v1056, v1057, v1055, buffer.len(v1055))
	end

	if p109.source ~= nil then
		local v1058 = p109.source:encode()
		local v1059, v1060 = proto.writeTag(buf, n71, 2, proto.wireTypes.lengthDelimited)

		buf, n71 = proto.writeBuffer(v1059, v1060, v1058, buffer.len(v1058))
	end

	local buf38 = buffer.create(n71)

	buffer.copy(buf38, 0, buf, 0, n71)

	return buf38
end
function t144.decode(p110: buffer) -- line: 7584
	-- upvalues: t144 (copy), proto (copy), prop_types (copy)
	local v1063 = t144.new()
	local n72 = 0

	while n72 < buffer.len(p110) do
		local v1065, v1066

		v1065, v1066, n72 = proto.readTag(p110, n72)

		if v1066 == proto.wireTypes.varint then
			local v1067

			v1067, n72 = proto.readVarInt(p110, n72)
		elseif v1066 == proto.wireTypes.lengthDelimited then
			if v1065 == 1 then
				local v1068

				v1068, n72 = proto.readBuffer(p110, n72)
				v1063.user_id = prop_types.StringProp.decode(v1068)
			elseif v1065 == 2 then
				local v1069

				v1069, n72 = proto.readBuffer(p110, n72)
				v1063.source = prop_types.StringProp.decode(v1069)
			else
				local v1070, v1071 = proto.readVarInt(p110, n72)

				n72 = v1071 + v1070
			end
		elseif v1066 == proto.wireTypes.i32 then
			local v1072

			v1072, n72 = proto.readFixed32(p110, n72)
		elseif v1066 == proto.wireTypes.i64 then
			local v1073

			v1073, n72 = proto.readFixed64(p110, n72)
		else
			error("Unsupported wire type: " .. v1066)
		end
	end

	return v1063
end
function t144.jsonEncode(p111) -- line: 7632
	local t146 = {}

	if p111.user_id ~= nil then
		t146.userId = p111.user_id:jsonEncode()
	end

	if p111.source ~= nil then
		t146.source = p111.source:jsonEncode()
	end

	return t146
end
function t144.jsonDecode(t147: {[any]: any}) -- line: 7646
	-- upvalues: t144 (copy), prop_types (copy)
	local v1077 = t144.new()

	if t147.user_id ~= nil then
		v1077.user_id = prop_types.StringProp.jsonDecode(t147.user_id)
	end

	if t147.userId ~= nil then
		v1077.user_id = prop_types.StringProp.jsonDecode(t147.userId)
	end

	if t147.source ~= nil then
		v1077.source = prop_types.StringProp.jsonDecode(t147.source)
	end

	return v1077
end

t144.descriptor = {
	name = "OpenFacialAgeEstimationAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenFacialAgeEstimationAction_Params = t144
typeRegistry.default:register(t1.OpenFacialAgeEstimationAction_Params)

local t148 = {}

t148.__index = t148

function t148.new(t149: {[any]: any}?) -- line: 7680
	-- upvalues: t1 (copy), t148 (copy)
	return (setmetatable({
		action_type = if t149 ~= nil and t149.action_type ~= nil then t149.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t149 ~= nil and t149.action_params ~= nil then t149.action_params else nil
	}, t148))
end
function t148.encode(p112) -- line: 7691
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n73 = 0

	if p112.action_type ~= nil and (p112.action_type ~= nil and p112.action_type ~= 0 or p112.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1082, v1083 = proto.writeTag(buf, n73, 1, proto.wireTypes.varint)

		buf, n73 = proto.writeVarInt(v1082, v1083, t1.ActionType.toNumber(p112.action_type))
	end

	if p112.action_params ~= nil then
		local v1084 = p112.action_params:encode()
		local v1085, v1086 = proto.writeTag(buf, n73, 2, proto.wireTypes.lengthDelimited)

		buf, n73 = proto.writeBuffer(v1085, v1086, v1084, buffer.len(v1084))
	end

	local buf39 = buffer.create(n73)

	buffer.copy(buf39, 0, buf, 0, n73)

	return buf39
end
function t148.decode(p113: buffer) -- line: 7717
	-- upvalues: t148 (copy), proto (copy), t1 (copy)
	local v1089 = t148.new()
	local n74 = 0

	while n74 < buffer.len(p113) do
		local v1091, v1092

		v1091, v1092, n74 = proto.readTag(p113, n74)

		if v1092 == proto.wireTypes.varint then
			if v1091 == 1 then
				local v1093

				v1093, n74 = proto.readVarIntI32(p113, n74)
				v1089.action_type = t1.ActionType.fromNumber(v1093) or v1093
			else
				local v1094

				v1094, n74 = proto.readVarInt(p113, n74)
			end
		elseif v1092 == proto.wireTypes.lengthDelimited then
			if v1091 == 2 then
				local v1095

				v1095, n74 = proto.readBuffer(p113, n74)
				v1089.action_params = t1.OpenAddConnectionsPageAction_Params.decode(v1095)
			else
				local v1096, v1097 = proto.readVarInt(p113, n74)

				n74 = v1097 + v1096
			end
		elseif v1092 == proto.wireTypes.i32 then
			local v1098

			v1098, n74 = proto.readFixed32(p113, n74)
		elseif v1092 == proto.wireTypes.i64 then
			local v1099

			v1099, n74 = proto.readFixed64(p113, n74)
		else
			error("Unsupported wire type: " .. v1092)
		end
	end

	return v1089
end
function t148.jsonEncode(p114) -- line: 7765
	-- upvalues: t1 (copy)
	local t150 = {}

	if p114.action_type ~= nil and (p114.action_type ~= nil and p114.action_type ~= 0 or p114.action_type ~= t1.ActionType.fromNumber(0)) then
		t150.actionType = if typeof(p114.action_type) ~= "number" then t1.ActionType.toNumber(p114.action_type) else p114.action_type
	end

	if p114.action_params ~= nil then
		t150.actionParams = p114.action_params:jsonEncode()
	end

	return t150
end
function t148.jsonDecode(t151: {[any]: any}) -- line: 7787
	-- upvalues: t148 (copy), t1 (copy)
	local v1103 = t148.new()

	if t151.action_type ~= nil then
		v1103.action_type = if typeof(t151.action_type) ~= "number" then t1.ActionType.fromName(t151.action_type) or t151.action_type else t1.ActionType.fromNumber(t151.action_type) or t151.action_type
	end

	if t151.actionType ~= nil then
		v1103.action_type = if typeof(t151.actionType) ~= "number" then t1.ActionType.fromName(t151.actionType) or t151.actionType else t1.ActionType.fromNumber(t151.actionType) or t151.actionType
	end

	if t151.action_params ~= nil then
		v1103.action_params = t1.OpenAddConnectionsPageAction_Params.jsonDecode(t151.action_params)
	end

	if t151.actionParams ~= nil then
		v1103.action_params = t1.OpenAddConnectionsPageAction_Params.jsonDecode(t151.actionParams)
	end

	return v1103
end

t148.descriptor = {
	name = "OpenAddConnectionsPageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
}
t1.OpenAddConnectionsPageAction = t148
typeRegistry.default:register(t1.OpenAddConnectionsPageAction)

local t152 = {}

t152.__index = t152

function t152.new(t153: {[any]: any}?) -- line: 7827
	-- upvalues: t152 (copy)
	return (setmetatable({
		user_id = if t153 ~= nil and t153.user_id ~= nil then t153.user_id else nil,
		source = if t153 ~= nil and t153.source ~= nil then t153.source else nil
	}, t152))
end
function t152.encode(p115) -- line: 7836
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n75 = 0

	if p115.user_id ~= nil then
		local v1108 = p115.user_id:encode()
		local v1109, v1110 = proto.writeTag(buf, n75, 1, proto.wireTypes.lengthDelimited)

		buf, n75 = proto.writeBuffer(v1109, v1110, v1108, buffer.len(v1108))
	end

	if p115.source ~= nil then
		local v1111 = p115.source:encode()
		local v1112, v1113 = proto.writeTag(buf, n75, 2, proto.wireTypes.lengthDelimited)

		buf, n75 = proto.writeBuffer(v1112, v1113, v1111, buffer.len(v1111))
	end

	local buf40 = buffer.create(n75)

	buffer.copy(buf40, 0, buf, 0, n75)

	return buf40
end
function t152.decode(p116: buffer) -- line: 7857
	-- upvalues: t152 (copy), proto (copy), prop_types (copy)
	local v1116 = t152.new()
	local n76 = 0

	while n76 < buffer.len(p116) do
		local v1118, v1119

		v1118, v1119, n76 = proto.readTag(p116, n76)

		if v1119 == proto.wireTypes.varint then
			local v1120

			v1120, n76 = proto.readVarInt(p116, n76)
		elseif v1119 == proto.wireTypes.lengthDelimited then
			if v1118 == 1 then
				local v1121

				v1121, n76 = proto.readBuffer(p116, n76)
				v1116.user_id = prop_types.StringProp.decode(v1121)
			elseif v1118 == 2 then
				local v1122

				v1122, n76 = proto.readBuffer(p116, n76)
				v1116.source = prop_types.StringProp.decode(v1122)
			else
				local v1123, v1124 = proto.readVarInt(p116, n76)

				n76 = v1124 + v1123
			end
		elseif v1119 == proto.wireTypes.i32 then
			local v1125

			v1125, n76 = proto.readFixed32(p116, n76)
		elseif v1119 == proto.wireTypes.i64 then
			local v1126

			v1126, n76 = proto.readFixed64(p116, n76)
		else
			error("Unsupported wire type: " .. v1119)
		end
	end

	return v1116
end
function t152.jsonEncode(p117) -- line: 7905
	local t154 = {}

	if p117.user_id ~= nil then
		t154.userId = p117.user_id:jsonEncode()
	end

	if p117.source ~= nil then
		t154.source = p117.source:jsonEncode()
	end

	return t154
end
function t152.jsonDecode(t155: {[any]: any}) -- line: 7919
	-- upvalues: t152 (copy), prop_types (copy)
	local v1130 = t152.new()

	if t155.user_id ~= nil then
		v1130.user_id = prop_types.StringProp.jsonDecode(t155.user_id)
	end

	if t155.userId ~= nil then
		v1130.user_id = prop_types.StringProp.jsonDecode(t155.userId)
	end

	if t155.source ~= nil then
		v1130.source = prop_types.StringProp.jsonDecode(t155.source)
	end

	return v1130
end

t152.descriptor = {
	name = "OpenAddConnectionsPageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenAddConnectionsPageAction_Params = t152
typeRegistry.default:register(t1.OpenAddConnectionsPageAction_Params)

local t156 = {}

t156.__index = t156

function t156.new(t157: {[any]: any}?) -- line: 7953
	-- upvalues: t1 (copy), t156 (copy)
	return (setmetatable({
		action_type = if t157 ~= nil and t157.action_type ~= nil then t157.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t157 ~= nil and t157.action_params ~= nil then t157.action_params else nil
	}, t156))
end
function t156.encode(p118) -- line: 7962
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n77 = 0

	if p118.action_type ~= nil and (p118.action_type ~= nil and p118.action_type ~= 0 or p118.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1135, v1136 = proto.writeTag(buf, n77, 1, proto.wireTypes.varint)

		buf, n77 = proto.writeVarInt(v1135, v1136, t1.ActionType.toNumber(p118.action_type))
	end

	if p118.action_params ~= nil then
		local v1137 = p118.action_params:encode()
		local v1138, v1139 = proto.writeTag(buf, n77, 2, proto.wireTypes.lengthDelimited)

		buf, n77 = proto.writeBuffer(v1138, v1139, v1137, buffer.len(v1137))
	end

	local buf41 = buffer.create(n77)

	buffer.copy(buf41, 0, buf, 0, n77)

	return buf41
end
function t156.decode(p119: buffer) -- line: 7988
	-- upvalues: t156 (copy), proto (copy), t1 (copy)
	local v1142 = t156.new()
	local n78 = 0

	while n78 < buffer.len(p119) do
		local v1144, v1145

		v1144, v1145, n78 = proto.readTag(p119, n78)

		if v1145 == proto.wireTypes.varint then
			if v1144 == 1 then
				local v1146

				v1146, n78 = proto.readVarIntI32(p119, n78)
				v1142.action_type = t1.ActionType.fromNumber(v1146) or v1146
			else
				local v1147

				v1147, n78 = proto.readVarInt(p119, n78)
			end
		elseif v1145 == proto.wireTypes.lengthDelimited then
			if v1144 == 2 then
				local v1148

				v1148, n78 = proto.readBuffer(p119, n78)
				v1142.action_params = t1.OpenMarketplaceAction_Params.decode(v1148)
			else
				local v1149, v1150 = proto.readVarInt(p119, n78)

				n78 = v1150 + v1149
			end
		elseif v1145 == proto.wireTypes.i32 then
			local v1151

			v1151, n78 = proto.readFixed32(p119, n78)
		elseif v1145 == proto.wireTypes.i64 then
			local v1152

			v1152, n78 = proto.readFixed64(p119, n78)
		else
			error("Unsupported wire type: " .. v1145)
		end
	end

	return v1142
end
function t156.jsonEncode(p120) -- line: 8036
	-- upvalues: t1 (copy)
	local t158 = {}

	if p120.action_type ~= nil and (p120.action_type ~= nil and p120.action_type ~= 0 or p120.action_type ~= t1.ActionType.fromNumber(0)) then
		t158.actionType = if typeof(p120.action_type) ~= "number" then t1.ActionType.toNumber(p120.action_type) else p120.action_type
	end

	if p120.action_params ~= nil then
		t158.actionParams = p120.action_params:jsonEncode()
	end

	return t158
end
function t156.jsonDecode(t159: {[any]: any}) -- line: 8058
	-- upvalues: t156 (copy), t1 (copy)
	local v1156 = t156.new()

	if t159.action_type ~= nil then
		v1156.action_type = if typeof(t159.action_type) ~= "number" then t1.ActionType.fromName(t159.action_type) or t159.action_type else t1.ActionType.fromNumber(t159.action_type) or t159.action_type
	end

	if t159.actionType ~= nil then
		v1156.action_type = if typeof(t159.actionType) ~= "number" then t1.ActionType.fromName(t159.actionType) or t159.actionType else t1.ActionType.fromNumber(t159.actionType) or t159.actionType
	end

	if t159.action_params ~= nil then
		v1156.action_params = t1.OpenMarketplaceAction_Params.jsonDecode(t159.action_params)
	end

	if t159.actionParams ~= nil then
		v1156.action_params = t1.OpenMarketplaceAction_Params.jsonDecode(t159.actionParams)
	end

	return v1156
end

t156.descriptor = {
	name = "OpenMarketplaceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
}
t1.OpenMarketplaceAction = t156
typeRegistry.default:register(t1.OpenMarketplaceAction)

local t160 = {}

t160.__index = t160

function t160.new(t161: {[any]: any}?) -- line: 8098
	-- upvalues: t160 (copy)
	return (setmetatable({
		user_id = if t161 ~= nil and t161.user_id ~= nil then t161.user_id else nil,
		source = if t161 ~= nil and t161.source ~= nil then t161.source else nil
	}, t160))
end
function t160.encode(p121) -- line: 8107
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n79 = 0

	if p121.user_id ~= nil then
		local v1161 = p121.user_id:encode()
		local v1162, v1163 = proto.writeTag(buf, n79, 1, proto.wireTypes.lengthDelimited)

		buf, n79 = proto.writeBuffer(v1162, v1163, v1161, buffer.len(v1161))
	end

	if p121.source ~= nil then
		local v1164 = p121.source:encode()
		local v1165, v1166 = proto.writeTag(buf, n79, 2, proto.wireTypes.lengthDelimited)

		buf, n79 = proto.writeBuffer(v1165, v1166, v1164, buffer.len(v1164))
	end

	local buf42 = buffer.create(n79)

	buffer.copy(buf42, 0, buf, 0, n79)

	return buf42
end
function t160.decode(p122: buffer) -- line: 8128
	-- upvalues: t160 (copy), proto (copy), prop_types (copy)
	local v1169 = t160.new()
	local n80 = 0

	while n80 < buffer.len(p122) do
		local v1171, v1172

		v1171, v1172, n80 = proto.readTag(p122, n80)

		if v1172 == proto.wireTypes.varint then
			local v1173

			v1173, n80 = proto.readVarInt(p122, n80)
		elseif v1172 == proto.wireTypes.lengthDelimited then
			if v1171 == 1 then
				local v1174

				v1174, n80 = proto.readBuffer(p122, n80)
				v1169.user_id = prop_types.StringProp.decode(v1174)
			elseif v1171 == 2 then
				local v1175

				v1175, n80 = proto.readBuffer(p122, n80)
				v1169.source = prop_types.StringProp.decode(v1175)
			else
				local v1176, v1177 = proto.readVarInt(p122, n80)

				n80 = v1177 + v1176
			end
		elseif v1172 == proto.wireTypes.i32 then
			local v1178

			v1178, n80 = proto.readFixed32(p122, n80)
		elseif v1172 == proto.wireTypes.i64 then
			local v1179

			v1179, n80 = proto.readFixed64(p122, n80)
		else
			error("Unsupported wire type: " .. v1172)
		end
	end

	return v1169
end
function t160.jsonEncode(p123) -- line: 8176
	local t162 = {}

	if p123.user_id ~= nil then
		t162.userId = p123.user_id:jsonEncode()
	end

	if p123.source ~= nil then
		t162.source = p123.source:jsonEncode()
	end

	return t162
end
function t160.jsonDecode(t163: {[any]: any}) -- line: 8190
	-- upvalues: t160 (copy), prop_types (copy)
	local v1183 = t160.new()

	if t163.user_id ~= nil then
		v1183.user_id = prop_types.StringProp.jsonDecode(t163.user_id)
	end

	if t163.userId ~= nil then
		v1183.user_id = prop_types.StringProp.jsonDecode(t163.userId)
	end

	if t163.source ~= nil then
		v1183.source = prop_types.StringProp.jsonDecode(t163.source)
	end

	return v1183
end

t160.descriptor = {
	name = "OpenMarketplaceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenMarketplaceAction_Params = t160
typeRegistry.default:register(t1.OpenMarketplaceAction_Params)

local t164 = {}

t164.__index = t164

function t164.new(t165: {[any]: any}?) -- line: 8222
	-- upvalues: t1 (copy), t164 (copy)
	return (setmetatable({
		action_type = if t165 ~= nil and t165.action_type ~= nil then t165.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t165 ~= nil and t165.action_params ~= nil then t165.action_params else nil
	}, t164))
end
function t164.encode(p124) -- line: 8233
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n81 = 0

	if p124.action_type ~= nil and (p124.action_type ~= nil and p124.action_type ~= 0 or p124.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1188, v1189 = proto.writeTag(buf, n81, 1, proto.wireTypes.varint)

		buf, n81 = proto.writeVarInt(v1188, v1189, t1.ActionType.toNumber(p124.action_type))
	end

	if p124.action_params ~= nil then
		local v1190 = p124.action_params:encode()
		local v1191, v1192 = proto.writeTag(buf, n81, 2, proto.wireTypes.lengthDelimited)

		buf, n81 = proto.writeBuffer(v1191, v1192, v1190, buffer.len(v1190))
	end

	local buf43 = buffer.create(n81)

	buffer.copy(buf43, 0, buf, 0, n81)

	return buf43
end
function t164.decode(p125: buffer) -- line: 8259
	-- upvalues: t164 (copy), proto (copy), t1 (copy)
	local v1195 = t164.new()
	local n82 = 0

	while n82 < buffer.len(p125) do
		local v1197, v1198

		v1197, v1198, n82 = proto.readTag(p125, n82)

		if v1198 == proto.wireTypes.varint then
			if v1197 == 1 then
				local v1199

				v1199, n82 = proto.readVarIntI32(p125, n82)
				v1195.action_type = t1.ActionType.fromNumber(v1199) or v1199
			else
				local v1200

				v1200, n82 = proto.readVarInt(p125, n82)
			end
		elseif v1198 == proto.wireTypes.lengthDelimited then
			if v1197 == 2 then
				local v1201

				v1201, n82 = proto.readBuffer(p125, n82)
				v1195.action_params = t1.HideProfileCompletionAction_Params.decode(v1201)
			else
				local v1202, v1203 = proto.readVarInt(p125, n82)

				n82 = v1203 + v1202
			end
		elseif v1198 == proto.wireTypes.i32 then
			local v1204

			v1204, n82 = proto.readFixed32(p125, n82)
		elseif v1198 == proto.wireTypes.i64 then
			local v1205

			v1205, n82 = proto.readFixed64(p125, n82)
		else
			error("Unsupported wire type: " .. v1198)
		end
	end

	return v1195
end
function t164.jsonEncode(p126) -- line: 8307
	-- upvalues: t1 (copy)
	local t166 = {}

	if p126.action_type ~= nil and (p126.action_type ~= nil and p126.action_type ~= 0 or p126.action_type ~= t1.ActionType.fromNumber(0)) then
		t166.actionType = if typeof(p126.action_type) ~= "number" then t1.ActionType.toNumber(p126.action_type) else p126.action_type
	end

	if p126.action_params ~= nil then
		t166.actionParams = p126.action_params:jsonEncode()
	end

	return t166
end
function t164.jsonDecode(t167: {[any]: any}) -- line: 8329
	-- upvalues: t164 (copy), t1 (copy)
	local v1209 = t164.new()

	if t167.action_type ~= nil then
		v1209.action_type = if typeof(t167.action_type) ~= "number" then t1.ActionType.fromName(t167.action_type) or t167.action_type else t1.ActionType.fromNumber(t167.action_type) or t167.action_type
	end

	if t167.actionType ~= nil then
		v1209.action_type = if typeof(t167.actionType) ~= "number" then t1.ActionType.fromName(t167.actionType) or t167.actionType else t1.ActionType.fromNumber(t167.actionType) or t167.actionType
	end

	if t167.action_params ~= nil then
		v1209.action_params = t1.HideProfileCompletionAction_Params.jsonDecode(t167.action_params)
	end

	if t167.actionParams ~= nil then
		v1209.action_params = t1.HideProfileCompletionAction_Params.jsonDecode(t167.actionParams)
	end

	return v1209
end

t164.descriptor = {
	name = "HideProfileCompletionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
}
t1.HideProfileCompletionAction = t164
typeRegistry.default:register(t1.HideProfileCompletionAction)

local t168 = {}

t168.__index = t168

function t168.new(t169: {[any]: any}?) -- line: 8369
	-- upvalues: t168 (copy)
	return (setmetatable({
		user_id = if t169 ~= nil and t169.user_id ~= nil then t169.user_id else nil,
		prompt_id = if t169 ~= nil and t169.prompt_id ~= nil then t169.prompt_id else nil,
		source = if t169 ~= nil and t169.source ~= nil then t169.source else nil,
		prompt_type = if t169 ~= nil and t169.prompt_type ~= nil then t169.prompt_type else nil
	}, t168))
end
function t168.encode(p127) -- line: 8380
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n83 = 0

	if p127.user_id ~= nil then
		local v1214 = p127.user_id:encode()
		local v1215, v1216 = proto.writeTag(buf, n83, 1, proto.wireTypes.lengthDelimited)

		buf, n83 = proto.writeBuffer(v1215, v1216, v1214, buffer.len(v1214))
	end

	if p127.prompt_id ~= nil then
		local v1217 = p127.prompt_id:encode()
		local v1218, v1219 = proto.writeTag(buf, n83, 2, proto.wireTypes.lengthDelimited)

		buf, n83 = proto.writeBuffer(v1218, v1219, v1217, buffer.len(v1217))
	end

	if p127.source ~= nil then
		local v1220 = p127.source:encode()
		local v1221, v1222 = proto.writeTag(buf, n83, 3, proto.wireTypes.lengthDelimited)

		buf, n83 = proto.writeBuffer(v1221, v1222, v1220, buffer.len(v1220))
	end

	if p127.prompt_type ~= nil then
		local v1223 = p127.prompt_type:encode()
		local v1224, v1225 = proto.writeTag(buf, n83, 4, proto.wireTypes.lengthDelimited)

		buf, n83 = proto.writeBuffer(v1224, v1225, v1223, buffer.len(v1223))
	end

	local buf44 = buffer.create(n83)

	buffer.copy(buf44, 0, buf, 0, n83)

	return buf44
end
function t168.decode(p128: buffer) -- line: 8413
	-- upvalues: t168 (copy), proto (copy), prop_types (copy)
	local v1228 = t168.new()
	local n84 = 0

	while n84 < buffer.len(p128) do
		local v1230, v1231

		v1230, v1231, n84 = proto.readTag(p128, n84)

		if v1231 == proto.wireTypes.varint then
			local v1232

			v1232, n84 = proto.readVarInt(p128, n84)
		elseif v1231 == proto.wireTypes.lengthDelimited then
			if v1230 == 1 then
				local v1233

				v1233, n84 = proto.readBuffer(p128, n84)
				v1228.user_id = prop_types.StringProp.decode(v1233)
			elseif v1230 == 2 then
				local v1234

				v1234, n84 = proto.readBuffer(p128, n84)
				v1228.prompt_id = prop_types.StringProp.decode(v1234)
			elseif v1230 == 3 then
				local v1235

				v1235, n84 = proto.readBuffer(p128, n84)
				v1228.source = prop_types.StringProp.decode(v1235)
			elseif v1230 == 4 then
				local v1236

				v1236, n84 = proto.readBuffer(p128, n84)
				v1228.prompt_type = prop_types.StringProp.decode(v1236)
			else
				local v1237, v1238 = proto.readVarInt(p128, n84)

				n84 = v1238 + v1237
			end
		elseif v1231 == proto.wireTypes.i32 then
			local v1239

			v1239, n84 = proto.readFixed32(p128, n84)
		elseif v1231 == proto.wireTypes.i64 then
			local v1240

			v1240, n84 = proto.readFixed64(p128, n84)
		else
			error("Unsupported wire type: " .. v1231)
		end
	end

	return v1228
end
function t168.jsonEncode(p129) -- line: 8471
	local t170 = {}

	if p129.user_id ~= nil then
		t170.userId = p129.user_id:jsonEncode()
	end

	if p129.prompt_id ~= nil then
		t170.promptId = p129.prompt_id:jsonEncode()
	end

	if p129.source ~= nil then
		t170.source = p129.source:jsonEncode()
	end

	if p129.prompt_type ~= nil then
		t170.promptType = p129.prompt_type:jsonEncode()
	end

	return t170
end
function t168.jsonDecode(t171: {[any]: any}) -- line: 8493
	-- upvalues: t168 (copy), prop_types (copy)
	local v1244 = t168.new()

	if t171.user_id ~= nil then
		v1244.user_id = prop_types.StringProp.jsonDecode(t171.user_id)
	end

	if t171.userId ~= nil then
		v1244.user_id = prop_types.StringProp.jsonDecode(t171.userId)
	end

	if t171.prompt_id ~= nil then
		v1244.prompt_id = prop_types.StringProp.jsonDecode(t171.prompt_id)
	end

	if t171.promptId ~= nil then
		v1244.prompt_id = prop_types.StringProp.jsonDecode(t171.promptId)
	end

	if t171.source ~= nil then
		v1244.source = prop_types.StringProp.jsonDecode(t171.source)
	end

	if t171.prompt_type ~= nil then
		v1244.prompt_type = prop_types.StringProp.jsonDecode(t171.prompt_type)
	end

	if t171.promptType ~= nil then
		v1244.prompt_type = prop_types.StringProp.jsonDecode(t171.promptType)
	end

	return v1244
end

t168.descriptor = {
	name = "HideProfileCompletionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.HideProfileCompletionAction_Params = t168
typeRegistry.default:register(t1.HideProfileCompletionAction_Params)

local t172 = {}

t172.__index = t172

function t172.new(t173: {[any]: any}?) -- line: 8544
	-- upvalues: t1 (copy), t172 (copy)
	return (setmetatable({
		action_type = if t173 ~= nil and t173.action_type ~= nil then t173.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t173 ~= nil and t173.action_params ~= nil then t173.action_params else nil
	}, t172))
end
function t172.encode(p130) -- line: 8555
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n85 = 0

	if p130.action_type ~= nil and (p130.action_type ~= nil and p130.action_type ~= 0 or p130.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1249, v1250 = proto.writeTag(buf, n85, 1, proto.wireTypes.varint)

		buf, n85 = proto.writeVarInt(v1249, v1250, t1.ActionType.toNumber(p130.action_type))
	end

	if p130.action_params ~= nil then
		local v1251 = p130.action_params:encode()
		local v1252, v1253 = proto.writeTag(buf, n85, 2, proto.wireTypes.lengthDelimited)

		buf, n85 = proto.writeBuffer(v1252, v1253, v1251, buffer.len(v1251))
	end

	local buf45 = buffer.create(n85)

	buffer.copy(buf45, 0, buf, 0, n85)

	return buf45
end
function t172.decode(p131: buffer) -- line: 8581
	-- upvalues: t172 (copy), proto (copy), t1 (copy)
	local v1256 = t172.new()
	local n86 = 0

	while n86 < buffer.len(p131) do
		local v1258, v1259

		v1258, v1259, n86 = proto.readTag(p131, n86)

		if v1259 == proto.wireTypes.varint then
			if v1258 == 1 then
				local v1260

				v1260, n86 = proto.readVarIntI32(p131, n86)
				v1256.action_type = t1.ActionType.fromNumber(v1260) or v1260
			else
				local v1261

				v1261, n86 = proto.readVarInt(p131, n86)
			end
		elseif v1259 == proto.wireTypes.lengthDelimited then
			if v1258 == 2 then
				local v1262

				v1262, n86 = proto.readBuffer(p131, n86)
				v1256.action_params = t1.SelectMarketplaceCatalogCategory_Params.decode(v1262)
			else
				local v1263, v1264 = proto.readVarInt(p131, n86)

				n86 = v1264 + v1263
			end
		elseif v1259 == proto.wireTypes.i32 then
			local v1265

			v1265, n86 = proto.readFixed32(p131, n86)
		elseif v1259 == proto.wireTypes.i64 then
			local v1266

			v1266, n86 = proto.readFixed64(p131, n86)
		else
			error("Unsupported wire type: " .. v1259)
		end
	end

	return v1256
end
function t172.jsonEncode(p132) -- line: 8629
	-- upvalues: t1 (copy)
	local t174 = {}

	if p132.action_type ~= nil and (p132.action_type ~= nil and p132.action_type ~= 0 or p132.action_type ~= t1.ActionType.fromNumber(0)) then
		t174.actionType = if typeof(p132.action_type) ~= "number" then t1.ActionType.toNumber(p132.action_type) else p132.action_type
	end

	if p132.action_params ~= nil then
		t174.actionParams = p132.action_params:jsonEncode()
	end

	return t174
end
function t172.jsonDecode(t175: {[any]: any}) -- line: 8651
	-- upvalues: t172 (copy), t1 (copy)
	local v1270 = t172.new()

	if t175.action_type ~= nil then
		v1270.action_type = if typeof(t175.action_type) ~= "number" then t1.ActionType.fromName(t175.action_type) or t175.action_type else t1.ActionType.fromNumber(t175.action_type) or t175.action_type
	end

	if t175.actionType ~= nil then
		v1270.action_type = if typeof(t175.actionType) ~= "number" then t1.ActionType.fromName(t175.actionType) or t175.actionType else t1.ActionType.fromNumber(t175.actionType) or t175.actionType
	end

	if t175.action_params ~= nil then
		v1270.action_params = t1.SelectMarketplaceCatalogCategory_Params.jsonDecode(t175.action_params)
	end

	if t175.actionParams ~= nil then
		v1270.action_params = t1.SelectMarketplaceCatalogCategory_Params.jsonDecode(t175.actionParams)
	end

	return v1270
end

t172.descriptor = {
	name = "SelectMarketplaceCatalogCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
}
t1.SelectMarketplaceCatalogCategory = t172
typeRegistry.default:register(t1.SelectMarketplaceCatalogCategory)

local t176 = {}

t176.__index = t176

function t176.new(t177: {[any]: any}?) -- line: 8693
	-- upvalues: t176 (copy)
	return (setmetatable({
		category_id = if t177 ~= nil and t177.category_id ~= nil then t177.category_id else nil
	}, t176))
end
function t176.encode(p133) -- line: 8701
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n87 = 0

	if p133.category_id ~= nil then
		local v1275 = p133.category_id:encode()
		local v1276, v1277 = proto.writeTag(buf, n87, 1, proto.wireTypes.lengthDelimited)

		buf, n87 = proto.writeBuffer(v1276, v1277, v1275, buffer.len(v1275))
	end

	local buf46 = buffer.create(n87)

	buffer.copy(buf46, 0, buf, 0, n87)

	return buf46
end
function t176.decode(p134: buffer) -- line: 8716
	-- upvalues: t176 (copy), proto (copy), prop_types (copy)
	local v1280 = t176.new()
	local n88 = 0

	while n88 < buffer.len(p134) do
		local v1282, v1283

		v1282, v1283, n88 = proto.readTag(p134, n88)

		if v1283 == proto.wireTypes.varint then
			local v1284

			v1284, n88 = proto.readVarInt(p134, n88)
		elseif v1283 == proto.wireTypes.lengthDelimited then
			if v1282 == 1 then
				local v1285

				v1285, n88 = proto.readBuffer(p134, n88)
				v1280.category_id = prop_types.StringProp.decode(v1285)
			else
				local v1286, v1287 = proto.readVarInt(p134, n88)

				n88 = v1287 + v1286
			end
		elseif v1283 == proto.wireTypes.i32 then
			local v1288

			v1288, n88 = proto.readFixed32(p134, n88)
		elseif v1283 == proto.wireTypes.i64 then
			local v1289

			v1289, n88 = proto.readFixed64(p134, n88)
		else
			error("Unsupported wire type: " .. v1283)
		end
	end

	return v1280
end
function t176.jsonEncode(p135) -- line: 8759
	local t178 = {}

	if p135.category_id ~= nil then
		t178.categoryId = p135.category_id:jsonEncode()
	end

	return t178
end
function t176.jsonDecode(t179: {[any]: any}) -- line: 8769
	-- upvalues: t176 (copy), prop_types (copy)
	local v1293 = t176.new()

	if t179.category_id ~= nil then
		v1293.category_id = prop_types.StringProp.jsonDecode(t179.category_id)
	end

	if t179.categoryId ~= nil then
		v1293.category_id = prop_types.StringProp.jsonDecode(t179.categoryId)
	end

	return v1293
end

t176.descriptor = {
	name = "SelectMarketplaceCatalogCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.SelectMarketplaceCatalogCategory_Params = t176
typeRegistry.default:register(t1.SelectMarketplaceCatalogCategory_Params)

local t180 = {}

t180.__index = t180

function t180.new(t181: {[any]: any}?) -- line: 8800
	-- upvalues: t1 (copy), t180 (copy)
	return (setmetatable({
		action_type = if t181 ~= nil and t181.action_type ~= nil then t181.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t181 ~= nil and t181.action_params ~= nil then t181.action_params else nil
	}, t180))
end
function t180.encode(p136) -- line: 8811
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n89 = 0

	if p136.action_type ~= nil and (p136.action_type ~= nil and p136.action_type ~= 0 or p136.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1298, v1299 = proto.writeTag(buf, n89, 1, proto.wireTypes.varint)

		buf, n89 = proto.writeVarInt(v1298, v1299, t1.ActionType.toNumber(p136.action_type))
	end

	if p136.action_params ~= nil then
		local v1300 = p136.action_params:encode()
		local v1301, v1302 = proto.writeTag(buf, n89, 2, proto.wireTypes.lengthDelimited)

		buf, n89 = proto.writeBuffer(v1301, v1302, v1300, buffer.len(v1300))
	end

	local buf47 = buffer.create(n89)

	buffer.copy(buf47, 0, buf, 0, n89)

	return buf47
end
function t180.decode(p137: buffer) -- line: 8837
	-- upvalues: t180 (copy), proto (copy), t1 (copy)
	local v1305 = t180.new()
	local n90 = 0

	while n90 < buffer.len(p137) do
		local v1307, v1308

		v1307, v1308, n90 = proto.readTag(p137, n90)

		if v1308 == proto.wireTypes.varint then
			if v1307 == 1 then
				local v1309

				v1309, n90 = proto.readVarIntI32(p137, n90)
				v1305.action_type = t1.ActionType.fromNumber(v1309) or v1309
			else
				local v1310

				v1310, n90 = proto.readVarInt(p137, n90)
			end
		elseif v1308 == proto.wireTypes.lengthDelimited then
			if v1307 == 2 then
				local v1311

				v1311, n90 = proto.readBuffer(p137, n90)
				v1305.action_params = t1.SelectMarketplaceCatalogSubcategory_Params.decode(v1311)
			else
				local v1312, v1313 = proto.readVarInt(p137, n90)

				n90 = v1313 + v1312
			end
		elseif v1308 == proto.wireTypes.i32 then
			local v1314

			v1314, n90 = proto.readFixed32(p137, n90)
		elseif v1308 == proto.wireTypes.i64 then
			local v1315

			v1315, n90 = proto.readFixed64(p137, n90)
		else
			error("Unsupported wire type: " .. v1308)
		end
	end

	return v1305
end
function t180.jsonEncode(p138) -- line: 8885
	-- upvalues: t1 (copy)
	local t182 = {}

	if p138.action_type ~= nil and (p138.action_type ~= nil and p138.action_type ~= 0 or p138.action_type ~= t1.ActionType.fromNumber(0)) then
		t182.actionType = if typeof(p138.action_type) ~= "number" then t1.ActionType.toNumber(p138.action_type) else p138.action_type
	end

	if p138.action_params ~= nil then
		t182.actionParams = p138.action_params:jsonEncode()
	end

	return t182
end
function t180.jsonDecode(t183: {[any]: any}) -- line: 8907
	-- upvalues: t180 (copy), t1 (copy)
	local v1319 = t180.new()

	if t183.action_type ~= nil then
		v1319.action_type = if typeof(t183.action_type) ~= "number" then t1.ActionType.fromName(t183.action_type) or t183.action_type else t1.ActionType.fromNumber(t183.action_type) or t183.action_type
	end

	if t183.actionType ~= nil then
		v1319.action_type = if typeof(t183.actionType) ~= "number" then t1.ActionType.fromName(t183.actionType) or t183.actionType else t1.ActionType.fromNumber(t183.actionType) or t183.actionType
	end

	if t183.action_params ~= nil then
		v1319.action_params = t1.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(t183.action_params)
	end

	if t183.actionParams ~= nil then
		v1319.action_params = t1.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(t183.actionParams)
	end

	return v1319
end

t180.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
}
t1.SelectMarketplaceCatalogSubcategory = t180
typeRegistry.default:register(t1.SelectMarketplaceCatalogSubcategory)

local t184 = {}

t184.__index = t184

function t184.new(t185: {[any]: any}?) -- line: 8949
	-- upvalues: t184 (copy)
	return (setmetatable({
		subcategory_id = if t185 ~= nil and t185.subcategory_id ~= nil then t185.subcategory_id else nil
	}, t184))
end
function t184.encode(p139) -- line: 8957
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n91 = 0

	if p139.subcategory_id ~= nil then
		local v1324 = p139.subcategory_id:encode()
		local v1325, v1326 = proto.writeTag(buf, n91, 1, proto.wireTypes.lengthDelimited)

		buf, n91 = proto.writeBuffer(v1325, v1326, v1324, buffer.len(v1324))
	end

	local buf48 = buffer.create(n91)

	buffer.copy(buf48, 0, buf, 0, n91)

	return buf48
end
function t184.decode(p140: buffer) -- line: 8974
	-- upvalues: t184 (copy), proto (copy), prop_types (copy)
	local v1329 = t184.new()
	local n92 = 0

	while n92 < buffer.len(p140) do
		local v1331, v1332

		v1331, v1332, n92 = proto.readTag(p140, n92)

		if v1332 == proto.wireTypes.varint then
			local v1333

			v1333, n92 = proto.readVarInt(p140, n92)
		elseif v1332 == proto.wireTypes.lengthDelimited then
			if v1331 == 1 then
				local v1334

				v1334, n92 = proto.readBuffer(p140, n92)
				v1329.subcategory_id = prop_types.StringProp.decode(v1334)
			else
				local v1335, v1336 = proto.readVarInt(p140, n92)

				n92 = v1336 + v1335
			end
		elseif v1332 == proto.wireTypes.i32 then
			local v1337

			v1337, n92 = proto.readFixed32(p140, n92)
		elseif v1332 == proto.wireTypes.i64 then
			local v1338

			v1338, n92 = proto.readFixed64(p140, n92)
		else
			error("Unsupported wire type: " .. v1332)
		end
	end

	return v1329
end
function t184.jsonEncode(p141) -- line: 9019
	local t186 = {}

	if p141.subcategory_id ~= nil then
		t186.subcategoryId = p141.subcategory_id:jsonEncode()
	end

	return t186
end
function t184.jsonDecode(t187: {[any]: any}) -- line: 9031
	-- upvalues: t184 (copy), prop_types (copy)
	local v1342 = t184.new()

	if t187.subcategory_id ~= nil then
		v1342.subcategory_id = prop_types.StringProp.jsonDecode(t187.subcategory_id)
	end

	if t187.subcategoryId ~= nil then
		v1342.subcategory_id = prop_types.StringProp.jsonDecode(t187.subcategoryId)
	end

	return v1342
end

t184.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.SelectMarketplaceCatalogSubcategory_Params = t184
typeRegistry.default:register(t1.SelectMarketplaceCatalogSubcategory_Params)

local t188 = {}

t188.__index = t188

function t188.new(t189: {[any]: any}?) -- line: 9063
	-- upvalues: t1 (copy), t188 (copy)
	return (setmetatable({
		action_type = if t189 ~= nil and t189.action_type ~= nil then t189.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t189 ~= nil and t189.action_params ~= nil then t189.action_params else nil
	}, t188))
end
function t188.encode(p142) -- line: 9074
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n93 = 0

	if p142.action_type ~= nil and (p142.action_type ~= nil and p142.action_type ~= 0 or p142.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1347, v1348 = proto.writeTag(buf, n93, 1, proto.wireTypes.varint)

		buf, n93 = proto.writeVarInt(v1347, v1348, t1.ActionType.toNumber(p142.action_type))
	end

	if p142.action_params ~= nil then
		local v1349 = p142.action_params:encode()
		local v1350, v1351 = proto.writeTag(buf, n93, 2, proto.wireTypes.lengthDelimited)

		buf, n93 = proto.writeBuffer(v1350, v1351, v1349, buffer.len(v1349))
	end

	local buf49 = buffer.create(n93)

	buffer.copy(buf49, 0, buf, 0, n93)

	return buf49
end
function t188.decode(p143: buffer) -- line: 9100
	-- upvalues: t188 (copy), proto (copy), t1 (copy)
	local v1354 = t188.new()
	local n94 = 0

	while n94 < buffer.len(p143) do
		local v1356, v1357

		v1356, v1357, n94 = proto.readTag(p143, n94)

		if v1357 == proto.wireTypes.varint then
			if v1356 == 1 then
				local v1358

				v1358, n94 = proto.readVarIntI32(p143, n94)
				v1354.action_type = t1.ActionType.fromNumber(v1358) or v1358
			else
				local v1359

				v1359, n94 = proto.readVarInt(p143, n94)
			end
		elseif v1357 == proto.wireTypes.lengthDelimited then
			if v1356 == 2 then
				local v1360

				v1360, n94 = proto.readBuffer(p143, n94)
				v1354.action_params = t1.OpenMarketplaceCatalogSeeAll_Params.decode(v1360)
			else
				local v1361, v1362 = proto.readVarInt(p143, n94)

				n94 = v1362 + v1361
			end
		elseif v1357 == proto.wireTypes.i32 then
			local v1363

			v1363, n94 = proto.readFixed32(p143, n94)
		elseif v1357 == proto.wireTypes.i64 then
			local v1364

			v1364, n94 = proto.readFixed64(p143, n94)
		else
			error("Unsupported wire type: " .. v1357)
		end
	end

	return v1354
end
function t188.jsonEncode(p144) -- line: 9148
	-- upvalues: t1 (copy)
	local t190 = {}

	if p144.action_type ~= nil and (p144.action_type ~= nil and p144.action_type ~= 0 or p144.action_type ~= t1.ActionType.fromNumber(0)) then
		t190.actionType = if typeof(p144.action_type) ~= "number" then t1.ActionType.toNumber(p144.action_type) else p144.action_type
	end

	if p144.action_params ~= nil then
		t190.actionParams = p144.action_params:jsonEncode()
	end

	return t190
end
function t188.jsonDecode(t191: {[any]: any}) -- line: 9170
	-- upvalues: t188 (copy), t1 (copy)
	local v1368 = t188.new()

	if t191.action_type ~= nil then
		v1368.action_type = if typeof(t191.action_type) ~= "number" then t1.ActionType.fromName(t191.action_type) or t191.action_type else t1.ActionType.fromNumber(t191.action_type) or t191.action_type
	end

	if t191.actionType ~= nil then
		v1368.action_type = if typeof(t191.actionType) ~= "number" then t1.ActionType.fromName(t191.actionType) or t191.actionType else t1.ActionType.fromNumber(t191.actionType) or t191.actionType
	end

	if t191.action_params ~= nil then
		v1368.action_params = t1.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(t191.action_params)
	end

	if t191.actionParams ~= nil then
		v1368.action_params = t1.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(t191.actionParams)
	end

	return v1368
end

t188.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
}
t1.OpenMarketplaceCatalogSeeAll = t188
typeRegistry.default:register(t1.OpenMarketplaceCatalogSeeAll)

local t192 = {}

t192.__index = t192

function t192.new(t193: {[any]: any}?) -- line: 9210
	-- upvalues: t192 (copy)
	return (setmetatable({
		sort_id = if t193 ~= nil and t193.sort_id ~= nil then t193.sort_id else nil,
		title = if t193 ~= nil and t193.title ~= nil then t193.title else nil,
		description = if t193 ~= nil and t193.description ~= nil then t193.description else nil,
		tooltip_text = if t193 ~= nil and t193.tooltip_text ~= nil then t193.tooltip_text else nil
	}, t192))
end
function t192.encode(p145) -- line: 9221
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n95 = 0

	if p145.sort_id ~= nil then
		local v1373 = p145.sort_id:encode()
		local v1374, v1375 = proto.writeTag(buf, n95, 1, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeBuffer(v1374, v1375, v1373, buffer.len(v1373))
	end

	if p145.title ~= nil then
		local v1376 = p145.title:encode()
		local v1377, v1378 = proto.writeTag(buf, n95, 2, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeBuffer(v1377, v1378, v1376, buffer.len(v1376))
	end

	if p145.description ~= nil then
		local v1379 = p145.description:encode()
		local v1380, v1381 = proto.writeTag(buf, n95, 3, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeBuffer(v1380, v1381, v1379, buffer.len(v1379))
	end

	if p145.tooltip_text ~= nil then
		local v1382 = p145.tooltip_text:encode()
		local v1383, v1384 = proto.writeTag(buf, n95, 4, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeBuffer(v1383, v1384, v1382, buffer.len(v1382))
	end

	local buf50 = buffer.create(n95)

	buffer.copy(buf50, 0, buf, 0, n95)

	return buf50
end
function t192.decode(p146: buffer) -- line: 9254
	-- upvalues: t192 (copy), proto (copy), prop_types (copy)
	local v1387 = t192.new()
	local n96 = 0

	while n96 < buffer.len(p146) do
		local v1389, v1390

		v1389, v1390, n96 = proto.readTag(p146, n96)

		if v1390 == proto.wireTypes.varint then
			local v1391

			v1391, n96 = proto.readVarInt(p146, n96)
		elseif v1390 == proto.wireTypes.lengthDelimited then
			if v1389 == 1 then
				local v1392

				v1392, n96 = proto.readBuffer(p146, n96)
				v1387.sort_id = prop_types.StringProp.decode(v1392)
			elseif v1389 == 2 then
				local v1393

				v1393, n96 = proto.readBuffer(p146, n96)
				v1387.title = prop_types.StringProp.decode(v1393)
			elseif v1389 == 3 then
				local v1394

				v1394, n96 = proto.readBuffer(p146, n96)
				v1387.description = prop_types.StringProp.decode(v1394)
			elseif v1389 == 4 then
				local v1395

				v1395, n96 = proto.readBuffer(p146, n96)
				v1387.tooltip_text = prop_types.StringProp.decode(v1395)
			else
				local v1396, v1397 = proto.readVarInt(p146, n96)

				n96 = v1397 + v1396
			end
		elseif v1390 == proto.wireTypes.i32 then
			local v1398

			v1398, n96 = proto.readFixed32(p146, n96)
		elseif v1390 == proto.wireTypes.i64 then
			local v1399

			v1399, n96 = proto.readFixed64(p146, n96)
		else
			error("Unsupported wire type: " .. v1390)
		end
	end

	return v1387
end
function t192.jsonEncode(p147) -- line: 9312
	local t194 = {}

	if p147.sort_id ~= nil then
		t194.sortId = p147.sort_id:jsonEncode()
	end

	if p147.title ~= nil then
		t194.title = p147.title:jsonEncode()
	end

	if p147.description ~= nil then
		t194.description = p147.description:jsonEncode()
	end

	if p147.tooltip_text ~= nil then
		t194.tooltipText = p147.tooltip_text:jsonEncode()
	end

	return t194
end
function t192.jsonDecode(t195: {[any]: any}) -- line: 9334
	-- upvalues: t192 (copy), prop_types (copy)
	local v1403 = t192.new()

	if t195.sort_id ~= nil then
		v1403.sort_id = prop_types.StringProp.jsonDecode(t195.sort_id)
	end

	if t195.sortId ~= nil then
		v1403.sort_id = prop_types.StringProp.jsonDecode(t195.sortId)
	end

	if t195.title ~= nil then
		v1403.title = prop_types.StringProp.jsonDecode(t195.title)
	end

	if t195.description ~= nil then
		v1403.description = prop_types.StringProp.jsonDecode(t195.description)
	end

	if t195.tooltip_text ~= nil then
		v1403.tooltip_text = prop_types.StringProp.jsonDecode(t195.tooltip_text)
	end

	if t195.tooltipText ~= nil then
		v1403.tooltip_text = prop_types.StringProp.jsonDecode(t195.tooltipText)
	end

	return v1403
end

t192.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenMarketplaceCatalogSeeAll_Params = t192
typeRegistry.default:register(t1.OpenMarketplaceCatalogSeeAll_Params)

local t196 = {}

t196.__index = t196

function t196.new(t197: {[any]: any}?) -- line: 9383
	-- upvalues: t1 (copy), t196 (copy)
	return (setmetatable({
		action_type = if t197 ~= nil and t197.action_type ~= nil then t197.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t197 ~= nil and t197.action_params ~= nil then t197.action_params else nil
	}, t196))
end
function t196.encode(p148) -- line: 9394
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n97 = 0

	if p148.action_type ~= nil and (p148.action_type ~= nil and p148.action_type ~= 0 or p148.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1408, v1409 = proto.writeTag(buf, n97, 1, proto.wireTypes.varint)

		buf, n97 = proto.writeVarInt(v1408, v1409, t1.ActionType.toNumber(p148.action_type))
	end

	if p148.action_params ~= nil then
		local v1410 = p148.action_params:encode()
		local v1411, v1412 = proto.writeTag(buf, n97, 2, proto.wireTypes.lengthDelimited)

		buf, n97 = proto.writeBuffer(v1411, v1412, v1410, buffer.len(v1410))
	end

	local buf51 = buffer.create(n97)

	buffer.copy(buf51, 0, buf, 0, n97)

	return buf51
end
function t196.decode(p149: buffer) -- line: 9420
	-- upvalues: t196 (copy), proto (copy), t1 (copy)
	local v1415 = t196.new()
	local n98 = 0

	while n98 < buffer.len(p149) do
		local v1417, v1418

		v1417, v1418, n98 = proto.readTag(p149, n98)

		if v1418 == proto.wireTypes.varint then
			if v1417 == 1 then
				local v1419

				v1419, n98 = proto.readVarIntI32(p149, n98)
				v1415.action_type = t1.ActionType.fromNumber(v1419) or v1419
			else
				local v1420

				v1420, n98 = proto.readVarInt(p149, n98)
			end
		elseif v1418 == proto.wireTypes.lengthDelimited then
			if v1417 == 2 then
				local v1421

				v1421, n98 = proto.readBuffer(p149, n98)
				v1415.action_params = t1.CloseMarketplaceCategoryTooltip_Params.decode(v1421)
			else
				local v1422, v1423 = proto.readVarInt(p149, n98)

				n98 = v1423 + v1422
			end
		elseif v1418 == proto.wireTypes.i32 then
			local v1424

			v1424, n98 = proto.readFixed32(p149, n98)
		elseif v1418 == proto.wireTypes.i64 then
			local v1425

			v1425, n98 = proto.readFixed64(p149, n98)
		else
			error("Unsupported wire type: " .. v1418)
		end
	end

	return v1415
end
function t196.jsonEncode(p150) -- line: 9468
	-- upvalues: t1 (copy)
	local t198 = {}

	if p150.action_type ~= nil and (p150.action_type ~= nil and p150.action_type ~= 0 or p150.action_type ~= t1.ActionType.fromNumber(0)) then
		t198.actionType = if typeof(p150.action_type) ~= "number" then t1.ActionType.toNumber(p150.action_type) else p150.action_type
	end

	if p150.action_params ~= nil then
		t198.actionParams = p150.action_params:jsonEncode()
	end

	return t198
end
function t196.jsonDecode(t199: {[any]: any}) -- line: 9490
	-- upvalues: t196 (copy), t1 (copy)
	local v1429 = t196.new()

	if t199.action_type ~= nil then
		v1429.action_type = if typeof(t199.action_type) ~= "number" then t1.ActionType.fromName(t199.action_type) or t199.action_type else t1.ActionType.fromNumber(t199.action_type) or t199.action_type
	end

	if t199.actionType ~= nil then
		v1429.action_type = if typeof(t199.actionType) ~= "number" then t1.ActionType.fromName(t199.actionType) or t199.actionType else t1.ActionType.fromNumber(t199.actionType) or t199.actionType
	end

	if t199.action_params ~= nil then
		v1429.action_params = t1.CloseMarketplaceCategoryTooltip_Params.jsonDecode(t199.action_params)
	end

	if t199.actionParams ~= nil then
		v1429.action_params = t1.CloseMarketplaceCategoryTooltip_Params.jsonDecode(t199.actionParams)
	end

	return v1429
end

t196.descriptor = {
	name = "CloseMarketplaceCategoryTooltip",
	fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
}
t1.CloseMarketplaceCategoryTooltip = t196
typeRegistry.default:register(t1.CloseMarketplaceCategoryTooltip)

local t200 = {}

t200.__index = t200

function t200.new(t201: {[any]: any}?) -- line: 9530
	-- upvalues: t200 (copy)
	return (setmetatable({
		tooltip_id = if t201 ~= nil and t201.tooltip_id ~= nil then t201.tooltip_id else nil
	}, t200))
end
function t200.encode(p151) -- line: 9538
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n99 = 0

	if p151.tooltip_id ~= nil then
		local v1434 = p151.tooltip_id:encode()
		local v1435, v1436 = proto.writeTag(buf, n99, 1, proto.wireTypes.lengthDelimited)

		buf, n99 = proto.writeBuffer(v1435, v1436, v1434, buffer.len(v1434))
	end

	local buf52 = buffer.create(n99)

	buffer.copy(buf52, 0, buf, 0, n99)

	return buf52
end
function t200.decode(p152: buffer) -- line: 9553
	-- upvalues: t200 (copy), proto (copy), prop_types (copy)
	local v1439 = t200.new()
	local n100 = 0

	while n100 < buffer.len(p152) do
		local v1441, v1442

		v1441, v1442, n100 = proto.readTag(p152, n100)

		if v1442 == proto.wireTypes.varint then
			local v1443

			v1443, n100 = proto.readVarInt(p152, n100)
		elseif v1442 == proto.wireTypes.lengthDelimited then
			if v1441 == 1 then
				local v1444

				v1444, n100 = proto.readBuffer(p152, n100)
				v1439.tooltip_id = prop_types.StringProp.decode(v1444)
			else
				local v1445, v1446 = proto.readVarInt(p152, n100)

				n100 = v1446 + v1445
			end
		elseif v1442 == proto.wireTypes.i32 then
			local v1447

			v1447, n100 = proto.readFixed32(p152, n100)
		elseif v1442 == proto.wireTypes.i64 then
			local v1448

			v1448, n100 = proto.readFixed64(p152, n100)
		else
			error("Unsupported wire type: " .. v1442)
		end
	end

	return v1439
end
function t200.jsonEncode(p153) -- line: 9596
	local t202 = {}

	if p153.tooltip_id ~= nil then
		t202.tooltipId = p153.tooltip_id:jsonEncode()
	end

	return t202
end
function t200.jsonDecode(t203: {[any]: any}) -- line: 9606
	-- upvalues: t200 (copy), prop_types (copy)
	local v1452 = t200.new()

	if t203.tooltip_id ~= nil then
		v1452.tooltip_id = prop_types.StringProp.jsonDecode(t203.tooltip_id)
	end

	if t203.tooltipId ~= nil then
		v1452.tooltip_id = prop_types.StringProp.jsonDecode(t203.tooltipId)
	end

	return v1452
end

t200.descriptor = {
	name = "CloseMarketplaceCategoryTooltip_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.CloseMarketplaceCategoryTooltip_Params = t200
typeRegistry.default:register(t1.CloseMarketplaceCategoryTooltip_Params)

local t204 = {}

t204.__index = t204

function t204.new(t205: {[any]: any}?) -- line: 9636
	-- upvalues: t1 (copy), t204 (copy)
	return (setmetatable({
		action_type = if t205 ~= nil and t205.action_type ~= nil then t205.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t205 ~= nil and t205.action_params ~= nil then t205.action_params else nil
	}, t204))
end
function t204.encode(p154) -- line: 9645
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n101 = 0

	if p154.action_type ~= nil and (p154.action_type ~= nil and p154.action_type ~= 0 or p154.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1457, v1458 = proto.writeTag(buf, n101, 1, proto.wireTypes.varint)

		buf, n101 = proto.writeVarInt(v1457, v1458, t1.ActionType.toNumber(p154.action_type))
	end

	if p154.action_params ~= nil then
		local v1459 = p154.action_params:encode()
		local v1460, v1461 = proto.writeTag(buf, n101, 2, proto.wireTypes.lengthDelimited)

		buf, n101 = proto.writeBuffer(v1460, v1461, v1459, buffer.len(v1459))
	end

	local buf53 = buffer.create(n101)

	buffer.copy(buf53, 0, buf, 0, n101)

	return buf53
end
function t204.decode(p155: buffer) -- line: 9671
	-- upvalues: t204 (copy), proto (copy), t1 (copy)
	local v1464 = t204.new()
	local n102 = 0

	while n102 < buffer.len(p155) do
		local v1466, v1467

		v1466, v1467, n102 = proto.readTag(p155, n102)

		if v1467 == proto.wireTypes.varint then
			if v1466 == 1 then
				local v1468

				v1468, n102 = proto.readVarIntI32(p155, n102)
				v1464.action_type = t1.ActionType.fromNumber(v1468) or v1468
			else
				local v1469

				v1469, n102 = proto.readVarInt(p155, n102)
			end
		elseif v1467 == proto.wireTypes.lengthDelimited then
			if v1466 == 2 then
				local v1470

				v1470, n102 = proto.readBuffer(p155, n102)
				v1464.action_params = t1.ResizeMarketplaceCatalog_Params.decode(v1470)
			else
				local v1471, v1472 = proto.readVarInt(p155, n102)

				n102 = v1472 + v1471
			end
		elseif v1467 == proto.wireTypes.i32 then
			local v1473

			v1473, n102 = proto.readFixed32(p155, n102)
		elseif v1467 == proto.wireTypes.i64 then
			local v1474

			v1474, n102 = proto.readFixed64(p155, n102)
		else
			error("Unsupported wire type: " .. v1467)
		end
	end

	return v1464
end
function t204.jsonEncode(p156) -- line: 9719
	-- upvalues: t1 (copy)
	local t206 = {}

	if p156.action_type ~= nil and (p156.action_type ~= nil and p156.action_type ~= 0 or p156.action_type ~= t1.ActionType.fromNumber(0)) then
		t206.actionType = if typeof(p156.action_type) ~= "number" then t1.ActionType.toNumber(p156.action_type) else p156.action_type
	end

	if p156.action_params ~= nil then
		t206.actionParams = p156.action_params:jsonEncode()
	end

	return t206
end
function t204.jsonDecode(t207: {[any]: any}) -- line: 9741
	-- upvalues: t204 (copy), t1 (copy)
	local v1478 = t204.new()

	if t207.action_type ~= nil then
		v1478.action_type = if typeof(t207.action_type) ~= "number" then t1.ActionType.fromName(t207.action_type) or t207.action_type else t1.ActionType.fromNumber(t207.action_type) or t207.action_type
	end

	if t207.actionType ~= nil then
		v1478.action_type = if typeof(t207.actionType) ~= "number" then t1.ActionType.fromName(t207.actionType) or t207.actionType else t1.ActionType.fromNumber(t207.actionType) or t207.actionType
	end

	if t207.action_params ~= nil then
		v1478.action_params = t1.ResizeMarketplaceCatalog_Params.jsonDecode(t207.action_params)
	end

	if t207.actionParams ~= nil then
		v1478.action_params = t1.ResizeMarketplaceCatalog_Params.jsonDecode(t207.actionParams)
	end

	return v1478
end

t204.descriptor = {
	name = "ResizeMarketplaceCatalog",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
}
t1.ResizeMarketplaceCatalog = t204
typeRegistry.default:register(t1.ResizeMarketplaceCatalog)

local t208 = {}

t208.__index = t208

function t208.new(t209: {[any]: any}?) -- line: 9781
	-- upvalues: t208 (copy)
	return (setmetatable({
		category_id = if t209 ~= nil and t209.category_id ~= nil then t209.category_id else nil,
		subcategory_id = if t209 ~= nil and t209.subcategory_id ~= nil then t209.subcategory_id else nil,
		screen_size = if t209 ~= nil and t209.screen_size ~= nil then t209.screen_size else nil
	}, t208))
end
function t208.encode(p157) -- line: 9791
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n103 = 0

	if p157.category_id ~= nil then
		local v1483 = p157.category_id:encode()
		local v1484, v1485 = proto.writeTag(buf, n103, 1, proto.wireTypes.lengthDelimited)

		buf, n103 = proto.writeBuffer(v1484, v1485, v1483, buffer.len(v1483))
	end

	if p157.subcategory_id ~= nil then
		local v1486 = p157.subcategory_id:encode()
		local v1487, v1488 = proto.writeTag(buf, n103, 2, proto.wireTypes.lengthDelimited)

		buf, n103 = proto.writeBuffer(v1487, v1488, v1486, buffer.len(v1486))
	end

	if p157.screen_size ~= nil then
		local v1489 = p157.screen_size:encode()
		local v1490, v1491 = proto.writeTag(buf, n103, 3, proto.wireTypes.lengthDelimited)

		buf, n103 = proto.writeBuffer(v1490, v1491, v1489, buffer.len(v1489))
	end

	local buf54 = buffer.create(n103)

	buffer.copy(buf54, 0, buf, 0, n103)

	return buf54
end
function t208.decode(p158: buffer) -- line: 9818
	-- upvalues: t208 (copy), proto (copy), prop_types (copy)
	local v1494 = t208.new()
	local n104 = 0

	while n104 < buffer.len(p158) do
		local v1496, v1497

		v1496, v1497, n104 = proto.readTag(p158, n104)

		if v1497 == proto.wireTypes.varint then
			local v1498

			v1498, n104 = proto.readVarInt(p158, n104)
		elseif v1497 == proto.wireTypes.lengthDelimited then
			if v1496 == 1 then
				local v1499

				v1499, n104 = proto.readBuffer(p158, n104)
				v1494.category_id = prop_types.StringProp.decode(v1499)
			elseif v1496 == 2 then
				local v1500

				v1500, n104 = proto.readBuffer(p158, n104)
				v1494.subcategory_id = prop_types.StringProp.decode(v1500)
			elseif v1496 == 3 then
				local v1501

				v1501, n104 = proto.readBuffer(p158, n104)
				v1494.screen_size = prop_types.StringProp.decode(v1501)
			else
				local v1502, v1503 = proto.readVarInt(p158, n104)

				n104 = v1503 + v1502
			end
		elseif v1497 == proto.wireTypes.i32 then
			local v1504

			v1504, n104 = proto.readFixed32(p158, n104)
		elseif v1497 == proto.wireTypes.i64 then
			local v1505

			v1505, n104 = proto.readFixed64(p158, n104)
		else
			error("Unsupported wire type: " .. v1497)
		end
	end

	return v1494
end
function t208.jsonEncode(p159) -- line: 9871
	local t210 = {}

	if p159.category_id ~= nil then
		t210.categoryId = p159.category_id:jsonEncode()
	end

	if p159.subcategory_id ~= nil then
		t210.subcategoryId = p159.subcategory_id:jsonEncode()
	end

	if p159.screen_size ~= nil then
		t210.screenSize = p159.screen_size:jsonEncode()
	end

	return t210
end
function t208.jsonDecode(t211: {[any]: any}) -- line: 9889
	-- upvalues: t208 (copy), prop_types (copy)
	local v1509 = t208.new()

	if t211.category_id ~= nil then
		v1509.category_id = prop_types.StringProp.jsonDecode(t211.category_id)
	end

	if t211.categoryId ~= nil then
		v1509.category_id = prop_types.StringProp.jsonDecode(t211.categoryId)
	end

	if t211.subcategory_id ~= nil then
		v1509.subcategory_id = prop_types.StringProp.jsonDecode(t211.subcategory_id)
	end

	if t211.subcategoryId ~= nil then
		v1509.subcategory_id = prop_types.StringProp.jsonDecode(t211.subcategoryId)
	end

	if t211.screen_size ~= nil then
		v1509.screen_size = prop_types.StringProp.jsonDecode(t211.screen_size)
	end

	if t211.screenSize ~= nil then
		v1509.screen_size = prop_types.StringProp.jsonDecode(t211.screenSize)
	end

	return v1509
end

t208.descriptor = {
	name = "ResizeMarketplaceCatalog_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.ResizeMarketplaceCatalog_Params = t208
typeRegistry.default:register(t1.ResizeMarketplaceCatalog_Params)

local t212 = {}

t212.__index = t212

function t212.new(t213: {[any]: any}?) -- line: 9937
	-- upvalues: t1 (copy), t212 (copy)
	return (setmetatable({
		action_type = if t213 ~= nil and t213.action_type ~= nil then t213.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t213 ~= nil and t213.action_params ~= nil then t213.action_params else nil
	}, t212))
end
function t212.encode(p160) -- line: 9948
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n105 = 0

	if p160.action_type ~= nil and (p160.action_type ~= nil and p160.action_type ~= 0 or p160.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1514, v1515 = proto.writeTag(buf, n105, 1, proto.wireTypes.varint)

		buf, n105 = proto.writeVarInt(v1514, v1515, t1.ActionType.toNumber(p160.action_type))
	end

	if p160.action_params ~= nil then
		local v1516 = p160.action_params:encode()
		local v1517, v1518 = proto.writeTag(buf, n105, 2, proto.wireTypes.lengthDelimited)

		buf, n105 = proto.writeBuffer(v1517, v1518, v1516, buffer.len(v1516))
	end

	local buf55 = buffer.create(n105)

	buffer.copy(buf55, 0, buf, 0, n105)

	return buf55
end
function t212.decode(p161: buffer) -- line: 9974
	-- upvalues: t212 (copy), proto (copy), t1 (copy)
	local v1521 = t212.new()
	local n106 = 0

	while n106 < buffer.len(p161) do
		local v1523, v1524

		v1523, v1524, n106 = proto.readTag(p161, n106)

		if v1524 == proto.wireTypes.varint then
			if v1523 == 1 then
				local v1525

				v1525, n106 = proto.readVarIntI32(p161, n106)
				v1521.action_type = t1.ActionType.fromNumber(v1525) or v1525
			else
				local v1526

				v1526, n106 = proto.readVarInt(p161, n106)
			end
		elseif v1524 == proto.wireTypes.lengthDelimited then
			if v1523 == 2 then
				local v1527

				v1527, n106 = proto.readBuffer(p161, n106)
				v1521.action_params = t1.OpenChartsSortDetailAction_Params.decode(v1527)
			else
				local v1528, v1529 = proto.readVarInt(p161, n106)

				n106 = v1529 + v1528
			end
		elseif v1524 == proto.wireTypes.i32 then
			local v1530

			v1530, n106 = proto.readFixed32(p161, n106)
		elseif v1524 == proto.wireTypes.i64 then
			local v1531

			v1531, n106 = proto.readFixed64(p161, n106)
		else
			error("Unsupported wire type: " .. v1524)
		end
	end

	return v1521
end
function t212.jsonEncode(p162) -- line: 10022
	-- upvalues: t1 (copy)
	local t214 = {}

	if p162.action_type ~= nil and (p162.action_type ~= nil and p162.action_type ~= 0 or p162.action_type ~= t1.ActionType.fromNumber(0)) then
		t214.actionType = if typeof(p162.action_type) ~= "number" then t1.ActionType.toNumber(p162.action_type) else p162.action_type
	end

	if p162.action_params ~= nil then
		t214.actionParams = p162.action_params:jsonEncode()
	end

	return t214
end
function t212.jsonDecode(t215: {[any]: any}) -- line: 10044
	-- upvalues: t212 (copy), t1 (copy)
	local v1535 = t212.new()

	if t215.action_type ~= nil then
		v1535.action_type = if typeof(t215.action_type) ~= "number" then t1.ActionType.fromName(t215.action_type) or t215.action_type else t1.ActionType.fromNumber(t215.action_type) or t215.action_type
	end

	if t215.actionType ~= nil then
		v1535.action_type = if typeof(t215.actionType) ~= "number" then t1.ActionType.fromName(t215.actionType) or t215.actionType else t1.ActionType.fromNumber(t215.actionType) or t215.actionType
	end

	if t215.action_params ~= nil then
		v1535.action_params = t1.OpenChartsSortDetailAction_Params.jsonDecode(t215.action_params)
	end

	if t215.actionParams ~= nil then
		v1535.action_params = t1.OpenChartsSortDetailAction_Params.jsonDecode(t215.actionParams)
	end

	return v1535
end

t212.descriptor = {
	name = "OpenChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
}
t1.OpenChartsSortDetailAction = t212
typeRegistry.default:register(t1.OpenChartsSortDetailAction)

local t216 = {}

t216.__index = t216

function t216.new(t217: {[any]: any}?) -- line: 10084
	-- upvalues: t216 (copy)
	return (setmetatable({
		sort_id = if t217 ~= nil and t217.sort_id ~= nil then t217.sort_id else nil,
		secondary_sort_id = if t217 ~= nil and t217.secondary_sort_id ~= nil then t217.secondary_sort_id else nil
	}, t216))
end
function t216.encode(p163) -- line: 10093
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n107 = 0

	if p163.sort_id ~= nil then
		local v1540 = p163.sort_id:encode()
		local v1541, v1542 = proto.writeTag(buf, n107, 1, proto.wireTypes.lengthDelimited)

		buf, n107 = proto.writeBuffer(v1541, v1542, v1540, buffer.len(v1540))
	end

	if p163.secondary_sort_id ~= nil then
		local v1543 = p163.secondary_sort_id:encode()
		local v1544, v1545 = proto.writeTag(buf, n107, 2, proto.wireTypes.lengthDelimited)

		buf, n107 = proto.writeBuffer(v1544, v1545, v1543, buffer.len(v1543))
	end

	local buf56 = buffer.create(n107)

	buffer.copy(buf56, 0, buf, 0, n107)

	return buf56
end
function t216.decode(p164: buffer) -- line: 10114
	-- upvalues: t216 (copy), proto (copy), prop_types (copy)
	local v1548 = t216.new()
	local n108 = 0

	while n108 < buffer.len(p164) do
		local v1550, v1551

		v1550, v1551, n108 = proto.readTag(p164, n108)

		if v1551 == proto.wireTypes.varint then
			local v1552

			v1552, n108 = proto.readVarInt(p164, n108)
		elseif v1551 == proto.wireTypes.lengthDelimited then
			if v1550 == 1 then
				local v1553

				v1553, n108 = proto.readBuffer(p164, n108)
				v1548.sort_id = prop_types.StringProp.decode(v1553)
			elseif v1550 == 2 then
				local v1554

				v1554, n108 = proto.readBuffer(p164, n108)
				v1548.secondary_sort_id = prop_types.Int32Prop.decode(v1554)
			else
				local v1555, v1556 = proto.readVarInt(p164, n108)

				n108 = v1556 + v1555
			end
		elseif v1551 == proto.wireTypes.i32 then
			local v1557

			v1557, n108 = proto.readFixed32(p164, n108)
		elseif v1551 == proto.wireTypes.i64 then
			local v1558

			v1558, n108 = proto.readFixed64(p164, n108)
		else
			error("Unsupported wire type: " .. v1551)
		end
	end

	return v1548
end
function t216.jsonEncode(p165) -- line: 10162
	local t218 = {}

	if p165.sort_id ~= nil then
		t218.sortId = p165.sort_id:jsonEncode()
	end

	if p165.secondary_sort_id ~= nil then
		t218.secondarySortId = p165.secondary_sort_id:jsonEncode()
	end

	return t218
end
function t216.jsonDecode(t219: {[any]: any}) -- line: 10176
	-- upvalues: t216 (copy), prop_types (copy)
	local v1562 = t216.new()

	if t219.sort_id ~= nil then
		v1562.sort_id = prop_types.StringProp.jsonDecode(t219.sort_id)
	end

	if t219.sortId ~= nil then
		v1562.sort_id = prop_types.StringProp.jsonDecode(t219.sortId)
	end

	if t219.secondary_sort_id ~= nil then
		v1562.secondary_sort_id = prop_types.Int32Prop.jsonDecode(t219.secondary_sort_id)
	end

	if t219.secondarySortId ~= nil then
		v1562.secondary_sort_id = prop_types.Int32Prop.jsonDecode(t219.secondarySortId)
	end

	return v1562
end

t216.descriptor = {
	name = "OpenChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenChartsSortDetailAction_Params = t216
typeRegistry.default:register(t1.OpenChartsSortDetailAction_Params)

local t220 = {}

t220.__index = t220

function t220.new(t221: {[any]: any}?) -- line: 10216
	-- upvalues: t1 (copy), t220 (copy)
	return (setmetatable({
		action_type = if t221 ~= nil and t221.action_type ~= nil then t221.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t221 ~= nil and t221.action_params ~= nil then t221.action_params else nil
	}, t220))
end
function t220.encode(p166) -- line: 10225
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n109 = 0

	if p166.action_type ~= nil and (p166.action_type ~= nil and p166.action_type ~= 0 or p166.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1567, v1568 = proto.writeTag(buf, n109, 1, proto.wireTypes.varint)

		buf, n109 = proto.writeVarInt(v1567, v1568, t1.ActionType.toNumber(p166.action_type))
	end

	if p166.action_params ~= nil then
		local v1569 = p166.action_params:encode()
		local v1570, v1571 = proto.writeTag(buf, n109, 2, proto.wireTypes.lengthDelimited)

		buf, n109 = proto.writeBuffer(v1570, v1571, v1569, buffer.len(v1569))
	end

	local buf57 = buffer.create(n109)

	buffer.copy(buf57, 0, buf, 0, n109)

	return buf57
end
function t220.decode(p167: buffer) -- line: 10251
	-- upvalues: t220 (copy), proto (copy), t1 (copy)
	local v1574 = t220.new()
	local n110 = 0

	while n110 < buffer.len(p167) do
		local v1576, v1577

		v1576, v1577, n110 = proto.readTag(p167, n110)

		if v1577 == proto.wireTypes.varint then
			if v1576 == 1 then
				local v1578

				v1578, n110 = proto.readVarIntI32(p167, n110)
				v1574.action_type = t1.ActionType.fromNumber(v1578) or v1578
			else
				local v1579

				v1579, n110 = proto.readVarInt(p167, n110)
			end
		elseif v1577 == proto.wireTypes.lengthDelimited then
			if v1576 == 2 then
				local v1580

				v1580, n110 = proto.readBuffer(p167, n110)
				v1574.action_params = t1.OpenSongDetailAction_Params.decode(v1580)
			else
				local v1581, v1582 = proto.readVarInt(p167, n110)

				n110 = v1582 + v1581
			end
		elseif v1577 == proto.wireTypes.i32 then
			local v1583

			v1583, n110 = proto.readFixed32(p167, n110)
		elseif v1577 == proto.wireTypes.i64 then
			local v1584

			v1584, n110 = proto.readFixed64(p167, n110)
		else
			error("Unsupported wire type: " .. v1577)
		end
	end

	return v1574
end
function t220.jsonEncode(p168) -- line: 10299
	-- upvalues: t1 (copy)
	local t222 = {}

	if p168.action_type ~= nil and (p168.action_type ~= nil and p168.action_type ~= 0 or p168.action_type ~= t1.ActionType.fromNumber(0)) then
		t222.actionType = if typeof(p168.action_type) ~= "number" then t1.ActionType.toNumber(p168.action_type) else p168.action_type
	end

	if p168.action_params ~= nil then
		t222.actionParams = p168.action_params:jsonEncode()
	end

	return t222
end
function t220.jsonDecode(t223: {[any]: any}) -- line: 10321
	-- upvalues: t220 (copy), t1 (copy)
	local v1588 = t220.new()

	if t223.action_type ~= nil then
		v1588.action_type = if typeof(t223.action_type) ~= "number" then t1.ActionType.fromName(t223.action_type) or t223.action_type else t1.ActionType.fromNumber(t223.action_type) or t223.action_type
	end

	if t223.actionType ~= nil then
		v1588.action_type = if typeof(t223.actionType) ~= "number" then t1.ActionType.fromName(t223.actionType) or t223.actionType else t1.ActionType.fromNumber(t223.actionType) or t223.actionType
	end

	if t223.action_params ~= nil then
		v1588.action_params = t1.OpenSongDetailAction_Params.jsonDecode(t223.action_params)
	end

	if t223.actionParams ~= nil then
		v1588.action_params = t1.OpenSongDetailAction_Params.jsonDecode(t223.actionParams)
	end

	return v1588
end

t220.descriptor = {
	name = "OpenSongDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
}
t1.OpenSongDetailAction = t220
typeRegistry.default:register(t1.OpenSongDetailAction)

local t224 = {}

t224.__index = t224

function t224.new(t225: {[any]: any}?) -- line: 10361
	-- upvalues: t224 (copy)
	return (setmetatable({
		song_id = if t225 ~= nil and t225.song_id ~= nil then t225.song_id else nil
	}, t224))
end
function t224.encode(p169) -- line: 10369
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n111 = 0

	if p169.song_id ~= nil then
		local v1593 = p169.song_id:encode()
		local v1594, v1595 = proto.writeTag(buf, n111, 1, proto.wireTypes.lengthDelimited)

		buf, n111 = proto.writeBuffer(v1594, v1595, v1593, buffer.len(v1593))
	end

	local buf58 = buffer.create(n111)

	buffer.copy(buf58, 0, buf, 0, n111)

	return buf58
end
function t224.decode(p170: buffer) -- line: 10384
	-- upvalues: t224 (copy), proto (copy), prop_types (copy)
	local v1598 = t224.new()
	local n112 = 0

	while n112 < buffer.len(p170) do
		local v1600, v1601

		v1600, v1601, n112 = proto.readTag(p170, n112)

		if v1601 == proto.wireTypes.varint then
			local v1602

			v1602, n112 = proto.readVarInt(p170, n112)
		elseif v1601 == proto.wireTypes.lengthDelimited then
			if v1600 == 1 then
				local v1603

				v1603, n112 = proto.readBuffer(p170, n112)
				v1598.song_id = prop_types.StringProp.decode(v1603)
			else
				local v1604, v1605 = proto.readVarInt(p170, n112)

				n112 = v1605 + v1604
			end
		elseif v1601 == proto.wireTypes.i32 then
			local v1606

			v1606, n112 = proto.readFixed32(p170, n112)
		elseif v1601 == proto.wireTypes.i64 then
			local v1607

			v1607, n112 = proto.readFixed64(p170, n112)
		else
			error("Unsupported wire type: " .. v1601)
		end
	end

	return v1598
end
function t224.jsonEncode(p171) -- line: 10427
	local t226 = {}

	if p171.song_id ~= nil then
		t226.songId = p171.song_id:jsonEncode()
	end

	return t226
end
function t224.jsonDecode(t227: {[any]: any}) -- line: 10437
	-- upvalues: t224 (copy), prop_types (copy)
	local v1611 = t224.new()

	if t227.song_id ~= nil then
		v1611.song_id = prop_types.StringProp.jsonDecode(t227.song_id)
	end

	if t227.songId ~= nil then
		v1611.song_id = prop_types.StringProp.jsonDecode(t227.songId)
	end

	return v1611
end

t224.descriptor = {
	name = "OpenSongDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenSongDetailAction_Params = t224
typeRegistry.default:register(t1.OpenSongDetailAction_Params)

local t228 = {}

t228.__index = t228

function t228.new(t229: {[any]: any}?) -- line: 10465
	-- upvalues: t1 (copy), t228 (copy)
	return (setmetatable({
		action_type = if t229 ~= nil and t229.action_type ~= nil then t229.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t229 ~= nil and t229.action_params ~= nil then t229.action_params else nil
	}, t228))
end
function t228.encode(p172) -- line: 10476
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n113 = 0

	if p172.action_type ~= nil and (p172.action_type ~= nil and p172.action_type ~= 0 or p172.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1616, v1617 = proto.writeTag(buf, n113, 1, proto.wireTypes.varint)

		buf, n113 = proto.writeVarInt(v1616, v1617, t1.ActionType.toNumber(p172.action_type))
	end

	if p172.action_params ~= nil then
		local v1618 = p172.action_params:encode()
		local v1619, v1620 = proto.writeTag(buf, n113, 2, proto.wireTypes.lengthDelimited)

		buf, n113 = proto.writeBuffer(v1619, v1620, v1618, buffer.len(v1618))
	end

	local buf59 = buffer.create(n113)

	buffer.copy(buf59, 0, buf, 0, n113)

	return buf59
end
function t228.decode(p173: buffer) -- line: 10502
	-- upvalues: t228 (copy), proto (copy), t1 (copy)
	local v1623 = t228.new()
	local n114 = 0

	while n114 < buffer.len(p173) do
		local v1625, v1626

		v1625, v1626, n114 = proto.readTag(p173, n114)

		if v1626 == proto.wireTypes.varint then
			if v1625 == 1 then
				local v1627

				v1627, n114 = proto.readVarIntI32(p173, n114)
				v1623.action_type = t1.ActionType.fromNumber(v1627) or v1627
			else
				local v1628

				v1628, n114 = proto.readVarInt(p173, n114)
			end
		elseif v1626 == proto.wireTypes.lengthDelimited then
			if v1625 == 2 then
				local v1629

				v1629, n114 = proto.readBuffer(p173, n114)
				v1623.action_params = t1.OpenMarketplaceCatalogFilters_Params.decode(v1629)
			else
				local v1630, v1631 = proto.readVarInt(p173, n114)

				n114 = v1631 + v1630
			end
		elseif v1626 == proto.wireTypes.i32 then
			local v1632

			v1632, n114 = proto.readFixed32(p173, n114)
		elseif v1626 == proto.wireTypes.i64 then
			local v1633

			v1633, n114 = proto.readFixed64(p173, n114)
		else
			error("Unsupported wire type: " .. v1626)
		end
	end

	return v1623
end
function t228.jsonEncode(p174) -- line: 10550
	-- upvalues: t1 (copy)
	local t230 = {}

	if p174.action_type ~= nil and (p174.action_type ~= nil and p174.action_type ~= 0 or p174.action_type ~= t1.ActionType.fromNumber(0)) then
		t230.actionType = if typeof(p174.action_type) ~= "number" then t1.ActionType.toNumber(p174.action_type) else p174.action_type
	end

	if p174.action_params ~= nil then
		t230.actionParams = p174.action_params:jsonEncode()
	end

	return t230
end
function t228.jsonDecode(t231: {[any]: any}) -- line: 10572
	-- upvalues: t228 (copy), t1 (copy)
	local v1637 = t228.new()

	if t231.action_type ~= nil then
		v1637.action_type = if typeof(t231.action_type) ~= "number" then t1.ActionType.fromName(t231.action_type) or t231.action_type else t1.ActionType.fromNumber(t231.action_type) or t231.action_type
	end

	if t231.actionType ~= nil then
		v1637.action_type = if typeof(t231.actionType) ~= "number" then t1.ActionType.fromName(t231.actionType) or t231.actionType else t1.ActionType.fromNumber(t231.actionType) or t231.actionType
	end

	if t231.action_params ~= nil then
		v1637.action_params = t1.OpenMarketplaceCatalogFilters_Params.jsonDecode(t231.action_params)
	end

	if t231.actionParams ~= nil then
		v1637.action_params = t1.OpenMarketplaceCatalogFilters_Params.jsonDecode(t231.actionParams)
	end

	return v1637
end

t228.descriptor = {
	name = "OpenMarketplaceCatalogFilters",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
}
t1.OpenMarketplaceCatalogFilters = t228
typeRegistry.default:register(t1.OpenMarketplaceCatalogFilters)

local t232 = {}

t232.__index = t232

function t232.new(_: {[any]: any}?) -- line: 10612
	-- upvalues: t232 (copy)
	return (setmetatable({}, t232))
end
function t232.encode(_) -- line: 10618
	local buf = buffer.create(0)
	local buf60 = buffer.create(0)

	buffer.copy(buf60, 0, buf, 0, 0)

	return buf60
end
function t232.decode(p176: buffer) -- line: 10627
	-- upvalues: t232 (copy), proto (copy)
	local v1643 = t232.new()
	local n115 = 0

	while n115 < buffer.len(p176) do
		local v1645, v1646

		v1645, v1646, n115 = proto.readTag(p176, n115)

		if v1646 == proto.wireTypes.varint then
			local v1647

			v1647, n115 = proto.readVarInt(p176, n115)
		elseif v1646 == proto.wireTypes.lengthDelimited then
			local v1648, v1649 = proto.readVarInt(p176, n115)

			n115 = v1649 + v1648
		elseif v1646 == proto.wireTypes.i32 then
			local v1650

			v1650, n115 = proto.readFixed32(p176, n115)
		elseif v1646 == proto.wireTypes.i64 then
			local v1651

			v1651, n115 = proto.readFixed64(p176, n115)
		else
			error("Unsupported wire type: " .. v1646)
		end
	end

	return v1643
end
function t232.jsonEncode(_) -- line: 10665
	return {}
end
function t232.jsonDecode(_: {[any]: any}) -- line: 10671
	-- upvalues: t232 (copy)
	return (t232.new())
end

t232.descriptor = {
	name = "OpenMarketplaceCatalogFilters_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenMarketplaceCatalogFilters_Params = t232
typeRegistry.default:register(t1.OpenMarketplaceCatalogFilters_Params)

local t235 = {}

t235.__index = t235

function t235.new(t236: {[any]: any}?) -- line: 10693
	-- upvalues: t1 (copy), t235 (copy)
	return (setmetatable({
		action_type = if t236 ~= nil and t236.action_type ~= nil then t236.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t236 ~= nil and t236.action_params ~= nil then t236.action_params else nil
	}, t235))
end
function t235.encode(p178) -- line: 10702
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n116 = 0

	if p178.action_type ~= nil and (p178.action_type ~= nil and p178.action_type ~= 0 or p178.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1658, v1659 = proto.writeTag(buf, n116, 1, proto.wireTypes.varint)

		buf, n116 = proto.writeVarInt(v1658, v1659, t1.ActionType.toNumber(p178.action_type))
	end

	if p178.action_params ~= nil then
		local v1660 = p178.action_params:encode()
		local v1661, v1662 = proto.writeTag(buf, n116, 2, proto.wireTypes.lengthDelimited)

		buf, n116 = proto.writeBuffer(v1661, v1662, v1660, buffer.len(v1660))
	end

	local buf61 = buffer.create(n116)

	buffer.copy(buf61, 0, buf, 0, n116)

	return buf61
end
function t235.decode(p179: buffer) -- line: 10728
	-- upvalues: t235 (copy), proto (copy), t1 (copy)
	local v1665 = t235.new()
	local n117 = 0

	while n117 < buffer.len(p179) do
		local v1667, v1668

		v1667, v1668, n117 = proto.readTag(p179, n117)

		if v1668 == proto.wireTypes.varint then
			if v1667 == 1 then
				local v1669

				v1669, n117 = proto.readVarIntI32(p179, n117)
				v1665.action_type = t1.ActionType.fromNumber(v1669) or v1669
			else
				local v1670

				v1670, n117 = proto.readVarInt(p179, n117)
			end
		elseif v1668 == proto.wireTypes.lengthDelimited then
			if v1667 == 2 then
				local v1671

				v1671, n117 = proto.readBuffer(p179, n117)
				v1665.action_params = t1.RefreshFromApiAction_Params.decode(v1671)
			else
				local v1672, v1673 = proto.readVarInt(p179, n117)

				n117 = v1673 + v1672
			end
		elseif v1668 == proto.wireTypes.i32 then
			local v1674

			v1674, n117 = proto.readFixed32(p179, n117)
		elseif v1668 == proto.wireTypes.i64 then
			local v1675

			v1675, n117 = proto.readFixed64(p179, n117)
		else
			error("Unsupported wire type: " .. v1668)
		end
	end

	return v1665
end
function t235.jsonEncode(p180) -- line: 10776
	-- upvalues: t1 (copy)
	local t237 = {}

	if p180.action_type ~= nil and (p180.action_type ~= nil and p180.action_type ~= 0 or p180.action_type ~= t1.ActionType.fromNumber(0)) then
		t237.actionType = if typeof(p180.action_type) ~= "number" then t1.ActionType.toNumber(p180.action_type) else p180.action_type
	end

	if p180.action_params ~= nil then
		t237.actionParams = p180.action_params:jsonEncode()
	end

	return t237
end
function t235.jsonDecode(t238: {[any]: any}) -- line: 10798
	-- upvalues: t235 (copy), t1 (copy)
	local v1679 = t235.new()

	if t238.action_type ~= nil then
		v1679.action_type = if typeof(t238.action_type) ~= "number" then t1.ActionType.fromName(t238.action_type) or t238.action_type else t1.ActionType.fromNumber(t238.action_type) or t238.action_type
	end

	if t238.actionType ~= nil then
		v1679.action_type = if typeof(t238.actionType) ~= "number" then t1.ActionType.fromName(t238.actionType) or t238.actionType else t1.ActionType.fromNumber(t238.actionType) or t238.actionType
	end

	if t238.action_params ~= nil then
		v1679.action_params = t1.RefreshFromApiAction_Params.jsonDecode(t238.action_params)
	end

	if t238.actionParams ~= nil then
		v1679.action_params = t1.RefreshFromApiAction_Params.jsonDecode(t238.actionParams)
	end

	return v1679
end

t235.descriptor = {
	name = "RefreshFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
}
t1.RefreshFromApiAction = t235
typeRegistry.default:register(t1.RefreshFromApiAction)

local t239 = {}

t239.__index = t239

function t239.new(t240: {[any]: any}?) -- line: 10838
	-- upvalues: t239 (copy)
	return (setmetatable({
		surface_key = if t240 ~= nil and t240.surface_key ~= nil then t240.surface_key else nil,
		config_key = if t240 ~= nil and t240.config_key ~= nil then t240.config_key else nil
	}, t239))
end
function t239.encode(p181) -- line: 10847
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n118 = 0

	if p181.surface_key ~= nil then
		local v1684 = p181.surface_key:encode()
		local v1685, v1686 = proto.writeTag(buf, n118, 1, proto.wireTypes.lengthDelimited)

		buf, n118 = proto.writeBuffer(v1685, v1686, v1684, buffer.len(v1684))
	end

	if p181.config_key ~= nil then
		local v1687 = p181.config_key:encode()
		local v1688, v1689 = proto.writeTag(buf, n118, 2, proto.wireTypes.lengthDelimited)

		buf, n118 = proto.writeBuffer(v1688, v1689, v1687, buffer.len(v1687))
	end

	local buf62 = buffer.create(n118)

	buffer.copy(buf62, 0, buf, 0, n118)

	return buf62
end
function t239.decode(p182: buffer) -- line: 10868
	-- upvalues: t239 (copy), proto (copy), prop_types (copy)
	local v1692 = t239.new()
	local n119 = 0

	while n119 < buffer.len(p182) do
		local v1694, v1695

		v1694, v1695, n119 = proto.readTag(p182, n119)

		if v1695 == proto.wireTypes.varint then
			local v1696

			v1696, n119 = proto.readVarInt(p182, n119)
		elseif v1695 == proto.wireTypes.lengthDelimited then
			if v1694 == 1 then
				local v1697

				v1697, n119 = proto.readBuffer(p182, n119)
				v1692.surface_key = prop_types.StringProp.decode(v1697)
			elseif v1694 == 2 then
				local v1698

				v1698, n119 = proto.readBuffer(p182, n119)
				v1692.config_key = prop_types.StringProp.decode(v1698)
			else
				local v1699, v1700 = proto.readVarInt(p182, n119)

				n119 = v1700 + v1699
			end
		elseif v1695 == proto.wireTypes.i32 then
			local v1701

			v1701, n119 = proto.readFixed32(p182, n119)
		elseif v1695 == proto.wireTypes.i64 then
			local v1702

			v1702, n119 = proto.readFixed64(p182, n119)
		else
			error("Unsupported wire type: " .. v1695)
		end
	end

	return v1692
end
function t239.jsonEncode(p183) -- line: 10916
	local t241 = {}

	if p183.surface_key ~= nil then
		t241.surfaceKey = p183.surface_key:jsonEncode()
	end

	if p183.config_key ~= nil then
		t241.configKey = p183.config_key:jsonEncode()
	end

	return t241
end
function t239.jsonDecode(t242: {[any]: any}) -- line: 10930
	-- upvalues: t239 (copy), prop_types (copy)
	local v1706 = t239.new()

	if t242.surface_key ~= nil then
		v1706.surface_key = prop_types.StringProp.jsonDecode(t242.surface_key)
	end

	if t242.surfaceKey ~= nil then
		v1706.surface_key = prop_types.StringProp.jsonDecode(t242.surfaceKey)
	end

	if t242.config_key ~= nil then
		v1706.config_key = prop_types.StringProp.jsonDecode(t242.config_key)
	end

	if t242.configKey ~= nil then
		v1706.config_key = prop_types.StringProp.jsonDecode(t242.configKey)
	end

	return v1706
end

t239.descriptor = {
	name = "RefreshFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.RefreshFromApiAction_Params = t239
typeRegistry.default:register(t1.RefreshFromApiAction_Params)

local t243 = {}

t243.__index = t243

function t243.new(t244: {[any]: any}?) -- line: 10967
	-- upvalues: t1 (copy), t243 (copy)
	return (setmetatable({
		action_type = if t244 ~= nil and t244.action_type ~= nil then t244.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t244 ~= nil and t244.action_params ~= nil then t244.action_params else nil
	}, t243))
end
function t243.encode(p184) -- line: 10976
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n120 = 0

	if p184.action_type ~= nil and (p184.action_type ~= nil and p184.action_type ~= 0 or p184.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1711, v1712 = proto.writeTag(buf, n120, 1, proto.wireTypes.varint)

		buf, n120 = proto.writeVarInt(v1711, v1712, t1.ActionType.toNumber(p184.action_type))
	end

	if p184.action_params ~= nil then
		local v1713 = p184.action_params:encode()
		local v1714, v1715 = proto.writeTag(buf, n120, 2, proto.wireTypes.lengthDelimited)

		buf, n120 = proto.writeBuffer(v1714, v1715, v1713, buffer.len(v1713))
	end

	local buf63 = buffer.create(n120)

	buffer.copy(buf63, 0, buf, 0, n120)

	return buf63
end
function t243.decode(p185: buffer) -- line: 11002
	-- upvalues: t243 (copy), proto (copy), t1 (copy)
	local v1718 = t243.new()
	local n121 = 0

	while n121 < buffer.len(p185) do
		local v1720, v1721

		v1720, v1721, n121 = proto.readTag(p185, n121)

		if v1721 == proto.wireTypes.varint then
			if v1720 == 1 then
				local v1722

				v1722, n121 = proto.readVarIntI32(p185, n121)
				v1718.action_type = t1.ActionType.fromNumber(v1722) or v1722
			else
				local v1723

				v1723, n121 = proto.readVarInt(p185, n121)
			end
		elseif v1721 == proto.wireTypes.lengthDelimited then
			if v1720 == 2 then
				local v1724

				v1724, n121 = proto.readBuffer(p185, n121)
				v1718.action_params = t1.RsvpToEventAction_Params.decode(v1724)
			else
				local v1725, v1726 = proto.readVarInt(p185, n121)

				n121 = v1726 + v1725
			end
		elseif v1721 == proto.wireTypes.i32 then
			local v1727

			v1727, n121 = proto.readFixed32(p185, n121)
		elseif v1721 == proto.wireTypes.i64 then
			local v1728

			v1728, n121 = proto.readFixed64(p185, n121)
		else
			error("Unsupported wire type: " .. v1721)
		end
	end

	return v1718
end
function t243.jsonEncode(p186) -- line: 11050
	-- upvalues: t1 (copy)
	local t245 = {}

	if p186.action_type ~= nil and (p186.action_type ~= nil and p186.action_type ~= 0 or p186.action_type ~= t1.ActionType.fromNumber(0)) then
		t245.actionType = if typeof(p186.action_type) ~= "number" then t1.ActionType.toNumber(p186.action_type) else p186.action_type
	end

	if p186.action_params ~= nil then
		t245.actionParams = p186.action_params:jsonEncode()
	end

	return t245
end
function t243.jsonDecode(t246: {[any]: any}) -- line: 11072
	-- upvalues: t243 (copy), t1 (copy)
	local v1732 = t243.new()

	if t246.action_type ~= nil then
		v1732.action_type = if typeof(t246.action_type) ~= "number" then t1.ActionType.fromName(t246.action_type) or t246.action_type else t1.ActionType.fromNumber(t246.action_type) or t246.action_type
	end

	if t246.actionType ~= nil then
		v1732.action_type = if typeof(t246.actionType) ~= "number" then t1.ActionType.fromName(t246.actionType) or t246.actionType else t1.ActionType.fromNumber(t246.actionType) or t246.actionType
	end

	if t246.action_params ~= nil then
		v1732.action_params = t1.RsvpToEventAction_Params.jsonDecode(t246.action_params)
	end

	if t246.actionParams ~= nil then
		v1732.action_params = t1.RsvpToEventAction_Params.jsonDecode(t246.actionParams)
	end

	return v1732
end

t243.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t1.RsvpToEventAction = t243
typeRegistry.default:register(t1.RsvpToEventAction)

local t247 = {}

t247.__index = t247

function t247.new(t248: {[any]: any}?) -- line: 11112
	-- upvalues: t247 (copy)
	return (setmetatable({
		event_id = if t248 ~= nil and t248.event_id ~= nil then t248.event_id else nil,
		user_rsvp = if t248 ~= nil and t248.user_rsvp ~= nil then t248.user_rsvp else nil
	}, t247))
end
function t247.encode(p187) -- line: 11119
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n122 = 0

	if p187.event_id ~= nil then
		local v1737 = p187.event_id:encode()
		local v1738, v1739 = proto.writeTag(buf, n122, 1, proto.wireTypes.lengthDelimited)

		buf, n122 = proto.writeBuffer(v1738, v1739, v1737, buffer.len(v1737))
	end

	if p187.user_rsvp ~= nil then
		local v1740 = p187.user_rsvp:encode()
		local v1741, v1742 = proto.writeTag(buf, n122, 2, proto.wireTypes.lengthDelimited)

		buf, n122 = proto.writeBuffer(v1741, v1742, v1740, buffer.len(v1740))
	end

	local buf64 = buffer.create(n122)

	buffer.copy(buf64, 0, buf, 0, n122)

	return buf64
end
function t247.decode(p188: buffer) -- line: 11140
	-- upvalues: t247 (copy), proto (copy), prop_types (copy)
	local v1745 = t247.new()
	local n123 = 0

	while n123 < buffer.len(p188) do
		local v1747, v1748

		v1747, v1748, n123 = proto.readTag(p188, n123)

		if v1748 == proto.wireTypes.varint then
			local v1749

			v1749, n123 = proto.readVarInt(p188, n123)
		elseif v1748 == proto.wireTypes.lengthDelimited then
			if v1747 == 1 then
				local v1750

				v1750, n123 = proto.readBuffer(p188, n123)
				v1745.event_id = prop_types.StringProp.decode(v1750)
			elseif v1747 == 2 then
				local v1751

				v1751, n123 = proto.readBuffer(p188, n123)
				v1745.user_rsvp = prop_types.BoolProp.decode(v1751)
			else
				local v1752, v1753 = proto.readVarInt(p188, n123)

				n123 = v1753 + v1752
			end
		elseif v1748 == proto.wireTypes.i32 then
			local v1754

			v1754, n123 = proto.readFixed32(p188, n123)
		elseif v1748 == proto.wireTypes.i64 then
			local v1755

			v1755, n123 = proto.readFixed64(p188, n123)
		else
			error("Unsupported wire type: " .. v1748)
		end
	end

	return v1745
end
function t247.jsonEncode(p189) -- line: 11188
	local t249 = {}

	if p189.event_id ~= nil then
		t249.eventId = p189.event_id:jsonEncode()
	end

	if p189.user_rsvp ~= nil then
		t249.userRsvp = p189.user_rsvp:jsonEncode()
	end

	return t249
end
function t247.jsonDecode(t250: {[any]: any}) -- line: 11202
	-- upvalues: t247 (copy), prop_types (copy)
	local v1759 = t247.new()

	if t250.event_id ~= nil then
		v1759.event_id = prop_types.StringProp.jsonDecode(t250.event_id)
	end

	if t250.eventId ~= nil then
		v1759.event_id = prop_types.StringProp.jsonDecode(t250.eventId)
	end

	if t250.user_rsvp ~= nil then
		v1759.user_rsvp = prop_types.BoolProp.jsonDecode(t250.user_rsvp)
	end

	if t250.userRsvp ~= nil then
		v1759.user_rsvp = prop_types.BoolProp.jsonDecode(t250.userRsvp)
	end

	return v1759
end

t247.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.RsvpToEventAction_Params = t247
typeRegistry.default:register(t1.RsvpToEventAction_Params)

local t251 = {}

t251.__index = t251

function t251.new(t252: {[any]: any}?) -- line: 11238
	-- upvalues: t1 (copy), t251 (copy)
	return (setmetatable({
		action_type = if t252 ~= nil and t252.action_type ~= nil then t252.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t252 ~= nil and t252.action_params ~= nil then t252.action_params else nil
	}, t251))
end
function t251.encode(p190) -- line: 11247
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n124 = 0

	if p190.action_type ~= nil and (p190.action_type ~= nil and p190.action_type ~= 0 or p190.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1764, v1765 = proto.writeTag(buf, n124, 1, proto.wireTypes.varint)

		buf, n124 = proto.writeVarInt(v1764, v1765, t1.ActionType.toNumber(p190.action_type))
	end

	if p190.action_params ~= nil then
		local v1766 = p190.action_params:encode()
		local v1767, v1768 = proto.writeTag(buf, n124, 2, proto.wireTypes.lengthDelimited)

		buf, n124 = proto.writeBuffer(v1767, v1768, v1766, buffer.len(v1766))
	end

	local buf65 = buffer.create(n124)

	buffer.copy(buf65, 0, buf, 0, n124)

	return buf65
end
function t251.decode(p191: buffer) -- line: 11273
	-- upvalues: t251 (copy), proto (copy), t1 (copy)
	local v1771 = t251.new()
	local n125 = 0

	while n125 < buffer.len(p191) do
		local v1773, v1774

		v1773, v1774, n125 = proto.readTag(p191, n125)

		if v1774 == proto.wireTypes.varint then
			if v1773 == 1 then
				local v1775

				v1775, n125 = proto.readVarIntI32(p191, n125)
				v1771.action_type = t1.ActionType.fromNumber(v1775) or v1775
			else
				local v1776

				v1776, n125 = proto.readVarInt(p191, n125)
			end
		elseif v1774 == proto.wireTypes.lengthDelimited then
			if v1773 == 2 then
				local v1777

				v1777, n125 = proto.readBuffer(p191, n125)
				v1771.action_params = t1.OpenEventDetailsAction_Params.decode(v1777)
			else
				local v1778, v1779 = proto.readVarInt(p191, n125)

				n125 = v1779 + v1778
			end
		elseif v1774 == proto.wireTypes.i32 then
			local v1780

			v1780, n125 = proto.readFixed32(p191, n125)
		elseif v1774 == proto.wireTypes.i64 then
			local v1781

			v1781, n125 = proto.readFixed64(p191, n125)
		else
			error("Unsupported wire type: " .. v1774)
		end
	end

	return v1771
end
function t251.jsonEncode(p192) -- line: 11321
	-- upvalues: t1 (copy)
	local t253 = {}

	if p192.action_type ~= nil and (p192.action_type ~= nil and p192.action_type ~= 0 or p192.action_type ~= t1.ActionType.fromNumber(0)) then
		t253.actionType = if typeof(p192.action_type) ~= "number" then t1.ActionType.toNumber(p192.action_type) else p192.action_type
	end

	if p192.action_params ~= nil then
		t253.actionParams = p192.action_params:jsonEncode()
	end

	return t253
end
function t251.jsonDecode(t254: {[any]: any}) -- line: 11343
	-- upvalues: t251 (copy), t1 (copy)
	local v1785 = t251.new()

	if t254.action_type ~= nil then
		v1785.action_type = if typeof(t254.action_type) ~= "number" then t1.ActionType.fromName(t254.action_type) or t254.action_type else t1.ActionType.fromNumber(t254.action_type) or t254.action_type
	end

	if t254.actionType ~= nil then
		v1785.action_type = if typeof(t254.actionType) ~= "number" then t1.ActionType.fromName(t254.actionType) or t254.actionType else t1.ActionType.fromNumber(t254.actionType) or t254.actionType
	end

	if t254.action_params ~= nil then
		v1785.action_params = t1.OpenEventDetailsAction_Params.jsonDecode(t254.action_params)
	end

	if t254.actionParams ~= nil then
		v1785.action_params = t1.OpenEventDetailsAction_Params.jsonDecode(t254.actionParams)
	end

	return v1785
end

t251.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t1.OpenEventDetailsAction = t251
typeRegistry.default:register(t1.OpenEventDetailsAction)

local t255 = {}

t255.__index = t255

function t255.new(t256: {[any]: any}?) -- line: 11383
	-- upvalues: t255 (copy)
	return (setmetatable({
		event_id = if t256 ~= nil and t256.event_id ~= nil then t256.event_id else nil
	}, t255))
end
function t255.encode(p193) -- line: 11391
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n126 = 0

	if p193.event_id ~= nil then
		local v1790 = p193.event_id:encode()
		local v1791, v1792 = proto.writeTag(buf, n126, 1, proto.wireTypes.lengthDelimited)

		buf, n126 = proto.writeBuffer(v1791, v1792, v1790, buffer.len(v1790))
	end

	local buf66 = buffer.create(n126)

	buffer.copy(buf66, 0, buf, 0, n126)

	return buf66
end
function t255.decode(p194: buffer) -- line: 11406
	-- upvalues: t255 (copy), proto (copy), prop_types (copy)
	local v1795 = t255.new()
	local n127 = 0

	while n127 < buffer.len(p194) do
		local v1797, v1798

		v1797, v1798, n127 = proto.readTag(p194, n127)

		if v1798 == proto.wireTypes.varint then
			local v1799

			v1799, n127 = proto.readVarInt(p194, n127)
		elseif v1798 == proto.wireTypes.lengthDelimited then
			if v1797 == 1 then
				local v1800

				v1800, n127 = proto.readBuffer(p194, n127)
				v1795.event_id = prop_types.StringProp.decode(v1800)
			else
				local v1801, v1802 = proto.readVarInt(p194, n127)

				n127 = v1802 + v1801
			end
		elseif v1798 == proto.wireTypes.i32 then
			local v1803

			v1803, n127 = proto.readFixed32(p194, n127)
		elseif v1798 == proto.wireTypes.i64 then
			local v1804

			v1804, n127 = proto.readFixed64(p194, n127)
		else
			error("Unsupported wire type: " .. v1798)
		end
	end

	return v1795
end
function t255.jsonEncode(p195) -- line: 11449
	local t257 = {}

	if p195.event_id ~= nil then
		t257.eventId = p195.event_id:jsonEncode()
	end

	return t257
end
function t255.jsonDecode(t258: {[any]: any}) -- line: 11459
	-- upvalues: t255 (copy), prop_types (copy)
	local v1808 = t255.new()

	if t258.event_id ~= nil then
		v1808.event_id = prop_types.StringProp.jsonDecode(t258.event_id)
	end

	if t258.eventId ~= nil then
		v1808.event_id = prop_types.StringProp.jsonDecode(t258.eventId)
	end

	return v1808
end

t255.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenEventDetailsAction_Params = t255
typeRegistry.default:register(t1.OpenEventDetailsAction_Params)

local t259 = {}

t259.__index = t259

function t259.new(t260: {[any]: any}?) -- line: 11487
	-- upvalues: t1 (copy), t259 (copy)
	return (setmetatable({
		action_type = if t260 ~= nil and t260.action_type ~= nil then t260.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t260 ~= nil and t260.action_params ~= nil then t260.action_params else nil
	}, t259))
end
function t259.encode(p196) -- line: 11496
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n128 = 0

	if p196.action_type ~= nil and (p196.action_type ~= nil and p196.action_type ~= 0 or p196.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1813, v1814 = proto.writeTag(buf, n128, 1, proto.wireTypes.varint)

		buf, n128 = proto.writeVarInt(v1813, v1814, t1.ActionType.toNumber(p196.action_type))
	end

	if p196.action_params ~= nil then
		local v1815 = p196.action_params:encode()
		local v1816, v1817 = proto.writeTag(buf, n128, 2, proto.wireTypes.lengthDelimited)

		buf, n128 = proto.writeBuffer(v1816, v1817, v1815, buffer.len(v1815))
	end

	local buf67 = buffer.create(n128)

	buffer.copy(buf67, 0, buf, 0, n128)

	return buf67
end
function t259.decode(p197: buffer) -- line: 11522
	-- upvalues: t259 (copy), proto (copy), t1 (copy)
	local v1820 = t259.new()
	local n129 = 0

	while n129 < buffer.len(p197) do
		local v1822, v1823

		v1822, v1823, n129 = proto.readTag(p197, n129)

		if v1823 == proto.wireTypes.varint then
			if v1822 == 1 then
				local v1824

				v1824, n129 = proto.readVarIntI32(p197, n129)
				v1820.action_type = t1.ActionType.fromNumber(v1824) or v1824
			else
				local v1825

				v1825, n129 = proto.readVarInt(p197, n129)
			end
		elseif v1823 == proto.wireTypes.lengthDelimited then
			if v1822 == 2 then
				local v1826

				v1826, n129 = proto.readBuffer(p197, n129)
				v1820.action_params = t1.ApplyChartsFilterAction_Params.decode(v1826)
			else
				local v1827, v1828 = proto.readVarInt(p197, n129)

				n129 = v1828 + v1827
			end
		elseif v1823 == proto.wireTypes.i32 then
			local v1829

			v1829, n129 = proto.readFixed32(p197, n129)
		elseif v1823 == proto.wireTypes.i64 then
			local v1830

			v1830, n129 = proto.readFixed64(p197, n129)
		else
			error("Unsupported wire type: " .. v1823)
		end
	end

	return v1820
end
function t259.jsonEncode(p198) -- line: 11570
	-- upvalues: t1 (copy)
	local t261 = {}

	if p198.action_type ~= nil and (p198.action_type ~= nil and p198.action_type ~= 0 or p198.action_type ~= t1.ActionType.fromNumber(0)) then
		t261.actionType = if typeof(p198.action_type) ~= "number" then t1.ActionType.toNumber(p198.action_type) else p198.action_type
	end

	if p198.action_params ~= nil then
		t261.actionParams = p198.action_params:jsonEncode()
	end

	return t261
end
function t259.jsonDecode(t262: {[any]: any}) -- line: 11592
	-- upvalues: t259 (copy), t1 (copy)
	local v1834 = t259.new()

	if t262.action_type ~= nil then
		v1834.action_type = if typeof(t262.action_type) ~= "number" then t1.ActionType.fromName(t262.action_type) or t262.action_type else t1.ActionType.fromNumber(t262.action_type) or t262.action_type
	end

	if t262.actionType ~= nil then
		v1834.action_type = if typeof(t262.actionType) ~= "number" then t1.ActionType.fromName(t262.actionType) or t262.actionType else t1.ActionType.fromNumber(t262.actionType) or t262.actionType
	end

	if t262.action_params ~= nil then
		v1834.action_params = t1.ApplyChartsFilterAction_Params.jsonDecode(t262.action_params)
	end

	if t262.actionParams ~= nil then
		v1834.action_params = t1.ApplyChartsFilterAction_Params.jsonDecode(t262.actionParams)
	end

	return v1834
end

t259.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t1.ApplyChartsFilterAction = t259
typeRegistry.default:register(t1.ApplyChartsFilterAction)

local t263 = {}

t263.__index = t263

function t263.new(t264: {[any]: any}?) -- line: 11632
	-- upvalues: t263 (copy)
	return (setmetatable({
		session_id = if t264 ~= nil and t264.session_id ~= nil then t264.session_id else nil
	}, t263))
end
function t263.encode(p199) -- line: 11640
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n130 = 0

	if p199.session_id ~= nil then
		local v1839 = p199.session_id:encode()
		local v1840, v1841 = proto.writeTag(buf, n130, 1, proto.wireTypes.lengthDelimited)

		buf, n130 = proto.writeBuffer(v1840, v1841, v1839, buffer.len(v1839))
	end

	local buf68 = buffer.create(n130)

	buffer.copy(buf68, 0, buf, 0, n130)

	return buf68
end
function t263.decode(p200: buffer) -- line: 11655
	-- upvalues: t263 (copy), proto (copy), prop_types (copy)
	local v1844 = t263.new()
	local n131 = 0

	while n131 < buffer.len(p200) do
		local v1846, v1847

		v1846, v1847, n131 = proto.readTag(p200, n131)

		if v1847 == proto.wireTypes.varint then
			local v1848

			v1848, n131 = proto.readVarInt(p200, n131)
		elseif v1847 == proto.wireTypes.lengthDelimited then
			if v1846 == 1 then
				local v1849

				v1849, n131 = proto.readBuffer(p200, n131)
				v1844.session_id = prop_types.StringProp.decode(v1849)
			else
				local v1850, v1851 = proto.readVarInt(p200, n131)

				n131 = v1851 + v1850
			end
		elseif v1847 == proto.wireTypes.i32 then
			local v1852

			v1852, n131 = proto.readFixed32(p200, n131)
		elseif v1847 == proto.wireTypes.i64 then
			local v1853

			v1853, n131 = proto.readFixed64(p200, n131)
		else
			error("Unsupported wire type: " .. v1847)
		end
	end

	return v1844
end
function t263.jsonEncode(p201) -- line: 11698
	local t265 = {}

	if p201.session_id ~= nil then
		t265.sessionId = p201.session_id:jsonEncode()
	end

	return t265
end
function t263.jsonDecode(t266: {[any]: any}) -- line: 11708
	-- upvalues: t263 (copy), prop_types (copy)
	local v1857 = t263.new()

	if t266.session_id ~= nil then
		v1857.session_id = prop_types.StringProp.jsonDecode(t266.session_id)
	end

	if t266.sessionId ~= nil then
		v1857.session_id = prop_types.StringProp.jsonDecode(t266.sessionId)
	end

	return v1857
end

t263.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.ApplyChartsFilterAction_Params = t263
typeRegistry.default:register(t1.ApplyChartsFilterAction_Params)

local t267 = {}

t267.__index = t267

function t267.new(t268: {[any]: any}?) -- line: 11736
	-- upvalues: t1 (copy), t267 (copy)
	return (setmetatable({
		action_type = if t268 ~= nil and t268.action_type ~= nil then t268.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t268 ~= nil and t268.action_params ~= nil then t268.action_params else nil
	}, t267))
end
function t267.encode(p202) -- line: 11745
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n132 = 0

	if p202.action_type ~= nil and (p202.action_type ~= nil and p202.action_type ~= 0 or p202.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1862, v1863 = proto.writeTag(buf, n132, 1, proto.wireTypes.varint)

		buf, n132 = proto.writeVarInt(v1862, v1863, t1.ActionType.toNumber(p202.action_type))
	end

	if p202.action_params ~= nil then
		local v1864 = p202.action_params:encode()
		local v1865, v1866 = proto.writeTag(buf, n132, 2, proto.wireTypes.lengthDelimited)

		buf, n132 = proto.writeBuffer(v1865, v1866, v1864, buffer.len(v1864))
	end

	local buf69 = buffer.create(n132)

	buffer.copy(buf69, 0, buf, 0, n132)

	return buf69
end
function t267.decode(p203: buffer) -- line: 11771
	-- upvalues: t267 (copy), proto (copy), t1 (copy)
	local v1869 = t267.new()
	local n133 = 0

	while n133 < buffer.len(p203) do
		local v1871, v1872

		v1871, v1872, n133 = proto.readTag(p203, n133)

		if v1872 == proto.wireTypes.varint then
			if v1871 == 1 then
				local v1873

				v1873, n133 = proto.readVarIntI32(p203, n133)
				v1869.action_type = t1.ActionType.fromNumber(v1873) or v1873
			else
				local v1874

				v1874, n133 = proto.readVarInt(p203, n133)
			end
		elseif v1872 == proto.wireTypes.lengthDelimited then
			if v1871 == 2 then
				local v1875

				v1875, n133 = proto.readBuffer(p203, n133)
				v1869.action_params = t1.AnalyticsEventAction_Params.decode(v1875)
			else
				local v1876, v1877 = proto.readVarInt(p203, n133)

				n133 = v1877 + v1876
			end
		elseif v1872 == proto.wireTypes.i32 then
			local v1878

			v1878, n133 = proto.readFixed32(p203, n133)
		elseif v1872 == proto.wireTypes.i64 then
			local v1879

			v1879, n133 = proto.readFixed64(p203, n133)
		else
			error("Unsupported wire type: " .. v1872)
		end
	end

	return v1869
end
function t267.jsonEncode(p204) -- line: 11819
	-- upvalues: t1 (copy)
	local t269 = {}

	if p204.action_type ~= nil and (p204.action_type ~= nil and p204.action_type ~= 0 or p204.action_type ~= t1.ActionType.fromNumber(0)) then
		t269.actionType = if typeof(p204.action_type) ~= "number" then t1.ActionType.toNumber(p204.action_type) else p204.action_type
	end

	if p204.action_params ~= nil then
		t269.actionParams = p204.action_params:jsonEncode()
	end

	return t269
end
function t267.jsonDecode(t270: {[any]: any}) -- line: 11841
	-- upvalues: t267 (copy), t1 (copy)
	local v1883 = t267.new()

	if t270.action_type ~= nil then
		v1883.action_type = if typeof(t270.action_type) ~= "number" then t1.ActionType.fromName(t270.action_type) or t270.action_type else t1.ActionType.fromNumber(t270.action_type) or t270.action_type
	end

	if t270.actionType ~= nil then
		v1883.action_type = if typeof(t270.actionType) ~= "number" then t1.ActionType.fromName(t270.actionType) or t270.actionType else t1.ActionType.fromNumber(t270.actionType) or t270.actionType
	end

	if t270.action_params ~= nil then
		v1883.action_params = t1.AnalyticsEventAction_Params.jsonDecode(t270.action_params)
	end

	if t270.actionParams ~= nil then
		v1883.action_params = t1.AnalyticsEventAction_Params.jsonDecode(t270.actionParams)
	end

	return v1883
end

t267.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t1.AnalyticsEventAction = t267
typeRegistry.default:register(t1.AnalyticsEventAction)

local t271 = {}

t271.__index = t271

function t271.new(t272: {[any]: any}?) -- line: 11881
	-- upvalues: t271 (copy)
	return (setmetatable({
		event_name = if t272 ~= nil and t272.event_name ~= nil then t272.event_name else nil,
		event_fields = if t272 ~= nil and t272.event_fields ~= nil then t272.event_fields else nil
	}, t271))
end
function t271.encode(p205) -- line: 11890
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n134 = 0

	if p205.event_name ~= nil then
		local v1888 = p205.event_name:encode()
		local v1889, v1890 = proto.writeTag(buf, n134, 1, proto.wireTypes.lengthDelimited)

		buf, n134 = proto.writeBuffer(v1889, v1890, v1888, buffer.len(v1888))
	end

	if p205.event_fields ~= nil then
		local v1891 = p205.event_fields:encode()
		local v1892, v1893 = proto.writeTag(buf, n134, 2, proto.wireTypes.lengthDelimited)

		buf, n134 = proto.writeBuffer(v1892, v1893, v1891, buffer.len(v1891))
	end

	local buf70 = buffer.create(n134)

	buffer.copy(buf70, 0, buf, 0, n134)

	return buf70
end
function t271.decode(p206: buffer) -- line: 11911
	-- upvalues: t271 (copy), proto (copy), prop_types (copy)
	local v1896 = t271.new()
	local n135 = 0

	while n135 < buffer.len(p206) do
		local v1898, v1899

		v1898, v1899, n135 = proto.readTag(p206, n135)

		if v1899 == proto.wireTypes.varint then
			local v1900

			v1900, n135 = proto.readVarInt(p206, n135)
		elseif v1899 == proto.wireTypes.lengthDelimited then
			if v1898 == 1 then
				local v1901

				v1901, n135 = proto.readBuffer(p206, n135)
				v1896.event_name = prop_types.StringProp.decode(v1901)
			elseif v1898 == 2 then
				local v1902

				v1902, n135 = proto.readBuffer(p206, n135)
				v1896.event_fields = prop_types.StructProp.decode(v1902)
			else
				local v1903, v1904 = proto.readVarInt(p206, n135)

				n135 = v1904 + v1903
			end
		elseif v1899 == proto.wireTypes.i32 then
			local v1905

			v1905, n135 = proto.readFixed32(p206, n135)
		elseif v1899 == proto.wireTypes.i64 then
			local v1906

			v1906, n135 = proto.readFixed64(p206, n135)
		else
			error("Unsupported wire type: " .. v1899)
		end
	end

	return v1896
end
function t271.jsonEncode(p207) -- line: 11959
	local t273 = {}

	if p207.event_name ~= nil then
		t273.eventName = p207.event_name:jsonEncode()
	end

	if p207.event_fields ~= nil then
		t273.eventFields = p207.event_fields:jsonEncode()
	end

	return t273
end
function t271.jsonDecode(t274: {[any]: any}) -- line: 11973
	-- upvalues: t271 (copy), prop_types (copy)
	local v1910 = t271.new()

	if t274.event_name ~= nil then
		v1910.event_name = prop_types.StringProp.jsonDecode(t274.event_name)
	end

	if t274.eventName ~= nil then
		v1910.event_name = prop_types.StringProp.jsonDecode(t274.eventName)
	end

	if t274.event_fields ~= nil then
		v1910.event_fields = prop_types.StructProp.jsonDecode(t274.event_fields)
	end

	if t274.eventFields ~= nil then
		v1910.event_fields = prop_types.StructProp.jsonDecode(t274.eventFields)
	end

	return v1910
end

t271.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.AnalyticsEventAction_Params = t271
typeRegistry.default:register(t1.AnalyticsEventAction_Params)

local t275 = {}

t275.__index = t275

function t275.new(t276: {[any]: any}?) -- line: 12011
	-- upvalues: t1 (copy), t275 (copy)
	return (setmetatable({
		action_type = if t276 ~= nil and t276.action_type ~= nil then t276.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t276 ~= nil and t276.action_params ~= nil then t276.action_params else nil
	}, t275))
end
function t275.encode(p208) -- line: 12022
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n136 = 0

	if p208.action_type ~= nil and (p208.action_type ~= nil and p208.action_type ~= 0 or p208.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1915, v1916 = proto.writeTag(buf, n136, 1, proto.wireTypes.varint)

		buf, n136 = proto.writeVarInt(v1915, v1916, t1.ActionType.toNumber(p208.action_type))
	end

	if p208.action_params ~= nil then
		local v1917 = p208.action_params:encode()
		local v1918, v1919 = proto.writeTag(buf, n136, 2, proto.wireTypes.lengthDelimited)

		buf, n136 = proto.writeBuffer(v1918, v1919, v1917, buffer.len(v1917))
	end

	local buf71 = buffer.create(n136)

	buffer.copy(buf71, 0, buf, 0, n136)

	return buf71
end
function t275.decode(p209: buffer) -- line: 12048
	-- upvalues: t275 (copy), proto (copy), t1 (copy)
	local v1922 = t275.new()
	local n137 = 0

	while n137 < buffer.len(p209) do
		local v1924, v1925

		v1924, v1925, n137 = proto.readTag(p209, n137)

		if v1925 == proto.wireTypes.varint then
			if v1924 == 1 then
				local v1926

				v1926, n137 = proto.readVarIntI32(p209, n137)
				v1922.action_type = t1.ActionType.fromNumber(v1926) or v1926
			else
				local v1927

				v1927, n137 = proto.readVarInt(p209, n137)
			end
		elseif v1925 == proto.wireTypes.lengthDelimited then
			if v1924 == 2 then
				local v1928

				v1928, n137 = proto.readBuffer(p209, n137)
				v1922.action_params = t1.CustomAnalyticsEventAction_Params.decode(v1928)
			else
				local v1929, v1930 = proto.readVarInt(p209, n137)

				n137 = v1930 + v1929
			end
		elseif v1925 == proto.wireTypes.i32 then
			local v1931

			v1931, n137 = proto.readFixed32(p209, n137)
		elseif v1925 == proto.wireTypes.i64 then
			local v1932

			v1932, n137 = proto.readFixed64(p209, n137)
		else
			error("Unsupported wire type: " .. v1925)
		end
	end

	return v1922
end
function t275.jsonEncode(p210) -- line: 12096
	-- upvalues: t1 (copy)
	local t277 = {}

	if p210.action_type ~= nil and (p210.action_type ~= nil and p210.action_type ~= 0 or p210.action_type ~= t1.ActionType.fromNumber(0)) then
		t277.actionType = if typeof(p210.action_type) ~= "number" then t1.ActionType.toNumber(p210.action_type) else p210.action_type
	end

	if p210.action_params ~= nil then
		t277.actionParams = p210.action_params:jsonEncode()
	end

	return t277
end
function t275.jsonDecode(t278: {[any]: any}) -- line: 12118
	-- upvalues: t275 (copy), t1 (copy)
	local v1936 = t275.new()

	if t278.action_type ~= nil then
		v1936.action_type = if typeof(t278.action_type) ~= "number" then t1.ActionType.fromName(t278.action_type) or t278.action_type else t1.ActionType.fromNumber(t278.action_type) or t278.action_type
	end

	if t278.actionType ~= nil then
		v1936.action_type = if typeof(t278.actionType) ~= "number" then t1.ActionType.fromName(t278.actionType) or t278.actionType else t1.ActionType.fromNumber(t278.actionType) or t278.actionType
	end

	if t278.action_params ~= nil then
		v1936.action_params = t1.CustomAnalyticsEventAction_Params.jsonDecode(t278.action_params)
	end

	if t278.actionParams ~= nil then
		v1936.action_params = t1.CustomAnalyticsEventAction_Params.jsonDecode(t278.actionParams)
	end

	return v1936
end

t275.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t1.CustomAnalyticsEventAction = t275
typeRegistry.default:register(t1.CustomAnalyticsEventAction)

local t279 = {}

t279.__index = t279

function t279.new(t280: {[any]: any}?) -- line: 12158
	-- upvalues: t279 (copy)
	return (setmetatable({
		event_name = if t280 ~= nil and t280.event_name ~= nil then t280.event_name else nil,
		event_fields = if t280 ~= nil and t280.event_fields ~= nil then t280.event_fields else nil
	}, t279))
end
function t279.encode(p211) -- line: 12167
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n138 = 0

	if p211.event_name ~= nil then
		local v1941 = p211.event_name:encode()
		local v1942, v1943 = proto.writeTag(buf, n138, 1, proto.wireTypes.lengthDelimited)

		buf, n138 = proto.writeBuffer(v1942, v1943, v1941, buffer.len(v1941))
	end

	if p211.event_fields ~= nil then
		local v1944 = p211.event_fields:encode()
		local v1945, v1946 = proto.writeTag(buf, n138, 2, proto.wireTypes.lengthDelimited)

		buf, n138 = proto.writeBuffer(v1945, v1946, v1944, buffer.len(v1944))
	end

	local buf72 = buffer.create(n138)

	buffer.copy(buf72, 0, buf, 0, n138)

	return buf72
end
function t279.decode(p212: buffer) -- line: 12188
	-- upvalues: t279 (copy), proto (copy), prop_types (copy)
	local v1949 = t279.new()
	local n139 = 0

	while n139 < buffer.len(p212) do
		local v1951, v1952

		v1951, v1952, n139 = proto.readTag(p212, n139)

		if v1952 == proto.wireTypes.varint then
			local v1953

			v1953, n139 = proto.readVarInt(p212, n139)
		elseif v1952 == proto.wireTypes.lengthDelimited then
			if v1951 == 1 then
				local v1954

				v1954, n139 = proto.readBuffer(p212, n139)
				v1949.event_name = prop_types.StringProp.decode(v1954)
			elseif v1951 == 2 then
				local v1955

				v1955, n139 = proto.readBuffer(p212, n139)
				v1949.event_fields = prop_types.StructProp.decode(v1955)
			else
				local v1956, v1957 = proto.readVarInt(p212, n139)

				n139 = v1957 + v1956
			end
		elseif v1952 == proto.wireTypes.i32 then
			local v1958

			v1958, n139 = proto.readFixed32(p212, n139)
		elseif v1952 == proto.wireTypes.i64 then
			local v1959

			v1959, n139 = proto.readFixed64(p212, n139)
		else
			error("Unsupported wire type: " .. v1952)
		end
	end

	return v1949
end
function t279.jsonEncode(p213) -- line: 12236
	local t281 = {}

	if p213.event_name ~= nil then
		t281.eventName = p213.event_name:jsonEncode()
	end

	if p213.event_fields ~= nil then
		t281.eventFields = p213.event_fields:jsonEncode()
	end

	return t281
end
function t279.jsonDecode(t282: {[any]: any}) -- line: 12250
	-- upvalues: t279 (copy), prop_types (copy)
	local v1963 = t279.new()

	if t282.event_name ~= nil then
		v1963.event_name = prop_types.StringProp.jsonDecode(t282.event_name)
	end

	if t282.eventName ~= nil then
		v1963.event_name = prop_types.StringProp.jsonDecode(t282.eventName)
	end

	if t282.event_fields ~= nil then
		v1963.event_fields = prop_types.StructProp.jsonDecode(t282.event_fields)
	end

	if t282.eventFields ~= nil then
		v1963.event_fields = prop_types.StructProp.jsonDecode(t282.eventFields)
	end

	return v1963
end

t279.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.CustomAnalyticsEventAction_Params = t279
typeRegistry.default:register(t1.CustomAnalyticsEventAction_Params)

local t283 = {}

t283.__index = t283

function t283.new(t284: {[any]: any}?) -- line: 12290
	-- upvalues: t1 (copy), t283 (copy)
	return (setmetatable({
		action_type = if t284 ~= nil and t284.action_type ~= nil then t284.action_type else assert(t1.ActionType.fromNumber(0), "Enum has no 0 default"),
		action_params = if t284 ~= nil and t284.action_params ~= nil then t284.action_params else nil
	}, t283))
end
function t283.encode(p214) -- line: 12299
	-- upvalues: t1 (copy), proto (copy)
	local buf = buffer.create(0)
	local n140 = 0

	if p214.action_type ~= nil and (p214.action_type ~= nil and p214.action_type ~= 0 or p214.action_type ~= t1.ActionType.fromNumber(0)) then
		local v1968, v1969 = proto.writeTag(buf, n140, 1, proto.wireTypes.varint)

		buf, n140 = proto.writeVarInt(v1968, v1969, t1.ActionType.toNumber(p214.action_type))
	end

	if p214.action_params ~= nil then
		local v1970 = p214.action_params:encode()
		local v1971, v1972 = proto.writeTag(buf, n140, 2, proto.wireTypes.lengthDelimited)

		buf, n140 = proto.writeBuffer(v1971, v1972, v1970, buffer.len(v1970))
	end

	local buf73 = buffer.create(n140)

	buffer.copy(buf73, 0, buf, 0, n140)

	return buf73
end
function t283.decode(p215: buffer) -- line: 12325
	-- upvalues: t283 (copy), proto (copy), t1 (copy)
	local v1975 = t283.new()
	local n141 = 0

	while n141 < buffer.len(p215) do
		local v1977, v1978

		v1977, v1978, n141 = proto.readTag(p215, n141)

		if v1978 == proto.wireTypes.varint then
			if v1977 == 1 then
				local v1979

				v1979, n141 = proto.readVarIntI32(p215, n141)
				v1975.action_type = t1.ActionType.fromNumber(v1979) or v1979
			else
				local v1980

				v1980, n141 = proto.readVarInt(p215, n141)
			end
		elseif v1978 == proto.wireTypes.lengthDelimited then
			if v1977 == 2 then
				local v1981

				v1981, n141 = proto.readBuffer(p215, n141)
				v1975.action_params = t1.OpenGameInviteAction_Params.decode(v1981)
			else
				local v1982, v1983 = proto.readVarInt(p215, n141)

				n141 = v1983 + v1982
			end
		elseif v1978 == proto.wireTypes.i32 then
			local v1984

			v1984, n141 = proto.readFixed32(p215, n141)
		elseif v1978 == proto.wireTypes.i64 then
			local v1985

			v1985, n141 = proto.readFixed64(p215, n141)
		else
			error("Unsupported wire type: " .. v1978)
		end
	end

	return v1975
end
function t283.jsonEncode(p216) -- line: 12373
	-- upvalues: t1 (copy)
	local t285 = {}

	if p216.action_type ~= nil and (p216.action_type ~= nil and p216.action_type ~= 0 or p216.action_type ~= t1.ActionType.fromNumber(0)) then
		t285.actionType = if typeof(p216.action_type) ~= "number" then t1.ActionType.toNumber(p216.action_type) else p216.action_type
	end

	if p216.action_params ~= nil then
		t285.actionParams = p216.action_params:jsonEncode()
	end

	return t285
end
function t283.jsonDecode(t286: {[any]: any}) -- line: 12395
	-- upvalues: t283 (copy), t1 (copy)
	local v1989 = t283.new()

	if t286.action_type ~= nil then
		v1989.action_type = if typeof(t286.action_type) ~= "number" then t1.ActionType.fromName(t286.action_type) or t286.action_type else t1.ActionType.fromNumber(t286.action_type) or t286.action_type
	end

	if t286.actionType ~= nil then
		v1989.action_type = if typeof(t286.actionType) ~= "number" then t1.ActionType.fromName(t286.actionType) or t286.actionType else t1.ActionType.fromNumber(t286.actionType) or t286.actionType
	end

	if t286.action_params ~= nil then
		v1989.action_params = t1.OpenGameInviteAction_Params.jsonDecode(t286.action_params)
	end

	if t286.actionParams ~= nil then
		v1989.action_params = t1.OpenGameInviteAction_Params.jsonDecode(t286.actionParams)
	end

	return v1989
end

t283.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t1.OpenGameInviteAction = t283
typeRegistry.default:register(t1.OpenGameInviteAction)

local t287 = {}

t287.__index = t287

function t287.new(t288: {[any]: any}?) -- line: 12435
	-- upvalues: t287 (copy)
	return (setmetatable({
		universe_id = if t288 ~= nil and t288.universe_id ~= nil then t288.universe_id else nil,
		root_place_id = if t288 ~= nil and t288.root_place_id ~= nil then t288.root_place_id else nil,
		trigger = if t288 ~= nil and t288.trigger ~= nil then t288.trigger else nil,
		button_name = if t288 ~= nil and t288.button_name ~= nil then t288.button_name else nil
	}, t287))
end
function t287.encode(p217) -- line: 12446
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n142 = 0

	if p217.universe_id ~= nil then
		local v1994 = p217.universe_id:encode()
		local v1995, v1996 = proto.writeTag(buf, n142, 1, proto.wireTypes.lengthDelimited)

		buf, n142 = proto.writeBuffer(v1995, v1996, v1994, buffer.len(v1994))
	end

	if p217.root_place_id ~= nil then
		local v1997 = p217.root_place_id:encode()
		local v1998, v1999 = proto.writeTag(buf, n142, 2, proto.wireTypes.lengthDelimited)

		buf, n142 = proto.writeBuffer(v1998, v1999, v1997, buffer.len(v1997))
	end

	if p217.trigger ~= nil then
		local v2000 = p217.trigger:encode()
		local v2001, v2002 = proto.writeTag(buf, n142, 3, proto.wireTypes.lengthDelimited)

		buf, n142 = proto.writeBuffer(v2001, v2002, v2000, buffer.len(v2000))
	end

	if p217.button_name ~= nil then
		local v2003 = p217.button_name:encode()
		local v2004, v2005 = proto.writeTag(buf, n142, 4, proto.wireTypes.lengthDelimited)

		buf, n142 = proto.writeBuffer(v2004, v2005, v2003, buffer.len(v2003))
	end

	local buf74 = buffer.create(n142)

	buffer.copy(buf74, 0, buf, 0, n142)

	return buf74
end
function t287.decode(p218: buffer) -- line: 12479
	-- upvalues: t287 (copy), proto (copy), prop_types (copy)
	local v2008 = t287.new()
	local n143 = 0

	while n143 < buffer.len(p218) do
		local v2010, v2011

		v2010, v2011, n143 = proto.readTag(p218, n143)

		if v2011 == proto.wireTypes.varint then
			local v2012

			v2012, n143 = proto.readVarInt(p218, n143)
		elseif v2011 == proto.wireTypes.lengthDelimited then
			if v2010 == 1 then
				local v2013

				v2013, n143 = proto.readBuffer(p218, n143)
				v2008.universe_id = prop_types.StringProp.decode(v2013)
			elseif v2010 == 2 then
				local v2014

				v2014, n143 = proto.readBuffer(p218, n143)
				v2008.root_place_id = prop_types.StringProp.decode(v2014)
			elseif v2010 == 3 then
				local v2015

				v2015, n143 = proto.readBuffer(p218, n143)
				v2008.trigger = prop_types.StringProp.decode(v2015)
			elseif v2010 == 4 then
				local v2016

				v2016, n143 = proto.readBuffer(p218, n143)
				v2008.button_name = prop_types.StringProp.decode(v2016)
			else
				local v2017, v2018 = proto.readVarInt(p218, n143)

				n143 = v2018 + v2017
			end
		elseif v2011 == proto.wireTypes.i32 then
			local v2019

			v2019, n143 = proto.readFixed32(p218, n143)
		elseif v2011 == proto.wireTypes.i64 then
			local v2020

			v2020, n143 = proto.readFixed64(p218, n143)
		else
			error("Unsupported wire type: " .. v2011)
		end
	end

	return v2008
end
function t287.jsonEncode(p219) -- line: 12537
	local t289 = {}

	if p219.universe_id ~= nil then
		t289.universeId = p219.universe_id:jsonEncode()
	end

	if p219.root_place_id ~= nil then
		t289.rootPlaceId = p219.root_place_id:jsonEncode()
	end

	if p219.trigger ~= nil then
		t289.trigger = p219.trigger:jsonEncode()
	end

	if p219.button_name ~= nil then
		t289.buttonName = p219.button_name:jsonEncode()
	end

	return t289
end
function t287.jsonDecode(t290: {[any]: any}) -- line: 12559
	-- upvalues: t287 (copy), prop_types (copy)
	local v2024 = t287.new()

	if t290.universe_id ~= nil then
		v2024.universe_id = prop_types.StringProp.jsonDecode(t290.universe_id)
	end

	if t290.universeId ~= nil then
		v2024.universe_id = prop_types.StringProp.jsonDecode(t290.universeId)
	end

	if t290.root_place_id ~= nil then
		v2024.root_place_id = prop_types.StringProp.jsonDecode(t290.root_place_id)
	end

	if t290.rootPlaceId ~= nil then
		v2024.root_place_id = prop_types.StringProp.jsonDecode(t290.rootPlaceId)
	end

	if t290.trigger ~= nil then
		v2024.trigger = prop_types.StringProp.jsonDecode(t290.trigger)
	end

	if t290.button_name ~= nil then
		v2024.button_name = prop_types.StringProp.jsonDecode(t290.button_name)
	end

	if t290.buttonName ~= nil then
		v2024.button_name = prop_types.StringProp.jsonDecode(t290.buttonName)
	end

	return v2024
end

t287.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t1.OpenGameInviteAction_Params = t287
typeRegistry.default:register(t1.OpenGameInviteAction_Params)

local t291 = {}

t291.__index = t291

function t291.new(t292: {[any]: any}?) -- line: 12611
	-- upvalues: t291 (copy)
	return (setmetatable({
		kind = if t292 ~= nil and t292.kind ~= nil then t292.kind else nil,
		telemetry_handler = if t292 ~= nil and t292.telemetry_handler ~= nil then t292.telemetry_handler else nil
	}, t291))
end
function t291.encode(p220) -- line: 12618
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n144 = 0

	if p220.kind ~= nil then
		if p220.kind.type == "dismiss_dialog_action" then
			local v2029 = p220.kind.value:encode()
			local v2030, v2031 = proto.writeTag(buf, n144, 1, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2030, v2031, v2029, buffer.len(v2029))
		elseif p220.kind.type == "link_action" then
			local v2032 = p220.kind.value:encode()
			local v2033, v2034 = proto.writeTag(buf, n144, 2, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2033, v2034, v2032, buffer.len(v2032))
		elseif p220.kind.type == "open_game_details_action" then
			local v2035 = p220.kind.value:encode()
			local v2036, v2037 = proto.writeTag(buf, n144, 3, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2036, v2037, v2035, buffer.len(v2035))
		elseif p220.kind.type == "open_join_friends_action" then
			local v2038 = p220.kind.value:encode()
			local v2039, v2040 = proto.writeTag(buf, n144, 4, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2039, v2040, v2038, buffer.len(v2038))
		elseif p220.kind.type == "open_marketplace_try_on_action" then
			local v2041 = p220.kind.value:encode()
			local v2042, v2043 = proto.writeTag(buf, n144, 5, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2042, v2043, v2041, buffer.len(v2041))
		elseif p220.kind.type == "open_see_all_action" then
			local v2044 = p220.kind.value:encode()
			local v2045, v2046 = proto.writeTag(buf, n144, 6, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2045, v2046, v2044, buffer.len(v2044))
		elseif p220.kind.type == "open_sponsored_tooltip_action" then
			local v2047 = p220.kind.value:encode()
			local v2048, v2049 = proto.writeTag(buf, n144, 7, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2048, v2049, v2047, buffer.len(v2047))
		elseif p220.kind.type == "play_button_click_action" then
			local v2050 = p220.kind.value:encode()
			local v2051, v2052 = proto.writeTag(buf, n144, 8, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2051, v2052, v2050, buffer.len(v2050))
		elseif p220.kind.type == "update_user_settings_action" then
			local v2053 = p220.kind.value:encode()
			local v2054, v2055 = proto.writeTag(buf, n144, 9, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2054, v2055, v2053, buffer.len(v2053))
		elseif p220.kind.type == "open_tooltip_action" then
			local v2056 = p220.kind.value:encode()
			local v2057, v2058 = proto.writeTag(buf, n144, 10, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2057, v2058, v2056, buffer.len(v2056))
		elseif p220.kind.type == "open_badge_details_action" then
			local v2059 = p220.kind.value:encode()
			local v2060, v2061 = proto.writeTag(buf, n144, 11, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2060, v2061, v2059, buffer.len(v2059))
		elseif p220.kind.type == "load_more_from_api_action" then
			local v2062 = p220.kind.value:encode()
			local v2063, v2064 = proto.writeTag(buf, n144, 12, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2063, v2064, v2062, buffer.len(v2062))
		elseif p220.kind.type == "share_action" then
			local v2065 = p220.kind.value:encode()
			local v2066, v2067 = proto.writeTag(buf, n144, 13, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2066, v2067, v2065, buffer.len(v2065))
		elseif p220.kind.type == "open_abuse_report_action" then
			local v2068 = p220.kind.value:encode()
			local v2069, v2070 = proto.writeTag(buf, n144, 14, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2069, v2070, v2068, buffer.len(v2068))
		elseif p220.kind.type == "remove_badge_from_inventory_action" then
			local v2071 = p220.kind.value:encode()
			local v2072, v2073 = proto.writeTag(buf, n144, 15, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2072, v2073, v2071, buffer.len(v2071))
		elseif p220.kind.type == "open_profile_action" then
			local v2074 = p220.kind.value:encode()
			local v2075, v2076 = proto.writeTag(buf, n144, 16, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2075, v2076, v2074, buffer.len(v2074))
		elseif p220.kind.type == "open_facial_age_estimation_action" then
			local v2077 = p220.kind.value:encode()
			local v2078, v2079 = proto.writeTag(buf, n144, 17, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2078, v2079, v2077, buffer.len(v2077))
		elseif p220.kind.type == "open_add_connections_page_action" then
			local v2080 = p220.kind.value:encode()
			local v2081, v2082 = proto.writeTag(buf, n144, 18, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2081, v2082, v2080, buffer.len(v2080))
		elseif p220.kind.type == "open_marketplace_action" then
			local v2083 = p220.kind.value:encode()
			local v2084, v2085 = proto.writeTag(buf, n144, 19, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2084, v2085, v2083, buffer.len(v2083))
		elseif p220.kind.type == "hide_profile_completion_action" then
			local v2086 = p220.kind.value:encode()
			local v2087, v2088 = proto.writeTag(buf, n144, 20, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2087, v2088, v2086, buffer.len(v2086))
		elseif p220.kind.type == "select_marketplace_catalog_category" then
			local v2089 = p220.kind.value:encode()
			local v2090, v2091 = proto.writeTag(buf, n144, 21, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2090, v2091, v2089, buffer.len(v2089))
		elseif p220.kind.type == "select_marketplace_catalog_subcategory" then
			local v2092 = p220.kind.value:encode()
			local v2093, v2094 = proto.writeTag(buf, n144, 22, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2093, v2094, v2092, buffer.len(v2092))
		elseif p220.kind.type == "open_marketplace_catalog_see_all" then
			local v2095 = p220.kind.value:encode()
			local v2096, v2097 = proto.writeTag(buf, n144, 23, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2096, v2097, v2095, buffer.len(v2095))
		elseif p220.kind.type == "close_marketplace_category_tooltip" then
			local v2098 = p220.kind.value:encode()
			local v2099, v2100 = proto.writeTag(buf, n144, 24, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2099, v2100, v2098, buffer.len(v2098))
		elseif p220.kind.type == "resize_marketplace_catalog" then
			local v2101 = p220.kind.value:encode()
			local v2102, v2103 = proto.writeTag(buf, n144, 25, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2102, v2103, v2101, buffer.len(v2101))
		elseif p220.kind.type == "open_marketplace_catalog_filters" then
			local v2104 = p220.kind.value:encode()
			local v2105, v2106 = proto.writeTag(buf, n144, 26, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2105, v2106, v2104, buffer.len(v2104))
		elseif p220.kind.type == "open_social_link_action" then
			local v2107 = p220.kind.value:encode()
			local v2108, v2109 = proto.writeTag(buf, n144, 27, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2108, v2109, v2107, buffer.len(v2107))
		elseif p220.kind.type == "open_charts_sort_detail_action" then
			local v2110 = p220.kind.value:encode()
			local v2111, v2112 = proto.writeTag(buf, n144, 28, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2111, v2112, v2110, buffer.len(v2110))
		elseif p220.kind.type == "open_song_detail_action" then
			local v2113 = p220.kind.value:encode()
			local v2114, v2115 = proto.writeTag(buf, n144, 29, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2114, v2115, v2113, buffer.len(v2113))
		elseif p220.kind.type == "refresh_from_api_action" then
			local v2116 = p220.kind.value:encode()
			local v2117, v2118 = proto.writeTag(buf, n144, 30, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2117, v2118, v2116, buffer.len(v2116))
		elseif p220.kind.type == "rsvp_to_event_action" then
			local v2119 = p220.kind.value:encode()
			local v2120, v2121 = proto.writeTag(buf, n144, 31, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2120, v2121, v2119, buffer.len(v2119))
		elseif p220.kind.type == "apply_charts_filter_action" then
			local v2122 = p220.kind.value:encode()
			local v2123, v2124 = proto.writeTag(buf, n144, 32, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2123, v2124, v2122, buffer.len(v2122))
		elseif p220.kind.type == "analytics_event_action" then
			local v2125 = p220.kind.value:encode()
			local v2126, v2127 = proto.writeTag(buf, n144, 33, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2126, v2127, v2125, buffer.len(v2125))
		elseif p220.kind.type == "custom_analytics_event_action" then
			local v2128 = p220.kind.value:encode()
			local v2129, v2130 = proto.writeTag(buf, n144, 34, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2129, v2130, v2128, buffer.len(v2128))
		elseif p220.kind.type == "open_game_invite_action" then
			local v2131 = p220.kind.value:encode()
			local v2132, v2133 = proto.writeTag(buf, n144, 35, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2132, v2133, v2131, buffer.len(v2131))
		elseif p220.kind.type == "open_event_details_action" then
			local v2134 = p220.kind.value:encode()
			local v2135, v2136 = proto.writeTag(buf, n144, 36, proto.wireTypes.lengthDelimited)

			buf, n144 = proto.writeBuffer(v2135, v2136, v2134, buffer.len(v2134))
		end
	end

	if p220.telemetry_handler ~= nil then
		local v2137 = p220.telemetry_handler:encode()
		local v2138, v2139 = proto.writeTag(buf, n144, 1000, proto.wireTypes.lengthDelimited)

		buf, n144 = proto.writeBuffer(v2138, v2139, v2137, buffer.len(v2137))
	end

	local buf75 = buffer.create(n144)

	buffer.copy(buf75, 0, buf, 0, n144)

	return buf75
end
function t291.decode(p221: buffer) -- line: 12781
	-- upvalues: t291 (copy), proto (copy), t1 (copy), prop_types (copy)
	local v2142 = t291.new()
	local n145 = 0

	while n145 < buffer.len(p221) do
		local v2144, v2145

		v2144, v2145, n145 = proto.readTag(p221, n145)

		if v2145 == proto.wireTypes.varint then
			local v2146

			v2146, n145 = proto.readVarInt(p221, n145)
		elseif v2145 == proto.wireTypes.lengthDelimited then
			if v2144 == 1 then
				local v2147

				v2147, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "dismiss_dialog_action",
					value = t1.DismissDialogAction.decode(v2147)
				}
			elseif v2144 == 2 then
				local v2148

				v2148, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "link_action",
					value = t1.LinkAction.decode(v2148)
				}
			elseif v2144 == 3 then
				local v2149

				v2149, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_game_details_action",
					value = t1.OpenGameDetailsAction.decode(v2149)
				}
			elseif v2144 == 4 then
				local v2150

				v2150, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_join_friends_action",
					value = t1.OpenJoinFriendsAction.decode(v2150)
				}
			elseif v2144 == 5 then
				local v2151

				v2151, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_marketplace_try_on_action",
					value = t1.OpenMarketplaceTryOnAction.decode(v2151)
				}
			elseif v2144 == 6 then
				local v2152

				v2152, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_see_all_action",
					value = t1.OpenSeeAllAction.decode(v2152)
				}
			elseif v2144 == 7 then
				local v2153

				v2153, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_sponsored_tooltip_action",
					value = t1.OpenSponsoredTooltipAction.decode(v2153)
				}
			elseif v2144 == 8 then
				local v2154

				v2154, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "play_button_click_action",
					value = t1.PlayButtonClickAction.decode(v2154)
				}
			elseif v2144 == 9 then
				local v2155

				v2155, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "update_user_settings_action",
					value = t1.UpdateUserSettingsAction.decode(v2155)
				}
			elseif v2144 == 10 then
				local v2156

				v2156, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_tooltip_action",
					value = t1.OpenTooltipAction.decode(v2156)
				}
			elseif v2144 == 11 then
				local v2157

				v2157, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_badge_details_action",
					value = t1.OpenBadgeDetailsAction.decode(v2157)
				}
			elseif v2144 == 12 then
				local v2158

				v2158, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "load_more_from_api_action",
					value = t1.LoadMoreFromApiAction.decode(v2158)
				}
			elseif v2144 == 13 then
				local v2159

				v2159, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "share_action",
					value = t1.ShareAction.decode(v2159)
				}
			elseif v2144 == 14 then
				local v2160

				v2160, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_abuse_report_action",
					value = t1.OpenAbuseReportAction.decode(v2160)
				}
			elseif v2144 == 15 then
				local v2161

				v2161, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "remove_badge_from_inventory_action",
					value = t1.RemoveBadgeFromInventoryAction.decode(v2161)
				}
			elseif v2144 == 16 then
				local v2162

				v2162, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_profile_action",
					value = t1.OpenProfileAction.decode(v2162)
				}
			elseif v2144 == 17 then
				local v2163

				v2163, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_facial_age_estimation_action",
					value = t1.OpenFacialAgeEstimationAction.decode(v2163)
				}
			elseif v2144 == 18 then
				local v2164

				v2164, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_add_connections_page_action",
					value = t1.OpenAddConnectionsPageAction.decode(v2164)
				}
			elseif v2144 == 19 then
				local v2165

				v2165, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_marketplace_action",
					value = t1.OpenMarketplaceAction.decode(v2165)
				}
			elseif v2144 == 20 then
				local v2166

				v2166, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "hide_profile_completion_action",
					value = t1.HideProfileCompletionAction.decode(v2166)
				}
			elseif v2144 == 21 then
				local v2167

				v2167, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "select_marketplace_catalog_category",
					value = t1.SelectMarketplaceCatalogCategory.decode(v2167)
				}
			elseif v2144 == 22 then
				local v2168

				v2168, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t1.SelectMarketplaceCatalogSubcategory.decode(v2168)
				}
			elseif v2144 == 23 then
				local v2169

				v2169, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t1.OpenMarketplaceCatalogSeeAll.decode(v2169)
				}
			elseif v2144 == 24 then
				local v2170

				v2170, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "close_marketplace_category_tooltip",
					value = t1.CloseMarketplaceCategoryTooltip.decode(v2170)
				}
			elseif v2144 == 25 then
				local v2171

				v2171, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "resize_marketplace_catalog",
					value = t1.ResizeMarketplaceCatalog.decode(v2171)
				}
			elseif v2144 == 26 then
				local v2172

				v2172, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_marketplace_catalog_filters",
					value = t1.OpenMarketplaceCatalogFilters.decode(v2172)
				}
			elseif v2144 == 27 then
				local v2173

				v2173, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_social_link_action",
					value = t1.OpenSocialLinkAction.decode(v2173)
				}
			elseif v2144 == 28 then
				local v2174

				v2174, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_charts_sort_detail_action",
					value = t1.OpenChartsSortDetailAction.decode(v2174)
				}
			elseif v2144 == 29 then
				local v2175

				v2175, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_song_detail_action",
					value = t1.OpenSongDetailAction.decode(v2175)
				}
			elseif v2144 == 30 then
				local v2176

				v2176, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "refresh_from_api_action",
					value = t1.RefreshFromApiAction.decode(v2176)
				}
			elseif v2144 == 31 then
				local v2177

				v2177, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "rsvp_to_event_action",
					value = t1.RsvpToEventAction.decode(v2177)
				}
			elseif v2144 == 32 then
				local v2178

				v2178, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "apply_charts_filter_action",
					value = t1.ApplyChartsFilterAction.decode(v2178)
				}
			elseif v2144 == 33 then
				local v2179

				v2179, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "analytics_event_action",
					value = t1.AnalyticsEventAction.decode(v2179)
				}
			elseif v2144 == 34 then
				local v2180

				v2180, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "custom_analytics_event_action",
					value = t1.CustomAnalyticsEventAction.decode(v2180)
				}
			elseif v2144 == 35 then
				local v2181

				v2181, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_game_invite_action",
					value = t1.OpenGameInviteAction.decode(v2181)
				}
			elseif v2144 == 36 then
				local v2182

				v2182, n145 = proto.readBuffer(p221, n145)
				v2142.kind = {
					type = "open_event_details_action",
					value = t1.OpenEventDetailsAction.decode(v2182)
				}
			elseif v2144 == 1000 then
				local v2183

				v2183, n145 = proto.readBuffer(p221, n145)
				v2142.telemetry_handler = prop_types.StringProp.decode(v2183)
			else
				local v2184, v2185 = proto.readVarInt(p221, n145)

				n145 = v2185 + v2184
			end
		elseif v2145 == proto.wireTypes.i32 then
			local v2186

			v2186, n145 = proto.readFixed32(p221, n145)
		elseif v2145 == proto.wireTypes.i64 then
			local v2187

			v2187, n145 = proto.readFixed64(p221, n145)
		else
			error("Unsupported wire type: " .. v2145)
		end
	end

	return v2142
end
function t291.jsonEncode(p222) -- line: 13060
	local t293 = {}

	if p222.kind ~= nil then
		if p222.kind.type == "dismiss_dialog_action" then
			t293.dismissDialogAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "link_action" then
			t293.linkAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_game_details_action" then
			t293.openGameDetailsAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_join_friends_action" then
			t293.openJoinFriendsAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_marketplace_try_on_action" then
			t293.openMarketplaceTryOnAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_see_all_action" then
			t293.openSeeAllAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_sponsored_tooltip_action" then
			t293.openSponsoredTooltipAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "play_button_click_action" then
			t293.playButtonClickAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "update_user_settings_action" then
			t293.updateUserSettingsAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_tooltip_action" then
			t293.openTooltipAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_badge_details_action" then
			t293.openBadgeDetailsAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "load_more_from_api_action" then
			t293.loadMoreFromApiAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "share_action" then
			t293.shareAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_abuse_report_action" then
			t293.openAbuseReportAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "remove_badge_from_inventory_action" then
			t293.removeBadgeFromInventoryAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_profile_action" then
			t293.openProfileAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_facial_age_estimation_action" then
			t293.openFacialAgeEstimationAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_add_connections_page_action" then
			t293.openAddConnectionsPageAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_marketplace_action" then
			t293.openMarketplaceAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "hide_profile_completion_action" then
			t293.hideProfileCompletionAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "select_marketplace_catalog_category" then
			t293.selectMarketplaceCatalogCategory = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "select_marketplace_catalog_subcategory" then
			t293.selectMarketplaceCatalogSubcategory = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_marketplace_catalog_see_all" then
			t293.openMarketplaceCatalogSeeAll = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "close_marketplace_category_tooltip" then
			t293.closeMarketplaceCategoryTooltip = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "resize_marketplace_catalog" then
			t293.resizeMarketplaceCatalog = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_marketplace_catalog_filters" then
			t293.openMarketplaceCatalogFilters = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_social_link_action" then
			t293.openSocialLinkAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_charts_sort_detail_action" then
			t293.openChartsSortDetailAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_song_detail_action" then
			t293.openSongDetailAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "refresh_from_api_action" then
			t293.refreshFromApiAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "rsvp_to_event_action" then
			t293.rsvpToEventAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "apply_charts_filter_action" then
			t293.applyChartsFilterAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "analytics_event_action" then
			t293.analyticsEventAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "custom_analytics_event_action" then
			t293.customAnalyticsEventAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_game_invite_action" then
			t293.openGameInviteAction = p222.kind.value:jsonEncode()
		elseif p222.kind.type == "open_event_details_action" then
			t293.openEventDetailsAction = p222.kind.value:jsonEncode()
		end
	end

	if p222.telemetry_handler ~= nil then
		t293.telemetryHandler = p222.telemetry_handler:jsonEncode()
	end

	return t293
end
function t291.jsonDecode(t294: {[any]: any}) -- line: 13146
	-- upvalues: t291 (copy), t1 (copy), prop_types (copy)
	local v2191 = t291.new()

	if t294.dismiss_dialog_action ~= nil then
		v2191.kind = {
			type = "dismiss_dialog_action",
			value = t1.DismissDialogAction.jsonDecode(t294.dismiss_dialog_action)
		}
	end

	if t294.dismissDialogAction ~= nil then
		v2191.kind = {
			type = "dismiss_dialog_action",
			value = t1.DismissDialogAction.jsonDecode(t294.dismissDialogAction)
		}
	end

	if t294.link_action ~= nil then
		v2191.kind = {
			type = "link_action",
			value = t1.LinkAction.jsonDecode(t294.link_action)
		}
	end

	if t294.linkAction ~= nil then
		v2191.kind = {
			type = "link_action",
			value = t1.LinkAction.jsonDecode(t294.linkAction)
		}
	end

	if t294.open_game_details_action ~= nil then
		v2191.kind = {
			type = "open_game_details_action",
			value = t1.OpenGameDetailsAction.jsonDecode(t294.open_game_details_action)
		}
	end

	if t294.openGameDetailsAction ~= nil then
		v2191.kind = {
			type = "open_game_details_action",
			value = t1.OpenGameDetailsAction.jsonDecode(t294.openGameDetailsAction)
		}
	end

	if t294.open_join_friends_action ~= nil then
		v2191.kind = {
			type = "open_join_friends_action",
			value = t1.OpenJoinFriendsAction.jsonDecode(t294.open_join_friends_action)
		}
	end

	if t294.openJoinFriendsAction ~= nil then
		v2191.kind = {
			type = "open_join_friends_action",
			value = t1.OpenJoinFriendsAction.jsonDecode(t294.openJoinFriendsAction)
		}
	end

	if t294.open_marketplace_try_on_action ~= nil then
		v2191.kind = {
			type = "open_marketplace_try_on_action",
			value = t1.OpenMarketplaceTryOnAction.jsonDecode(t294.open_marketplace_try_on_action)
		}
	end

	if t294.openMarketplaceTryOnAction ~= nil then
		v2191.kind = {
			type = "open_marketplace_try_on_action",
			value = t1.OpenMarketplaceTryOnAction.jsonDecode(t294.openMarketplaceTryOnAction)
		}
	end

	if t294.open_see_all_action ~= nil then
		v2191.kind = {
			type = "open_see_all_action",
			value = t1.OpenSeeAllAction.jsonDecode(t294.open_see_all_action)
		}
	end

	if t294.openSeeAllAction ~= nil then
		v2191.kind = {
			type = "open_see_all_action",
			value = t1.OpenSeeAllAction.jsonDecode(t294.openSeeAllAction)
		}
	end

	if t294.open_sponsored_tooltip_action ~= nil then
		v2191.kind = {
			type = "open_sponsored_tooltip_action",
			value = t1.OpenSponsoredTooltipAction.jsonDecode(t294.open_sponsored_tooltip_action)
		}
	end

	if t294.openSponsoredTooltipAction ~= nil then
		v2191.kind = {
			type = "open_sponsored_tooltip_action",
			value = t1.OpenSponsoredTooltipAction.jsonDecode(t294.openSponsoredTooltipAction)
		}
	end

	if t294.play_button_click_action ~= nil then
		v2191.kind = {
			type = "play_button_click_action",
			value = t1.PlayButtonClickAction.jsonDecode(t294.play_button_click_action)
		}
	end

	if t294.playButtonClickAction ~= nil then
		v2191.kind = {
			type = "play_button_click_action",
			value = t1.PlayButtonClickAction.jsonDecode(t294.playButtonClickAction)
		}
	end

	if t294.update_user_settings_action ~= nil then
		v2191.kind = {
			type = "update_user_settings_action",
			value = t1.UpdateUserSettingsAction.jsonDecode(t294.update_user_settings_action)
		}
	end

	if t294.updateUserSettingsAction ~= nil then
		v2191.kind = {
			type = "update_user_settings_action",
			value = t1.UpdateUserSettingsAction.jsonDecode(t294.updateUserSettingsAction)
		}
	end

	if t294.open_tooltip_action ~= nil then
		v2191.kind = {
			type = "open_tooltip_action",
			value = t1.OpenTooltipAction.jsonDecode(t294.open_tooltip_action)
		}
	end

	if t294.openTooltipAction ~= nil then
		v2191.kind = {
			type = "open_tooltip_action",
			value = t1.OpenTooltipAction.jsonDecode(t294.openTooltipAction)
		}
	end

	if t294.open_badge_details_action ~= nil then
		v2191.kind = {
			type = "open_badge_details_action",
			value = t1.OpenBadgeDetailsAction.jsonDecode(t294.open_badge_details_action)
		}
	end

	if t294.openBadgeDetailsAction ~= nil then
		v2191.kind = {
			type = "open_badge_details_action",
			value = t1.OpenBadgeDetailsAction.jsonDecode(t294.openBadgeDetailsAction)
		}
	end

	if t294.load_more_from_api_action ~= nil then
		v2191.kind = {
			type = "load_more_from_api_action",
			value = t1.LoadMoreFromApiAction.jsonDecode(t294.load_more_from_api_action)
		}
	end

	if t294.loadMoreFromApiAction ~= nil then
		v2191.kind = {
			type = "load_more_from_api_action",
			value = t1.LoadMoreFromApiAction.jsonDecode(t294.loadMoreFromApiAction)
		}
	end

	if t294.share_action ~= nil then
		v2191.kind = {
			type = "share_action",
			value = t1.ShareAction.jsonDecode(t294.share_action)
		}
	end

	if t294.shareAction ~= nil then
		v2191.kind = {
			type = "share_action",
			value = t1.ShareAction.jsonDecode(t294.shareAction)
		}
	end

	if t294.open_abuse_report_action ~= nil then
		v2191.kind = {
			type = "open_abuse_report_action",
			value = t1.OpenAbuseReportAction.jsonDecode(t294.open_abuse_report_action)
		}
	end

	if t294.openAbuseReportAction ~= nil then
		v2191.kind = {
			type = "open_abuse_report_action",
			value = t1.OpenAbuseReportAction.jsonDecode(t294.openAbuseReportAction)
		}
	end

	if t294.remove_badge_from_inventory_action ~= nil then
		v2191.kind = {
			type = "remove_badge_from_inventory_action",
			value = t1.RemoveBadgeFromInventoryAction.jsonDecode(t294.remove_badge_from_inventory_action)
		}
	end

	if t294.removeBadgeFromInventoryAction ~= nil then
		v2191.kind = {
			type = "remove_badge_from_inventory_action",
			value = t1.RemoveBadgeFromInventoryAction.jsonDecode(t294.removeBadgeFromInventoryAction)
		}
	end

	if t294.open_profile_action ~= nil then
		v2191.kind = {
			type = "open_profile_action",
			value = t1.OpenProfileAction.jsonDecode(t294.open_profile_action)
		}
	end

	if t294.openProfileAction ~= nil then
		v2191.kind = {
			type = "open_profile_action",
			value = t1.OpenProfileAction.jsonDecode(t294.openProfileAction)
		}
	end

	if t294.open_facial_age_estimation_action ~= nil then
		v2191.kind = {
			type = "open_facial_age_estimation_action",
			value = t1.OpenFacialAgeEstimationAction.jsonDecode(t294.open_facial_age_estimation_action)
		}
	end

	if t294.openFacialAgeEstimationAction ~= nil then
		v2191.kind = {
			type = "open_facial_age_estimation_action",
			value = t1.OpenFacialAgeEstimationAction.jsonDecode(t294.openFacialAgeEstimationAction)
		}
	end

	if t294.open_add_connections_page_action ~= nil then
		v2191.kind = {
			type = "open_add_connections_page_action",
			value = t1.OpenAddConnectionsPageAction.jsonDecode(t294.open_add_connections_page_action)
		}
	end

	if t294.openAddConnectionsPageAction ~= nil then
		v2191.kind = {
			type = "open_add_connections_page_action",
			value = t1.OpenAddConnectionsPageAction.jsonDecode(t294.openAddConnectionsPageAction)
		}
	end

	if t294.open_marketplace_action ~= nil then
		v2191.kind = {
			type = "open_marketplace_action",
			value = t1.OpenMarketplaceAction.jsonDecode(t294.open_marketplace_action)
		}
	end

	if t294.openMarketplaceAction ~= nil then
		v2191.kind = {
			type = "open_marketplace_action",
			value = t1.OpenMarketplaceAction.jsonDecode(t294.openMarketplaceAction)
		}
	end

	if t294.hide_profile_completion_action ~= nil then
		v2191.kind = {
			type = "hide_profile_completion_action",
			value = t1.HideProfileCompletionAction.jsonDecode(t294.hide_profile_completion_action)
		}
	end

	if t294.hideProfileCompletionAction ~= nil then
		v2191.kind = {
			type = "hide_profile_completion_action",
			value = t1.HideProfileCompletionAction.jsonDecode(t294.hideProfileCompletionAction)
		}
	end

	if t294.select_marketplace_catalog_category ~= nil then
		v2191.kind = {
			type = "select_marketplace_catalog_category",
			value = t1.SelectMarketplaceCatalogCategory.jsonDecode(t294.select_marketplace_catalog_category)
		}
	end

	if t294.selectMarketplaceCatalogCategory ~= nil then
		v2191.kind = {
			type = "select_marketplace_catalog_category",
			value = t1.SelectMarketplaceCatalogCategory.jsonDecode(t294.selectMarketplaceCatalogCategory)
		}
	end

	if t294.select_marketplace_catalog_subcategory ~= nil then
		v2191.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t1.SelectMarketplaceCatalogSubcategory.jsonDecode(t294.select_marketplace_catalog_subcategory)
		}
	end

	if t294.selectMarketplaceCatalogSubcategory ~= nil then
		v2191.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t1.SelectMarketplaceCatalogSubcategory.jsonDecode(t294.selectMarketplaceCatalogSubcategory)
		}
	end

	if t294.open_marketplace_catalog_see_all ~= nil then
		v2191.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t1.OpenMarketplaceCatalogSeeAll.jsonDecode(t294.open_marketplace_catalog_see_all)
		}
	end

	if t294.openMarketplaceCatalogSeeAll ~= nil then
		v2191.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t1.OpenMarketplaceCatalogSeeAll.jsonDecode(t294.openMarketplaceCatalogSeeAll)
		}
	end

	if t294.close_marketplace_category_tooltip ~= nil then
		v2191.kind = {
			type = "close_marketplace_category_tooltip",
			value = t1.CloseMarketplaceCategoryTooltip.jsonDecode(t294.close_marketplace_category_tooltip)
		}
	end

	if t294.closeMarketplaceCategoryTooltip ~= nil then
		v2191.kind = {
			type = "close_marketplace_category_tooltip",
			value = t1.CloseMarketplaceCategoryTooltip.jsonDecode(t294.closeMarketplaceCategoryTooltip)
		}
	end

	if t294.resize_marketplace_catalog ~= nil then
		v2191.kind = {
			type = "resize_marketplace_catalog",
			value = t1.ResizeMarketplaceCatalog.jsonDecode(t294.resize_marketplace_catalog)
		}
	end

	if t294.resizeMarketplaceCatalog ~= nil then
		v2191.kind = {
			type = "resize_marketplace_catalog",
			value = t1.ResizeMarketplaceCatalog.jsonDecode(t294.resizeMarketplaceCatalog)
		}
	end

	if t294.open_marketplace_catalog_filters ~= nil then
		v2191.kind = {
			type = "open_marketplace_catalog_filters",
			value = t1.OpenMarketplaceCatalogFilters.jsonDecode(t294.open_marketplace_catalog_filters)
		}
	end

	if t294.openMarketplaceCatalogFilters ~= nil then
		v2191.kind = {
			type = "open_marketplace_catalog_filters",
			value = t1.OpenMarketplaceCatalogFilters.jsonDecode(t294.openMarketplaceCatalogFilters)
		}
	end

	if t294.open_social_link_action ~= nil then
		v2191.kind = {
			type = "open_social_link_action",
			value = t1.OpenSocialLinkAction.jsonDecode(t294.open_social_link_action)
		}
	end

	if t294.openSocialLinkAction ~= nil then
		v2191.kind = {
			type = "open_social_link_action",
			value = t1.OpenSocialLinkAction.jsonDecode(t294.openSocialLinkAction)
		}
	end

	if t294.open_charts_sort_detail_action ~= nil then
		v2191.kind = {
			type = "open_charts_sort_detail_action",
			value = t1.OpenChartsSortDetailAction.jsonDecode(t294.open_charts_sort_detail_action)
		}
	end

	if t294.openChartsSortDetailAction ~= nil then
		v2191.kind = {
			type = "open_charts_sort_detail_action",
			value = t1.OpenChartsSortDetailAction.jsonDecode(t294.openChartsSortDetailAction)
		}
	end

	if t294.open_song_detail_action ~= nil then
		v2191.kind = {
			type = "open_song_detail_action",
			value = t1.OpenSongDetailAction.jsonDecode(t294.open_song_detail_action)
		}
	end

	if t294.openSongDetailAction ~= nil then
		v2191.kind = {
			type = "open_song_detail_action",
			value = t1.OpenSongDetailAction.jsonDecode(t294.openSongDetailAction)
		}
	end

	if t294.refresh_from_api_action ~= nil then
		v2191.kind = {
			type = "refresh_from_api_action",
			value = t1.RefreshFromApiAction.jsonDecode(t294.refresh_from_api_action)
		}
	end

	if t294.refreshFromApiAction ~= nil then
		v2191.kind = {
			type = "refresh_from_api_action",
			value = t1.RefreshFromApiAction.jsonDecode(t294.refreshFromApiAction)
		}
	end

	if t294.rsvp_to_event_action ~= nil then
		v2191.kind = {
			type = "rsvp_to_event_action",
			value = t1.RsvpToEventAction.jsonDecode(t294.rsvp_to_event_action)
		}
	end

	if t294.rsvpToEventAction ~= nil then
		v2191.kind = {
			type = "rsvp_to_event_action",
			value = t1.RsvpToEventAction.jsonDecode(t294.rsvpToEventAction)
		}
	end

	if t294.apply_charts_filter_action ~= nil then
		v2191.kind = {
			type = "apply_charts_filter_action",
			value = t1.ApplyChartsFilterAction.jsonDecode(t294.apply_charts_filter_action)
		}
	end

	if t294.applyChartsFilterAction ~= nil then
		v2191.kind = {
			type = "apply_charts_filter_action",
			value = t1.ApplyChartsFilterAction.jsonDecode(t294.applyChartsFilterAction)
		}
	end

	if t294.analytics_event_action ~= nil then
		v2191.kind = {
			type = "analytics_event_action",
			value = t1.AnalyticsEventAction.jsonDecode(t294.analytics_event_action)
		}
	end

	if t294.analyticsEventAction ~= nil then
		v2191.kind = {
			type = "analytics_event_action",
			value = t1.AnalyticsEventAction.jsonDecode(t294.analyticsEventAction)
		}
	end

	if t294.custom_analytics_event_action ~= nil then
		v2191.kind = {
			type = "custom_analytics_event_action",
			value = t1.CustomAnalyticsEventAction.jsonDecode(t294.custom_analytics_event_action)
		}
	end

	if t294.customAnalyticsEventAction ~= nil then
		v2191.kind = {
			type = "custom_analytics_event_action",
			value = t1.CustomAnalyticsEventAction.jsonDecode(t294.customAnalyticsEventAction)
		}
	end

	if t294.open_game_invite_action ~= nil then
		v2191.kind = {
			type = "open_game_invite_action",
			value = t1.OpenGameInviteAction.jsonDecode(t294.open_game_invite_action)
		}
	end

	if t294.openGameInviteAction ~= nil then
		v2191.kind = {
			type = "open_game_invite_action",
			value = t1.OpenGameInviteAction.jsonDecode(t294.openGameInviteAction)
		}
	end

	if t294.open_event_details_action ~= nil then
		v2191.kind = {
			type = "open_event_details_action",
			value = t1.OpenEventDetailsAction.jsonDecode(t294.open_event_details_action)
		}
	end

	if t294.openEventDetailsAction ~= nil then
		v2191.kind = {
			type = "open_event_details_action",
			value = t1.OpenEventDetailsAction.jsonDecode(t294.openEventDetailsAction)
		}
	end

	if t294.telemetry_handler ~= nil then
		v2191.telemetry_handler = prop_types.StringProp.jsonDecode(t294.telemetry_handler)
	end

	if t294.telemetryHandler ~= nil then
		v2191.telemetry_handler = prop_types.StringProp.jsonDecode(t294.telemetryHandler)
	end

	return v2191
end

t291.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t1.Action = t291
typeRegistry.default:register(t1.Action)

local t295 = {}

t295.__index = t295

function t295.new(t296: {[any]: any}?) -- line: 13666
	-- upvalues: t295 (copy)
	return (setmetatable({
		kind = if t296 ~= nil and t296.kind ~= nil then t296.kind else nil
	}, t295))
end
function t295.encode(p223) -- line: 13672
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n146 = 0

	if p223.kind ~= nil then
		if p223.kind.type == "value" then
			local v2196 = p223.kind.value:encode()
			local v2197, v2198 = proto.writeTag(buf, n146, 1, proto.wireTypes.lengthDelimited)

			buf, n146 = proto.writeBuffer(v2197, v2198, v2196, buffer.len(v2196))
		elseif p223.kind.type == "conditional" then
			local v2199 = p223.kind.value:encode()
			local v2200, v2201 = proto.writeTag(buf, n146, 2, proto.wireTypes.lengthDelimited)

			buf, n146 = proto.writeBuffer(v2200, v2201, v2199, buffer.len(v2199))
		end
	end

	local buf76 = buffer.create(n146)

	buffer.copy(buf76, 0, buf, 0, n146)

	return buf76
end
function t295.decode(p224: buffer) -- line: 13693
	-- upvalues: t295 (copy), proto (copy), t1 (copy)
	local v2204 = t295.new()
	local n147 = 0

	while n147 < buffer.len(p224) do
		local v2206, v2207

		v2206, v2207, n147 = proto.readTag(p224, n147)

		if v2207 == proto.wireTypes.varint then
			local v2208

			v2208, n147 = proto.readVarInt(p224, n147)
		elseif v2207 == proto.wireTypes.lengthDelimited then
			if v2206 == 1 then
				local v2209

				v2209, n147 = proto.readBuffer(p224, n147)
				v2204.kind = {
					type = "value",
					value = t1.Action.decode(v2209)
				}
			elseif v2206 == 2 then
				local v2210

				v2210, n147 = proto.readBuffer(p224, n147)
				v2204.kind = {
					type = "conditional",
					value = t1.ActionProp_ConditionalOptions.decode(v2210)
				}
			else
				local v2211, v2212 = proto.readVarInt(p224, n147)

				n147 = v2212 + v2211
			end
		elseif v2207 == proto.wireTypes.i32 then
			local v2213

			v2213, n147 = proto.readFixed32(p224, n147)
		elseif v2207 == proto.wireTypes.i64 then
			local v2214

			v2214, n147 = proto.readFixed64(p224, n147)
		else
			error("Unsupported wire type: " .. v2207)
		end
	end

	return v2204
end
function t295.jsonEncode(p225) -- line: 13741
	local t297 = {}

	if p225.kind ~= nil then
		if p225.kind.type == "value" then
			t297.value = p225.kind.value:jsonEncode()

			return t297
		end

		if p225.kind.type == "conditional" then
			t297.conditional = p225.kind.value:jsonEncode()
		end
	end

	return t297
end
function t295.jsonDecode(t298: {[any]: any}) -- line: 13755
	-- upvalues: t295 (copy), t1 (copy)
	local v2218 = t295.new()

	if t298.value ~= nil then
		v2218.kind = {
			type = "value",
			value = t1.Action.jsonDecode(t298.value)
		}
	end

	if t298.conditional ~= nil then
		v2218.kind = {
			type = "conditional",
			value = t1.ActionProp_ConditionalOptions.jsonDecode(t298.conditional)
		}
	end

	return v2218
end

t295.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t1.ActionProp = t295
typeRegistry.default:register(t1.ActionProp)

local t299 = {}

t299.__index = t299

function t299.new(t300: {[any]: any}?) -- line: 13784
	-- upvalues: t299 (copy)
	return (setmetatable({
		condition = if t300 ~= nil and t300.condition ~= nil then t300.condition else nil,
		kind = if t300 ~= nil and t300.kind ~= nil then t300.kind else nil
	}, t299))
end
function t299.encode(p226) -- line: 13793
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n148 = 0

	if p226.condition ~= nil then
		local v2223 = p226.condition:encode()
		local v2224, v2225 = proto.writeTag(buf, n148, 1, proto.wireTypes.lengthDelimited)

		buf, n148 = proto.writeBuffer(v2224, v2225, v2223, buffer.len(v2223))
	end

	if p226.kind ~= nil and p226.kind.type == "value" then
		local v2226 = p226.kind.value:encode()
		local v2227, v2228 = proto.writeTag(buf, n148, 3, proto.wireTypes.lengthDelimited)

		buf, n148 = proto.writeBuffer(v2227, v2228, v2226, buffer.len(v2226))
	end

	local buf77 = buffer.create(n148)

	buffer.copy(buf77, 0, buf, 0, n148)

	return buf77
end
function t299.decode(p227: buffer) -- line: 13816
	-- upvalues: t299 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v2231 = t299.new()
	local n149 = 0

	while n149 < buffer.len(p227) do
		local v2233, v2234

		v2233, v2234, n149 = proto.readTag(p227, n149)

		if v2234 == proto.wireTypes.varint then
			local v2235

			v2235, n149 = proto.readVarInt(p227, n149)
		elseif v2234 == proto.wireTypes.lengthDelimited then
			if v2233 == 1 then
				local v2236

				v2236, n149 = proto.readBuffer(p227, n149)
				v2231.condition = prop_condition.PropCondition.decode(v2236)
			elseif v2233 == 3 then
				local v2237

				v2237, n149 = proto.readBuffer(p227, n149)
				v2231.kind = {
					type = "value",
					value = t1.Action.decode(v2237)
				}
			else
				local v2238, v2239 = proto.readVarInt(p227, n149)

				n149 = v2239 + v2238
			end
		elseif v2234 == proto.wireTypes.i32 then
			local v2240

			v2240, n149 = proto.readFixed32(p227, n149)
		elseif v2234 == proto.wireTypes.i64 then
			local v2241

			v2241, n149 = proto.readFixed64(p227, n149)
		else
			error("Unsupported wire type: " .. v2234)
		end
	end

	return v2231
end
function t299.jsonEncode(p228) -- line: 13864
	local t301 = {}

	if p228.condition ~= nil then
		t301.condition = p228.condition:jsonEncode()
	end

	if p228.kind ~= nil and p228.kind.type == "value" then
		t301.value = p228.kind.value:jsonEncode()
	end

	return t301
end
function t299.jsonDecode(t302: {[any]: any}) -- line: 13880
	-- upvalues: t299 (copy), prop_condition (copy), t1 (copy)
	local v2245 = t299.new()

	if t302.condition ~= nil then
		v2245.condition = prop_condition.PropCondition.jsonDecode(t302.condition)
	end

	if t302.value ~= nil then
		v2245.kind = {
			type = "value",
			value = t1.Action.jsonDecode(t302.value)
		}
	end

	return v2245
end

t299.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.ActionProp_ConditionalOption = t299
typeRegistry.default:register(t1.ActionProp_ConditionalOption)

local t303 = {}

t303.__index = t303

function t303.new(t304: {[any]: any}?) -- line: 13909
	-- upvalues: t303 (copy)
	return (setmetatable({
		options = if t304 ~= nil and t304.options ~= nil then t304.options else {}
	}, t303))
end
function t303.encode(p229) -- line: 13917
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n150 = 0

	if p229.options ~= nil and #p229.options > 0 then
		for _, v2251 in p229.options do
			local v2252 = v2251:encode()
			local v2253, v2254 = proto.writeTag(buf, n150, 1, proto.wireTypes.lengthDelimited)

			buf, n150 = proto.writeBuffer(v2253, v2254, v2252, buffer.len(v2252))
		end
	end

	local buf78 = buffer.create(n150)

	buffer.copy(buf78, 0, buf, 0, n150)

	return buf78
end
function t303.decode(p230: buffer) -- line: 13934
	-- upvalues: t303 (copy), proto (copy), t1 (copy)
	local v2257 = t303.new()
	local n151 = 0

	while n151 < buffer.len(p230) do
		local v2259, v2260

		v2259, v2260, n151 = proto.readTag(p230, n151)

		if v2260 == proto.wireTypes.varint then
			local v2261

			v2261, n151 = proto.readVarInt(p230, n151)
		elseif v2260 == proto.wireTypes.lengthDelimited then
			if v2259 == 1 then
				local v2262

				v2262, n151 = proto.readBuffer(p230, n151)
				table.insert(v2257.options, t1.ActionProp_ConditionalOption.decode(v2262))
			else
				local v2263, v2264 = proto.readVarInt(p230, n151)

				n151 = v2264 + v2263
			end
		elseif v2260 == proto.wireTypes.i32 then
			local v2265

			v2265, n151 = proto.readFixed32(p230, n151)
		elseif v2260 == proto.wireTypes.i64 then
			local v2266

			v2266, n151 = proto.readFixed64(p230, n151)
		else
			error("Unsupported wire type: " .. v2260)
		end
	end

	return v2257
end
function t303.jsonEncode(p231) -- line: 13977
	local t305 = {}

	if p231.options ~= nil and #p231.options > 0 then
		local t306 = {}

		for _, v2271 in p231.options do
			table.insert(t306, v2271:jsonEncode())
		end

		t305.options = t306
	end

	return t305
end
function t303.jsonDecode(t307: {[any]: any}) -- line: 13991
	-- upvalues: t303 (copy), t1 (copy)
	local v2273 = t303.new()

	if t307.options ~= nil then
		local t308 = {}

		for _, v2276 in t307.options do
			table.insert(t308, t1.ActionProp_ConditionalOption.jsonDecode(v2276))
		end

		v2273.options = t308
	end

	return v2273
end

t303.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.ActionProp_ConditionalOptions = t303
typeRegistry.default:register(t1.ActionProp_ConditionalOptions)

local t309 = {}

t309.__index = t309

function t309.new(t310: {[any]: any}?) -- line: 14020
	-- upvalues: t309 (copy)
	return (setmetatable({
		kind = if t310 ~= nil and t310.kind ~= nil then t310.kind else nil
	}, t309))
end
function t309.encode(p232) -- line: 14026
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n152 = 0

	if p232.kind ~= nil then
		if p232.kind.type == "value" then
			local v2281 = p232.kind.value:encode()
			local v2282, v2283 = proto.writeTag(buf, n152, 1, proto.wireTypes.lengthDelimited)

			buf, n152 = proto.writeBuffer(v2282, v2283, v2281, buffer.len(v2281))
		elseif p232.kind.type == "conditional" then
			local v2284 = p232.kind.value:encode()
			local v2285, v2286 = proto.writeTag(buf, n152, 2, proto.wireTypes.lengthDelimited)

			buf, n152 = proto.writeBuffer(v2285, v2286, v2284, buffer.len(v2284))
		end
	end

	local buf79 = buffer.create(n152)

	buffer.copy(buf79, 0, buf, 0, n152)

	return buf79
end
function t309.decode(p233: buffer) -- line: 14047
	-- upvalues: t309 (copy), proto (copy), t1 (copy)
	local v2289 = t309.new()
	local n153 = 0

	while n153 < buffer.len(p233) do
		local v2291, v2292

		v2291, v2292, n153 = proto.readTag(p233, n153)

		if v2292 == proto.wireTypes.varint then
			local v2293

			v2293, n153 = proto.readVarInt(p233, n153)
		elseif v2292 == proto.wireTypes.lengthDelimited then
			if v2291 == 1 then
				local v2294

				v2294, n153 = proto.readBuffer(p233, n153)
				v2289.kind = {
					type = "value",
					value = t1.FocusNavActionsProp_FocusNavData.decode(v2294)
				}
			elseif v2291 == 2 then
				local v2295

				v2295, n153 = proto.readBuffer(p233, n153)
				v2289.kind = {
					type = "conditional",
					value = t1.FocusNavActionsProp_ConditionalOptions.decode(v2295)
				}
			else
				local v2296, v2297 = proto.readVarInt(p233, n153)

				n153 = v2297 + v2296
			end
		elseif v2292 == proto.wireTypes.i32 then
			local v2298

			v2298, n153 = proto.readFixed32(p233, n153)
		elseif v2292 == proto.wireTypes.i64 then
			local v2299

			v2299, n153 = proto.readFixed64(p233, n153)
		else
			error("Unsupported wire type: " .. v2292)
		end
	end

	return v2289
end
function t309.jsonEncode(p234) -- line: 14096
	local t311 = {}

	if p234.kind ~= nil then
		if p234.kind.type == "value" then
			t311.value = p234.kind.value:jsonEncode()

			return t311
		end

		if p234.kind.type == "conditional" then
			t311.conditional = p234.kind.value:jsonEncode()
		end
	end

	return t311
end
function t309.jsonDecode(t312: {[any]: any}) -- line: 14110
	-- upvalues: t309 (copy), t1 (copy)
	local v2303 = t309.new()

	if t312.value ~= nil then
		v2303.kind = {
			type = "value",
			value = t1.FocusNavActionsProp_FocusNavData.jsonDecode(t312.value)
		}
	end

	if t312.conditional ~= nil then
		v2303.kind = {
			type = "conditional",
			value = t1.FocusNavActionsProp_ConditionalOptions.jsonDecode(t312.conditional)
		}
	end

	return v2303
end

t309.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t1.FocusNavActionsProp = t309
typeRegistry.default:register(t1.FocusNavActionsProp)

local t313 = {}

t313.__index = t313

function t313.new(t314: {[any]: any}?) -- line: 14141
	-- upvalues: t313 (copy)
	return (setmetatable({
		condition = if t314 ~= nil and t314.condition ~= nil then t314.condition else nil,
		kind = if t314 ~= nil and t314.kind ~= nil then t314.kind else nil
	}, t313))
end
function t313.encode(p235) -- line: 14150
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n154 = 0

	if p235.condition ~= nil then
		local v2308 = p235.condition:encode()
		local v2309, v2310 = proto.writeTag(buf, n154, 1, proto.wireTypes.lengthDelimited)

		buf, n154 = proto.writeBuffer(v2309, v2310, v2308, buffer.len(v2308))
	end

	if p235.kind ~= nil and p235.kind.type == "value" then
		local v2311 = p235.kind.value:encode()
		local v2312, v2313 = proto.writeTag(buf, n154, 3, proto.wireTypes.lengthDelimited)

		buf, n154 = proto.writeBuffer(v2312, v2313, v2311, buffer.len(v2311))
	end

	local buf80 = buffer.create(n154)

	buffer.copy(buf80, 0, buf, 0, n154)

	return buf80
end
function t313.decode(p236: buffer) -- line: 14173
	-- upvalues: t313 (copy), proto (copy), prop_condition (copy), t1 (copy)
	local v2316 = t313.new()
	local n155 = 0

	while n155 < buffer.len(p236) do
		local v2318, v2319

		v2318, v2319, n155 = proto.readTag(p236, n155)

		if v2319 == proto.wireTypes.varint then
			local v2320

			v2320, n155 = proto.readVarInt(p236, n155)
		elseif v2319 == proto.wireTypes.lengthDelimited then
			if v2318 == 1 then
				local v2321

				v2321, n155 = proto.readBuffer(p236, n155)
				v2316.condition = prop_condition.PropCondition.decode(v2321)
			elseif v2318 == 3 then
				local v2322

				v2322, n155 = proto.readBuffer(p236, n155)
				v2316.kind = {
					type = "value",
					value = t1.FocusNavActionsProp_FocusNavData.decode(v2322)
				}
			else
				local v2323, v2324 = proto.readVarInt(p236, n155)

				n155 = v2324 + v2323
			end
		elseif v2319 == proto.wireTypes.i32 then
			local v2325

			v2325, n155 = proto.readFixed32(p236, n155)
		elseif v2319 == proto.wireTypes.i64 then
			local v2326

			v2326, n155 = proto.readFixed64(p236, n155)
		else
			error("Unsupported wire type: " .. v2319)
		end
	end

	return v2316
end
function t313.jsonEncode(p237) -- line: 14221
	local t315 = {}

	if p237.condition ~= nil then
		t315.condition = p237.condition:jsonEncode()
	end

	if p237.kind ~= nil and p237.kind.type == "value" then
		t315.value = p237.kind.value:jsonEncode()
	end

	return t315
end
function t313.jsonDecode(t316: {[any]: any}) -- line: 14237
	-- upvalues: t313 (copy), prop_condition (copy), t1 (copy)
	local v2330 = t313.new()

	if t316.condition ~= nil then
		v2330.condition = prop_condition.PropCondition.jsonDecode(t316.condition)
	end

	if t316.value ~= nil then
		v2330.kind = {
			type = "value",
			value = t1.FocusNavActionsProp_FocusNavData.jsonDecode(t316.value)
		}
	end

	return v2330
end

t313.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t1.FocusNavActionsProp_ConditionalOption = t313
typeRegistry.default:register(t1.FocusNavActionsProp_ConditionalOption)

local t317 = {}

t317.__index = t317

function t317.new(t318: {[any]: any}?) -- line: 14268
	-- upvalues: t317 (copy)
	return (setmetatable({
		options = if t318 ~= nil and t318.options ~= nil then t318.options else {}
	}, t317))
end
function t317.encode(p238) -- line: 14276
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n156 = 0

	if p238.options ~= nil and #p238.options > 0 then
		for _, v2336 in p238.options do
			local v2337 = v2336:encode()
			local v2338, v2339 = proto.writeTag(buf, n156, 1, proto.wireTypes.lengthDelimited)

			buf, n156 = proto.writeBuffer(v2338, v2339, v2337, buffer.len(v2337))
		end
	end

	local buf81 = buffer.create(n156)

	buffer.copy(buf81, 0, buf, 0, n156)

	return buf81
end
function t317.decode(p239: buffer) -- line: 14293
	-- upvalues: t317 (copy), proto (copy), t1 (copy)
	local v2342 = t317.new()
	local n157 = 0

	while n157 < buffer.len(p239) do
		local v2344, v2345

		v2344, v2345, n157 = proto.readTag(p239, n157)

		if v2345 == proto.wireTypes.varint then
			local v2346

			v2346, n157 = proto.readVarInt(p239, n157)
		elseif v2345 == proto.wireTypes.lengthDelimited then
			if v2344 == 1 then
				local v2347

				v2347, n157 = proto.readBuffer(p239, n157)
				table.insert(v2342.options, t1.FocusNavActionsProp_ConditionalOption.decode(v2347))
			else
				local v2348, v2349 = proto.readVarInt(p239, n157)

				n157 = v2349 + v2348
			end
		elseif v2345 == proto.wireTypes.i32 then
			local v2350

			v2350, n157 = proto.readFixed32(p239, n157)
		elseif v2345 == proto.wireTypes.i64 then
			local v2351

			v2351, n157 = proto.readFixed64(p239, n157)
		else
			error("Unsupported wire type: " .. v2345)
		end
	end

	return v2342
end
function t317.jsonEncode(p240) -- line: 14336
	local t319 = {}

	if p240.options ~= nil and #p240.options > 0 then
		local t320 = {}

		for _, v2356 in p240.options do
			table.insert(t320, v2356:jsonEncode())
		end

		t319.options = t320
	end

	return t319
end
function t317.jsonDecode(t321: {[any]: any}) -- line: 14350
	-- upvalues: t317 (copy), t1 (copy)
	local v2358 = t317.new()

	if t321.options ~= nil then
		local t322 = {}

		for _, v2361 in t321.options do
			table.insert(t322, t1.FocusNavActionsProp_ConditionalOption.jsonDecode(v2361))
		end

		v2358.options = t322
	end

	return v2358
end

t317.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t1.FocusNavActionsProp_ConditionalOptions = t317
typeRegistry.default:register(t1.FocusNavActionsProp_ConditionalOptions)

local t323 = {}

t323.__index = t323

function t323.new(t324: {[any]: any}?) -- line: 14381
	-- upvalues: t323 (copy)
	return (setmetatable({
		keys = if t324 ~= nil and t324.keys ~= nil then t324.keys else {},
		events = if t324 ~= nil and t324.events ~= nil then t324.events else {}
	}, t323))
end
function t323.encode(p241) -- line: 14390
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n158 = 0

	if p241.keys ~= nil and next(p241.keys) ~= nil then
		for v2366, v2367 in p241.keys do
			local buf82 = buffer.create(0)
			local v2369, v2370 = proto.writeTag(buf82, 0, 1, proto.wireTypes.lengthDelimited)
			local v2371, v2372 = proto.writeString(v2369, v2370, v2366)
			local v2373, v2374 = proto.writeTag(v2371, v2372, 2, proto.wireTypes.lengthDelimited)
			local v2375, v2376 = proto.writeString(v2373, v2374, v2367)
			local v2377, v2378 = proto.writeTag(buf, n158, 1, proto.wireTypes.lengthDelimited)

			buf, n158 = proto.writeBuffer(v2377, v2378, v2375, v2376)
		end
	end

	if p241.events ~= nil and next(p241.events) ~= nil then
		for v2379, v2380 in p241.events do
			local buf83 = buffer.create(0)
			local v2382, v2383 = proto.writeTag(buf83, 0, 1, proto.wireTypes.lengthDelimited)
			local v2384, v2385 = proto.writeString(v2382, v2383, v2379)
			local v2386 = v2380:encode()
			local v2387, v2388 = proto.writeTag(v2384, v2385, 2, proto.wireTypes.lengthDelimited)
			local v2389, v2390 = proto.writeBuffer(v2387, v2388, v2386, buffer.len(v2386))
			local v2391, v2392 = proto.writeTag(buf, n158, 2, proto.wireTypes.lengthDelimited)

			buf, n158 = proto.writeBuffer(v2391, v2392, v2389, v2390)
		end
	end

	local buf84 = buffer.create(n158)

	buffer.copy(buf84, 0, buf, 0, n158)

	return buf84
end
function t323.decode(p242: buffer) -- line: 14426
	-- upvalues: t323 (copy), proto (copy), t1 (copy), struct (copy)
	local v2395 = t323.new()
	local n159 = 0

	while n159 < buffer.len(p242) do
		local v2397, v2398

		v2397, v2398, n159 = proto.readTag(p242, n159)

		if v2398 == proto.wireTypes.varint then
			local v2399

			v2399, n159 = proto.readVarInt(p242, n159)
		elseif v2398 == proto.wireTypes.lengthDelimited then
			if v2397 == 1 then
				local v2400

				v2400, n159 = proto.readBuffer(p242, n159)

				local v2401 = t1.FocusNavActionsProp_FocusNavData_KeysEntry.decode(v2400)

				v2395.keys[v2401.key or ""] = v2401.value or ""
			elseif v2397 == 2 then
				local v2402

				v2402, n159 = proto.readBuffer(p242, n159)

				local v2403 = t1.FocusNavActionsProp_FocusNavData_EventsEntry.decode(v2402)
				local v2404 = struct.Struct.new()

				v2395.events[v2403.key or ""] = v2403.value or v2404
			else
				local v2405, v2406 = proto.readVarInt(p242, n159)

				n159 = v2406 + v2405
			end
		elseif v2398 == proto.wireTypes.i32 then
			local v2407

			v2407, n159 = proto.readFixed32(p242, n159)
		elseif v2398 == proto.wireTypes.i64 then
			local v2408

			v2408, n159 = proto.readFixed64(p242, n159)
		else
			error("Unsupported wire type: " .. v2398)
		end
	end

	return v2395
end
function t323.jsonEncode(p243) -- line: 14488
	local t325 = {}

	if p243.keys ~= nil and next(p243.keys) ~= nil then
		local t326 = {}

		for v2412, v2413 in p243.keys do
			t326[v2412] = v2413
		end

		t325.keys = t326
	end

	if p243.events ~= nil and next(p243.events) ~= nil then
		local t327 = {}

		for v2415, v2416 in p243.events do
			t327[v2415] = v2416:jsonEncode()
		end

		t325.events = t327
	end

	return t325
end
function t323.jsonDecode(t328: {[any]: any}) -- line: 14510
	-- upvalues: t323 (copy), struct (copy)
	local v2418 = t323.new()

	if t328.keys ~= nil then
		local t329 = {}

		for v2420, v2421 in t328.keys do
			t329[v2420] = v2421
		end

		v2418.keys = t329
	end

	if t328.events ~= nil then
		local t330 = {}

		for v2423, v2424 in t328.events do
			t330[v2423] = struct.Struct.jsonDecode(v2424)
		end

		v2418.events = t330
	end

	return v2418
end

t323.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t1.FocusNavActionsProp_FocusNavData = t323
typeRegistry.default:register(t1.FocusNavActionsProp_FocusNavData)

local t331 = {}

t331.__index = t331

function t331.new(t332: {[any]: any}?) -- line: 14550
	-- upvalues: t331 (copy)
	return (setmetatable({
		key = if t332 ~= nil and t332.key ~= nil then t332.key else "",
		value = if t332 ~= nil and t332.value ~= nil then t332.value else ""
	}, t331))
end
function t331.encode(p244) -- line: 14559
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n160 = 0

	if p244.key ~= nil and p244.key ~= "" then
		local v2429, v2430 = proto.writeTag(buf, n160, 1, proto.wireTypes.lengthDelimited)

		buf, n160 = proto.writeString(v2429, v2430, p244.key)
	end

	if p244.value ~= nil and p244.value ~= "" then
		local v2431, v2432 = proto.writeTag(buf, n160, 2, proto.wireTypes.lengthDelimited)

		buf, n160 = proto.writeString(v2431, v2432, p244.value)
	end

	local buf85 = buffer.create(n160)

	buffer.copy(buf85, 0, buf, 0, n160)

	return buf85
end
function t331.decode(p245: buffer) -- line: 14580
	-- upvalues: t331 (copy), proto (copy)
	local v2435 = t331.new()
	local n161 = 0

	while n161 < buffer.len(p245) do
		local v2437, v2438

		v2437, v2438, n161 = proto.readTag(p245, n161)

		if v2438 == proto.wireTypes.varint then
			local v2439

			v2439, n161 = proto.readVarInt(p245, n161)
		elseif v2438 == proto.wireTypes.lengthDelimited then
			if v2437 == 1 then
				local v2440

				v2440, n161 = proto.readBuffer(p245, n161)
				v2435.key = buffer.tostring(v2440)
			elseif v2437 == 2 then
				local v2441

				v2441, n161 = proto.readBuffer(p245, n161)
				v2435.value = buffer.tostring(v2441)
			else
				local v2442, v2443 = proto.readVarInt(p245, n161)

				n161 = v2443 + v2442
			end
		elseif v2438 == proto.wireTypes.i32 then
			local v2444

			v2444, n161 = proto.readFixed32(p245, n161)
		elseif v2438 == proto.wireTypes.i64 then
			local v2445

			v2445, n161 = proto.readFixed64(p245, n161)
		else
			error("Unsupported wire type: " .. v2438)
		end
	end

	return v2435
end
function t331.jsonEncode(p246) -- line: 14630
	local t333 = {}

	if p246.key ~= nil and p246.key ~= "" then
		t333.key = p246.key
	end

	if p246.value ~= nil and p246.value ~= "" then
		t333.value = p246.value
	end

	return t333
end
function t331.jsonDecode(t334: {[any]: any}) -- line: 14646
	-- upvalues: t331 (copy)
	local v2449 = t331.new()

	if t334.key ~= nil then
		v2449.key = t334.key
	end

	if t334.value ~= nil then
		v2449.value = t334.value
	end

	return v2449
end

t331.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t1.FocusNavActionsProp_FocusNavData_KeysEntry = t331
typeRegistry.default:register(t1.FocusNavActionsProp_FocusNavData_KeysEntry)

local t335 = {}

t335.__index = t335

function t335.new(t336: {[any]: any}?) -- line: 14676
	-- upvalues: t335 (copy)
	return (setmetatable({
		key = if t336 ~= nil and t336.key ~= nil then t336.key else "",
		value = if t336 ~= nil and t336.value ~= nil then t336.value else nil
	}, t335))
end
function t335.encode(p247) -- line: 14685
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n162 = 0

	if p247.key ~= nil and p247.key ~= "" then
		local v2454, v2455 = proto.writeTag(buf, n162, 1, proto.wireTypes.lengthDelimited)

		buf, n162 = proto.writeString(v2454, v2455, p247.key)
	end

	if p247.value ~= nil then
		local v2456 = p247.value:encode()
		local v2457, v2458 = proto.writeTag(buf, n162, 2, proto.wireTypes.lengthDelimited)

		buf, n162 = proto.writeBuffer(v2457, v2458, v2456, buffer.len(v2456))
	end

	local buf86 = buffer.create(n162)

	buffer.copy(buf86, 0, buf, 0, n162)

	return buf86
end
function t335.decode(p248: buffer) -- line: 14707
	-- upvalues: t335 (copy), proto (copy), struct (copy)
	local v2461 = t335.new()
	local n163 = 0

	while n163 < buffer.len(p248) do
		local v2463, v2464

		v2463, v2464, n163 = proto.readTag(p248, n163)

		if v2464 == proto.wireTypes.varint then
			local v2465

			v2465, n163 = proto.readVarInt(p248, n163)
		elseif v2464 == proto.wireTypes.lengthDelimited then
			if v2463 == 1 then
				local v2466

				v2466, n163 = proto.readBuffer(p248, n163)
				v2461.key = buffer.tostring(v2466)
			elseif v2463 == 2 then
				local v2467

				v2467, n163 = proto.readBuffer(p248, n163)
				v2461.value = struct.Struct.decode(v2467)
			else
				local v2468, v2469 = proto.readVarInt(p248, n163)

				n163 = v2469 + v2468
			end
		elseif v2464 == proto.wireTypes.i32 then
			local v2470

			v2470, n163 = proto.readFixed32(p248, n163)
		elseif v2464 == proto.wireTypes.i64 then
			local v2471

			v2471, n163 = proto.readFixed64(p248, n163)
		else
			error("Unsupported wire type: " .. v2464)
		end
	end

	return v2461
end
function t335.jsonEncode(p249) -- line: 14757
	local t337 = {}

	if p249.key ~= nil and p249.key ~= "" then
		t337.key = p249.key
	end

	if p249.value ~= nil then
		t337.value = p249.value:jsonEncode()
	end

	return t337
end
function t335.jsonDecode(t338: {[any]: any}) -- line: 14773
	-- upvalues: t335 (copy), struct (copy)
	local v2475 = t335.new()

	if t338.key ~= nil then
		v2475.key = t338.key
	end

	if t338.value ~= nil then
		v2475.value = struct.Struct.jsonDecode(t338.value)
	end

	return v2475
end

t335.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t1.FocusNavActionsProp_FocusNavData_EventsEntry = t335
typeRegistry.default:register(t1.FocusNavActionsProp_FocusNavData_EventsEntry)
t1.ActionType = {
	fromNumber = function(n164: number) --[[ fromNumber ]] -- line: 14800
		if n164 == 0 then
			return "ACTION_TYPE_INVALID"
		end

		if n164 == 1 then
			return "ACTION_TYPE_DISMISS_DIALOG"
		end

		if n164 == 2 then
			return "ACTION_TYPE_LINK"
		end

		if n164 == 3 then
			return "ACTION_TYPE_OPEN_GAME_DETAILS"
		end

		if n164 == 4 then
			return "ACTION_TYPE_OPEN_JOIN_FRIENDS"
		end

		if n164 == 5 then
			return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON"
		end

		if n164 == 6 then
			return "ACTION_TYPE_OPEN_SEE_ALL"
		end

		if n164 == 7 then
			return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP"
		end

		if n164 == 8 then
			return "ACTION_TYPE_PLAY_BUTTON_CLICK"
		end

		if n164 == 9 then
			return "ACTION_TYPE_UPDATE_USER_SETTINGS"
		end

		if n164 == 10 then
			return "ACTION_TYPE_OPEN_TOOLTIP"
		end

		if n164 == 11 then
			return "ACTION_TYPE_OPEN_BADGE_DETAILS"
		end

		if n164 == 12 then
			return "ACTION_TYPE_LOAD_MORE_FROM_API"
		end

		if n164 == 13 then
			return "ACTION_TYPE_SHARE"
		end

		if n164 == 14 then
			return "ACTION_TYPE_OPEN_ABUSE_REPORT"
		end

		if n164 == 15 then
			return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY"
		end

		if n164 == 16 then
			return "ACTION_TYPE_OPEN_PROFILE"
		end

		if n164 == 17 then
			return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION"
		end

		if n164 == 18 then
			return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE"
		end

		if n164 == 19 then
			return "ACTION_TYPE_OPEN_MARKETPLACE"
		end

		if n164 == 20 then
			return "ACTION_TYPE_HIDE_PROFILE_COMPLETION"
		end

		if n164 == 21 then
			return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY"
		end

		if n164 == 22 then
			return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY"
		end

		if n164 == 23 then
			return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL"
		end

		if n164 == 24 then
			return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP"
		end

		if n164 == 25 then
			return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG"
		end

		if n164 == 26 then
			return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS"
		end

		if n164 == 27 then
			return "ACTION_TYPE_OPEN_SOCIAL_LINK"
		end

		if n164 == 28 then
			return "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL"
		end

		if n164 == 29 then
			return "ACTION_TYPE_OPEN_SONG_DETAIL"
		end

		if n164 == 30 then
			return "ACTION_TYPE_REFRESH_FROM_API"
		end

		if n164 == 31 then
			return "ACTION_TYPE_RSVP_TO_EVENT"
		end

		if n164 == 32 then
			return "ACTION_TYPE_APPLY_CHARTS_FILTER"
		end

		if n164 == 33 then
			return "ACTION_TYPE_ANALYTICS_EVENT"
		end

		if n164 == 34 then
			return "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT"
		end

		if n164 == 35 then
			return "ACTION_TYPE_OPEN_GAME_INVITE"
		end

		if n164 == 36 then
			return "ACTION_TYPE_OPEN_EVENT_DETAILS"
		end

		return nil
	end,
	toNumber = function(p250) --[[ toNumber ]] -- line: 14880
		if p250 == "ACTION_TYPE_INVALID" then
			return 0
		end

		if p250 == "ACTION_TYPE_DISMISS_DIALOG" then
			return 1
		end

		if p250 == "ACTION_TYPE_LINK" then
			return 2
		end

		if p250 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
			return 3
		end

		if p250 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
			return 4
		end

		if p250 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
			return 5
		end

		if p250 == "ACTION_TYPE_OPEN_SEE_ALL" then
			return 6
		end

		if p250 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
			return 7
		end

		if p250 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
			return 8
		end

		if p250 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
			return 9
		end

		if p250 == "ACTION_TYPE_OPEN_TOOLTIP" then
			return 10
		end

		if p250 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
			return 11
		end

		if p250 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
			return 12
		end

		if p250 == "ACTION_TYPE_SHARE" then
			return 13
		end

		if p250 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
			return 14
		end

		if p250 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
			return 15
		end

		if p250 == "ACTION_TYPE_OPEN_PROFILE" then
			return 16
		end

		if p250 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
			return 17
		end

		if p250 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
			return 18
		end

		if p250 == "ACTION_TYPE_OPEN_MARKETPLACE" then
			return 19
		end

		if p250 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
			return 20
		end

		if p250 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
			return 21
		end

		if p250 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
			return 22
		end

		if p250 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
			return 23
		end

		if p250 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
			return 24
		end

		if p250 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
			return 25
		end

		if p250 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
			return 26
		end

		if p250 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then
			return 27
		end

		if p250 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then
			return 28
		end

		if p250 == "ACTION_TYPE_OPEN_SONG_DETAIL" then
			return 29
		end

		if p250 == "ACTION_TYPE_REFRESH_FROM_API" then
			return 30
		end

		if p250 == "ACTION_TYPE_RSVP_TO_EVENT" then
			return 31
		end

		if p250 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then
			return 32
		end

		if p250 == "ACTION_TYPE_ANALYTICS_EVENT" then
			return 33
		end

		if p250 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then
			return 34
		end

		if p250 == "ACTION_TYPE_OPEN_GAME_INVITE" then
			return 35
		end

		if p250 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then
			return 36
		end

		return p250
	end,
	fromName = function(s1: string) --[[ fromName ]] -- line: 14960
		if s1 == "ACTION_TYPE_INVALID" then
			return "ACTION_TYPE_INVALID"
		end

		if s1 == "ACTION_TYPE_DISMISS_DIALOG" then
			return "ACTION_TYPE_DISMISS_DIALOG"
		end

		if s1 == "ACTION_TYPE_LINK" then
			return "ACTION_TYPE_LINK"
		end

		if s1 == "ACTION_TYPE_OPEN_GAME_DETAILS" then
			return "ACTION_TYPE_OPEN_GAME_DETAILS"
		end

		if s1 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then
			return "ACTION_TYPE_OPEN_JOIN_FRIENDS"
		end

		if s1 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then
			return "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON"
		end

		if s1 == "ACTION_TYPE_OPEN_SEE_ALL" then
			return "ACTION_TYPE_OPEN_SEE_ALL"
		end

		if s1 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then
			return "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP"
		end

		if s1 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then
			return "ACTION_TYPE_PLAY_BUTTON_CLICK"
		end

		if s1 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then
			return "ACTION_TYPE_UPDATE_USER_SETTINGS"
		end

		if s1 == "ACTION_TYPE_OPEN_TOOLTIP" then
			return "ACTION_TYPE_OPEN_TOOLTIP"
		end

		if s1 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then
			return "ACTION_TYPE_OPEN_BADGE_DETAILS"
		end

		if s1 == "ACTION_TYPE_LOAD_MORE_FROM_API" then
			return "ACTION_TYPE_LOAD_MORE_FROM_API"
		end

		if s1 == "ACTION_TYPE_SHARE" then
			return "ACTION_TYPE_SHARE"
		end

		if s1 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then
			return "ACTION_TYPE_OPEN_ABUSE_REPORT"
		end

		if s1 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then
			return "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY"
		end

		if s1 == "ACTION_TYPE_OPEN_PROFILE" then
			return "ACTION_TYPE_OPEN_PROFILE"
		end

		if s1 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then
			return "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION"
		end

		if s1 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then
			return "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE"
		end

		if s1 == "ACTION_TYPE_OPEN_MARKETPLACE" then
			return "ACTION_TYPE_OPEN_MARKETPLACE"
		end

		if s1 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then
			return "ACTION_TYPE_HIDE_PROFILE_COMPLETION"
		end

		if s1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then
			return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY"
		end

		if s1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then
			return "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY"
		end

		if s1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then
			return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL"
		end

		if s1 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then
			return "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP"
		end

		if s1 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then
			return "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG"
		end

		if s1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then
			return "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS"
		end

		if s1 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then
			return "ACTION_TYPE_OPEN_SOCIAL_LINK"
		end

		if s1 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then
			return "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL"
		end

		if s1 == "ACTION_TYPE_OPEN_SONG_DETAIL" then
			return "ACTION_TYPE_OPEN_SONG_DETAIL"
		end

		if s1 == "ACTION_TYPE_REFRESH_FROM_API" then
			return "ACTION_TYPE_REFRESH_FROM_API"
		end

		if s1 == "ACTION_TYPE_RSVP_TO_EVENT" then
			return "ACTION_TYPE_RSVP_TO_EVENT"
		end

		if s1 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then
			return "ACTION_TYPE_APPLY_CHARTS_FILTER"
		end

		if s1 == "ACTION_TYPE_ANALYTICS_EVENT" then
			return "ACTION_TYPE_ANALYTICS_EVENT"
		end

		if s1 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then
			return "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT"
		end

		if s1 == "ACTION_TYPE_OPEN_GAME_INVITE" then
			return "ACTION_TYPE_OPEN_GAME_INVITE"
		end

		if s1 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then
			return "ACTION_TYPE_OPEN_EVENT_DETAILS"
		end

		return nil
	end
}

return {
	DismissDialogAction = t1.DismissDialogAction,
	DismissDialogAction_Params = t1.DismissDialogAction_Params,
	LinkAction = t1.LinkAction,
	LinkAction_Params = t1.LinkAction_Params,
	OpenSocialLinkAction = t1.OpenSocialLinkAction,
	OpenSocialLinkAction_Params = t1.OpenSocialLinkAction_Params,
	OpenGameDetailsAction = t1.OpenGameDetailsAction,
	OpenGameDetailsAction_Params = t1.OpenGameDetailsAction_Params,
	OpenJoinFriendsAction = t1.OpenJoinFriendsAction,
	OpenJoinFriendsAction_Params = t1.OpenJoinFriendsAction_Params,
	OpenMarketplaceTryOnAction = t1.OpenMarketplaceTryOnAction,
	OpenMarketplaceTryOnAction_Params = t1.OpenMarketplaceTryOnAction_Params,
	OpenSeeAllAction = t1.OpenSeeAllAction,
	OpenSeeAllAction_Params = t1.OpenSeeAllAction_Params,
	OpenSponsoredTooltipAction = t1.OpenSponsoredTooltipAction,
	OpenSponsoredTooltipAction_Params = t1.OpenSponsoredTooltipAction_Params,
	PlayButtonClickAction = t1.PlayButtonClickAction,
	PlayButtonClickAction_Params = t1.PlayButtonClickAction_Params,
	UpdateUserSettingsAction = t1.UpdateUserSettingsAction,
	UpdateUserSettingsAction_Params = t1.UpdateUserSettingsAction_Params,
	OpenTooltipAction = t1.OpenTooltipAction,
	OpenTooltipAction_Params = t1.OpenTooltipAction_Params,
	OpenBadgeDetailsAction = t1.OpenBadgeDetailsAction,
	OpenBadgeDetailsAction_Params = t1.OpenBadgeDetailsAction_Params,
	LoadMoreFromApiAction = t1.LoadMoreFromApiAction,
	LoadMoreFromApiAction_Params = t1.LoadMoreFromApiAction_Params,
	ShareAction = t1.ShareAction,
	ShareAction_ShareLinkData = t1.ShareAction_ShareLinkData,
	ShareAction_Params = t1.ShareAction_Params,
	OpenAbuseReportAction = t1.OpenAbuseReportAction,
	OpenAbuseReportAction_Params = t1.OpenAbuseReportAction_Params,
	RemoveBadgeFromInventoryAction = t1.RemoveBadgeFromInventoryAction,
	RemoveBadgeFromInventoryAction_Params = t1.RemoveBadgeFromInventoryAction_Params,
	OpenProfileAction = t1.OpenProfileAction,
	OpenProfileAction_Params = t1.OpenProfileAction_Params,
	OpenFacialAgeEstimationAction = t1.OpenFacialAgeEstimationAction,
	OpenFacialAgeEstimationAction_Params = t1.OpenFacialAgeEstimationAction_Params,
	OpenAddConnectionsPageAction = t1.OpenAddConnectionsPageAction,
	OpenAddConnectionsPageAction_Params = t1.OpenAddConnectionsPageAction_Params,
	OpenMarketplaceAction = t1.OpenMarketplaceAction,
	OpenMarketplaceAction_Params = t1.OpenMarketplaceAction_Params,
	HideProfileCompletionAction = t1.HideProfileCompletionAction,
	HideProfileCompletionAction_Params = t1.HideProfileCompletionAction_Params,
	SelectMarketplaceCatalogCategory = t1.SelectMarketplaceCatalogCategory,
	SelectMarketplaceCatalogCategory_Params = t1.SelectMarketplaceCatalogCategory_Params,
	SelectMarketplaceCatalogSubcategory = t1.SelectMarketplaceCatalogSubcategory,
	SelectMarketplaceCatalogSubcategory_Params = t1.SelectMarketplaceCatalogSubcategory_Params,
	OpenMarketplaceCatalogSeeAll = t1.OpenMarketplaceCatalogSeeAll,
	OpenMarketplaceCatalogSeeAll_Params = t1.OpenMarketplaceCatalogSeeAll_Params,
	CloseMarketplaceCategoryTooltip = t1.CloseMarketplaceCategoryTooltip,
	CloseMarketplaceCategoryTooltip_Params = t1.CloseMarketplaceCategoryTooltip_Params,
	ResizeMarketplaceCatalog = t1.ResizeMarketplaceCatalog,
	ResizeMarketplaceCatalog_Params = t1.ResizeMarketplaceCatalog_Params,
	OpenChartsSortDetailAction = t1.OpenChartsSortDetailAction,
	OpenChartsSortDetailAction_Params = t1.OpenChartsSortDetailAction_Params,
	OpenSongDetailAction = t1.OpenSongDetailAction,
	OpenSongDetailAction_Params = t1.OpenSongDetailAction_Params,
	OpenMarketplaceCatalogFilters = t1.OpenMarketplaceCatalogFilters,
	OpenMarketplaceCatalogFilters_Params = t1.OpenMarketplaceCatalogFilters_Params,
	RefreshFromApiAction = t1.RefreshFromApiAction,
	RefreshFromApiAction_Params = t1.RefreshFromApiAction_Params,
	RsvpToEventAction = t1.RsvpToEventAction,
	RsvpToEventAction_Params = t1.RsvpToEventAction_Params,
	OpenEventDetailsAction = t1.OpenEventDetailsAction,
	OpenEventDetailsAction_Params = t1.OpenEventDetailsAction_Params,
	ApplyChartsFilterAction = t1.ApplyChartsFilterAction,
	ApplyChartsFilterAction_Params = t1.ApplyChartsFilterAction_Params,
	AnalyticsEventAction = t1.AnalyticsEventAction,
	AnalyticsEventAction_Params = t1.AnalyticsEventAction_Params,
	CustomAnalyticsEventAction = t1.CustomAnalyticsEventAction,
	CustomAnalyticsEventAction_Params = t1.CustomAnalyticsEventAction_Params,
	OpenGameInviteAction = t1.OpenGameInviteAction,
	OpenGameInviteAction_Params = t1.OpenGameInviteAction_Params,
	Action = t1.Action,
	ActionProp = t1.ActionProp,
	ActionProp_ConditionalOption = t1.ActionProp_ConditionalOption,
	ActionProp_ConditionalOptions = t1.ActionProp_ConditionalOptions,
	FocusNavActionsProp = t1.FocusNavActionsProp,
	FocusNavActionsProp_ConditionalOption = t1.FocusNavActionsProp_ConditionalOption,
	FocusNavActionsProp_ConditionalOptions = t1.FocusNavActionsProp_ConditionalOptions,
	FocusNavActionsProp_FocusNavData = t1.FocusNavActionsProp_FocusNavData,
	ActionType = t1.ActionType
}
