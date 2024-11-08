//
//  TestData.swift
//  RecipeAppTests
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

///Test Data For Recipe list - 11 recipes
let testRecipeData = """
{
    "recipes": [
        {
            "cuisine": "Malaysian",
            "name": "Apam Balik",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
            "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        },
        {
            "cuisine": "British",
            "name": "Apple & Blackberry Crumble",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
            "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
            "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
        },
        {
            "cuisine": "British",
            "name": "Apple Frangipan Tart",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg",
            "uuid": "74f6d4eb-da50-4901-94d1-deae2d8af1d1",
            "youtube_url": "https://www.youtube.com/watch?v=rp8Slv4INLk"
        },
        {
            "cuisine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/small.jpg",
            "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            "youtube_url": "https://www.youtube.com/watch?v=1ahpSTf_Pvk"
        },
        {
            "cuisine": "American",
            "name": "Banana Pancakes",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/banana-pancakes",
            "uuid": "f8b20884-1e54-4e72-a417-dabbc8d91f12",
            "youtube_url": "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
        },
        {
            "cuisine": "British",
            "name": "Battenberg Cake",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/1120657/battenberg-cake",
            "uuid": "891a474e-91cd-4996-865e-02ac5facafe3",
            "youtube_url": "https://www.youtube.com/watch?v=aB41Q7kDZQ0"
        },
        {
            "cuisine": "Canadian",
            "name": "BeaverTails",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/small.jpg",
            "source_url": "https://www.tastemade.com/videos/beavertails",
            "uuid": "b5db2c09-411e-4bdf-9a75-a194dcde311b",
            "youtube_url": "https://www.youtube.com/watch?v=2G07UOqU2e8"
        },
        {
            "cuisine": "British",
            "name": "Blackberry Fool",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/small.jpg",
            "source_url": "https://www.bbc.co.uk/food/recipes/blackberry_fool_with_11859",
            "uuid": "8938f16a-954c-4d65-953f-fa069f3f1b0d",
            "youtube_url": "https://www.youtube.com/watch?v=kniRGjDLFrQ"
        },
        {
            "cuisine": "British",
            "name": "Bread and Butter Pudding",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/10818213-3c03-47ae-a7b1-230baa981226/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/10818213-3c03-47ae-a7b1-230baa981226/small.jpg",
            "source_url": "https://cooking.nytimes.com/recipes/1018529-coq-au-vin",
            "uuid": "02a80f95-09d6-430c-a9da-332584229d6f",
            "youtube_url": "https://www.youtube.com/watch?v=Vz5W1-BmOE4"
        },
        {
            "cuisine": "Italian",
            "name": "Budino Di Ricotta",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg",
            "source_url": "https://thehappyfoodie.co.uk/recipes/ricotta-cake-budino-di-ricotta",
            "uuid": "563dbb27-5323-443c-b30c-c221ae598568",
            "youtube_url": "https://www.youtube.com/watch?v=6dzd6Ra6sb4"
        },
        {
            "cuisine": "Canadian",
            "name": "Canadian Butter Tarts",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/1837/canadian-butter-tarts",
            "uuid": "39ad8233-c470-4394-b65f-2a6c3218b935",
            "youtube_url": "https://www.youtube.com/watch?v=WUpaOGghOdo"
        }
    ]
}
""".data(using: .utf8)!

///Invalid Test data for desserts - 9 recipes - misspelled cuisine
let testInvalidRecipeData = """
{
    "recipes": [
        {
            "cuisne": "Malaysian",
            "name": "Apam Balik",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
            "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        },
        {
            "cuiine": "British",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
            "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
            "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
        },
        {
            "csine": "British",
            "name": "Apple Frangipan Tart",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg",
            "uuid": "74f6d4eb-da50-4901-94d1-deae2d8af1d1",
            "youtube_url": "https://www.youtube.com/watch?v=rp8Slv4INLk"
        },
        {
            "cusine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/small.jpg",
            "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            "youtube_url": "https://www.youtube.com/watch?v=1ahpSTf_Pvk"
        },
        {
            "cuise": "American",
            "name": "Banana Pancakes",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/banana-pancakes",
            "uuid": "f8b20884-1e54-4e72-a417-dabbc8d91f12",
            "youtube_url": "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
        },
        {
            "uisine": "British",
            "name": "Battenberg Cake",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/1120657/battenberg-cake",
            "uuid": "891a474e-91cd-4996-865e-02ac5facafe3",
            "youtube_url": "https://www.youtube.com/watch?v=aB41Q7kDZQ0"
        },
        {
            "cusine": "Canadian",
            "name": "BeaverTails",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/small.jpg",
            "source_url": "https://www.tastemade.com/videos/beavertails",
            "uuid": "b5db2c09-411e-4bdf-9a75-a194dcde311b",
            "youtube_url": "https://www.youtube.com/watch?v=2G07UOqU2e8"
        },
        {
            "cusine": "British",
            "name": "Blackberry Fool",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/small.jpg",
            "source_url": "https://www.bbc.co.uk/food/recipes/blackberry_fool_with_11859",
            "uuid": "8938f16a-954c-4d65-953f-fa069f3f1b0d",
            "youtube_url": "https://www.youtube.com/watch?v=kniRGjDLFrQ"
        },
        {
            "cuiine": "British",
            "name": "Bread and Butter Pudding",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/10818213-3c03-47ae-a7b1-230baa981226/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/10818213-3c03-47ae-a7b1-230baa981226/small.jpg",
            "source_url": "https://cooking.nytimes.com/recipes/1018529-coq-au-vin",
            "uuid": "02a80f95-09d6-430c-a9da-332584229d6f",
            "youtube_url": "https://www.youtube.com/watch?v=Vz5W1-BmOE4"
        }
    ]
}
""".data(using: .utf8)!

let emptyRecipeTestData = """
{
    "recipes": []
}
""".data(using: .utf8)!

//test single recipe source
let recipe01TestData = """
{
    "cuisine": "French",
    "name": "White Chocolate Crème Brûlée",
    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/large.jpg",
    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/small.jpg",
    "source_url": "https://www.bbcgoodfood.com/recipes/2540/white-chocolate-crme-brle",
    "uuid": "ef7d81b7-07ba-4fab-a791-ae10e2817e66",
    "youtube_url": "https://www.youtube.com/watch?v=LmJ0lsPLHDc"
}
""".data(using: .utf8)!

//Missing source
let recipe02TestData = """
{
    "cuisine": "French",
    "name": "White Chocolate Crème Brûlée",
    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/large.jpg",
    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/small.jpg",
    
    "uuid": "ef7d81b7-07ba-4fab-a791-ae10e2817e66",
    "youtube_url": "https://www.youtube.com/watch?v=LmJ0lsPLHDc"
}
""".data(using: .utf8)!

//missing video
let recipe03TestData = """
{
    "cuisine": "French",
    "name": "White Chocolate Crème Brûlée",
    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/large.jpg",
    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/small.jpg",
    "source_url": "https://www.bbcgoodfood.com/recipes/2540/white-chocolate-crme-brle",
    "uuid": "ef7d81b7-07ba-4fab-a791-ae10e2817e66",

}
""".data(using: .utf8)!

//missing source and video
let recipe04TestData = """
{
    "cuisine": "French",
    "name": "White Chocolate Crème Brûlée",
    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/large.jpg",
    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f4b7b7d7-9671-410e-bf81-39a007ede535/small.jpg",
    
    "uuid": "ef7d81b7-07ba-4fab-a791-ae10e2817e66",

}
""".data(using: .utf8)!

