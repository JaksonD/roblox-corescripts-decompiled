local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local prop_types = require(script.Parent.prop_types)
local component_shared = require(script.Parent.component_shared)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 83
	-- upvalues: t2 (copy)
	return (setmetatable({
		props = if t3 ~= nil and t3.props ~= nil then t3.props else nil,
		shared = if t3 ~= nil and t3.shared ~= nil then t3.shared else nil
	}, t2))
end
function t2.encode(p1) -- line: 90
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
function t2.decode(p2: buffer) -- line: 111
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
				v20.props = t1.InfoTableSchema_Props.decode(v25)
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
function t2.jsonEncode(p3) -- line: 159
	local t4 = {}

	if p3.props ~= nil then
		t4.props = p3.props:jsonEncode()
	end

	if p3.shared ~= nil then
		t4.shared = p3.shared:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 173
	-- upvalues: t2 (copy), t1 (copy), component_shared (copy)
	local v34 = t2.new()

	if t5.props ~= nil then
		v34.props = t1.InfoTableSchema_Props.jsonDecode(t5.props)
	end

	if t5.shared ~= nil then
		v34.shared = component_shared.ComponentShared.jsonDecode(t5.shared)
	end

	return v34
end

t2.descriptor = {
	name = "InfoTableSchema",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTableSchema"
}
t1.InfoTableSchema = t2
typeRegistry.default:register(t1.InfoTableSchema)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 202
	-- upvalues: t6 (copy)
	return (setmetatable({
		items = if t7 ~= nil and t7.items ~= nil then t7.items else nil,
		num_columns = if t7 ~= nil and t7.num_columns ~= nil then t7.num_columns else nil,
		grid_tag = if t7 ~= nil and t7.grid_tag ~= nil then t7.grid_tag else nil,
		layout_order = if t7 ~= nil and t7.layout_order ~= nil then t7.layout_order else nil,
		anchor_point = if t7 ~= nil and t7.anchor_point ~= nil then t7.anchor_point else nil,
		position = if t7 ~= nil and t7.position ~= nil then t7.position else nil,
		size = if t7 ~= nil and t7.size ~= nil then t7.size else nil,
		header_component = if t7 ~= nil and t7.header_component ~= nil then t7.header_component else nil
	}, t6))
end
function t6.encode(p4) -- line: 215
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.items ~= nil then
		local v39 = p4.items:encode()
		local v40, v41 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v40, v41, v39, buffer.len(v39))
	end

	if p4.num_columns ~= nil then
		local v42 = p4.num_columns:encode()
		local v43, v44 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v43, v44, v42, buffer.len(v42))
	end

	if p4.grid_tag ~= nil then
		local v45 = p4.grid_tag:encode()
		local v46, v47 = proto.writeTag(buf, n3, 3, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v46, v47, v45, buffer.len(v45))
	end

	if p4.layout_order ~= nil then
		local v48 = p4.layout_order:encode()
		local v49, v50 = proto.writeTag(buf, n3, 4, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v49, v50, v48, buffer.len(v48))
	end

	if p4.anchor_point ~= nil then
		local v51 = p4.anchor_point:encode()
		local v52, v53 = proto.writeTag(buf, n3, 5, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v52, v53, v51, buffer.len(v51))
	end

	if p4.position ~= nil then
		local v54 = p4.position:encode()
		local v55, v56 = proto.writeTag(buf, n3, 6, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v55, v56, v54, buffer.len(v54))
	end

	if p4.size ~= nil then
		local v57 = p4.size:encode()
		local v58, v59 = proto.writeTag(buf, n3, 7, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v58, v59, v57, buffer.len(v57))
	end

	if p4.header_component ~= nil then
		local v60 = p4.header_component:encode()
		local v61, v62 = proto.writeTag(buf, n3, 8, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v61, v62, v60, buffer.len(v60))
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 272
	-- upvalues: t6 (copy), proto (copy), prop_types (copy)
	local v65 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v67, v68

		v67, v68, n4 = proto.readTag(p5, n4)

		if v68 == proto.wireTypes.varint then
			local v69

			v69, n4 = proto.readVarInt(p5, n4)
		elseif v68 == proto.wireTypes.lengthDelimited then
			if v67 == 1 then
				local v70

				v70, n4 = proto.readBuffer(p5, n4)
				v65.items = prop_types.LazyNestedComponentListProp.decode(v70)
			elseif v67 == 2 then
				local v71

				v71, n4 = proto.readBuffer(p5, n4)
				v65.num_columns = prop_types.Int32Prop.decode(v71)
			elseif v67 == 3 then
				local v72

				v72, n4 = proto.readBuffer(p5, n4)
				v65.grid_tag = prop_types.StringProp.decode(v72)
			elseif v67 == 4 then
				local v73

				v73, n4 = proto.readBuffer(p5, n4)
				v65.layout_order = prop_types.Int32Prop.decode(v73)
			elseif v67 == 5 then
				local v74

				v74, n4 = proto.readBuffer(p5, n4)
				v65.anchor_point = prop_types.Vector2Prop.decode(v74)
			elseif v67 == 6 then
				local v75

				v75, n4 = proto.readBuffer(p5, n4)
				v65.position = prop_types.UDim2Prop.decode(v75)
			elseif v67 == 7 then
				local v76

				v76, n4 = proto.readBuffer(p5, n4)
				v65.size = prop_types.UDim2Prop.decode(v76)
			elseif v67 == 8 then
				local v77

				v77, n4 = proto.readBuffer(p5, n4)
				v65.header_component = prop_types.NestedComponentProp.decode(v77)
			else
				local v78, v79 = proto.readVarInt(p5, n4)

				n4 = v79 + v78
			end
		elseif v68 == proto.wireTypes.i32 then
			local v80

			v80, n4 = proto.readFixed32(p5, n4)
		elseif v68 == proto.wireTypes.i64 then
			local v81

			v81, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v68)
		end
	end

	return v65
end
function t6.jsonEncode(p6) -- line: 352
	local t8 = {}

	if p6.items ~= nil then
		t8.items = p6.items:jsonEncode()
	end

	if p6.num_columns ~= nil then
		t8.numColumns = p6.num_columns:jsonEncode()
	end

	if p6.grid_tag ~= nil then
		t8.gridTag = p6.grid_tag:jsonEncode()
	end

	if p6.layout_order ~= nil then
		t8.layoutOrder = p6.layout_order:jsonEncode()
	end

	if p6.anchor_point ~= nil then
		t8.anchorPoint = p6.anchor_point:jsonEncode()
	end

	if p6.position ~= nil then
		t8.position = p6.position:jsonEncode()
	end

	if p6.size ~= nil then
		t8.size = p6.size:jsonEncode()
	end

	if p6.header_component ~= nil then
		t8.headerComponent = p6.header_component:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 390
	-- upvalues: t6 (copy), prop_types (copy)
	local v85 = t6.new()

	if t9.items ~= nil then
		v85.items = prop_types.LazyNestedComponentListProp.jsonDecode(t9.items)
	end

	if t9.num_columns ~= nil then
		v85.num_columns = prop_types.Int32Prop.jsonDecode(t9.num_columns)
	end

	if t9.numColumns ~= nil then
		v85.num_columns = prop_types.Int32Prop.jsonDecode(t9.numColumns)
	end

	if t9.grid_tag ~= nil then
		v85.grid_tag = prop_types.StringProp.jsonDecode(t9.grid_tag)
	end

	if t9.gridTag ~= nil then
		v85.grid_tag = prop_types.StringProp.jsonDecode(t9.gridTag)
	end

	if t9.layout_order ~= nil then
		v85.layout_order = prop_types.Int32Prop.jsonDecode(t9.layout_order)
	end

	if t9.layoutOrder ~= nil then
		v85.layout_order = prop_types.Int32Prop.jsonDecode(t9.layoutOrder)
	end

	if t9.anchor_point ~= nil then
		v85.anchor_point = prop_types.Vector2Prop.jsonDecode(t9.anchor_point)
	end

	if t9.anchorPoint ~= nil then
		v85.anchor_point = prop_types.Vector2Prop.jsonDecode(t9.anchorPoint)
	end

	if t9.position ~= nil then
		v85.position = prop_types.UDim2Prop.jsonDecode(t9.position)
	end

	if t9.size ~= nil then
		v85.size = prop_types.UDim2Prop.jsonDecode(t9.size)
	end

	if t9.header_component ~= nil then
		v85.header_component = prop_types.NestedComponentProp.jsonDecode(t9.header_component)
	end

	if t9.headerComponent ~= nil then
		v85.header_component = prop_types.NestedComponentProp.jsonDecode(t9.headerComponent)
	end

	return v85
end

t6.descriptor = {
	name = "InfoTableSchema_Props",
	fullName = "roblox.apppageplatform.shared.v1beta1.Props"
}
t1.InfoTableSchema_Props = t6
typeRegistry.default:register(t1.InfoTableSchema_Props)

return {
	InfoTableSchema = t1.InfoTableSchema,
	InfoTableSchema_Props = t1.InfoTableSchema_Props
}
