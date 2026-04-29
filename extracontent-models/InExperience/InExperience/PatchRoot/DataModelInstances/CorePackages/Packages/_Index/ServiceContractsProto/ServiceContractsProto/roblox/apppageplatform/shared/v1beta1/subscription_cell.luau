local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local prop_types = require(script.Parent.prop_types)
local actions = require(script.Parent.actions)
local component_shared = require(script.Parent.component_shared)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 84
	-- upvalues: t2 (copy)
	return (setmetatable({
		props = if t3 ~= nil and t3.props ~= nil then t3.props else nil,
		shared = if t3 ~= nil and t3.shared ~= nil then t3.shared else nil
	}, t2))
end
function t2.encode(p1) -- line: 91
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.props ~= nil then
		local v13 = p1.props:encode()
		local v14, v15 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v14, v15, v13, buffer.len(v13))
	end

	if p1.shared ~= nil then
		local v16 = p1.shared:encode()
		local v17, v18 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v17, v18, v16, buffer.len(v16))
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 112
	-- upvalues: t2 (copy), proto (copy), t1 (copy), component_shared (copy)
	local v21 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v23, v24

		v23, v24, n2 = proto.readTag(p2, n2)

		if v24 == proto.wireTypes.varint then
			local v25

			v25, n2 = proto.readVarInt(p2, n2)
		elseif v24 == proto.wireTypes.lengthDelimited then
			if v23 == 1 then
				local v26

				v26, n2 = proto.readBuffer(p2, n2)
				v21.props = t1.SubscriptionCellSchema_Props.decode(v26)
			elseif v23 == 2 then
				local v27

				v27, n2 = proto.readBuffer(p2, n2)
				v21.shared = component_shared.ComponentShared.decode(v27)
			else
				local v28, v29 = proto.readVarInt(p2, n2)

				n2 = v29 + v28
			end
		elseif v24 == proto.wireTypes.i32 then
			local v30

			v30, n2 = proto.readFixed32(p2, n2)
		elseif v24 == proto.wireTypes.i64 then
			local v31

			v31, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v24)
		end
	end

	return v21
end
function t2.jsonEncode(p3) -- line: 160
	local t4 = {}

	if p3.props ~= nil then
		t4.props = p3.props:jsonEncode()
	end

	if p3.shared ~= nil then
		t4.shared = p3.shared:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 174
	-- upvalues: t2 (copy), t1 (copy), component_shared (copy)
	local v35 = t2.new()

	if t5.props ~= nil then
		v35.props = t1.SubscriptionCellSchema_Props.jsonDecode(t5.props)
	end

	if t5.shared ~= nil then
		v35.shared = component_shared.ComponentShared.jsonDecode(t5.shared)
	end

	return v35
end

t2.descriptor = {
	name = "SubscriptionCellSchema",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCellSchema"
}
t1.SubscriptionCellSchema = t2
typeRegistry.default:register(t1.SubscriptionCellSchema)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 203
	-- upvalues: t6 (copy)
	return (setmetatable({
		content_row = if t7 ~= nil and t7.content_row ~= nil then t7.content_row else nil,
		button = if t7 ~= nil and t7.button ~= nil then t7.button else nil,
		on_activated = if t7 ~= nil and t7.on_activated ~= nil then t7.on_activated else nil,
		tag = if t7 ~= nil and t7.tag ~= nil then t7.tag else nil,
		layout_order = if t7 ~= nil and t7.layout_order ~= nil then t7.layout_order else nil
	}, t6))
end
function t6.encode(p4) -- line: 215
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.content_row ~= nil then
		local v40 = p4.content_row:encode()
		local v41, v42 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v41, v42, v40, buffer.len(v40))
	end

	if p4.button ~= nil then
		local v43 = p4.button:encode()
		local v44, v45 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v44, v45, v43, buffer.len(v43))
	end

	if p4.on_activated ~= nil then
		local v46 = p4.on_activated:encode()
		local v47, v48 = proto.writeTag(buf, n3, 3, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v47, v48, v46, buffer.len(v46))
	end

	if p4.tag ~= nil then
		local v49 = p4.tag:encode()
		local v50, v51 = proto.writeTag(buf, n3, 4, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v50, v51, v49, buffer.len(v49))
	end

	if p4.layout_order ~= nil then
		local v52 = p4.layout_order:encode()
		local v53, v54 = proto.writeTag(buf, n3, 5, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v53, v54, v52, buffer.len(v52))
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 254
	-- upvalues: t6 (copy), proto (copy), prop_types (copy), actions (copy)
	local v57 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v59, v60

		v59, v60, n4 = proto.readTag(p5, n4)

		if v60 == proto.wireTypes.varint then
			local v61

			v61, n4 = proto.readVarInt(p5, n4)
		elseif v60 == proto.wireTypes.lengthDelimited then
			if v59 == 1 then
				local v62

				v62, n4 = proto.readBuffer(p5, n4)
				v57.content_row = prop_types.NestedComponentProp.decode(v62)
			elseif v59 == 2 then
				local v63

				v63, n4 = proto.readBuffer(p5, n4)
				v57.button = prop_types.NestedComponentProp.decode(v63)
			elseif v59 == 3 then
				local v64

				v64, n4 = proto.readBuffer(p5, n4)
				v57.on_activated = actions.ActionProp.decode(v64)
			elseif v59 == 4 then
				local v65

				v65, n4 = proto.readBuffer(p5, n4)
				v57.tag = prop_types.StringProp.decode(v65)
			elseif v59 == 5 then
				local v66

				v66, n4 = proto.readBuffer(p5, n4)
				v57.layout_order = prop_types.Int32Prop.decode(v66)
			else
				local v67, v68 = proto.readVarInt(p5, n4)

				n4 = v68 + v67
			end
		elseif v60 == proto.wireTypes.i32 then
			local v69

			v69, n4 = proto.readFixed32(p5, n4)
		elseif v60 == proto.wireTypes.i64 then
			local v70

			v70, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v60)
		end
	end

	return v57
end
function t6.jsonEncode(p6) -- line: 318
	local t8 = {}

	if p6.content_row ~= nil then
		t8.contentRow = p6.content_row:jsonEncode()
	end

	if p6.button ~= nil then
		t8.button = p6.button:jsonEncode()
	end

	if p6.on_activated ~= nil then
		t8.onActivated = p6.on_activated:jsonEncode()
	end

	if p6.tag ~= nil then
		t8.tag = p6.tag:jsonEncode()
	end

	if p6.layout_order ~= nil then
		t8.layoutOrder = p6.layout_order:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 344
	-- upvalues: t6 (copy), prop_types (copy), actions (copy)
	local v74 = t6.new()

	if t9.content_row ~= nil then
		v74.content_row = prop_types.NestedComponentProp.jsonDecode(t9.content_row)
	end

	if t9.contentRow ~= nil then
		v74.content_row = prop_types.NestedComponentProp.jsonDecode(t9.contentRow)
	end

	if t9.button ~= nil then
		v74.button = prop_types.NestedComponentProp.jsonDecode(t9.button)
	end

	if t9.on_activated ~= nil then
		v74.on_activated = actions.ActionProp.jsonDecode(t9.on_activated)
	end

	if t9.onActivated ~= nil then
		v74.on_activated = actions.ActionProp.jsonDecode(t9.onActivated)
	end

	if t9.tag ~= nil then
		v74.tag = prop_types.StringProp.jsonDecode(t9.tag)
	end

	if t9.layout_order ~= nil then
		v74.layout_order = prop_types.Int32Prop.jsonDecode(t9.layout_order)
	end

	if t9.layoutOrder ~= nil then
		v74.layout_order = prop_types.Int32Prop.jsonDecode(t9.layoutOrder)
	end

	return v74
end

t6.descriptor = {
	name = "SubscriptionCellSchema_Props",
	fullName = "roblox.apppageplatform.shared.v1beta1.Props"
}
t1.SubscriptionCellSchema_Props = t6
typeRegistry.default:register(t1.SubscriptionCellSchema_Props)

return {
	SubscriptionCellSchema = t1.SubscriptionCellSchema,
	SubscriptionCellSchema_Props = t1.SubscriptionCellSchema_Props
}
