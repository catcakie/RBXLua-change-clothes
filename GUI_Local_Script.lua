local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("changeClothes")

local TryItemsGUI = script.Parent

TryItemsGUI.FaceEnter.MouseButton1Down:connect(function()
	local userInput = TryItemsGUI.FaceBox.Text
	remoteEvent:FireServer(userInput, "Face")
end)

TryItemsGUI.ShirtEnter.MouseButton1Down:connect(function()
	local userInput = TryItemsGUI.ShirtBox.Text
	remoteEvent:FireServer(userInput, "Shirt")
end)

TryItemsGUI.TShirtEnter.MouseButton1Down:connect(function()
	local userInput = TryItemsGUI.TShirtBox.Text
	remoteEvent:FireServer(userInput, "Shirt Graphic")
end)

TryItemsGUI.PantsEnter.MouseButton1Down:connect(function()
	local userInput = TryItemsGUI.PantsBox.Text
	remoteEvent:FireServer(userInput, "Pants")
end)
