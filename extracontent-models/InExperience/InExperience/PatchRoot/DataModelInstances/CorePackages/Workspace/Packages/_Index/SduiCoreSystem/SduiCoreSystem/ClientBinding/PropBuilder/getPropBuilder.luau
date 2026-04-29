local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent
local buildDefaultProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildDefaultProp)
local buildStringProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildStringProp)
local buildTableProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildTableProp)
local buildRepeatedProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildRepeatedProp)
local buildNestedComponentProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentProp)
local buildLazyNestedComponentListProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentListProp)
local buildNestedComponentListProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentListProp)
local buildActionProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildActionProp)
local SduiParsers = require(SduiCoreSystem.SduiParsers)

require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)

local SduiClientBindingParsers = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiClientBindingParsers)
local ProtoVariableMapper = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local FFlagLuaAppSduiBadgeDetailsComponents = require(SduiCoreSystemParent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local FFlagSduiOverflowMenuComponent = require(SduiCoreSystemParent.SharedFlags).FFlagSduiOverflowMenuComponent
local FFlagSduiStructPropParsers = require(SduiCoreSystemParent.SharedFlags).FFlagSduiStructPropParsers
local FFlagSduiExperienceDetailsSupport = require(SduiCoreSystemParent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = require(SduiCoreSystemParent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagSduiNestedComponentListProp = require(SduiCoreSystemParent.SharedFlags).FFlagSduiNestedComponentListProp
local FFlagSduiChartsSupport = require(SduiCoreSystemParent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiSystemBannerComponent = require(SduiCoreSystemParent.SharedFlags).FFlagSduiSystemBannerComponent
local t1 = {
	StringProp = buildStringProp,
	BoolProp = buildDefaultProp,
	FloatProp = buildDefaultProp,
	DoubleProp = buildDefaultProp,
	Int32Prop = buildDefaultProp,
	Int64Prop = buildDefaultProp
}
local v24

if FFlagSduiStructPropParsers then
	local parseStruct = SduiClientBindingParsers.parseStruct

	function v24(p1, p2, p3, p4, p5, p6) -- line: 64
		-- upvalues: buildDefaultProp (copy), parseStruct (copy)
		local v89, v90 = buildDefaultProp(p1, p2, p3, p4, p5, p6, parseStruct)

		return v89, v90
	end
else
	v24 = buildDefaultProp
end

t1.StructProp = v24

local parseImageStringProp_ = SduiParsers.parseImageStringProp_

function t1.ImageStringProp(p7, p8, p9, p10, p11, p12) -- line: 64
	-- upvalues: buildStringProp (copy), parseImageStringProp_ (copy)
	local v97, v98 = buildStringProp(p7, p8, p9, p10, p11, p12, parseImageStringProp_)

	return v97, v98
end

local parseImageSetOrImageProp_ = SduiParsers.parseImageSetOrImageProp_

function t1.ImageSetProp(p13, p14, p15, p16, p17, p18) -- line: 64
	-- upvalues: buildStringProp (copy), parseImageSetOrImageProp_ (copy)
	local v105, v106 = buildStringProp(p13, p14, p15, p16, p17, p18, parseImageSetOrImageProp_)

	return v105, v106
end

local fromHex = Color3.fromHex

function t1.ColorProp(p19, p20, p21, p22, p23, p24) -- line: 64
	-- upvalues: buildDefaultProp (copy), fromHex (copy)
	local v113, v114 = buildDefaultProp(p19, p20, p21, p22, p23, p24, fromHex)

	return v113, v114
end

t1.TypographyProp = buildDefaultProp
t1.TypographyFontProp = buildDefaultProp

local parseUDimProp_ = SduiParsers.parseUDimProp_

function t1.UDimProp(p25, p26, p27, p28, p29, p30) -- line: 64
	-- upvalues: buildDefaultProp (copy), parseUDimProp_ (copy)
	local v121, v122 = buildDefaultProp(p25, p26, p27, p28, p29, p30, parseUDimProp_)

	return v121, v122
end

local parseUDim2Prop_ = SduiParsers.parseUDim2Prop_

function t1.UDim2Prop(p31, p32, p33, p34, p35, p36) -- line: 64
	-- upvalues: buildDefaultProp (copy), parseUDim2Prop_ (copy)
	local v129, v130 = buildDefaultProp(p31, p32, p33, p34, p35, p36, parseUDim2Prop_)

	return v129, v130
end

local parseVector2Prop_ = SduiParsers.parseVector2Prop_

function t1.Vector2Prop(p37, p38, p39, p40, p41, p42) -- line: 64
	-- upvalues: buildDefaultProp (copy), parseVector2Prop_ (copy)
	local v137, v138 = buildDefaultProp(p37, p38, p39, p40, p41, p42, parseVector2Prop_)

	return v137, v138
end

t1.NestedComponentProp = buildNestedComponentProp
t1.NestedComponentListProp = if not FFlagSduiNestedComponentListProp then nil else buildNestedComponentListProp
t1.LazyNestedComponentListProp = buildLazyNestedComponentListProp

local parseIconProp_ = SduiParsers.parseIconProp_

function t1.IconProp(p43, p44, p45, p46, p47, p48) -- line: 64
	-- upvalues: buildDefaultProp (copy), parseIconProp_ (copy)
	local v145, v146 = buildDefaultProp(p43, p44, p45, p46, p47, p48, parseIconProp_)

	return v145, v146
end

local parseGradientProp_ = SduiParsers.parseGradientProp_

function t1.GradientProp(p49, p50, p51, p52, p53, p54) -- line: 64
	-- upvalues: buildDefaultProp (copy), parseGradientProp_ (copy)
	local v153, v154 = buildDefaultProp(p49, p50, p51, p52, p53, p54, parseGradientProp_)

	return v153, v154
end

local v34

if FFlagSduiStructPropParsers then
	local parseArrayOfStruct = SduiClientBindingParsers.parseArrayOfStruct

	function v34(p55, p56, p57, p58, p59, p60) -- line: 64
		-- upvalues: buildDefaultProp (copy), parseArrayOfStruct (copy)
		local v161, v162 = buildDefaultProp(p55, p56, p57, p58, p59, p60, parseArrayOfStruct)

		return v161, v162
	end
else
	v34 = buildDefaultProp
end

t1.ArrayOfStructProp = v34
t1.ActionProp = buildActionProp
t1.TableProp = buildTableProp
t1.ArrayOfMenuItemProp = if not FFlagSduiOverflowMenuComponent then nil else buildRepeatedProp
t1.MenuItemProp = if not FFlagSduiOverflowMenuComponent then nil else buildTableProp
t1.MenuItem = if not FFlagSduiOverflowMenuComponent then nil else buildTableProp
t1.GenericShareLinkData = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else buildTableProp
t1.ShareLinkFetchData = if not FFlagSduiExperienceDetailsSupport and not FFlagSduiEventDetailsSupport then nil else buildTableProp
t1.ExperienceShareLinkPayload = if not FFlagSduiExperienceDetailsSupport then nil else buildTableProp
t1.EventShareLinkPayload = if not FFlagSduiEventDetailsSupport then nil else buildTableProp
t1.MediaGallerySchema_MediaItemArrayProp = if not FFlagSduiExperienceDetailsSupport then nil else buildRepeatedProp
t1.ArrayOfSystemBannerActionsProp = if not FFlagSduiSystemBannerComponent then nil else buildRepeatedProp
t1.SystemBannerActionProp = if not FFlagSduiSystemBannerComponent then nil else buildTableProp
t1.AnalyticsDataField = buildDefaultProp

local v38

if FFlagLuaAppSduiBadgeDetailsComponents then
	local AutomaticSize = Enum.AutomaticSize
	local s1 = "AUTOMATIC_SIZE_"

	local function v37(p61) -- line: 86
		-- upvalues: SduiParsers (copy), AutomaticSize (copy), ProtoVariableMapper (copy), s1 (copy)
		local v164 = SduiParsers.getEngineEnumParser(AutomaticSize)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p61, s1, v164)
	end

	function v38(p62, p63, p64, p65, p66, p67) -- line: 64
		-- upvalues: buildDefaultProp (copy), v37 (copy)
		local v171, v172 = buildDefaultProp(p62, p63, p64, p65, p66, p67, v37)

		return v171, v172
	end
else
	v38 = nil
end

t1.AutomaticSizeProp = v38

local v42

if FFlagLuaAppSduiBadgeDetailsComponents then
	local TextTruncate = Enum.TextTruncate
	local s2 = "TEXT_TRUNCATE_"

	local function v41(p68) -- line: 86
		-- upvalues: SduiParsers (copy), TextTruncate (copy), ProtoVariableMapper (copy), s2 (copy)
		local v174 = SduiParsers.getEngineEnumParser(TextTruncate)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p68, s2, v174)
	end

	function v42(p69, p70, p71, p72, p73, p74) -- line: 64
		-- upvalues: buildDefaultProp (copy), v41 (copy)
		local v181, v182 = buildDefaultProp(p69, p70, p71, p72, p73, p74, v41)

		return v181, v182
	end
else
	v42 = nil
end

t1.TextTruncateProp = v42

local v46

if FFlagLuaAppSduiBadgeDetailsComponents then
	local TextXAlignment = Enum.TextXAlignment
	local s3 = "TEXT_X_ALIGNMENT_"

	local function v45(p75) -- line: 86
		-- upvalues: SduiParsers (copy), TextXAlignment (copy), ProtoVariableMapper (copy), s3 (copy)
		local v184 = SduiParsers.getEngineEnumParser(TextXAlignment)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p75, s3, v184)
	end

	function v46(p76, p77, p78, p79, p80, p81) -- line: 64
		-- upvalues: buildDefaultProp (copy), v45 (copy)
		local v191, v192 = buildDefaultProp(p76, p77, p78, p79, p80, p81, v45)

		return v191, v192
	end
else
	v46 = nil
end

t1.TextXAlignmentProp = v46

local v50

if FFlagLuaAppSduiBadgeDetailsComponents then
	local TextYAlignment = Enum.TextYAlignment
	local s4 = "TEXT_Y_ALIGNMENT_"

	local function v49(p82) -- line: 86
		-- upvalues: SduiParsers (copy), TextYAlignment (copy), ProtoVariableMapper (copy), s4 (copy)
		local v194 = SduiParsers.getEngineEnumParser(TextYAlignment)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p82, s4, v194)
	end

	function v50(p83, p84, p85, p86, p87, p88) -- line: 64
		-- upvalues: buildDefaultProp (copy), v49 (copy)
		local v201, v202 = buildDefaultProp(p83, p84, p85, p86, p87, p88, v49)

		return v201, v202
	end
else
	v50 = nil
end

t1.TextYAlignmentProp = v50

local v54

if FFlagLuaAppSduiBadgeDetailsComponents then
	local UIFlexMode = Enum.UIFlexMode
	local s5 = "UI_FLEX_MODE_"

	local function v53(p89) -- line: 86
		-- upvalues: SduiParsers (copy), UIFlexMode (copy), ProtoVariableMapper (copy), s5 (copy)
		local v204 = SduiParsers.getEngineEnumParser(UIFlexMode)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p89, s5, v204)
	end

	function v54(p90, p91, p92, p93, p94, p95) -- line: 64
		-- upvalues: buildDefaultProp (copy), v53 (copy)
		local v211, v212 = buildDefaultProp(p90, p91, p92, p93, p94, p95, v53)

		return v211, v212
	end
else
	v54 = nil
end

t1.UIFlexModeProp = v54

local v58

if FFlagLuaAppSduiBadgeDetailsComponents then
	local EnumScaleType = Enum.ScaleType
	local s6 = "SCALE_TYPE_"

	local function v57(p96) -- line: 86
		-- upvalues: SduiParsers (copy), EnumScaleType (copy), ProtoVariableMapper (copy), s6 (copy)
		local v214 = SduiParsers.getEngineEnumParser(EnumScaleType)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p96, s6, v214)
	end

	function v58(p97, p98, p99, p100, p101, p102) -- line: 64
		-- upvalues: buildDefaultProp (copy), v57 (copy)
		local v221, v222 = buildDefaultProp(p97, p98, p99, p100, p101, p102, v57)

		return v221, v222
	end
else
	v58 = nil
end

t1.ScaleTypeProp = v58

local v62

if FFlagLuaAppSduiBadgeDetailsComponents then
	local ResamplerMode = Enum.ResamplerMode
	local s7 = "RESAMPLER_MODE_"

	local function v61(p103) -- line: 86
		-- upvalues: SduiParsers (copy), ResamplerMode (copy), ProtoVariableMapper (copy), s7 (copy)
		local v224 = SduiParsers.getEngineEnumParser(ResamplerMode)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p103, s7, v224)
	end

	function v62(p104, p105, p106, p107, p108, p109) -- line: 64
		-- upvalues: buildDefaultProp (copy), v61 (copy)
		local v231, v232 = buildDefaultProp(p104, p105, p106, p107, p108, p109, v61)

		return v231, v232
	end
else
	v62 = nil
end

t1.ResamplerModeProp = v62

local v66

if FFlagLuaAppSduiBadgeDetailsComponents then
	local SizeConstraint = Enum.SizeConstraint
	local s8 = "SIZE_CONSTRAINT_"

	local function v65(p110) -- line: 86
		-- upvalues: SduiParsers (copy), SizeConstraint (copy), ProtoVariableMapper (copy), s8 (copy)
		local v234 = SduiParsers.getEngineEnumParser(SizeConstraint)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p110, s8, v234)
	end

	function v66(p111, p112, p113, p114, p115, p116) -- line: 64
		-- upvalues: buildDefaultProp (copy), v65 (copy)
		local v241, v242 = buildDefaultProp(p111, p112, p113, p114, p115, p116, v65)

		return v241, v242
	end
else
	v66 = nil
end

t1.SizeConstraintProp = v66

local v70

if FFlagSduiChartsSupport then
	local SelectionBehavior = Enum.SelectionBehavior
	local s9 = "SELECTION_BEHAVIOR_"

	local function v69(p117) -- line: 86
		-- upvalues: SduiParsers (copy), SelectionBehavior (copy), ProtoVariableMapper (copy), s9 (copy)
		local v244 = SduiParsers.getEngineEnumParser(SelectionBehavior)

		return ProtoVariableMapper.mapProtoEngineEnumToLua(p117, s9, v244)
	end

	function v70(p118, p119, p120, p121, p122, p123) -- line: 64
		-- upvalues: buildDefaultProp (copy), v69 (copy)
		local v251, v252 = buildDefaultProp(p118, p119, p120, p121, p122, p123, v69)

		return v251, v252
	end
else
	v70 = nil
end

t1.SelectionBehaviorProp = v70
t1.ColorStyleProp = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else buildDefaultProp

local v72

if FFlagLuaAppSduiBadgeDetailsComponents then
	local parseUiScaledUDim2 = SduiClientBindingParsers.parseUiScaledUDim2

	function v72(p124, p125, p126, p127, p128, p129) -- line: 64
		-- upvalues: buildDefaultProp (copy), parseUiScaledUDim2 (copy)
		local v259, v260 = buildDefaultProp(p124, p125, p126, p127, p128, p129, parseUiScaledUDim2)

		return v259, v260
	end
else
	v72 = nil
end

t1.UiScaledUDim2Prop = v72

local v74

if FFlagLuaAppSduiBadgeDetailsComponents then
	local parseUiScaledUDim = SduiClientBindingParsers.parseUiScaledUDim

	function v74(p130, p131, p132, p133, p134, p135) -- line: 64
		-- upvalues: buildDefaultProp (copy), parseUiScaledUDim (copy)
		local v267, v268 = buildDefaultProp(p130, p131, p132, p133, p134, p135, parseUiScaledUDim)

		return v267, v268
	end
else
	v74 = nil
end

t1.UiScaledUDimProp = v74

local v76

if FFlagLuaAppSduiBadgeDetailsComponents then
	local parseUiScaledNumber = SduiClientBindingParsers.parseUiScaledNumber

	function v76(p136, p137, p138, p139, p140, p141) -- line: 64
		-- upvalues: buildDefaultProp (copy), parseUiScaledNumber (copy)
		local v275, v276 = buildDefaultProp(p136, p137, p138, p139, p140, p141, parseUiScaledNumber)

		return v275, v276
	end
else
	v76 = nil
end

t1.UiScaledFloatProp = v76

return function(s10: string) --[[ getPropBuilder ]] -- line: 190
	-- upvalues: t1 (copy), buildDefaultProp (copy)
	if not s10 then
		error("Failed to find prop builder -- missing propDescriptorName")
	end

	local v278 = t1[s10]

	if not v278 then
		warn(`Could not find propBuilder for propDescriptorName { s10 }. Using default.`)
		v278 = buildDefaultProp
	end

	return v278
end
