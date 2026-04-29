local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 41
	-- upvalues: t2 (copy)
	return (setmetatable({
		is_playable = t3 ~= nil and (t3.is_playable ~= nil and t3.is_playable),
		playability_status = if t3 ~= nil and t3.playability_status ~= nil then t3.playability_status else ""
	}, t2))
end
function t2.encode(p1) -- line: 48
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.is_playable then
		local v9, v10 = proto.writeTag(buf, n1, 1, proto.wireTypes.varint)

		buf, n1 = proto.writeVarInt(v9, v10, not p1.is_playable and 0 or 1)
	end

	if p1.playability_status ~= nil and p1.playability_status ~= "" then
		local v11, v12 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v11, v12, p1.playability_status)
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 67
	-- upvalues: t2 (copy), proto (copy)
	local v15 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v17, v18

		v17, v18, n2 = proto.readTag(p2, n2)

		if v18 == proto.wireTypes.varint then
			if v17 == 1 then
				local v19

				v19, n2 = proto.readVarInt(p2, n2)
				v15.is_playable = v19 ~= 0
			else
				local v20

				v20, n2 = proto.readVarInt(p2, n2)
			end
		elseif v18 == proto.wireTypes.lengthDelimited then
			if v17 == 2 then
				local v21

				v21, n2 = proto.readBuffer(p2, n2)
				v15.playability_status = buffer.tostring(v21)
			else
				local v22, v23 = proto.readVarInt(p2, n2)

				n2 = v23 + v22
			end
		elseif v18 == proto.wireTypes.i32 then
			local v24

			v24, n2 = proto.readFixed32(p2, n2)
		elseif v18 == proto.wireTypes.i64 then
			local v25

			v25, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v18)
		end
	end

	return v15
end
function t2.jsonEncode(p3) -- line: 115
	local t4 = {}

	if p3.is_playable then
		t4.isPlayable = p3.is_playable
	end

	if p3.playability_status ~= nil and p3.playability_status ~= "" then
		t4.playabilityStatus = p3.playability_status
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 129
	-- upvalues: t2 (copy)
	local v29 = t2.new()

	if t5.is_playable ~= nil then
		v29.is_playable = t5.is_playable
	end

	if t5.isPlayable ~= nil then
		v29.is_playable = t5.isPlayable
	end

	if t5.playability_status ~= nil then
		v29.playability_status = t5.playability_status
	end

	if t5.playabilityStatus ~= nil then
		v29.playability_status = t5.playabilityStatus
	end

	return v29
end

t2.descriptor = {
	name = "PlayabilityData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayabilityData"
}
t1.PlayabilityData = t2
typeRegistry.default:register(t1.PlayabilityData)

return {
	PlayabilityData = t1.PlayabilityData
}
