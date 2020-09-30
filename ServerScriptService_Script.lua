local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InsertService = game:GetService("InsertService")
local remoteEvent = ReplicatedStorage:WaitForChild("ChangeClothesEvent")

function changeShirtOrPants(character, userInput, clothingType)
	local existingPlayerClothing = character:FindFirstChild(clothingType)
	local templateType = clothingType.."Template"
	local inputTemplate = InsertService:LoadAsset(userInput):GetChildren()[1][templateType]
	
	if existingPlayerClothing then
		existingPlayerClothing[templateType] = inputTemplate
	else
		local newClothing = Instance.new(clothingType)
		newClothing[templateType] = inputTemplate
		newClothing.Parent = character
	end
end

function changeShirtGraphic(character, userInput)
	local existingPlayerShirtGraphic = character:FindFirstChild("Shirt Graphic")
	local inputShirtGraphic = InsertService:LoadAsset(userInput):GetChildren()[1].Graphic
	
	if existingPlayerShirtGraphic then
		existingPlayerShirtGraphic.Graphic = inputShirtGraphic
	else
		local newTShirt = Instance.new("ShirtGraphic")
		newTShirt.Graphic = inputShirtGraphic
		newTShirt.Parent = character
	end
end

function changeFace(character, userInput)
	local existingPlayerHead = character:FindFirstChild("Head")
	local inputFaceTexture = InsertService:LoadAsset(userInput):GetChildren()[1].Texture
	
	existingPlayerHead.face.Texture = inputFaceTexture
end

function onButtonClick(player, userInput, clothingType)
	local character = player.Character
	
	if clothingType == "Face" then
		changeFace(character, userInput)
	end
	if clothingType == "Shirt" then
		changeShirtOrPants(character, userInput, "Shirt")
	end
	if clothingType == "Shirt Graphic" then
		changeShirtGraphic(character, userInput)
	end
	if clothingType == "Pants" then
		changeShirtOrPants(character, userInput, "Pants")
	end
end

remoteEvent.OnServerEvent:Connect(onButtonClick)
