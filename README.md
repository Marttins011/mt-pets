# mt-pets
This is a work in progress so please don't request support! i don't advise you to use this rn!

Add to qb-target/init.lua

```
    ["loja-pets"] = {
        models = {
            "u_m_y_baygor",

        },
        options = {
            {
                type = "client",
                event = "mt-pets:client:MenuLoja",
                icon = "fas fa-cat", 
                label = "Talk to employee",
            }
        },
        distance = 2.5,
    },
    ```
    
        { --mt-pets
        model = 'u_m_y_baygor',
        coords = vector4(563.19, 2753.09, 41.88, 184.1),
        gender = 'male',
        freeze = true,
        invincible = false,
        blockevents = false,
    },
```

# Add to qb-core/shared/items.lua

```
	-- mt-pets
	["pet_shepherd"] 				= {["name"] = "pet_shepherd", 					["label"] = "K9 Unit", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_k9.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Doggo go woof!"},
	["pet_cat"] 					= {["name"] = "pet_cat", 						["label"] = "Pet Cat", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_cat.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Cat go miauw miauw!"},
	["pet_pug"] 					= {["name"] = "pet_pug", 						["label"] = "Pet Pug", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_pug.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Doggo go woof!"},
	["pet_retriever"] 				= {["name"] = "pet_retriever", 					["label"] = "Pet Retriever", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_retriever.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Doggo go woof!"},
	["pet_rat"] 					= {["name"] = "pet_rat", 						["label"] = "Pet Rat", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_rat.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "This rat is missing a toe!"},
	["pet_rottweiler"] 				= {["name"] = "pet_rottweiler", 				["label"] = "Pet Rottweiler", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_rottweiler.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
	["pet_westy"] 					= {["name"] = "pet_westy", 						["label"] = "Pet Westy", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_westy.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
	["pet_poodle"] 					= {["name"] = "pet_poodle", 					["label"] = "Pet Poodle", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_poodle.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
	["pet_rabbit"] 					= {["name"] = "pet_rabbit", 					["label"] = "Pet Rabbit", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_rabbit.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
	["pet_chicken"] 				= {["name"] = "pet_chicken", 					["label"] = "Pet Chicken", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_chicken.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Soon to be KFC"},
	["pet_husky"] 					= {["name"] = "pet_husky", 						["label"] = "Pet Husky", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_husky.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "A fine doggo"},
	["pet_mtlion"] 					= {["name"] = "pet_mtlion", 					["label"] = "Pet Lionh34rt", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "pet_mtlion.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,	   	["combinable"] = nil,   ["description"] = "Big cat"},
	["comida_animais"]     = {["name"] = "comida_animais", 				    ["label"] = "Pet Feed", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = ".png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["agua_animais"]     = {["name"] = "agua_animais", 				    ["label"] = "Pet Water", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = ".png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

# MLO LINK

https://www.gta5-mods.com/maps/mlo-pet-shop

# Original script:
https://github.com/Lionh34rt/lion-companions
