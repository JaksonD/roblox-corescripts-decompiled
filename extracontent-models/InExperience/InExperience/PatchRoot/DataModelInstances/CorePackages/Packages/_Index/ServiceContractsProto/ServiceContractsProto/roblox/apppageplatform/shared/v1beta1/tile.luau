local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local prop_types = require(script.Parent.prop_types)
local prop_types_engine = require(script.Parent.prop_types_engine)
local actions = require(script.Parent.actions)
local component_shared = require(script.Parent.component_shared)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 132
	-- upvalues: t2 (copy)
	return (setmetatable({
		props = if t3 ~= nil and t3.props ~= nil then t3.props else nil,
		shared = if t3 ~= nil and t3.shared ~= nil then t3.shared else nil
	}, t2))
end
function t2.encode(p1) -- line: 139
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.props ~= nil then
		local v15 = p1.props:encode()
		local v16, v17 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v16, v17, v15, buffer.len(v15))
	end

	if p1.shared ~= nil then
		local v18 = p1.shared:encode()
		local v19, v20 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v19, v20, v18, buffer.len(v18))
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 160
	-- upvalues: t2 (copy), proto (copy), t1 (copy), component_shared (copy)
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
				v23.props = t1.TileSchema_Props.decode(v28)
			elseif v25 == 2 then
				local v29

				v29, n2 = proto.readBuffer(p2, n2)
				v23.shared = component_shared.ComponentShared.decode(v29)
			else
				local v30, v31 = proto.readVarInt(p2, n2)

				n2 = v31 + v30
			end
		elseif v26 == proto.wireTypes.i32 then
			local v32

			v32, n2 = proto.readFixed32(p2, n2)
		elseif v26 == proto.wireTypes.i64 then
			local v33

			v33, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v26)
		end
	end

	return v23
end
function t2.jsonEncode(p3) -- line: 208
	local t4 = {}

	if p3.props ~= nil then
		t4.props = p3.props:jsonEncode()
	end

	if p3.shared ~= nil then
		t4.shared = p3.shared:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 222
	-- upvalues: t2 (copy), t1 (copy), component_shared (copy)
	local v37 = t2.new()

	if t5.props ~= nil then
		v37.props = t1.TileSchema_Props.jsonDecode(t5.props)
	end

	if t5.shared ~= nil then
		v37.shared = component_shared.ComponentShared.jsonDecode(t5.shared)
	end

	return v37
end

t2.descriptor = {
	name = "TileSchema",
	fullName = "roblox.apppageplatform.shared.v1beta1.TileSchema"
}
t1.TileSchema = t2
typeRegistry.default:register(t1.TileSchema)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 251
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
		hold_action_config = if t7 ~= nil and t7.hold_action_config ~= nil then t7.hold_action_config else nil
	}, t6))
end
function t6.encode(p4) -- line: 291
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.image_aspect_ratio ~= nil then
		local v42 = p4.image_aspect_ratio:encode()
		local v43, v44 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v43, v44, v42, buffer.len(v42))
	end

	if p4.title_text ~= nil then
		local v45 = p4.title_text:encode()
		local v46, v47 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v46, v47, v45, buffer.len(v45))
	end

	if p4.image ~= nil then
		local v48 = p4.image:encode()
		local v49, v50 = proto.writeTag(buf, n3, 3, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v49, v50, v48, buffer.len(v48))
	end

	if p4.is_contained ~= nil then
		local v51 = p4.is_contained:encode()
		local v52, v53 = proto.writeTag(buf, n3, 4, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v52, v53, v51, buffer.len(v51))
	end

	if p4.on_activated ~= nil then
		local v54 = p4.on_activated:encode()
		local v55, v56 = proto.writeTag(buf, n3, 5, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v55, v56, v54, buffer.len(v54))
	end

	if p4.background_image ~= nil then
		local v57 = p4.background_image:encode()
		local v58, v59 = proto.writeTag(buf, n3, 6, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v58, v59, v57, buffer.len(v57))
	end

	if p4.containment_padding ~= nil then
		local v60 = p4.containment_padding:encode()
		local v61, v62 = proto.writeTag(buf, n3, 7, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v61, v62, v60, buffer.len(v60))
	end

	if p4.corner_radius ~= nil then
		local v63 = p4.corner_radius:encode()
		local v64, v65 = proto.writeTag(buf, n3, 8, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v64, v65, v63, buffer.len(v63))
	end

	if p4.title_lines ~= nil then
		local v66 = p4.title_lines:encode()
		local v67, v68 = proto.writeTag(buf, n3, 9, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v67, v68, v66, buffer.len(v66))
	end

	if p4.background_image_component ~= nil then
		local v69 = p4.background_image_component:encode()
		local v70, v71 = proto.writeTag(buf, n3, 10, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v70, v71, v69, buffer.len(v69))
	end

	if p4.cta_button_component ~= nil then
		local v72 = p4.cta_button_component:encode()
		local v73, v74 = proto.writeTag(buf, n3, 11, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v73, v74, v72, buffer.len(v72))
	end

	if p4.footer_component ~= nil then
		local v75 = p4.footer_component:encode()
		local v76, v77 = proto.writeTag(buf, n3, 12, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v76, v77, v75, buffer.len(v75))
	end

	if p4.image_component ~= nil then
		local v78 = p4.image_component:encode()
		local v79, v80 = proto.writeTag(buf, n3, 13, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v79, v80, v78, buffer.len(v78))
	end

	if p4.thumbnail_overlay_component ~= nil then
		local v81 = p4.thumbnail_overlay_component:encode()
		local v82, v83 = proto.writeTag(buf, n3, 14, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v82, v83, v81, buffer.len(v81))
	end

	if p4.title_component ~= nil then
		local v84 = p4.title_component:encode()
		local v85, v86 = proto.writeTag(buf, n3, 15, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v85, v86, v84, buffer.len(v84))
	end

	if p4.focus_navigation_actions_component ~= nil then
		local v87 = p4.focus_navigation_actions_component:encode()
		local v88, v89 = proto.writeTag(buf, n3, 16, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v88, v89, v87, buffer.len(v87))
	end

	if p4.thumbnail_background_style ~= nil then
		local v90 = p4.thumbnail_background_style:encode()
		local v91, v92 = proto.writeTag(buf, n3, 17, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v91, v92, v90, buffer.len(v90))
	end

	if p4.title_font ~= nil then
		local v93 = p4.title_font:encode()
		local v94, v95 = proto.writeTag(buf, n3, 18, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v94, v95, v93, buffer.len(v93))
	end

	if p4.enable_legacy_hover_state ~= nil then
		local v96 = p4.enable_legacy_hover_state:encode()
		local v97, v98 = proto.writeTag(buf, n3, 19, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v97, v98, v96, buffer.len(v96))
	end

	if p4.hold_action_config ~= nil then
		local v99 = p4.hold_action_config:encode()
		local v100, v101 = proto.writeTag(buf, n3, 20, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v100, v101, v99, buffer.len(v99))
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 420
	-- upvalues: t6 (copy), proto (copy), prop_types (copy), actions (copy), t1 (copy)
	local v104 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v106, v107

		v106, v107, n4 = proto.readTag(p5, n4)

		if v107 == proto.wireTypes.varint then
			local v108

			v108, n4 = proto.readVarInt(p5, n4)
		elseif v107 == proto.wireTypes.lengthDelimited then
			if v106 == 1 then
				local v109

				v109, n4 = proto.readBuffer(p5, n4)
				v104.image_aspect_ratio = prop_types.FloatProp.decode(v109)
			elseif v106 == 2 then
				local v110

				v110, n4 = proto.readBuffer(p5, n4)
				v104.title_text = prop_types.StringProp.decode(v110)
			elseif v106 == 3 then
				local v111

				v111, n4 = proto.readBuffer(p5, n4)
				v104.image = prop_types.ImageStringProp.decode(v111)
			elseif v106 == 4 then
				local v112

				v112, n4 = proto.readBuffer(p5, n4)
				v104.is_contained = prop_types.BoolProp.decode(v112)
			elseif v106 == 5 then
				local v113

				v113, n4 = proto.readBuffer(p5, n4)
				v104.on_activated = actions.ActionProp.decode(v113)
			elseif v106 == 6 then
				local v114

				v114, n4 = proto.readBuffer(p5, n4)
				v104.background_image = prop_types.ImageSetProp.decode(v114)
			elseif v106 == 7 then
				local v115

				v115, n4 = proto.readBuffer(p5, n4)
				v104.containment_padding = prop_types.Int32Prop.decode(v115)
			elseif v106 == 8 then
				local v116

				v116, n4 = proto.readBuffer(p5, n4)
				v104.corner_radius = prop_types.Int32Prop.decode(v116)
			elseif v106 == 9 then
				local v117

				v117, n4 = proto.readBuffer(p5, n4)
				v104.title_lines = prop_types.Int32Prop.decode(v117)
			elseif v106 == 10 then
				local v118

				v118, n4 = proto.readBuffer(p5, n4)
				v104.background_image_component = prop_types.NestedComponentProp.decode(v118)
			elseif v106 == 11 then
				local v119

				v119, n4 = proto.readBuffer(p5, n4)
				v104.cta_button_component = prop_types.NestedComponentProp.decode(v119)
			elseif v106 == 12 then
				local v120

				v120, n4 = proto.readBuffer(p5, n4)
				v104.footer_component = prop_types.NestedComponentProp.decode(v120)
			elseif v106 == 13 then
				local v121

				v121, n4 = proto.readBuffer(p5, n4)
				v104.image_component = prop_types.NestedComponentProp.decode(v121)
			elseif v106 == 14 then
				local v122

				v122, n4 = proto.readBuffer(p5, n4)
				v104.thumbnail_overlay_component = prop_types.NestedComponentProp.decode(v122)
			elseif v106 == 15 then
				local v123

				v123, n4 = proto.readBuffer(p5, n4)
				v104.title_component = prop_types.NestedComponentProp.decode(v123)
			elseif v106 == 16 then
				local v124

				v124, n4 = proto.readBuffer(p5, n4)
				v104.focus_navigation_actions_component = prop_types.NestedComponentProp.decode(v124)
			elseif v106 == 17 then
				local v125

				v125, n4 = proto.readBuffer(p5, n4)
				v104.thumbnail_background_style = prop_types.ColorProp.decode(v125)
			elseif v106 == 18 then
				local v126

				v126, n4 = proto.readBuffer(p5, n4)
				v104.title_font = prop_types.TypographyProp.decode(v126)
			elseif v106 == 19 then
				local v127

				v127, n4 = proto.readBuffer(p5, n4)
				v104.enable_legacy_hover_state = prop_types.BoolProp.decode(v127)
			elseif v106 == 20 then
				local v128

				v128, n4 = proto.readBuffer(p5, n4)
				v104.hold_action_config = t1.HoldActionConfig.decode(v128)
			else
				local v129, v130 = proto.readVarInt(p5, n4)

				n4 = v130 + v129
			end
		elseif v107 == proto.wireTypes.i32 then
			local v131

			v131, n4 = proto.readFixed32(p5, n4)
		elseif v107 == proto.wireTypes.i64 then
			local v132

			v132, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v107)
		end
	end

	return v104
end
function t6.jsonEncode(p6) -- line: 567
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

	if p6.hold_action_config ~= nil then
		t8.holdActionConfig = p6.hold_action_config:jsonEncode()
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 653
	-- upvalues: t6 (copy), prop_types (copy), actions (copy), t1 (copy)
	local v136 = t6.new()

	if t9.image_aspect_ratio ~= nil then
		v136.image_aspect_ratio = prop_types.FloatProp.jsonDecode(t9.image_aspect_ratio)
	end

	if t9.imageAspectRatio ~= nil then
		v136.image_aspect_ratio = prop_types.FloatProp.jsonDecode(t9.imageAspectRatio)
	end

	if t9.title_text ~= nil then
		v136.title_text = prop_types.StringProp.jsonDecode(t9.title_text)
	end

	if t9.titleText ~= nil then
		v136.title_text = prop_types.StringProp.jsonDecode(t9.titleText)
	end

	if t9.image ~= nil then
		v136.image = prop_types.ImageStringProp.jsonDecode(t9.image)
	end

	if t9.is_contained ~= nil then
		v136.is_contained = prop_types.BoolProp.jsonDecode(t9.is_contained)
	end

	if t9.isContained ~= nil then
		v136.is_contained = prop_types.BoolProp.jsonDecode(t9.isContained)
	end

	if t9.on_activated ~= nil then
		v136.on_activated = actions.ActionProp.jsonDecode(t9.on_activated)
	end

	if t9.onActivated ~= nil then
		v136.on_activated = actions.ActionProp.jsonDecode(t9.onActivated)
	end

	if t9.background_image ~= nil then
		v136.background_image = prop_types.ImageSetProp.jsonDecode(t9.background_image)
	end

	if t9.backgroundImage ~= nil then
		v136.background_image = prop_types.ImageSetProp.jsonDecode(t9.backgroundImage)
	end

	if t9.containment_padding ~= nil then
		v136.containment_padding = prop_types.Int32Prop.jsonDecode(t9.containment_padding)
	end

	if t9.containmentPadding ~= nil then
		v136.containment_padding = prop_types.Int32Prop.jsonDecode(t9.containmentPadding)
	end

	if t9.corner_radius ~= nil then
		v136.corner_radius = prop_types.Int32Prop.jsonDecode(t9.corner_radius)
	end

	if t9.cornerRadius ~= nil then
		v136.corner_radius = prop_types.Int32Prop.jsonDecode(t9.cornerRadius)
	end

	if t9.title_lines ~= nil then
		v136.title_lines = prop_types.Int32Prop.jsonDecode(t9.title_lines)
	end

	if t9.titleLines ~= nil then
		v136.title_lines = prop_types.Int32Prop.jsonDecode(t9.titleLines)
	end

	if t9.background_image_component ~= nil then
		v136.background_image_component = prop_types.NestedComponentProp.jsonDecode(t9.background_image_component)
	end

	if t9.backgroundImageComponent ~= nil then
		v136.background_image_component = prop_types.NestedComponentProp.jsonDecode(t9.backgroundImageComponent)
	end

	if t9.cta_button_component ~= nil then
		v136.cta_button_component = prop_types.NestedComponentProp.jsonDecode(t9.cta_button_component)
	end

	if t9.ctaButtonComponent ~= nil then
		v136.cta_button_component = prop_types.NestedComponentProp.jsonDecode(t9.ctaButtonComponent)
	end

	if t9.footer_component ~= nil then
		v136.footer_component = prop_types.NestedComponentProp.jsonDecode(t9.footer_component)
	end

	if t9.footerComponent ~= nil then
		v136.footer_component = prop_types.NestedComponentProp.jsonDecode(t9.footerComponent)
	end

	if t9.image_component ~= nil then
		v136.image_component = prop_types.NestedComponentProp.jsonDecode(t9.image_component)
	end

	if t9.imageComponent ~= nil then
		v136.image_component = prop_types.NestedComponentProp.jsonDecode(t9.imageComponent)
	end

	if t9.thumbnail_overlay_component ~= nil then
		v136.thumbnail_overlay_component = prop_types.NestedComponentProp.jsonDecode(t9.thumbnail_overlay_component)
	end

	if t9.thumbnailOverlayComponent ~= nil then
		v136.thumbnail_overlay_component = prop_types.NestedComponentProp.jsonDecode(t9.thumbnailOverlayComponent)
	end

	if t9.title_component ~= nil then
		v136.title_component = prop_types.NestedComponentProp.jsonDecode(t9.title_component)
	end

	if t9.titleComponent ~= nil then
		v136.title_component = prop_types.NestedComponentProp.jsonDecode(t9.titleComponent)
	end

	if t9.focus_navigation_actions_component ~= nil then
		v136.focus_navigation_actions_component = prop_types.NestedComponentProp.jsonDecode(t9.focus_navigation_actions_component)
	end

	if t9.focusNavigationActionsComponent ~= nil then
		v136.focus_navigation_actions_component = prop_types.NestedComponentProp.jsonDecode(t9.focusNavigationActionsComponent)
	end

	if t9.thumbnail_background_style ~= nil then
		v136.thumbnail_background_style = prop_types.ColorProp.jsonDecode(t9.thumbnail_background_style)
	end

	if t9.thumbnailBackgroundStyle ~= nil then
		v136.thumbnail_background_style = prop_types.ColorProp.jsonDecode(t9.thumbnailBackgroundStyle)
	end

	if t9.title_font ~= nil then
		v136.title_font = prop_types.TypographyProp.jsonDecode(t9.title_font)
	end

	if t9.titleFont ~= nil then
		v136.title_font = prop_types.TypographyProp.jsonDecode(t9.titleFont)
	end

	if t9.enable_legacy_hover_state ~= nil then
		v136.enable_legacy_hover_state = prop_types.BoolProp.jsonDecode(t9.enable_legacy_hover_state)
	end

	if t9.enableLegacyHoverState ~= nil then
		v136.enable_legacy_hover_state = prop_types.BoolProp.jsonDecode(t9.enableLegacyHoverState)
	end

	if t9.hold_action_config ~= nil then
		v136.hold_action_config = t1.HoldActionConfig.jsonDecode(t9.hold_action_config)
	end

	if t9.holdActionConfig ~= nil then
		v136.hold_action_config = t1.HoldActionConfig.jsonDecode(t9.holdActionConfig)
	end

	return v136
end

t6.descriptor = {
	name = "TileSchema_Props",
	fullName = "roblox.apppageplatform.shared.v1beta1.Props"
}
t1.TileSchema_Props = t6
typeRegistry.default:register(t1.TileSchema_Props)

local t10 = {}

t10.__index = t10

function t10.new(t11: {[any]: any}?) -- line: 874
	-- upvalues: t10 (copy)
	return (setmetatable({
		on_hold_completed = if t11 ~= nil and t11.on_hold_completed ~= nil then t11.on_hold_completed else nil,
		focus_navigation_event_name = if t11 ~= nil and t11.focus_navigation_event_name ~= nil then t11.focus_navigation_event_name else nil,
		key_code = if t11 ~= nil and t11.key_code ~= nil then t11.key_code else nil
	}, t10))
end
function t10.encode(p7) -- line: 884
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n5 = 0

	if p7.on_hold_completed ~= nil then
		local v141 = p7.on_hold_completed:encode()
		local v142, v143 = proto.writeTag(buf, n5, 1, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeBuffer(v142, v143, v141, buffer.len(v141))
	end

	if p7.focus_navigation_event_name ~= nil then
		local v144 = p7.focus_navigation_event_name:encode()
		local v145, v146 = proto.writeTag(buf, n5, 2, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeBuffer(v145, v146, v144, buffer.len(v144))
	end

	if p7.key_code ~= nil then
		local v147 = p7.key_code:encode()
		local v148, v149 = proto.writeTag(buf, n5, 3, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeBuffer(v148, v149, v147, buffer.len(v147))
	end

	local buf4 = buffer.create(n5)

	buffer.copy(buf4, 0, buf, 0, n5)

	return buf4
end
function t10.decode(p8: buffer) -- line: 911
	-- upvalues: t10 (copy), proto (copy), actions (copy), prop_types (copy), prop_types_engine (copy)
	local v152 = t10.new()
	local n6 = 0

	while n6 < buffer.len(p8) do
		local v154, v155

		v154, v155, n6 = proto.readTag(p8, n6)

		if v155 == proto.wireTypes.varint then
			local v156

			v156, n6 = proto.readVarInt(p8, n6)
		elseif v155 == proto.wireTypes.lengthDelimited then
			if v154 == 1 then
				local v157

				v157, n6 = proto.readBuffer(p8, n6)
				v152.on_hold_completed = actions.ActionProp.decode(v157)
			elseif v154 == 2 then
				local v158

				v158, n6 = proto.readBuffer(p8, n6)
				v152.focus_navigation_event_name = prop_types.StringProp.decode(v158)
			elseif v154 == 3 then
				local v159

				v159, n6 = proto.readBuffer(p8, n6)
				v152.key_code = prop_types_engine.KeyCodeProp.decode(v159)
			else
				local v160, v161 = proto.readVarInt(p8, n6)

				n6 = v161 + v160
			end
		elseif v155 == proto.wireTypes.i32 then
			local v162

			v162, n6 = proto.readFixed32(p8, n6)
		elseif v155 == proto.wireTypes.i64 then
			local v163

			v163, n6 = proto.readFixed64(p8, n6)
		else
			error("Unsupported wire type: " .. v155)
		end
	end

	return v152
end
function t10.jsonEncode(p9) -- line: 965
	local t12 = {}

	if p9.on_hold_completed ~= nil then
		t12.onHoldCompleted = p9.on_hold_completed:jsonEncode()
	end

	if p9.focus_navigation_event_name ~= nil then
		t12.focusNavigationEventName = p9.focus_navigation_event_name:jsonEncode()
	end

	if p9.key_code ~= nil then
		t12.keyCode = p9.key_code:jsonEncode()
	end

	return t12
end
function t10.jsonDecode(t13: {[any]: any}) -- line: 983
	-- upvalues: t10 (copy), actions (copy), prop_types (copy), prop_types_engine (copy)
	local v167 = t10.new()

	if t13.on_hold_completed ~= nil then
		v167.on_hold_completed = actions.ActionProp.jsonDecode(t13.on_hold_completed)
	end

	if t13.onHoldCompleted ~= nil then
		v167.on_hold_completed = actions.ActionProp.jsonDecode(t13.onHoldCompleted)
	end

	if t13.focus_navigation_event_name ~= nil then
		v167.focus_navigation_event_name = prop_types.StringProp.jsonDecode(t13.focus_navigation_event_name)
	end

	if t13.focusNavigationEventName ~= nil then
		v167.focus_navigation_event_name = prop_types.StringProp.jsonDecode(t13.focusNavigationEventName)
	end

	if t13.key_code ~= nil then
		v167.key_code = prop_types_engine.KeyCodeProp.jsonDecode(t13.key_code)
	end

	if t13.keyCode ~= nil then
		v167.key_code = prop_types_engine.KeyCodeProp.jsonDecode(t13.keyCode)
	end

	return v167
end

t10.descriptor = {
	name = "HoldActionConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.HoldActionConfig"
}
t1.HoldActionConfig = t10
typeRegistry.default:register(t1.HoldActionConfig)

return {
	TileSchema = t1.TileSchema,
	TileSchema_Props = t1.TileSchema_Props,
	HoldActionConfig = t1.HoldActionConfig
}
