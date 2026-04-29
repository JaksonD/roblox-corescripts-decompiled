local HttpService = game:GetService("HttpService")
local Foundation = script:FindFirstAncestor("Foundation")
local StudioUri = require(Foundation.Utility.Plugin.StudioUri)

require(script.Parent.Parent.Types)

local t1 = {}

t1.__index = t1

function t1.new(p1, s1: string?) -- line: 68
	-- upvalues: t1 (copy), StudioUri (copy)
	local v14 = setmetatable({}, t1)

	v14._uriScope = s1
	v14._plugin = p1
	v14._panels = p1:GetPluginComponent("Panels")
	v14._pluginUri = StudioUri.wrap(p1:GetUri())
	v14._active = {}
	v14._pool = {}
	v14._didPrewarm = false

	return v14
end
function t1.openAtAsync(p2, p3, p4: ((...any) -> ...any)?, n1: number?, s2: string?) -- line: 98
	local v20 = p2:_acquirePanelAsync(p4, if n1 ~= nil then n1 else 0, s2)

	v20.panel.Enabled = false
	p2._panels:SetAttachmentAsync(v20.uri, {
		TargetWidgetUri = p3.targetWidgetUri,
		TargetAnchorPoint = p3.targetAnchorPoint,
		SubjectAnchorPoint = p3.subjectAnchorPoint,
		Offset = p3.offset
	})
	p2._panels:SetSizeAsync(v20.uri, Vector2.new(0, 0))
	v20.panel.Enabled = true
	v20.open = true

	return {
		container = v20.panel,
		popoverId = v20.id,
		setSizeAsync = function(vector2: Vector2) --[[ setSizeAsync ]] -- line: 125
			-- upvalues: p2 (copy), v20 (copy)
			local v83 = math.ceil((math.min(3000, vector2.X)))
			local v84 = math.ceil((math.min(3000, vector2.Y)))

			p2._panels:SetSizeAsync(v20.uri, Vector2.new(v83, v84))
		end,
		updateAsync = function(p5) --[[ updateAsync ]] -- line: 130
			-- upvalues: v20 (copy), p2 (copy)
			if not v20.uri then
				return
			end

			p2._panels:SetAttachmentAsync(v20.uri, {
				TargetWidgetUri = p5.targetWidgetUri,
				TargetAnchorPoint = p5.targetAnchorPoint,
				SubjectAnchorPoint = p5.subjectAnchorPoint,
				Offset = p5.offset
			})
		end,
		close = function() --[[ close ]] -- line: 142
			-- upvalues: p2 (copy), v20 (copy)
			p2:_closePopover(v20, true)
		end
	}
end
function t1._createPanelAsync(p6, s3: string, n2: number) -- line: 155
	-- upvalues: StudioUri (copy)
	local v24 = p6._plugin:CreateQWidgetPluginGui(s3, {
		Id = s3,
		InitialEnabled = true,
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Title = s3,
		ZIndex = n2 + 200
	})

	v24.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	return v24, StudioUri.join(p6._pluginUri, {
		Category = "Panels",
		ItemId = s3
	})
end
function t1._makePopoverId(p7) -- line: 176
	-- upvalues: HttpService (copy)
	return `Popovers{ not p7._uriScope and "" or `/{ p7._uriScope }` }/{ HttpService:GenerateGUID(false) }`
end
function t1._createPopoverAsync(p8, s4: string, n3: number) -- line: 181
	local v29, v30 = p8:_createPanelAsync(s4, n3)
	local t2 = {
		id = s4,
		uri = v30,
		panel = v29,
		open = false,
		depth = n3,
		parentPopoverId = nil,
		onClose = nil
	}

	if v29:IsA("PluginGui") then
		v29:BindToClose(function() -- line: 193
			-- upvalues: p8 (copy), t2 (copy)
			p8:_closePopover(t2)
		end)
	end

	v29.InputBegan:Connect(function(input) -- line: 202
		-- upvalues: t2 (copy), p8 (copy)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and t2.open then
			p8:_closeChildPopovers(t2)
		end
	end)

	return t2
end
function t1._activatePopover(p9, t3: {[any]: any}, p10: ((...any) -> ...any)?, s5: string?) -- line: 211
	t3.onClose = p10
	t3.parentPopoverId = s5
	t3.open = false
	p9._active[t3.id] = t3
end
function t1._tryAcquireFromPool(p11, p12: ((...any) -> ...any)?, n4: number, s6: string?) -- line: 227
	local v40 = p11._pool[n4]
	local v41 = if not v40 then nil else table.remove(v40)

	if not v41 then
		return nil
	end

	p11:_activatePopover(v41, p12, s6)

	return v41
end
function t1._acquirePanelAsync(p13, p14: ((...any) -> ...any)?, n5: number, s7: string?) -- line: 247
	local v46 = p13:_tryAcquireFromPool(p14, n5, s7)

	if v46 then
		return v46
	end

	local v47 = p13:_createPopoverAsync(p13:_makePopoverId(), n5)

	p13:_activatePopover(v47, p14, s7)

	return v47
end
function t1.prewarmPoolAsync(p15, n6: number) -- line: 268
	if p15._didPrewarm then
		return
	end

	for i = 0, math.max(0, n6) do
		if p15._pool[i] == nil then
			p15._pool[i] = {}
		end

		local v51 = p15._pool[i]

		if #v51 == 0 then
			local v52 = p15:_createPopoverAsync(p15:_makePopoverId(), i)

			v52.panel.Enabled = false
			table.insert(v51, v52)
		end
	end

	p15._didPrewarm = true
end
function t1._closeChildPopovers(p16, t4: {[any]: any}) -- line: 294
	local t5 = {}
	local g60 = nil
	local g62 = nil
	local g63 = nil
	local v64 = nil
	local v61 = nil

	for _, v57 in p16._active do
		if not v57.open or v57.id == t4.id then
			continue
		end

		local _active = p16._active
		local parentPopoverId = v57.parentPopoverId

		while true do
			repeat
				if g60 or not parentPopoverId then
					g60 = false
					v61 = false
					g62 = true
				end

				if g62 then
					break
				end

				if parentPopoverId == t4.id then
					g63 = true

					break
				end

				v64 = _active[parentPopoverId]

				if not v64 then
					g60 = true
				end
			until not g60

			if g62 then
				break
			end

			if g63 then
				g63 = false

				break
			end

			parentPopoverId = v64.parentPopoverId
		end

		if not g62 then
			v61 = true
		end

		g62 = false

		if v61 then
			table.insert(t5, v57)
		end
	end

	for _, v66 in t5 do
		p16:_closePopover(v66)
	end
end
function t1._closePopover(p17, t6: {[any]: any}, b1: boolean?) -- line: 320
	if not t6.open then
		return
	end

	t6.open = false
	t6.panel.Enabled = false

	if not b1 and t6.onClose then
		t6.onClose()
	end

	p17._active[t6.id] = nil

	local depth = t6.depth

	if not p17._pool[depth] then
		p17._pool[depth] = {}
	end

	table.insert(p17._pool[depth], t6)
end
function t1.closeAll(p18) -- line: 344
	local t7 = {}

	for _, v74 in p18._active do
		table.insert(t7, v74)
	end

	for _, v76 in t7 do
		p18:_closePopover(v76)
	end
end
function t1.destroy(p19) -- line: 358
	p19:closeAll()

	for _, v79 in p19._pool do
		for _, v81 in v79 do
			if v81.panel then
				v81.panel:Destroy()
			end
		end
	end

	p19._pool = {}
end

return t1
