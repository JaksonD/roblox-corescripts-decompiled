local Flags = require(script.Parent.Parent.Utility.Flags)
local NumberInput = require(script.NumberInput)

if Flags.FoundationNumberInputTextFix then
	return NumberInput
end

return (require(script.NumberInputTextState))
