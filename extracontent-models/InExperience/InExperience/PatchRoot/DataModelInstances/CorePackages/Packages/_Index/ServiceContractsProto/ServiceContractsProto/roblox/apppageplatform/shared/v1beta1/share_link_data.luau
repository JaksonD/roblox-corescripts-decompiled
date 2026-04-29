local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local prop_types = require(script.Parent.prop_types)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 274
	-- upvalues: t2 (copy)
	return (setmetatable({
		kind = if t3 ~= nil and t3.kind ~= nil then t3.kind else nil
	}, t2))
end
function t2.encode(p1) -- line: 280
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.kind ~= nil and p1.kind.type == "literal" then
		local v18 = p1.kind.value:encode()
		local v19, v20 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v19, v20, v18, buffer.len(v18))
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 297
	-- upvalues: t2 (copy), proto (copy), t1 (copy)
	local v23 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v25, v26

		v25, v26, n2 = proto.readTag(p2, n2)

		if v26 == proto.wireTypes.varint then
			local v27

			v27, n2 = proto.readVarInt(p2, n2)
		elseif v26 == proto.wireTypes.lengthDelimited then
			if v25 == 1 then
				local v28

				v28, n2 = proto.readBuffer(p2, n2)
				v23.kind = {
					type = "literal",
					value = t1.GenericShareLinkData_GenericShareLinkLiteralData.decode(v28)
				}
			else
				local v29, v30 = proto.readVarInt(p2, n2)

				n2 = v30 + v29
			end
		elseif v26 == proto.wireTypes.i32 then
			local v31

			v31, n2 = proto.readFixed32(p2, n2)
		elseif v26 == proto.wireTypes.i64 then
			local v32

			v32, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v26)
		end
	end

	return v23
end
function t2.jsonEncode(p3) -- line: 343
	local t4 = {}

	if p3.kind ~= nil and p3.kind.type == "literal" then
		t4.literal = p3.kind.value:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 355
	-- upvalues: t2 (copy), t1 (copy)
	local v36 = t2.new()

	if t5.literal ~= nil then
		v36.kind = {
			type = "literal",
			value = t1.GenericShareLinkData_GenericShareLinkLiteralData.jsonDecode(t5.literal)
		}
	end

	return v36
end

t2.descriptor = {
	name = "GenericShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkData"
}
t1.GenericShareLinkData = t2
typeRegistry.default:register(t1.GenericShareLinkData)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 383
	-- upvalues: t6 (copy)
	return (setmetatable({
		url = if t7 ~= nil and t7.url ~= nil then t7.url else nil,
		share_url_context = if t7 ~= nil and t7.share_url_context ~= nil then t7.share_url_context else nil
	}, t6))
end
function t6.encode(p4) -- line: 397
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.url ~= nil then
		local v41 = p4.url:encode()
		local v42, v43 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v42, v43, v41, buffer.len(v41))
	end

	if p4.share_url_context ~= nil then
		local v44 = p4.share_url_context:encode()
		local v45, v46 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v45, v46, v44, buffer.len(v44))
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 420
	-- upvalues: t6 (copy), proto (copy), prop_types (copy)
	local v49 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v51, v52

		v51, v52, n4 = proto.readTag(p5, n4)

		if v52 == proto.wireTypes.varint then
			local v53

			v53, n4 = proto.readVarInt(p5, n4)
		elseif v52 == proto.wireTypes.lengthDelimited then
			if v51 == 1 then
				local v54

				v54, n4 = proto.readBuffer(p5, n4)
				v49.url = prop_types.StringProp.decode(v54)
			elseif v51 == 2 then
				local v55

				v55, n4 = proto.readBuffer(p5, n4)
				v49.share_url_context = prop_types.StringProp.decode(v55)
			else
				local v56, v57 = proto.readVarInt(p5, n4)

				n4 = v57 + v56
			end
		elseif v52 == proto.wireTypes.i32 then
			local v58

			v58, n4 = proto.readFixed32(p5, n4)
		elseif v52 == proto.wireTypes.i64 then
			local v59

			v59, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v52)
		end
	end

	return v49
end
function t6.jsonEncode(p6) -- line: 470
	local t8 = {}

	if p6.url ~= nil then
		t8.url = p6.url:jsonEncode()
	end

	if p6.share_url_context ~= nil then
		t8.shareUrlContext = p6.share_url_context:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 486
	-- upvalues: t6 (copy), prop_types (copy)
	local v63 = t6.new()

	if t9.url ~= nil then
		v63.url = prop_types.StringProp.jsonDecode(t9.url)
	end

	if t9.share_url_context ~= nil then
		v63.share_url_context = prop_types.StringProp.jsonDecode(t9.share_url_context)
	end

	if t9.shareUrlContext ~= nil then
		v63.share_url_context = prop_types.StringProp.jsonDecode(t9.shareUrlContext)
	end

	return v63
end

t6.descriptor = {
	name = "GenericShareLinkData_GenericShareLinkLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkLiteralData"
}
t1.GenericShareLinkData_GenericShareLinkLiteralData = t6
typeRegistry.default:register(t1.GenericShareLinkData_GenericShareLinkLiteralData)

local t10 = {}

t10.__index = t10

function t10.new(t11: {[any]: any}?) -- line: 523
	-- upvalues: t10 (copy)
	return (setmetatable({
		kind = if t11 ~= nil and t11.kind ~= nil then t11.kind else nil
	}, t10))
end
function t10.encode(p7) -- line: 529
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n5 = 0

	if p7.kind ~= nil and p7.kind.type == "literal" then
		local v68 = p7.kind.value:encode()
		local v69, v70 = proto.writeTag(buf, n5, 1, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeBuffer(v69, v70, v68, buffer.len(v68))
	end

	local buf4 = buffer.create(n5)

	buffer.copy(buf4, 0, buf, 0, n5)

	return buf4
end
function t10.decode(p8: buffer) -- line: 546
	-- upvalues: t10 (copy), proto (copy), t1 (copy)
	local v73 = t10.new()
	local n6 = 0

	while n6 < buffer.len(p8) do
		local v75, v76

		v75, v76, n6 = proto.readTag(p8, n6)

		if v76 == proto.wireTypes.varint then
			local v77

			v77, n6 = proto.readVarInt(p8, n6)
		elseif v76 == proto.wireTypes.lengthDelimited then
			if v75 == 1 then
				local v78

				v78, n6 = proto.readBuffer(p8, n6)
				v73.kind = {
					type = "literal",
					value = t1.ShareLinkFetchData_ShareLinkFetchLiteralData.decode(v78)
				}
			else
				local v79, v80 = proto.readVarInt(p8, n6)

				n6 = v80 + v79
			end
		elseif v76 == proto.wireTypes.i32 then
			local v81

			v81, n6 = proto.readFixed32(p8, n6)
		elseif v76 == proto.wireTypes.i64 then
			local v82

			v82, n6 = proto.readFixed64(p8, n6)
		else
			error("Unsupported wire type: " .. v76)
		end
	end

	return v73
end
function t10.jsonEncode(p9) -- line: 592
	local t12 = {}

	if p9.kind ~= nil and p9.kind.type == "literal" then
		t12.literal = p9.kind.value:jsonEncode()
	end

	return t12
end
function t10.jsonDecode(t13: {[any]: any}) -- line: 604
	-- upvalues: t10 (copy), t1 (copy)
	local v86 = t10.new()

	if t13.literal ~= nil then
		v86.kind = {
			type = "literal",
			value = t1.ShareLinkFetchData_ShareLinkFetchLiteralData.jsonDecode(t13.literal)
		}
	end

	return v86
end

t10.descriptor = {
	name = "ShareLinkFetchData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchData"
}
t1.ShareLinkFetchData = t10
typeRegistry.default:register(t1.ShareLinkFetchData)

local t14 = {}

t14.__index = t14

function t14.new(t15: {[any]: any}?) -- line: 631
	-- upvalues: t14 (copy)
	return (setmetatable({
		share_url_context = if t15 ~= nil and t15.share_url_context ~= nil then t15.share_url_context else nil,
		link_type = if t15 ~= nil and t15.link_type ~= nil then t15.link_type else nil,
		link_data = if t15 ~= nil and t15.link_data ~= nil then t15.link_data else nil
	}, t14))
end
function t14.encode(p10) -- line: 641
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n7 = 0

	if p10.share_url_context ~= nil then
		local v91 = p10.share_url_context:encode()
		local v92, v93 = proto.writeTag(buf, n7, 1, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeBuffer(v92, v93, v91, buffer.len(v91))
	end

	if p10.link_type ~= nil then
		local v94 = p10.link_type:encode()
		local v95, v96 = proto.writeTag(buf, n7, 2, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeBuffer(v95, v96, v94, buffer.len(v94))
	end

	if p10.link_data ~= nil then
		local v97 = p10.link_data:encode()
		local v98, v99 = proto.writeTag(buf, n7, 3, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeBuffer(v98, v99, v97, buffer.len(v97))
	end

	local buf5 = buffer.create(n7)

	buffer.copy(buf5, 0, buf, 0, n7)

	return buf5
end
function t14.decode(p11: buffer) -- line: 670
	-- upvalues: t14 (copy), proto (copy), prop_types (copy), t1 (copy)
	local v102 = t14.new()
	local n8 = 0

	while n8 < buffer.len(p11) do
		local v104, v105

		v104, v105, n8 = proto.readTag(p11, n8)

		if v105 == proto.wireTypes.varint then
			local v106

			v106, n8 = proto.readVarInt(p11, n8)
		elseif v105 == proto.wireTypes.lengthDelimited then
			if v104 == 1 then
				local v107

				v107, n8 = proto.readBuffer(p11, n8)
				v102.share_url_context = prop_types.StringProp.decode(v107)
			elseif v104 == 2 then
				local v108

				v108, n8 = proto.readBuffer(p11, n8)
				v102.link_type = prop_types.StringProp.decode(v108)
			elseif v104 == 3 then
				local v109

				v109, n8 = proto.readBuffer(p11, n8)
				v102.link_data = t1.ShareLinkPayload.decode(v109)
			else
				local v110, v111 = proto.readVarInt(p11, n8)

				n8 = v111 + v110
			end
		elseif v105 == proto.wireTypes.i32 then
			local v112

			v112, n8 = proto.readFixed32(p11, n8)
		elseif v105 == proto.wireTypes.i64 then
			local v113

			v113, n8 = proto.readFixed64(p11, n8)
		else
			error("Unsupported wire type: " .. v105)
		end
	end

	return v102
end
function t14.jsonEncode(p12) -- line: 725
	local t16 = {}

	if p12.share_url_context ~= nil then
		t16.shareUrlContext = p12.share_url_context:jsonEncode()
	end

	if p12.link_type ~= nil then
		t16.linkType = p12.link_type:jsonEncode()
	end

	if p12.link_data ~= nil then
		t16.linkData = p12.link_data:jsonEncode()
	end

	return t16
end
function t14.jsonDecode(t17: {[any]: any}) -- line: 745
	-- upvalues: t14 (copy), prop_types (copy), t1 (copy)
	local v117 = t14.new()

	if t17.share_url_context ~= nil then
		v117.share_url_context = prop_types.StringProp.jsonDecode(t17.share_url_context)
	end

	if t17.shareUrlContext ~= nil then
		v117.share_url_context = prop_types.StringProp.jsonDecode(t17.shareUrlContext)
	end

	if t17.link_type ~= nil then
		v117.link_type = prop_types.StringProp.jsonDecode(t17.link_type)
	end

	if t17.linkType ~= nil then
		v117.link_type = prop_types.StringProp.jsonDecode(t17.linkType)
	end

	if t17.link_data ~= nil then
		v117.link_data = t1.ShareLinkPayload.jsonDecode(t17.link_data)
	end

	if t17.linkData ~= nil then
		v117.link_data = t1.ShareLinkPayload.jsonDecode(t17.linkData)
	end

	return v117
end

t14.descriptor = {
	name = "ShareLinkFetchData_ShareLinkFetchLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchLiteralData"
}
t1.ShareLinkFetchData_ShareLinkFetchLiteralData = t14
typeRegistry.default:register(t1.ShareLinkFetchData_ShareLinkFetchLiteralData)

local t18 = {}

t18.__index = t18

function t18.new(t19: {[any]: any}?) -- line: 793
	-- upvalues: t18 (copy)
	return (setmetatable({
		oneof_prop = if t19 ~= nil and t19.oneof_prop ~= nil then t19.oneof_prop else nil
	}, t18))
end
function t18.encode(p13) -- line: 799
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n9 = 0

	if p13.oneof_prop ~= nil then
		if p13.oneof_prop.type == "experience_share_link_payload" then
			local v122 = p13.oneof_prop.value:encode()
			local v123, v124 = proto.writeTag(buf, n9, 1, proto.wireTypes.lengthDelimited)

			buf, n9 = proto.writeBuffer(v123, v124, v122, buffer.len(v122))
		elseif p13.oneof_prop.type == "event_share_link_payload" then
			local v125 = p13.oneof_prop.value:encode()
			local v126, v127 = proto.writeTag(buf, n9, 2, proto.wireTypes.lengthDelimited)

			buf, n9 = proto.writeBuffer(v126, v127, v125, buffer.len(v125))
		end
	end

	local buf6 = buffer.create(n9)

	buffer.copy(buf6, 0, buf, 0, n9)

	return buf6
end
function t18.decode(p14: buffer) -- line: 820
	-- upvalues: t18 (copy), proto (copy), t1 (copy)
	local v130 = t18.new()
	local n10 = 0

	while n10 < buffer.len(p14) do
		local v132, v133

		v132, v133, n10 = proto.readTag(p14, n10)

		if v133 == proto.wireTypes.varint then
			local v134

			v134, n10 = proto.readVarInt(p14, n10)
		elseif v133 == proto.wireTypes.lengthDelimited then
			if v132 == 1 then
				local v135

				v135, n10 = proto.readBuffer(p14, n10)
				v130.oneof_prop = {
					type = "experience_share_link_payload",
					value = t1.ExperienceShareLinkPayload.decode(v135)
				}
			elseif v132 == 2 then
				local v136

				v136, n10 = proto.readBuffer(p14, n10)
				v130.oneof_prop = {
					type = "event_share_link_payload",
					value = t1.EventShareLinkPayload.decode(v136)
				}
			else
				local v137, v138 = proto.readVarInt(p14, n10)

				n10 = v138 + v137
			end
		elseif v133 == proto.wireTypes.i32 then
			local v139

			v139, n10 = proto.readFixed32(p14, n10)
		elseif v133 == proto.wireTypes.i64 then
			local v140

			v140, n10 = proto.readFixed64(p14, n10)
		else
			error("Unsupported wire type: " .. v133)
		end
	end

	return v130
end
function t18.jsonEncode(p15) -- line: 872
	local t20 = {}

	if p15.oneof_prop ~= nil then
		if p15.oneof_prop.type == "experience_share_link_payload" then
			t20.experienceShareLinkPayload = p15.oneof_prop.value:jsonEncode()

			return t20
		end

		if p15.oneof_prop.type == "event_share_link_payload" then
			t20.eventShareLinkPayload = p15.oneof_prop.value:jsonEncode()
		end
	end

	return t20
end
function t18.jsonDecode(t21: {[any]: any}) -- line: 886
	-- upvalues: t18 (copy), t1 (copy)
	local v144 = t18.new()

	if t21.experience_share_link_payload ~= nil then
		v144.oneof_prop = {
			type = "experience_share_link_payload",
			value = t1.ExperienceShareLinkPayload.jsonDecode(t21.experience_share_link_payload)
		}
	end

	if t21.experienceShareLinkPayload ~= nil then
		v144.oneof_prop = {
			type = "experience_share_link_payload",
			value = t1.ExperienceShareLinkPayload.jsonDecode(t21.experienceShareLinkPayload)
		}
	end

	if t21.event_share_link_payload ~= nil then
		v144.oneof_prop = {
			type = "event_share_link_payload",
			value = t1.EventShareLinkPayload.jsonDecode(t21.event_share_link_payload)
		}
	end

	if t21.eventShareLinkPayload ~= nil then
		v144.oneof_prop = {
			type = "event_share_link_payload",
			value = t1.EventShareLinkPayload.jsonDecode(t21.eventShareLinkPayload)
		}
	end

	return v144
end

t18.descriptor = {
	name = "ShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkPayload"
}
t1.ShareLinkPayload = t18
typeRegistry.default:register(t1.ShareLinkPayload)

local t22 = {}

t22.__index = t22

function t22.new(t23: {[any]: any}?) -- line: 934
	-- upvalues: t22 (copy)
	return (setmetatable({
		kind = if t23 ~= nil and t23.kind ~= nil then t23.kind else nil
	}, t22))
end
function t22.encode(p16) -- line: 942
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n11 = 0

	if p16.kind ~= nil and p16.kind.type == "literal" then
		local v149 = p16.kind.value:encode()
		local v150, v151 = proto.writeTag(buf, n11, 1, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v150, v151, v149, buffer.len(v149))
	end

	local buf7 = buffer.create(n11)

	buffer.copy(buf7, 0, buf, 0, n11)

	return buf7
end
function t22.decode(p17: buffer) -- line: 959
	-- upvalues: t22 (copy), proto (copy), t1 (copy)
	local v154 = t22.new()
	local n12 = 0

	while n12 < buffer.len(p17) do
		local v156, v157

		v156, v157, n12 = proto.readTag(p17, n12)

		if v157 == proto.wireTypes.varint then
			local v158

			v158, n12 = proto.readVarInt(p17, n12)
		elseif v157 == proto.wireTypes.lengthDelimited then
			if v156 == 1 then
				local v159

				v159, n12 = proto.readBuffer(p17, n12)
				v154.kind = {
					type = "literal",
					value = t1.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.decode(v159)
				}
			else
				local v160, v161 = proto.readVarInt(p17, n12)

				n12 = v161 + v160
			end
		elseif v157 == proto.wireTypes.i32 then
			local v162

			v162, n12 = proto.readFixed32(p17, n12)
		elseif v157 == proto.wireTypes.i64 then
			local v163

			v163, n12 = proto.readFixed64(p17, n12)
		else
			error("Unsupported wire type: " .. v157)
		end
	end

	return v154
end
function t22.jsonEncode(p18) -- line: 1005
	local t24 = {}

	if p18.kind ~= nil and p18.kind.type == "literal" then
		t24.literal = p18.kind.value:jsonEncode()
	end

	return t24
end
function t22.jsonDecode(t25: {[any]: any}) -- line: 1017
	-- upvalues: t22 (copy), t1 (copy)
	local v167 = t22.new()

	if t25.literal ~= nil then
		v167.kind = {
			type = "literal",
			value = t1.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.jsonDecode(t25.literal)
		}
	end

	return v167
end

t22.descriptor = {
	name = "ExperienceShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkPayload"
}
t1.ExperienceShareLinkPayload = t22
typeRegistry.default:register(t1.ExperienceShareLinkPayload)

local t26 = {}

t26.__index = t26

function t26.new(t27: {[any]: any}?) -- line: 1045
	-- upvalues: t26 (copy)
	return (setmetatable({
		universe_id = if t27 ~= nil and t27.universe_id ~= nil then t27.universe_id else nil
	}, t26))
end
function t26.encode(p19) -- line: 1056
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n13 = 0

	if p19.universe_id ~= nil then
		local v172 = p19.universe_id:encode()
		local v173, v174 = proto.writeTag(buf, n13, 1, proto.wireTypes.lengthDelimited)

		buf, n13 = proto.writeBuffer(v173, v174, v172, buffer.len(v172))
	end

	local buf8 = buffer.create(n13)

	buffer.copy(buf8, 0, buf, 0, n13)

	return buf8
end
function t26.decode(p20: buffer) -- line: 1073
	-- upvalues: t26 (copy), proto (copy), prop_types (copy)
	local v177 = t26.new()
	local n14 = 0

	while n14 < buffer.len(p20) do
		local v179, v180

		v179, v180, n14 = proto.readTag(p20, n14)

		if v180 == proto.wireTypes.varint then
			local v181

			v181, n14 = proto.readVarInt(p20, n14)
		elseif v180 == proto.wireTypes.lengthDelimited then
			if v179 == 1 then
				local v182

				v182, n14 = proto.readBuffer(p20, n14)
				v177.universe_id = prop_types.StringProp.decode(v182)
			else
				local v183, v184 = proto.readVarInt(p20, n14)

				n14 = v184 + v183
			end
		elseif v180 == proto.wireTypes.i32 then
			local v185

			v185, n14 = proto.readFixed32(p20, n14)
		elseif v180 == proto.wireTypes.i64 then
			local v186

			v186, n14 = proto.readFixed64(p20, n14)
		else
			error("Unsupported wire type: " .. v180)
		end
	end

	return v177
end
function t26.jsonEncode(p21) -- line: 1118
	local t28 = {}

	if p21.universe_id ~= nil then
		t28.universeId = p21.universe_id:jsonEncode()
	end

	return t28
end
function t26.jsonDecode(t29: {[any]: any}) -- line: 1130
	-- upvalues: t26 (copy), prop_types (copy)
	local v190 = t26.new()

	if t29.universe_id ~= nil then
		v190.universe_id = prop_types.StringProp.jsonDecode(t29.universe_id)
	end

	if t29.universeId ~= nil then
		v190.universe_id = prop_types.StringProp.jsonDecode(t29.universeId)
	end

	return v190
end

t26.descriptor = {
	name = "ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkLiteralPayload"
}
t1.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload = t26
typeRegistry.default:register(t1.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload)

local t30 = {}

t30.__index = t30

function t30.new(t31: {[any]: any}?) -- line: 1162
	-- upvalues: t30 (copy)
	return (setmetatable({
		kind = if t31 ~= nil and t31.kind ~= nil then t31.kind else nil
	}, t30))
end
function t30.encode(p22) -- line: 1168
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n15 = 0

	if p22.kind ~= nil and p22.kind.type == "literal" then
		local v195 = p22.kind.value:encode()
		local v196, v197 = proto.writeTag(buf, n15, 1, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeBuffer(v196, v197, v195, buffer.len(v195))
	end

	local buf9 = buffer.create(n15)

	buffer.copy(buf9, 0, buf, 0, n15)

	return buf9
end
function t30.decode(p23: buffer) -- line: 1185
	-- upvalues: t30 (copy), proto (copy), t1 (copy)
	local v200 = t30.new()
	local n16 = 0

	while n16 < buffer.len(p23) do
		local v202, v203

		v202, v203, n16 = proto.readTag(p23, n16)

		if v203 == proto.wireTypes.varint then
			local v204

			v204, n16 = proto.readVarInt(p23, n16)
		elseif v203 == proto.wireTypes.lengthDelimited then
			if v202 == 1 then
				local v205

				v205, n16 = proto.readBuffer(p23, n16)
				v200.kind = {
					type = "literal",
					value = t1.EventShareLinkPayload_EventShareLinkLiteralPayload.decode(v205)
				}
			else
				local v206, v207 = proto.readVarInt(p23, n16)

				n16 = v207 + v206
			end
		elseif v203 == proto.wireTypes.i32 then
			local v208

			v208, n16 = proto.readFixed32(p23, n16)
		elseif v203 == proto.wireTypes.i64 then
			local v209

			v209, n16 = proto.readFixed64(p23, n16)
		else
			error("Unsupported wire type: " .. v203)
		end
	end

	return v200
end
function t30.jsonEncode(p24) -- line: 1231
	local t32 = {}

	if p24.kind ~= nil and p24.kind.type == "literal" then
		t32.literal = p24.kind.value:jsonEncode()
	end

	return t32
end
function t30.jsonDecode(t33: {[any]: any}) -- line: 1243
	-- upvalues: t30 (copy), t1 (copy)
	local v213 = t30.new()

	if t33.literal ~= nil then
		v213.kind = {
			type = "literal",
			value = t1.EventShareLinkPayload_EventShareLinkLiteralPayload.jsonDecode(t33.literal)
		}
	end

	return v213
end

t30.descriptor = {
	name = "EventShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventShareLinkPayload"
}
t1.EventShareLinkPayload = t30
typeRegistry.default:register(t1.EventShareLinkPayload)

local t34 = {}

t34.__index = t34

function t34.new(t35: {[any]: any}?) -- line: 1271
	-- upvalues: t34 (copy)
	return (setmetatable({
		event_id = if t35 ~= nil and t35.event_id ~= nil then t35.event_id else nil
	}, t34))
end
function t34.encode(p25) -- line: 1282
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n17 = 0

	if p25.event_id ~= nil then
		local v218 = p25.event_id:encode()
		local v219, v220 = proto.writeTag(buf, n17, 1, proto.wireTypes.lengthDelimited)

		buf, n17 = proto.writeBuffer(v219, v220, v218, buffer.len(v218))
	end

	local buf10 = buffer.create(n17)

	buffer.copy(buf10, 0, buf, 0, n17)

	return buf10
end
function t34.decode(p26: buffer) -- line: 1299
	-- upvalues: t34 (copy), proto (copy), prop_types (copy)
	local v223 = t34.new()
	local n18 = 0

	while n18 < buffer.len(p26) do
		local v225, v226

		v225, v226, n18 = proto.readTag(p26, n18)

		if v226 == proto.wireTypes.varint then
			local v227

			v227, n18 = proto.readVarInt(p26, n18)
		elseif v226 == proto.wireTypes.lengthDelimited then
			if v225 == 1 then
				local v228

				v228, n18 = proto.readBuffer(p26, n18)
				v223.event_id = prop_types.StringProp.decode(v228)
			else
				local v229, v230 = proto.readVarInt(p26, n18)

				n18 = v230 + v229
			end
		elseif v226 == proto.wireTypes.i32 then
			local v231

			v231, n18 = proto.readFixed32(p26, n18)
		elseif v226 == proto.wireTypes.i64 then
			local v232

			v232, n18 = proto.readFixed64(p26, n18)
		else
			error("Unsupported wire type: " .. v226)
		end
	end

	return v223
end
function t34.jsonEncode(p27) -- line: 1344
	local t36 = {}

	if p27.event_id ~= nil then
		t36.eventId = p27.event_id:jsonEncode()
	end

	return t36
end
function t34.jsonDecode(t37: {[any]: any}) -- line: 1356
	-- upvalues: t34 (copy), prop_types (copy)
	local v236 = t34.new()

	if t37.event_id ~= nil then
		v236.event_id = prop_types.StringProp.jsonDecode(t37.event_id)
	end

	if t37.eventId ~= nil then
		v236.event_id = prop_types.StringProp.jsonDecode(t37.eventId)
	end

	return v236
end

t34.descriptor = {
	name = "EventShareLinkPayload_EventShareLinkLiteralPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventShareLinkLiteralPayload"
}
t1.EventShareLinkPayload_EventShareLinkLiteralPayload = t34
typeRegistry.default:register(t1.EventShareLinkPayload_EventShareLinkLiteralPayload)

return {
	GenericShareLinkData = t1.GenericShareLinkData,
	GenericShareLinkData_GenericShareLinkLiteralData = t1.GenericShareLinkData_GenericShareLinkLiteralData,
	ShareLinkFetchData = t1.ShareLinkFetchData,
	ShareLinkFetchData_ShareLinkFetchLiteralData = t1.ShareLinkFetchData_ShareLinkFetchLiteralData,
	ShareLinkPayload = t1.ShareLinkPayload,
	ExperienceShareLinkPayload = t1.ExperienceShareLinkPayload,
	ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload = t1.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload,
	EventShareLinkPayload = t1.EventShareLinkPayload,
	EventShareLinkPayload_EventShareLinkLiteralPayload = t1.EventShareLinkPayload_EventShareLinkLiteralPayload
}
