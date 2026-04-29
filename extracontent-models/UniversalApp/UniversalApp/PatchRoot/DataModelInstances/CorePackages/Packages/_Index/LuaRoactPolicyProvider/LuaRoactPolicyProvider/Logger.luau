local ParentParent = script.Parent.Parent
local Lumberyak = require(ParentParent.Lumberyak)

if game:DefineFastFlag("RoactPolicyLoggerName", false) then
	return (Lumberyak.Logger.new(nil, "LuaRoactPolicyProvider"))
end

return (Lumberyak.Logger.new())
