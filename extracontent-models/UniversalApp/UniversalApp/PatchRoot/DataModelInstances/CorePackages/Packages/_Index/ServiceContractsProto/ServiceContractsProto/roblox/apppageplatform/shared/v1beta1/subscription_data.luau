local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 51
	-- upvalues: t2 (copy)
	return (setmetatable({
		id = if t3 ~= nil and t3.id ~= nil then t3.id else 0,
		name = if t3 ~= nil and t3.name ~= nil then t3.name else "",
		description = if t3 ~= nil and t3.description ~= nil then t3.description else "",
		image_asset_id = if t3 ~= nil and t3.image_asset_id ~= nil then t3.image_asset_id else 0,
		price_display = if t3 ~= nil and t3.price_display ~= nil then t3.price_display else "",
		period_type = if t3 ~= nil and t3.period_type ~= nil then t3.period_type else "",
		is_subscribed = t3 ~= nil and (t3.is_subscribed ~= nil and t3.is_subscribed)
	}, t2))
end
function t2.encode(p1) -- line: 63
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.id ~= nil and p1.id ~= 0 then
		local v9, v10 = proto.writeTag(buf, n1, 1, proto.wireTypes.varint)

		buf, n1 = proto.writeVarInt(v9, v10, p1.id)
	end

	if p1.name ~= nil and p1.name ~= "" then
		local v11, v12 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v11, v12, p1.name)
	end

	if p1.description ~= nil and p1.description ~= "" then
		local v13, v14 = proto.writeTag(buf, n1, 3, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v13, v14, p1.description)
	end

	if p1.image_asset_id ~= nil and p1.image_asset_id ~= 0 then
		local v15, v16 = proto.writeTag(buf, n1, 4, proto.wireTypes.varint)

		buf, n1 = proto.writeVarInt(v15, v16, p1.image_asset_id)
	end

	if p1.price_display ~= nil and p1.price_display ~= "" then
		local v17, v18 = proto.writeTag(buf, n1, 5, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v17, v18, p1.price_display)
	end

	if p1.period_type ~= nil and p1.period_type ~= "" then
		local v19, v20 = proto.writeTag(buf, n1, 6, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v19, v20, p1.period_type)
	end

	if p1.is_subscribed then
		local v21, v22 = proto.writeTag(buf, n1, 7, proto.wireTypes.varint)

		buf, n1 = proto.writeVarInt(v21, v22, not p1.is_subscribed and 0 or 1)
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 107
	-- upvalues: t2 (copy), proto (copy)
	local v25 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v27, v28

		v27, v28, n2 = proto.readTag(p2, n2)

		if v28 == proto.wireTypes.varint then
			if v27 == 1 then
				local v29

				v29, n2 = proto.readVarIntI64(p2, n2)
				v25.id = v29
			elseif v27 == 4 then
				local v30

				v30, n2 = proto.readVarIntI64(p2, n2)
				v25.image_asset_id = v30
			elseif v27 == 7 then
				local v31

				v31, n2 = proto.readVarInt(p2, n2)
				v25.is_subscribed = v31 ~= 0
			else
				local v32

				v32, n2 = proto.readVarInt(p2, n2)
			end
		elseif v28 == proto.wireTypes.lengthDelimited then
			if v27 == 2 then
				local v33

				v33, n2 = proto.readBuffer(p2, n2)
				v25.name = buffer.tostring(v33)
			elseif v27 == 3 then
				local v34

				v34, n2 = proto.readBuffer(p2, n2)
				v25.description = buffer.tostring(v34)
			elseif v27 == 5 then
				local v35

				v35, n2 = proto.readBuffer(p2, n2)
				v25.price_display = buffer.tostring(v35)
			elseif v27 == 6 then
				local v36

				v36, n2 = proto.readBuffer(p2, n2)
				v25.period_type = buffer.tostring(v36)
			else
				local v37, v38 = proto.readVarInt(p2, n2)

				n2 = v38 + v37
			end
		elseif v28 == proto.wireTypes.i32 then
			local v39

			v39, n2 = proto.readFixed32(p2, n2)
		elseif v28 == proto.wireTypes.i64 then
			local v40

			v40, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v28)
		end
	end

	return v25
end
function t2.jsonEncode(p3) -- line: 180
	local t4 = {}

	if p3.id ~= nil and p3.id ~= 0 then
		t4.id = p3.id
	end

	if p3.name ~= nil and p3.name ~= "" then
		t4.name = p3.name
	end

	if p3.description ~= nil and p3.description ~= "" then
		t4.description = p3.description
	end

	if p3.image_asset_id ~= nil and p3.image_asset_id ~= 0 then
		t4.imageAssetId = p3.image_asset_id
	end

	if p3.price_display ~= nil and p3.price_display ~= "" then
		t4.priceDisplay = p3.price_display
	end

	if p3.period_type ~= nil and p3.period_type ~= "" then
		t4.periodType = p3.period_type
	end

	if p3.is_subscribed then
		t4.isSubscribed = p3.is_subscribed
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 214
	-- upvalues: t2 (copy)
	local v44 = t2.new()

	if t5.id ~= nil then
		v44.id = t5.id
	end

	if t5.name ~= nil then
		v44.name = t5.name
	end

	if t5.description ~= nil then
		v44.description = t5.description
	end

	if t5.image_asset_id ~= nil then
		v44.image_asset_id = t5.image_asset_id
	end

	if t5.imageAssetId ~= nil then
		v44.image_asset_id = t5.imageAssetId
	end

	if t5.price_display ~= nil then
		v44.price_display = t5.price_display
	end

	if t5.priceDisplay ~= nil then
		v44.price_display = t5.priceDisplay
	end

	if t5.period_type ~= nil then
		v44.period_type = t5.period_type
	end

	if t5.periodType ~= nil then
		v44.period_type = t5.periodType
	end

	if t5.is_subscribed ~= nil then
		v44.is_subscribed = t5.is_subscribed
	end

	if t5.isSubscribed ~= nil then
		v44.is_subscribed = t5.isSubscribed
	end

	return v44
end

t2.descriptor = {
	name = "SubscriptionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionData"
}
t1.SubscriptionData = t2
typeRegistry.default:register(t1.SubscriptionData)

return {
	SubscriptionData = t1.SubscriptionData
}
