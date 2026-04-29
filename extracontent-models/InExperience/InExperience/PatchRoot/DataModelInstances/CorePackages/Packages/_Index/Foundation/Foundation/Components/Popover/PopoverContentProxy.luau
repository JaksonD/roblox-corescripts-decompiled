local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Content = require(script.Parent.Content)
local ContentPlugin = require(script.Parent.ContentPlugin)
local Flags = require(Foundation.Utility.Flags)
local isPluginSecurity = require(Foundation.Utility.isPluginSecurity)
local usePlugin = require(Foundation.Providers.Plugin.usePlugin)

return React.forwardRef(function(p1, p2) --[[ PopoverContentProxy ]] -- line: 14
	-- upvalues: Flags (copy), usePlugin (copy), React (copy), isPluginSecurity (copy), ContentPlugin (copy), Content (copy)
	local v11 = nil
	local u13

	if Flags.FoundationFixUserLevelPlugins then
		local v12

		v12, v11 = usePlugin()
		u13 = v12
	else
		u13 = usePlugin()
	end

	local v14 = if not Flags.FoundationFixUserLevelPlugins then React.useMemo(function() -- line: 24
		-- upvalues: u13 (ref)
		if u13 == nil then
			return false
		end

		local ok, _ = pcall(function() -- line: 33
			-- upvalues: u13 (ref)
			return u13:GetPluginComponent("Panels")
		end)

		return ok
	end, { u13 }) else nil

	if p2 then
		p1 = table.clone(p1)
		p1.ref = p2
	end

	local FoundationPopoverPluginSupport = Flags.FoundationPopoverPluginSupport

	if Flags.FoundationPopoverPluginSecurityGate then
		FoundationPopoverPluginSupport = FoundationPopoverPluginSupport and isPluginSecurity()
	end

	if Flags.FoundationFixUserLevelPlugins then
		if FoundationPopoverPluginSupport and v11 then
			return React.createElement(ContentPlugin, p1)
		end
	elseif FoundationPopoverPluginSupport and v14 then
		return React.createElement(ContentPlugin, p1)
	end

	return React.createElement(Content, p1)
end)
