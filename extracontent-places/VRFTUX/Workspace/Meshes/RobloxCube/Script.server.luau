print("Hello world!")
-- Variables
local object = script.Parent -- The object to rotate
local speedX = 0.3 -- The rotation speed for X axis
local speedY = 0.3 -- The rotation speed for Y axis
local speedZ = 0.3 -- The rotation speed for Z axis

-- Functions
local function rotateObject()
	local rotation = object.Rotation
	rotation = rotation + Vector3.new(speedX, speedY, speedZ)
	object.Rotation = rotation
end

-- Main script
while object.Parent do -- loop until object is destroyed or unparented
	rotateObject()
	game:GetService("RunService").Heartbeat:Wait()
end