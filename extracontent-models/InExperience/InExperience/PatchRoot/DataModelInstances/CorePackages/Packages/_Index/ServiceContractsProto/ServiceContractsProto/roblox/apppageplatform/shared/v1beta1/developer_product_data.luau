local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 52
	-- upvalues: t2 (copy)
	return (setmetatable({
		id = if t3 ~= nil and t3.id ~= nil then t3.id else 0,
		name = if t3 ~= nil and t3.name ~= nil then t3.name else "",
		description = if t3 ~= nil and t3.description ~= nil then t3.description else "",
		image_asset_id = if t3 ~= nil and t3.image_asset_id ~= nil then t3.image_asset_id else 0,
		price_in_robux = if t3 ~= nil and t3.price_in_robux ~= nil then t3.price_in_robux else 0,
		status_text = if t3 ~= nil and t3.status_text ~= nil then t3.status_text else ""
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

	if p1.price_in_robux ~= nil and p1.price_in_robux ~= 0 then
		local v17, v18 = proto.writeTag(buf, n1, 5, proto.wireTypes.varint)

		buf, n1 = proto.writeVarInt(v17, v18, p1.price_in_robux)
	end

	if p1.status_text ~= nil and p1.status_text ~= "" then
		local v19, v20 = proto.writeTag(buf, n1, 6, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v19, v20, p1.status_text)
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 102
	-- upvalues: t2 (copy), proto (copy)
	local v23 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v25, v26

		v25, v26, n2 = proto.readTag(p2, n2)

		if v26 == proto.wireTypes.varint then
			if v25 == 1 then
				local v27

				v27, n2 = proto.readVarIntI64(p2, n2)
				v23.id = v27
			elseif v25 == 4 then
				local v28

				v28, n2 = proto.readVarIntI64(p2, n2)
				v23.image_asset_id = v28
			elseif v25 == 5 then
				local v29

				v29, n2 = proto.readVarIntI64(p2, n2)
				v23.price_in_robux = v29
			else
				local v30

				v30, n2 = proto.readVarInt(p2, n2)
			end
		elseif v26 == proto.wireTypes.lengthDelimited then
			if v25 == 2 then
				local v31

				v31, n2 = proto.readBuffer(p2, n2)
				v23.name = buffer.tostring(v31)
			elseif v25 == 3 then
				local v32

				v32, n2 = proto.readBuffer(p2, n2)
				v23.description = buffer.tostring(v32)
			elseif v25 == 6 then
				local v33

				v33, n2 = proto.readBuffer(p2, n2)
				v23.status_text = buffer.tostring(v33)
			else
				local v34, v35 = proto.readVarInt(p2, n2)

				n2 = v35 + v34
			end
		elseif v26 == proto.wireTypes.i32 then
			local v36

			v36, n2 = proto.readFixed32(p2, n2)
		elseif v26 == proto.wireTypes.i64 then
			local v37

			v37, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v26)
		end
	end

	return v23
end
function t2.jsonEncode(p3) -- line: 170
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

	if p3.price_in_robux ~= nil and p3.price_in_robux ~= 0 then
		t4.priceInRobux = p3.price_in_robux
	end

	if p3.status_text ~= nil and p3.status_text ~= "" then
		t4.statusText = p3.status_text
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 200
	-- upvalues: t2 (copy)
	local v41 = t2.new()

	if t5.id ~= nil then
		v41.id = t5.id
	end

	if t5.name ~= nil then
		v41.name = t5.name
	end

	if t5.description ~= nil then
		v41.description = t5.description
	end

	if t5.image_asset_id ~= nil then
		v41.image_asset_id = t5.image_asset_id
	end

	if t5.imageAssetId ~= nil then
		v41.image_asset_id = t5.imageAssetId
	end

	if t5.price_in_robux ~= nil then
		v41.price_in_robux = t5.price_in_robux
	end

	if t5.priceInRobux ~= nil then
		v41.price_in_robux = t5.priceInRobux
	end

	if t5.status_text ~= nil then
		v41.status_text = t5.status_text
	end

	if t5.statusText ~= nil then
		v41.status_text = t5.statusText
	end

	return v41
end

t2.descriptor = {
	name = "DeveloperProductData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductData"
}
t1.DeveloperProductData = t2
typeRegistry.default:register(t1.DeveloperProductData)

return {
	DeveloperProductData = t1.DeveloperProductData
}
