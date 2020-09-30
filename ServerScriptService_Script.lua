local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InsertService = game:GetService("InsertService")
local remoteEvent = ReplicatedStorage:WaitForChild("ChangeClothesEvent")

function changeShirtOrPants(character, userInput, clothingType)
	local inputTemplate = InsertService:LoadAsset(userInput):GetChildren()[1][clothingType.."Template"]
	
	if character:FindFirstChild(clothingType) then
		character:FindFirstChild(clothingType)[clothingType.."Template"] = inputTemplate
	else
		local newClothing = Instance.new(clothingType)
		newClothing[clothingType.."Template"] = inputTemplate
		newClothing.Parent = character
	end
end

function changeShirtGraphic(character, userInput)
	local inputShirtGraphic = InsertService:LoadAsset(userInput):GetChildren()[1].Graphic
	
	if character:FindFirstChild("Shirt Graphic") then
		character:FindFirstChild("Shirt Graphic").Graphic = inputShirtGraphic
	else
		local newTShirt = Instance.new("ShirtGraphic")
		newTShirt.Graphic = inputShirtGraphic
		newTShirt.Parent = character
	end
end

function changeFace(character, userInput)
	local inputFaceTexture = InsertService:LoadAsset(userInput):GetChildren()[1].Texture
	
	character:FindFirstChild("Head").face.Texture = inputFaceTexture
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
