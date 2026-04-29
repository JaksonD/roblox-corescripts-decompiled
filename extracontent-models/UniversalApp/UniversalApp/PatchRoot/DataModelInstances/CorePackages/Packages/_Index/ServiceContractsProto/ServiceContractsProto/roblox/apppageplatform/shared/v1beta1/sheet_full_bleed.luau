local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local prop_types = require(script.Parent.prop_types)
local component_shared = require(script.Parent.component_shared)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 87
	-- upvalues: t2 (copy)
	return (setmetatable({
		props = if t3 ~= nil and t3.props ~= nil then t3.props else nil,
		shared = if t3 ~= nil and t3.shared ~= nil then t3.shared else nil
	}, t2))
end
function t2.encode(p1) -- line: 94
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.props ~= nil then
		local v12 = p1.props:encode()
		local v13, v14 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v13, v14, v12, buffer.len(v12))
	end

	if p1.shared ~= nil then
		local v15 = p1.shared:encode()
		local v16, v17 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v16, v17, v15, buffer.len(v15))
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 115
	-- upvalues: t2 (copy), proto (copy), t1 (copy), component_shared (copy)
	local v20 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v22, v23

		v22, v23, n2 = proto.readTag(p2, n2)

		if v23 == proto.wireTypes.varint then
			local v24

			v24, n2 = proto.readVarInt(p2, n2)
		elseif v23 == proto.wireTypes.lengthDelimited then
			if v22 == 1 then
				local v25

				v25, n2 = proto.readBuffer(p2, n2)
				v20.props = t1.SheetFullBleedSchema_Props.decode(v25)
			elseif v22 == 2 then
				local v26

				v26, n2 = proto.readBuffer(p2, n2)
				v20.shared = component_shared.ComponentShared.decode(v26)
			else
				local v27, v28 = proto.readVarInt(p2, n2)

				n2 = v28 + v27
			end
		elseif v23 == proto.wireTypes.i32 then
			local v29

			v29, n2 = proto.readFixed32(p2, n2)
		elseif v23 == proto.wireTypes.i64 then
			local v30

			v30, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v23)
		end
	end

	return v20
end
function t2.jsonEncode(p3) -- line: 163
	local t4 = {}

	if p3.props ~= nil then
		t4.props = p3.props:jsonEncode()
	end

	if p3.shared ~= nil then
		t4.shared = p3.shared:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 177
	-- upvalues: t2 (copy), t1 (copy), component_shared (copy)
	local v34 = t2.new()

	if t5.props ~= nil then
		v34.props = t1.SheetFullBleedSchema_Props.jsonDecode(t5.props)
	end

	if t5.shared ~= nil then
		v34.shared = component_shared.ComponentShared.jsonDecode(t5.shared)
	end

	return v34
end

t2.descriptor = {
	name = "SheetFullBleedSchema",
	fullName = "roblox.apppageplatform.shared.v1beta1.SheetFullBleedSchema"
}
t1.SheetFullBleedSchema = t2
typeRegistry.default:register(t1.SheetFullBleedSchema)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 206
	-- upvalues: t6 (copy)
	return (setmetatable({
		media = if t7 ~= nil and t7.media ~= nil then t7.media else nil,
		media_style = if t7 ~= nil and t7.media_style ~= nil then t7.media_style else nil,
		background_style = if t7 ~= nil and t7.background_style ~= nil then t7.background_style else nil,
		height = if t7 ~= nil and t7.height ~= nil then t7.height else nil,
		aspect_ratio = if t7 ~= nil and t7.aspect_ratio ~= nil then t7.aspect_ratio else nil,
		sticky = if t7 ~= nil and t7.sticky ~= nil then t7.sticky else nil,
		children = if t7 ~= nil and t7.children ~= nil then t7.children else nil
	}, t6))
end
function t6.encode(p4) -- line: 220
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.media ~= nil then
		local v39 = p4.media:encode()
		local v40, v41 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v40, v41, v39, buffer.len(v39))
	end

	if p4.media_style ~= nil then
		local v42 = p4.media_style:encode()
		local v43, v44 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v43, v44, v42, buffer.len(v42))
	end

	if p4.background_style ~= nil then
		local v45 = p4.background_style:encode()
		local v46, v47 = proto.writeTag(buf, n3, 3, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v46, v47, v45, buffer.len(v45))
	end

	if p4.height ~= nil then
		local v48 = p4.height:encode()
		local v49, v50 = proto.writeTag(buf, n3, 4, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v49, v50, v48, buffer.len(v48))
	end

	if p4.aspect_ratio ~= nil then
		local v51 = p4.aspect_ratio:encode()
		local v52, v53 = proto.writeTag(buf, n3, 5, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v52, v53, v51, buffer.len(v51))
	end

	if p4.sticky ~= nil then
		local v54 = p4.sticky:encode()
		local v55, v56 = proto.writeTag(buf, n3, 6, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v55, v56, v54, buffer.len(v54))
	end

	if p4.children ~= nil then
		local v57 = p4.children:encode()
		local v58, v59 = proto.writeTag(buf, n3, 7, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v58, v59, v57, buffer.len(v57))
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 271
	-- upvalues: t6 (copy), proto (copy), prop_types (copy)
	local v62 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v64, v65

		v64, v65, n4 = proto.readTag(p5, n4)

		if v65 == proto.wireTypes.varint then
			local v66

			v66, n4 = proto.readVarInt(p5, n4)
		elseif v65 == proto.wireTypes.lengthDelimited then
			if v64 == 1 then
				local v67

				v67, n4 = proto.readBuffer(p5, n4)
				v62.media = prop_types.ImageStringProp.decode(v67)
			elseif v64 == 2 then
				local v68

				v68, n4 = proto.readBuffer(p5, n4)
				v62.media_style = prop_types.ColorStyleProp.decode(v68)
			elseif v64 == 3 then
				local v69

				v69, n4 = proto.readBuffer(p5, n4)
				v62.background_style = prop_types.ColorStyleProp.decode(v69)
			elseif v64 == 4 then
				local v70

				v70, n4 = proto.readBuffer(p5, n4)
				v62.height = prop_types.UiScaledUDimProp.decode(v70)
			elseif v64 == 5 then
				local v71

				v71, n4 = proto.readBuffer(p5, n4)
				v62.aspect_ratio = prop_types.FloatProp.decode(v71)
			elseif v64 == 6 then
				local v72

				v72, n4 = proto.readBuffer(p5, n4)
				v62.sticky = prop_types.BoolProp.decode(v72)
			elseif v64 == 7 then
				local v73

				v73, n4 = proto.readBuffer(p5, n4)
				v62.children = prop_types.NestedComponentListProp.decode(v73)
			else
				local v74, v75 = proto.readVarInt(p5, n4)

				n4 = v75 + v74
			end
		elseif v65 == proto.wireTypes.i32 then
			local v76

			v76, n4 = proto.readFixed32(p5, n4)
		elseif v65 == proto.wireTypes.i64 then
			local v77

			v77, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v65)
		end
	end

	return v62
end
function t6.jsonEncode(p6) -- line: 346
	local t8 = {}

	if p6.media ~= nil then
		t8.media = p6.media:jsonEncode()
	end

	if p6.media_style ~= nil then
		t8.mediaStyle = p6.media_style:jsonEncode()
	end

	if p6.background_style ~= nil then
		t8.backgroundStyle = p6.background_style:jsonEncode()
	end

	if p6.height ~= nil then
		t8.height = p6.height:jsonEncode()
	end

	if p6.aspect_ratio ~= nil then
		t8.aspectRatio = p6.aspect_ratio:jsonEncode()
	end

	if p6.sticky ~= nil then
		t8.sticky = p6.sticky:jsonEncode()
	end

	if p6.children ~= nil then
		t8.children = p6.children:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 380
	-- upvalues: t6 (copy), prop_types (copy)
	local v81 = t6.new()

	if t9.media ~= nil then
		v81.media = prop_types.ImageStringProp.jsonDecode(t9.media)
	end

	if t9.media_style ~= nil then
		v81.media_style = prop_types.ColorStyleProp.jsonDecode(t9.media_style)
	end

	if t9.mediaStyle ~= nil then
		v81.media_style = prop_types.ColorStyleProp.jsonDecode(t9.mediaStyle)
	end

	if t9.background_style ~= nil then
		v81.background_style = prop_types.ColorStyleProp.jsonDecode(t9.background_style)
	end

	if t9.backgroundStyle ~= nil then
		v81.background_style = prop_types.ColorStyleProp.jsonDecode(t9.backgroundStyle)
	end

	if t9.height ~= nil then
		v81.height = prop_types.UiScaledUDimProp.jsonDecode(t9.height)
	end

	if t9.aspect_ratio ~= nil then
		v81.aspect_ratio = prop_types.FloatProp.jsonDecode(t9.aspect_ratio)
	end

	if t9.aspectRatio ~= nil then
		v81.aspect_ratio = prop_types.FloatProp.jsonDecode(t9.aspectRatio)
	end

	if t9.sticky ~= nil then
		v81.sticky = prop_types.BoolProp.jsonDecode(t9.sticky)
	end

	if t9.children ~= nil then
		v81.children = prop_types.NestedComponentListProp.jsonDecode(t9.children)
	end

	return v81
end

t6.descriptor = {
	name = "SheetFullBleedSchema_Props",
	fullName = "roblox.apppageplatform.shared.v1beta1.Props"
}
t1.SheetFullBleedSchema_Props = t6
typeRegistry.default:register(t1.SheetFullBleedSchema_Props)

return {
	SheetFullBleedSchema = t1.SheetFullBleedSchema,
	SheetFullBleedSchema_Props = t1.SheetFullBleedSchema_Props
}
