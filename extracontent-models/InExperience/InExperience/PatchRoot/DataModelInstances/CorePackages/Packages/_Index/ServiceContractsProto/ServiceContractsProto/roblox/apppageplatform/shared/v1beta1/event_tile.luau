local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local prop_types = require(script.Parent.prop_types)
local actions = require(script.Parent.actions)
local component_shared = require(script.Parent.component_shared)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 124
	-- upvalues: t2 (copy)
	return (setmetatable({
		props = if t3 ~= nil and t3.props ~= nil then t3.props else nil,
		shared = if t3 ~= nil and t3.shared ~= nil then t3.shared else nil
	}, t2))
end
function t2.encode(p1) -- line: 131
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
function t2.decode(p2: buffer) -- line: 152
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
				v21.props = t1.EventTileSchema_Props.decode(v26)
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
function t2.jsonEncode(p3) -- line: 200
	local t4 = {}

	if p3.props ~= nil then
		t4.props = p3.props:jsonEncode()
	end

	if p3.shared ~= nil then
		t4.shared = p3.shared:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 214
	-- upvalues: t2 (copy), t1 (copy), component_shared (copy)
	local v35 = t2.new()

	if t5.props ~= nil then
		v35.props = t1.EventTileSchema_Props.jsonDecode(t5.props)
	end

	if t5.shared ~= nil then
		v35.shared = component_shared.ComponentShared.jsonDecode(t5.shared)
	end

	return v35
end

t2.descriptor = {
	name = "EventTileSchema",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventTileSchema"
}
t1.EventTileSchema = t2
typeRegistry.default:register(t1.EventTileSchema)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 243
	-- upvalues: t6 (copy)
	return (setmetatable({
		image_aspect_ratio = if t7 ~= nil and t7.image_aspect_ratio ~= nil then t7.image_aspect_ratio else nil,
		title_text = if t7 ~= nil and t7.title_text ~= nil then t7.title_text else nil,
		image = if t7 ~= nil and t7.image ~= nil then t7.image else nil,
		is_contained = if t7 ~= nil and t7.is_contained ~= nil then t7.is_contained else nil,
		on_activated = if t7 ~= nil and t7.on_activated ~= nil then t7.on_activated else nil,
		background_image = if t7 ~= nil and t7.background_image ~= nil then t7.background_image else nil,
		containment_padding = if t7 ~= nil and t7.containment_padding ~= nil then t7.containment_padding else nil,
		corner_radius = if t7 ~= nil and t7.corner_radius ~= nil then t7.corner_radius else nil,
		title_lines = if t7 ~= nil and t7.title_lines ~= nil then t7.title_lines else nil,
		background_image_component = if t7 ~= nil and t7.background_image_component ~= nil then t7.background_image_component else nil,
		cta_button_component = if t7 ~= nil and t7.cta_button_component ~= nil then t7.cta_button_component else nil,
		footer_component = if t7 ~= nil and t7.footer_component ~= nil then t7.footer_component else nil,
		image_component = if t7 ~= nil and t7.image_component ~= nil then t7.image_component else nil,
		thumbnail_overlay_component = if t7 ~= nil and t7.thumbnail_overlay_component ~= nil then t7.thumbnail_overlay_component else nil,
		title_component = if t7 ~= nil and t7.title_component ~= nil then t7.title_component else nil,
		focus_navigation_actions_component = if t7 ~= nil and t7.focus_navigation_actions_component ~= nil then t7.focus_navigation_actions_component else nil,
		thumbnail_background_style = if t7 ~= nil and t7.thumbnail_background_style ~= nil then t7.thumbnail_background_style else nil,
		title_font = if t7 ~= nil and t7.title_font ~= nil then t7.title_font else nil,
		enable_legacy_hover_state = if t7 ~= nil and t7.enable_legacy_hover_state ~= nil then t7.enable_legacy_hover_state else nil,
		event_id = if t7 ~= nil and t7.event_id ~= nil then t7.event_id else nil,
		universe_id = if t7 ~= nil and t7.universe_id ~= nil then t7.universe_id else nil,
		disable_default_overlay = if t7 ~= nil and t7.disable_default_overlay ~= nil then t7.disable_default_overlay else nil,
		disable_default_footer = if t7 ~= nil and t7.disable_default_footer ~= nil then t7.disable_default_footer else nil,
		disable_default_cta = if t7 ~= nil and t7.disable_default_cta ~= nil then t7.disable_default_cta else nil,
		is_active = if t7 ~= nil and t7.is_active ~= nil then t7.is_active else nil,
		formatted_start_date = if t7 ~= nil and t7.formatted_start_date ~= nil then t7.formatted_start_date else nil,
		subtitle = if t7 ~= nil and t7.subtitle ~= nil then t7.subtitle else nil,
		user_rsvp = if t7 ~= nil and t7.user_rsvp ~= nil then t7.user_rsvp else nil
	}, t6))
end
function t6.encode(p4) -- line: 299
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.image_aspect_ratio ~= nil then
		local v40 = p4.image_aspect_ratio:encode()
		local v41, v42 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v41, v42, v40, buffer.len(v40))
	end

	if p4.title_text ~= nil then
		local v43 = p4.title_text:encode()
		local v44, v45 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v44, v45, v43, buffer.len(v43))
	end

	if p4.image ~= nil then
		local v46 = p4.image:encode()
		local v47, v48 = proto.writeTag(buf, n3, 3, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v47, v48, v46, buffer.len(v46))
	end

	if p4.is_contained ~= nil then
		local v49 = p4.is_contained:encode()
		local v50, v51 = proto.writeTag(buf, n3, 4, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v50, v51, v49, buffer.len(v49))
	end

	if p4.on_activated ~= nil then
		local v52 = p4.on_activated:encode()
		local v53, v54 = proto.writeTag(buf, n3, 5, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v53, v54, v52, buffer.len(v52))
	end

	if p4.background_image ~= nil then
		local v55 = p4.background_image:encode()
		local v56, v57 = proto.writeTag(buf, n3, 6, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v56, v57, v55, buffer.len(v55))
	end

	if p4.containment_padding ~= nil then
		local v58 = p4.containment_padding:encode()
		local v59, v60 = proto.writeTag(buf, n3, 7, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v59, v60, v58, buffer.len(v58))
	end

	if p4.corner_radius ~= nil then
		local v61 = p4.corner_radius:encode()
		local v62, v63 = proto.writeTag(buf, n3, 8, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v62, v63, v61, buffer.len(v61))
	end

	if p4.title_lines ~= nil then
		local v64 = p4.title_lines:encode()
		local v65, v66 = proto.writeTag(buf, n3, 9, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v65, v66, v64, buffer.len(v64))
	end

	if p4.background_image_component ~= nil then
		local v67 = p4.background_image_component:encode()
		local v68, v69 = proto.writeTag(buf, n3, 10, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v68, v69, v67, buffer.len(v67))
	end

	if p4.cta_button_component ~= nil then
		local v70 = p4.cta_button_component:encode()
		local v71, v72 = proto.writeTag(buf, n3, 11, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v71, v72, v70, buffer.len(v70))
	end

	if p4.footer_component ~= nil then
		local v73 = p4.footer_component:encode()
		local v74, v75 = proto.writeTag(buf, n3, 12, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v74, v75, v73, buffer.len(v73))
	end

	if p4.image_component ~= nil then
		local v76 = p4.image_component:encode()
		local v77, v78 = proto.writeTag(buf, n3, 13, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v77, v78, v76, buffer.len(v76))
	end

	if p4.thumbnail_overlay_component ~= nil then
		local v79 = p4.thumbnail_overlay_component:encode()
		local v80, v81 = proto.writeTag(buf, n3, 14, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v80, v81, v79, buffer.len(v79))
	end

	if p4.title_component ~= nil then
		local v82 = p4.title_component:encode()
		local v83, v84 = proto.writeTag(buf, n3, 15, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v83, v84, v82, buffer.len(v82))
	end

	if p4.focus_navigation_actions_component ~= nil then
		local v85 = p4.focus_navigation_actions_component:encode()
		local v86, v87 = proto.writeTag(buf, n3, 16, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v86, v87, v85, buffer.len(v85))
	end

	if p4.thumbnail_background_style ~= nil then
		local v88 = p4.thumbnail_background_style:encode()
		local v89, v90 = proto.writeTag(buf, n3, 17, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v89, v90, v88, buffer.len(v88))
	end

	if p4.title_font ~= nil then
		local v91 = p4.title_font:encode()
		local v92, v93 = proto.writeTag(buf, n3, 18, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v92, v93, v91, buffer.len(v91))
	end

	if p4.enable_legacy_hover_state ~= nil then
		local v94 = p4.enable_legacy_hover_state:encode()
		local v95, v96 = proto.writeTag(buf, n3, 19, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v95, v96, v94, buffer.len(v94))
	end

	if p4.event_id ~= nil then
		local v97 = p4.event_id:encode()
		local v98, v99 = proto.writeTag(buf, n3, 100, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v98, v99, v97, buffer.len(v97))
	end

	if p4.universe_id ~= nil then
		local v100 = p4.universe_id:encode()
		local v101, v102 = proto.writeTag(buf, n3, 101, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v101, v102, v100, buffer.len(v100))
	end

	if p4.disable_default_overlay ~= nil then
		local v103 = p4.disable_default_overlay:encode()
		local v104, v105 = proto.writeTag(buf, n3, 102, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v104, v105, v103, buffer.len(v103))
	end

	if p4.disable_default_footer ~= nil then
		local v106 = p4.disable_default_footer:encode()
		local v107, v108 = proto.writeTag(buf, n3, 103, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v107, v108, v106, buffer.len(v106))
	end

	if p4.disable_default_cta ~= nil then
		local v109 = p4.disable_default_cta:encode()
		local v110, v111 = proto.writeTag(buf, n3, 104, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v110, v111, v109, buffer.len(v109))
	end

	if p4.is_active ~= nil then
		local v112 = p4.is_active:encode()
		local v113, v114 = proto.writeTag(buf, n3, 105, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v113, v114, v112, buffer.len(v112))
	end

	if p4.formatted_start_date ~= nil then
		local v115 = p4.formatted_start_date:encode()
		local v116, v117 = proto.writeTag(buf, n3, 106, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v116, v117, v115, buffer.len(v115))
	end

	if p4.subtitle ~= nil then
		local v118 = p4.subtitle:encode()
		local v119, v120 = proto.writeTag(buf, n3, 107, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v119, v120, v118, buffer.len(v118))
	end

	if p4.user_rsvp ~= nil then
		local v121 = p4.user_rsvp:encode()
		local v122, v123 = proto.writeTag(buf, n3, 108, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v122, v123, v121, buffer.len(v121))
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 476
	-- upvalues: t6 (copy), proto (copy), prop_types (copy), actions (copy)
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
				v126.image_aspect_ratio = prop_types.FloatProp.decode(v131)
			elseif v128 == 2 then
				local v132

				v132, n4 = proto.readBuffer(p5, n4)
				v126.title_text = prop_types.StringProp.decode(v132)
			elseif v128 == 3 then
				local v133

				v133, n4 = proto.readBuffer(p5, n4)
				v126.image = prop_types.ImageStringProp.decode(v133)
			elseif v128 == 4 then
				local v134

				v134, n4 = proto.readBuffer(p5, n4)
				v126.is_contained = prop_types.BoolProp.decode(v134)
			elseif v128 == 5 then
				local v135

				v135, n4 = proto.readBuffer(p5, n4)
				v126.on_activated = actions.ActionProp.decode(v135)
			elseif v128 == 6 then
				local v136

				v136, n4 = proto.readBuffer(p5, n4)
				v126.background_image = prop_types.ImageSetProp.decode(v136)
			elseif v128 == 7 then
				local v137

				v137, n4 = proto.readBuffer(p5, n4)
				v126.containment_padding = prop_types.Int32Prop.decode(v137)
			elseif v128 == 8 then
				local v138

				v138, n4 = proto.readBuffer(p5, n4)
				v126.corner_radius = prop_types.Int32Prop.decode(v138)
			elseif v128 == 9 then
				local v139

				v139, n4 = proto.readBuffer(p5, n4)
				v126.title_lines = prop_types.Int32Prop.decode(v139)
			elseif v128 == 10 then
				local v140

				v140, n4 = proto.readBuffer(p5, n4)
				v126.background_image_component = prop_types.NestedComponentProp.decode(v140)
			elseif v128 == 11 then
				local v141

				v141, n4 = proto.readBuffer(p5, n4)
				v126.cta_button_component = prop_types.NestedComponentProp.decode(v141)
			elseif v128 == 12 then
				local v142

				v142, n4 = proto.readBuffer(p5, n4)
				v126.footer_component = prop_types.NestedComponentProp.decode(v142)
			elseif v128 == 13 then
				local v143

				v143, n4 = proto.readBuffer(p5, n4)
				v126.image_component = prop_types.NestedComponentProp.decode(v143)
			elseif v128 == 14 then
				local v144

				v144, n4 = proto.readBuffer(p5, n4)
				v126.thumbnail_overlay_component = prop_types.NestedComponentProp.decode(v144)
			elseif v128 == 15 then
				local v145

				v145, n4 = proto.readBuffer(p5, n4)
				v126.title_component = prop_types.NestedComponentProp.decode(v145)
			elseif v128 == 16 then
				local v146

				v146, n4 = proto.readBuffer(p5, n4)
				v126.focus_navigation_actions_component = prop_types.NestedComponentProp.decode(v146)
			elseif v128 == 17 then
				local v147

				v147, n4 = proto.readBuffer(p5, n4)
				v126.thumbnail_background_style = prop_types.ColorProp.decode(v147)
			elseif v128 == 18 then
				local v148

				v148, n4 = proto.readBuffer(p5, n4)
				v126.title_font = prop_types.TypographyProp.decode(v148)
			elseif v128 == 19 then
				local v149

				v149, n4 = proto.readBuffer(p5, n4)
				v126.enable_legacy_hover_state = prop_types.BoolProp.decode(v149)
			elseif v128 == 100 then
				local v150

				v150, n4 = proto.readBuffer(p5, n4)
				v126.event_id = prop_types.StringProp.decode(v150)
			elseif v128 == 101 then
				local v151

				v151, n4 = proto.readBuffer(p5, n4)
				v126.universe_id = prop_types.StringProp.decode(v151)
			elseif v128 == 102 then
				local v152

				v152, n4 = proto.readBuffer(p5, n4)
				v126.disable_default_overlay = prop_types.BoolProp.decode(v152)
			elseif v128 == 103 then
				local v153

				v153, n4 = proto.readBuffer(p5, n4)
				v126.disable_default_footer = prop_types.BoolProp.decode(v153)
			elseif v128 == 104 then
				local v154

				v154, n4 = proto.readBuffer(p5, n4)
				v126.disable_default_cta = prop_types.BoolProp.decode(v154)
			elseif v128 == 105 then
				local v155

				v155, n4 = proto.readBuffer(p5, n4)
				v126.is_active = prop_types.BoolProp.decode(v155)
			elseif v128 == 106 then
				local v156

				v156, n4 = proto.readBuffer(p5, n4)
				v126.formatted_start_date = prop_types.StringProp.decode(v156)
			elseif v128 == 107 then
				local v157

				v157, n4 = proto.readBuffer(p5, n4)
				v126.subtitle = prop_types.StringProp.decode(v157)
			elseif v128 == 108 then
				local v158

				v158, n4 = proto.readBuffer(p5, n4)
				v126.user_rsvp = prop_types.BoolProp.decode(v158)
			else
				local v159, v160 = proto.readVarInt(p5, n4)

				n4 = v160 + v159
			end
		elseif v129 == proto.wireTypes.i32 then
			local v161

			v161, n4 = proto.readFixed32(p5, n4)
		elseif v129 == proto.wireTypes.i64 then
			local v162

			v162, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v129)
		end
	end

	return v126
end
function t6.jsonEncode(p6) -- line: 666
	local t8 = {}

	if p6.image_aspect_ratio ~= nil then
		t8.imageAspectRatio = p6.image_aspect_ratio:jsonEncode()
	end

	if p6.title_text ~= nil then
		t8.titleText = p6.title_text:jsonEncode()
	end

	if p6.image ~= nil then
		t8.image = p6.image:jsonEncode()
	end

	if p6.is_contained ~= nil then
		t8.isContained = p6.is_contained:jsonEncode()
	end

	if p6.on_activated ~= nil then
		t8.onActivated = p6.on_activated:jsonEncode()
	end

	if p6.background_image ~= nil then
		t8.backgroundImage = p6.background_image:jsonEncode()
	end

	if p6.containment_padding ~= nil then
		t8.containmentPadding = p6.containment_padding:jsonEncode()
	end

	if p6.corner_radius ~= nil then
		t8.cornerRadius = p6.corner_radius:jsonEncode()
	end

	if p6.title_lines ~= nil then
		t8.titleLines = p6.title_lines:jsonEncode()
	end

	if p6.background_image_component ~= nil then
		t8.backgroundImageComponent = p6.background_image_component:jsonEncode()
	end

	if p6.cta_button_component ~= nil then
		t8.ctaButtonComponent = p6.cta_button_component:jsonEncode()
	end

	if p6.footer_component ~= nil then
		t8.footerComponent = p6.footer_component:jsonEncode()
	end

	if p6.image_component ~= nil then
		t8.imageComponent = p6.image_component:jsonEncode()
	end

	if p6.thumbnail_overlay_component ~= nil then
		t8.thumbnailOverlayComponent = p6.thumbnail_overlay_component:jsonEncode()
	end

	if p6.title_component ~= nil then
		t8.titleComponent = p6.title_component:jsonEncode()
	end

	if p6.focus_navigation_actions_component ~= nil then
		t8.focusNavigationActionsComponent = p6.focus_navigation_actions_component:jsonEncode()
	end

	if p6.thumbnail_background_style ~= nil then
		t8.thumbnailBackgroundStyle = p6.thumbnail_background_style:jsonEncode()
	end

	if p6.title_font ~= nil then
		t8.titleFont = p6.title_font:jsonEncode()
	end

	if p6.enable_legacy_hover_state ~= nil then
		t8.enableLegacyHoverState = p6.enable_legacy_hover_state:jsonEncode()
	end

	if p6.event_id ~= nil then
		t8.eventId = p6.event_id:jsonEncode()
	end

	if p6.universe_id ~= nil then
		t8.universeId = p6.universe_id:jsonEncode()
	end

	if p6.disable_default_overlay ~= nil then
		t8.disableDefaultOverlay = p6.disable_default_overlay:jsonEncode()
	end

	if p6.disable_default_footer ~= nil then
		t8.disableDefaultFooter = p6.disable_default_footer:jsonEncode()
	end

	if p6.disable_default_cta ~= nil then
		t8.disableDefaultCta = p6.disable_default_cta:jsonEncode()
	end

	if p6.is_active ~= nil then
		t8.isActive = p6.is_active:jsonEncode()
	end

	if p6.formatted_start_date ~= nil then
		t8.formattedStartDate = p6.formatted_start_date:jsonEncode()
	end

	if p6.subtitle ~= nil then
		t8.subtitle = p6.subtitle:jsonEncode()
	end

	if p6.user_rsvp ~= nil then
		t8.userRsvp = p6.user_rsvp:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 784
	-- upvalues: t6 (copy), prop_types (copy), actions (copy)
	local v166 = t6.new()

	if t9.image_aspect_ratio ~= nil then
		v166.image_aspect_ratio = prop_types.FloatProp.jsonDecode(t9.image_aspect_ratio)
	end

	if t9.imageAspectRatio ~= nil then
		v166.image_aspect_ratio = prop_types.FloatProp.jsonDecode(t9.imageAspectRatio)
	end

	if t9.title_text ~= nil then
		v166.title_text = prop_types.StringProp.jsonDecode(t9.title_text)
	end

	if t9.titleText ~= nil then
		v166.title_text = prop_types.StringProp.jsonDecode(t9.titleText)
	end

	if t9.image ~= nil then
		v166.image = prop_types.ImageStringProp.jsonDecode(t9.image)
	end

	if t9.is_contained ~= nil then
		v166.is_contained = prop_types.BoolProp.jsonDecode(t9.is_contained)
	end

	if t9.isContained ~= nil then
		v166.is_contained = prop_types.BoolProp.jsonDecode(t9.isContained)
	end

	if t9.on_activated ~= nil then
		v166.on_activated = actions.ActionProp.jsonDecode(t9.on_activated)
	end

	if t9.onActivated ~= nil then
		v166.on_activated = actions.ActionProp.jsonDecode(t9.onActivated)
	end

	if t9.background_image ~= nil then
		v166.background_image = prop_types.ImageSetProp.jsonDecode(t9.background_image)
	end

	if t9.backgroundImage ~= nil then
		v166.background_image = prop_types.ImageSetProp.jsonDecode(t9.backgroundImage)
	end

	if t9.containment_padding ~= nil then
		v166.containment_padding = prop_types.Int32Prop.jsonDecode(t9.containment_padding)
	end

	if t9.containmentPadding ~= nil then
		v166.containment_padding = prop_types.Int32Prop.jsonDecode(t9.containmentPadding)
	end

	if t9.corner_radius ~= nil then
		v166.corner_radius = prop_types.Int32Prop.jsonDecode(t9.corner_radius)
	end

	if t9.cornerRadius ~= nil then
		v166.corner_radius = prop_types.Int32Prop.jsonDecode(t9.cornerRadius)
	end

	if t9.title_lines ~= nil then
		v166.title_lines = prop_types.Int32Prop.jsonDecode(t9.title_lines)
	end

	if t9.titleLines ~= nil then
		v166.title_lines = prop_types.Int32Prop.jsonDecode(t9.titleLines)
	end

	if t9.background_image_component ~= nil then
		v166.background_image_component = prop_types.NestedComponentProp.jsonDecode(t9.background_image_component)
	end

	if t9.backgroundImageComponent ~= nil then
		v166.background_image_component = prop_types.NestedComponentProp.jsonDecode(t9.backgroundImageComponent)
	end

	if t9.cta_button_component ~= nil then
		v166.cta_button_component = prop_types.NestedComponentProp.jsonDecode(t9.cta_button_component)
	end

	if t9.ctaButtonComponent ~= nil then
		v166.cta_button_component = prop_types.NestedComponentProp.jsonDecode(t9.ctaButtonComponent)
	end

	if t9.footer_component ~= nil then
		v166.footer_component = prop_types.NestedComponentProp.jsonDecode(t9.footer_component)
	end

	if t9.footerComponent ~= nil then
		v166.footer_component = prop_types.NestedComponentProp.jsonDecode(t9.footerComponent)
	end

	if t9.image_component ~= nil then
		v166.image_component = prop_types.NestedComponentProp.jsonDecode(t9.image_component)
	end

	if t9.imageComponent ~= nil then
		v166.image_component = prop_types.NestedComponentProp.jsonDecode(t9.imageComponent)
	end

	if t9.thumbnail_overlay_component ~= nil then
		v166.thumbnail_overlay_component = prop_types.NestedComponentProp.jsonDecode(t9.thumbnail_overlay_component)
	end

	if t9.thumbnailOverlayComponent ~= nil then
		v166.thumbnail_overlay_component = prop_types.NestedComponentProp.jsonDecode(t9.thumbnailOverlayComponent)
	end

	if t9.title_component ~= nil then
		v166.title_component = prop_types.NestedComponentProp.jsonDecode(t9.title_component)
	end

	if t9.titleComponent ~= nil then
		v166.title_component = prop_types.NestedComponentProp.jsonDecode(t9.titleComponent)
	end

	if t9.focus_navigation_actions_component ~= nil then
		v166.focus_navigation_actions_component = prop_types.NestedComponentProp.jsonDecode(t9.focus_navigation_actions_component)
	end

	if t9.focusNavigationActionsComponent ~= nil then
		v166.focus_navigation_actions_component = prop_types.NestedComponentProp.jsonDecode(t9.focusNavigationActionsComponent)
	end

	if t9.thumbnail_background_style ~= nil then
		v166.thumbnail_background_style = prop_types.ColorProp.jsonDecode(t9.thumbnail_background_style)
	end

	if t9.thumbnailBackgroundStyle ~= nil then
		v166.thumbnail_background_style = prop_types.ColorProp.jsonDecode(t9.thumbnailBackgroundStyle)
	end

	if t9.title_font ~= nil then
		v166.title_font = prop_types.TypographyProp.jsonDecode(t9.title_font)
	end

	if t9.titleFont ~= nil then
		v166.title_font = prop_types.TypographyProp.jsonDecode(t9.titleFont)
	end

	if t9.enable_legacy_hover_state ~= nil then
		v166.enable_legacy_hover_state = prop_types.BoolProp.jsonDecode(t9.enable_legacy_hover_state)
	end

	if t9.enableLegacyHoverState ~= nil then
		v166.enable_legacy_hover_state = prop_types.BoolProp.jsonDecode(t9.enableLegacyHoverState)
	end

	if t9.event_id ~= nil then
		v166.event_id = prop_types.StringProp.jsonDecode(t9.event_id)
	end

	if t9.eventId ~= nil then
		v166.event_id = prop_types.StringProp.jsonDecode(t9.eventId)
	end

	if t9.universe_id ~= nil then
		v166.universe_id = prop_types.StringProp.jsonDecode(t9.universe_id)
	end

	if t9.universeId ~= nil then
		v166.universe_id = prop_types.StringProp.jsonDecode(t9.universeId)
	end

	if t9.disable_default_overlay ~= nil then
		v166.disable_default_overlay = prop_types.BoolProp.jsonDecode(t9.disable_default_overlay)
	end

	if t9.disableDefaultOverlay ~= nil then
		v166.disable_default_overlay = prop_types.BoolProp.jsonDecode(t9.disableDefaultOverlay)
	end

	if t9.disable_default_footer ~= nil then
		v166.disable_default_footer = prop_types.BoolProp.jsonDecode(t9.disable_default_footer)
	end

	if t9.disableDefaultFooter ~= nil then
		v166.disable_default_footer = prop_types.BoolProp.jsonDecode(t9.disableDefaultFooter)
	end

	if t9.disable_default_cta ~= nil then
		v166.disable_default_cta = prop_types.BoolProp.jsonDecode(t9.disable_default_cta)
	end

	if t9.disableDefaultCta ~= nil then
		v166.disable_default_cta = prop_types.BoolProp.jsonDecode(t9.disableDefaultCta)
	end

	if t9.is_active ~= nil then
		v166.is_active = prop_types.BoolProp.jsonDecode(t9.is_active)
	end

	if t9.isActive ~= nil then
		v166.is_active = prop_types.BoolProp.jsonDecode(t9.isActive)
	end

	if t9.formatted_start_date ~= nil then
		v166.formatted_start_date = prop_types.StringProp.jsonDecode(t9.formatted_start_date)
	end

	if t9.formattedStartDate ~= nil then
		v166.formatted_start_date = prop_types.StringProp.jsonDecode(t9.formattedStartDate)
	end

	if t9.subtitle ~= nil then
		v166.subtitle = prop_types.StringProp.jsonDecode(t9.subtitle)
	end

	if t9.user_rsvp ~= nil then
		v166.user_rsvp = prop_types.BoolProp.jsonDecode(t9.user_rsvp)
	end

	if t9.userRsvp ~= nil then
		v166.user_rsvp = prop_types.BoolProp.jsonDecode(t9.userRsvp)
	end

	return v166
end

t6.descriptor = {
	name = "EventTileSchema_Props",
	fullName = "roblox.apppageplatform.shared.v1beta1.Props"
}
t1.EventTileSchema_Props = t6
typeRegistry.default:register(t1.EventTileSchema_Props)

return {
	EventTileSchema = t1.EventTileSchema,
	EventTileSchema_Props = t1.EventTileSchema_Props
}
