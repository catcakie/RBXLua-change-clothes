local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ChangeClothesEvent")

local GUI = script.Parent

local faceTextboxName = "FaceBox"
local shirtTextboxName = "ShirtBox"
local tshirtTextboxName = "TShirtBox"
local pantsTextboxName = "PantsBox"

local faceButtonName = "FaceEnter"
local shirtButtonName = "ShirtEnter"
local tshirtButtonName = "TShirtEnter"
local pantsButtonName = "PantsEnter"

GUI[faceButtonName].MouseButton1Down:connect(function()
	local userInput = GUI[faceTextboxName].Text
	remoteEvent:FireServer(userInput, "Face")
end)

GUI[shirtButtonName].MouseButton1Down:connect(function()
	local userInput = GUI[shirtTextboxName].Text
	remoteEvent:FireServer(userInput, "Shirt")
end)

GUI[tshirtButtonName].MouseButton1Down:connect(function()
	local userInput = GUI[tshirtTextboxName].Text
	remoteEvent:FireServer(userInput, "Shirt Graphic")
end)

GUI[pantsButtonName].MouseButton1Down:connect(function()
	local userInput = GUI[pantsTextboxName].Text
	remoteEvent:FireServer(userInput, "Pants")
end)
