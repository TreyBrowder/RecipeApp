//
//  ViewModelTests.swift
//  ViewModelTests
//
//  Created by Trey Browder on 11/7/24.
//

import XCTest
@testable import RecipeApp

final class RecipeViewModelTests: XCTestCase {
    var recipeVM: RecipeViewModel!
    var mockService: MockRecipeService!
    
    override func setUpWithError() throws {
        mockService = MockRecipeService()
        recipeVM = RecipeViewModel(service: mockService)
    }

    override func tearDownWithError() throws {
        mockService = nil
        recipeVM = nil
    }
    
    func testInit(){
        XCTAssertNotNil(recipeVM)
    }
    func testDecodeRecipesIntoArray() throws {
        let result = try JSONDecoder().decode(RecipeResponse.self, from: testRecipeData)
        let recipes = result.recipes
        XCTAssertTrue(recipes.count > 0)
        XCTAssertEqual(recipes.count, 11)
    }
    
    func testGetRecipes_Success() async {
        // Mock a valid response with the provided testRecipeData
        mockService.mockData = testRecipeData
        
        await recipeVM.getRecipes(isRefreshing: false)
        
        XCTAssertFalse(recipeVM.isLoading, "The loading state should be false after fetching data.")
        XCTAssertNotNil(recipeVM.recipeArr, "The recipe array should be populated.")
        XCTAssertTrue(recipeVM.recipeArr.count > 0, "The recipe array should contain recipes.")
        XCTAssertEqual(recipeVM.recipeArr.count, 11)
        XCTAssertNil(recipeVM.errorMsg, "There should be no error message when the request is successful.")
    }
    
    func testGetRecipes_EmptyData() async {
        // Mock an empty response
        mockService.mockData = Data("""
        { "recipes": [] }
        """.data(using: .utf8)!)
        
        await recipeVM.getRecipes(isRefreshing: false)
        
        XCTAssertTrue(recipeVM.recipeArr.isEmpty, "The recipe array should be empty.")
        XCTAssertEqual(recipeVM.errorMsg, APIError.EmptyData(msg: "No Recipes Available at this time").description, "The error message should be set correctly when there are no recipes.")
    }
    
    func testGetRecipes_ServiceError() async {
        //Test Throwing a mock error
        mockService.mockError = APIError.requestFailed(msg: "Network request failed.")
        await recipeVM.getRecipes(isRefreshing: false)
        
        //loading should be false after the call
        XCTAssertFalse(recipeVM.isLoading, "The loading state should be false after the error is handled.")
        
        //Check Error Thrown
        XCTAssertEqual(recipeVM.errorMsg, APIError.requestFailed(msg: "Network request failed.").description, "The error message should be set correctly when the service fails.")
    }
    
    func testGetRecipes_JsonParseFail() async {
        // Mock a response that will fail JSON parsing
        mockService.mockData = testInvalidRecipeData
        
        await recipeVM.getRecipes(isRefreshing: false)
        
        XCTAssertEqual(recipeVM.recipeArr.count, 0)
    }
    
    func testFilteredMeals_EmptySearchText() {
        // Set some test data
        mockService.mockData = testRecipeData
        recipeVM.searchedText = ""
        
        let filteredMeals = recipeVM.filteredMeals
        XCTAssertEqual(filteredMeals.count, 0, "All recipes should be returned when the search text is empty.")
    }
    
    func testFilteredMeals_SearchText() async {
        // Set some test data
        mockService.mockData = testRecipeData
        recipeVM.searchedText = "Apple"
        
        await recipeVM.getRecipes(isRefreshing: false)
        
        let filteredMeals = recipeVM.filteredMeals
        XCTAssertEqual(filteredMeals.count, 2, "One recipe Should be returned when searched Text is apple.")
    }
    
    func testIsRecipeAvailable() {
        //Decode JSON test data into Recipe objects
        let recipeWithSourceAndVideo = try! JSONDecoder().decode(Recipe.self, from: recipe01TestData)
        let recipeWithoutSource = try! JSONDecoder().decode(Recipe.self, from: recipe02TestData)
        let recipeWithVideo = try! JSONDecoder().decode(Recipe.self, from: recipe03TestData)
        let recipeWithoutSourceAndVideo = try! JSONDecoder().decode(Recipe.self, from: recipe04TestData)
        
        //Test cases for unavailableText method
        //Both source and video are available
        XCTAssertNil(recipeVM.unavailableText(for: recipeWithSourceAndVideo), "Recipe should be available with both source URL and video URL.")
        
        //Source is missing
        XCTAssertEqual(recipeVM.unavailableText(for: recipeWithoutSource), "Recipe unavailable", "Recipe should NOT be available when source URL is missing.")
        
        //Video is missing
        XCTAssertEqual(recipeVM.unavailableText(for: recipeWithVideo), "Tutorial unavailable", "Recipe should NOT be available when video URL is missing.")
        
        //Both source and video are missing
        XCTAssertEqual(recipeVM.unavailableText(for: recipeWithoutSourceAndVideo), "Recipe and tutorial unavailable", "Recipe and tutorial should both be unavailable.")
        
    }
}
