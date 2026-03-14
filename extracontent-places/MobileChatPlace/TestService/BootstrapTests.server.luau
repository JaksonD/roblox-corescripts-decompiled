local Root = game.CoreGui.RobloxGui.Modules.LuaChat
local Test = game.CoreGui.RobloxGui.Modules:FindFirstChild("Test")

if not Test then
	error("Couldn't locate test harness. Make sure 'Test' is in your AdditionalCoreIncludeDirs!")
end

local TestBootstrap = require(Test.TestBootstrap)
local StudioReporter = require(Test.Reporters.StudioReporter)

TestBootstrap:run(Root, StudioReporter)