local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 82
	-- upvalues: t2 (copy)
	return (setmetatable({
		name = if t3 ~= nil and t3.name ~= nil then t3.name else "",
		display_name = if t3 ~= nil and t3.display_name ~= nil then t3.display_name else "",
		contains = t3 ~= nil and (t3.contains ~= nil and t3.contains)
	}, t2))
end
function t2.encode(p1) -- line: 92
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.name ~= nil and p1.name ~= "" then
		local v10, v11 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v10, v11, p1.name)
	end

	if p1.display_name ~= nil and p1.display_name ~= "" then
		local v12, v13 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeString(v12, v13, p1.display_name)
	end

	if p1.contains then
		local v14, v15 = proto.writeTag(buf, n1, 3, proto.wireTypes.varint)

		buf, n1 = proto.writeVarInt(v14, v15, not p1.contains and 0 or 1)
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 116
	-- upvalues: t2 (copy), proto (copy)
	local v18 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v20, v21

		v20, v21, n2 = proto.readTag(p2, n2)

		if v21 == proto.wireTypes.varint then
			if v20 == 3 then
				local v22

				v22, n2 = proto.readVarInt(p2, n2)
				v18.contains = v22 ~= 0
			else
				local v23

				v23, n2 = proto.readVarInt(p2, n2)
			end
		elseif v21 == proto.wireTypes.lengthDelimited then
			if v20 == 1 then
				local v24

				v24, n2 = proto.readBuffer(p2, n2)
				v18.name = buffer.tostring(v24)
			elseif v20 == 2 then
				local v25

				v25, n2 = proto.readBuffer(p2, n2)
				v18.display_name = buffer.tostring(v25)
			else
				local v26, v27 = proto.readVarInt(p2, n2)

				n2 = v27 + v26
			end
		elseif v21 == proto.wireTypes.i32 then
			local v28

			v28, n2 = proto.readFixed32(p2, n2)
		elseif v21 == proto.wireTypes.i64 then
			local v29

			v29, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v21)
		end
	end

	return v18
end
function t2.jsonEncode(p3) -- line: 169
	local t4 = {}

	if p3.name ~= nil and p3.name ~= "" then
		t4.name = p3.name
	end

	if p3.display_name ~= nil and p3.display_name ~= "" then
		t4.displayName = p3.display_name
	end

	if p3.contains then
		t4.contains = p3.contains
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 187
	-- upvalues: t2 (copy)
	local v33 = t2.new()

	if t5.name ~= nil then
		v33.name = t5.name
	end

	if t5.display_name ~= nil then
		v33.display_name = t5.display_name
	end

	if t5.displayName ~= nil then
		v33.display_name = t5.displayName
	end

	if t5.contains ~= nil then
		v33.contains = t5.contains
	end

	return v33
end

t2.descriptor = {
	name = "AgeRecommendationDescriptor",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationDescriptor"
}
t1.AgeRecommendationDescriptor = t2
typeRegistry.default:register(t1.AgeRecommendationDescriptor)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 223
	-- upvalues: t6 (copy)
	return (setmetatable({
		display_name = if t7 ~= nil and t7.display_name ~= nil then t7.display_name else "",
		display_name_with_header_short = if t7 ~= nil and t7.display_name_with_header_short ~= nil then t7.display_name_with_header_short else "",
		igrs_rating = if t7 ~= nil and t7.igrs_rating ~= nil then t7.igrs_rating else "",
		igrs_rating_display_message = if t7 ~= nil and t7.igrs_rating_display_message ~= nil then t7.igrs_rating_display_message else "",
		descriptors = if t7 ~= nil and t7.descriptors ~= nil then t7.descriptors else {}
	}, t6))
end
function t6.encode(p4) -- line: 237
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.display_name ~= nil and p4.display_name ~= "" then
		local v38, v39 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeString(v38, v39, p4.display_name)
	end

	if p4.display_name_with_header_short ~= nil and p4.display_name_with_header_short ~= "" then
		local v40, v41 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeString(v40, v41, p4.display_name_with_header_short)
	end

	if p4.igrs_rating ~= nil and p4.igrs_rating ~= "" then
		local v42, v43 = proto.writeTag(buf, n3, 3, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeString(v42, v43, p4.igrs_rating)
	end

	if p4.igrs_rating_display_message ~= nil and p4.igrs_rating_display_message ~= "" then
		local v44, v45 = proto.writeTag(buf, n3, 4, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeString(v44, v45, p4.igrs_rating_display_message)
	end

	if p4.descriptors ~= nil and #p4.descriptors > 0 then
		for _, v47 in p4.descriptors do
			local v48 = v47:encode()
			local v49, v50 = proto.writeTag(buf, n3, 5, proto.wireTypes.lengthDelimited)

			buf, n3 = proto.writeBuffer(v49, v50, v48, buffer.len(v48))
		end
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 274
	-- upvalues: t6 (copy), proto (copy), t1 (copy)
	local v53 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v55, v56

		v55, v56, n4 = proto.readTag(p5, n4)

		if v56 == proto.wireTypes.varint then
			local v57

			v57, n4 = proto.readVarInt(p5, n4)
		elseif v56 == proto.wireTypes.lengthDelimited then
			if v55 == 1 then
				local v58

				v58, n4 = proto.readBuffer(p5, n4)
				v53.display_name = buffer.tostring(v58)
			elseif v55 == 2 then
				local v59

				v59, n4 = proto.readBuffer(p5, n4)
				v53.display_name_with_header_short = buffer.tostring(v59)
			elseif v55 == 3 then
				local v60

				v60, n4 = proto.readBuffer(p5, n4)
				v53.igrs_rating = buffer.tostring(v60)
			elseif v55 == 4 then
				local v61

				v61, n4 = proto.readBuffer(p5, n4)
				v53.igrs_rating_display_message = buffer.tostring(v61)
			elseif v55 == 5 then
				local v62

				v62, n4 = proto.readBuffer(p5, n4)
				table.insert(v53.descriptors, t1.AgeRecommendationDescriptor.decode(v62))
			else
				local v63, v64 = proto.readVarInt(p5, n4)

				n4 = v64 + v63
			end
		elseif v56 == proto.wireTypes.i32 then
			local v65

			v65, n4 = proto.readFixed32(p5, n4)
		elseif v56 == proto.wireTypes.i64 then
			local v66

			v66, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v56)
		end
	end

	return v53
end
function t6.jsonEncode(p6) -- line: 337
	local t8 = {}

	if p6.display_name ~= nil and p6.display_name ~= "" then
		t8.displayName = p6.display_name
	end

	if p6.display_name_with_header_short ~= nil and p6.display_name_with_header_short ~= "" then
		t8.displayNameWithHeaderShort = p6.display_name_with_header_short
	end

	if p6.igrs_rating ~= nil and p6.igrs_rating ~= "" then
		t8.igrsRating = p6.igrs_rating
	end

	if p6.igrs_rating_display_message ~= nil and p6.igrs_rating_display_message ~= "" then
		t8.igrsRatingDisplayMessage = p6.igrs_rating_display_message
	end

	if p6.descriptors ~= nil and #p6.descriptors > 0 then
		local t9 = {}

		for _, v71 in p6.descriptors do
			table.insert(t9, v71:jsonEncode())
		end

		t8.descriptors = t9
	end

	return t8
end
function t6.jsonDecode(t10: {[any]: any}) -- line: 367
	-- upvalues: t6 (copy), t1 (copy)
	local v73 = t6.new()

	if t10.display_name ~= nil then
		v73.display_name = t10.display_name
	end

	if t10.displayName ~= nil then
		v73.display_name = t10.displayName
	end

	if t10.display_name_with_header_short ~= nil then
		v73.display_name_with_header_short = t10.display_name_with_header_short
	end

	if t10.displayNameWithHeaderShort ~= nil then
		v73.display_name_with_header_short = t10.displayNameWithHeaderShort
	end

	if t10.igrs_rating ~= nil then
		v73.igrs_rating = t10.igrs_rating
	end

	if t10.igrsRating ~= nil then
		v73.igrs_rating = t10.igrsRating
	end

	if t10.igrs_rating_display_message ~= nil then
		v73.igrs_rating_display_message = t10.igrs_rating_display_message
	end

	if t10.igrsRatingDisplayMessage ~= nil then
		v73.igrs_rating_display_message = t10.igrsRatingDisplayMessage
	end

	if t10.descriptors ~= nil then
		local t11 = {}

		for _, v76 in t10.descriptors do
			table.insert(t11, t1.AgeRecommendationDescriptor.jsonDecode(v76))
		end

		v73.descriptors = t11
	end

	return v73
end

t6.descriptor = {
	name = "AgeRecommendationData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationData"
}
t1.AgeRecommendationData = t6
typeRegistry.default:register(t1.AgeRecommendationData)

return {
	AgeRecommendationDescriptor = t1.AgeRecommendationDescriptor,
	AgeRecommendationData = t1.AgeRecommendationData
}
