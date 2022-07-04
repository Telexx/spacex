//
//  BiographyViewModelSpec.swift
//  SpaceX ClientTests
//
//  Created by Alec on 29/06/2022.
//

import XCTest
@testable import SpaceX_Client

@MainActor final class BiographyViewModelSpec: XCTestCase {
    
    var vm:BiographyViewModel?
    
    func testGetCompanyInfoSuccess() async throws {
        let spaceXService = SpaceXServiceMock()
        spaceXService.shouldFail = false
        vm = BiographyViewModel(spaceXService: spaceXService)
        await vm?.getCompanyInfo()
        XCTAssert(vm?.biograpghy != "")
    }
    
    func testGetCompanyInfoFailed() async throws {
        let spaceXService = SpaceXServiceMock()
        spaceXService.shouldFail = true
        vm = BiographyViewModel(spaceXService: spaceXService)
        await vm?.getCompanyInfo()
        XCTAssert(vm?.biograpghy == "")
        XCTAssert(vm?.failedToGetCompany == true)
    }
    
    func testFormatBiography() async throws {
        let spaceXService = SpaceXServiceMock()
        spaceXService.shouldFail = false
        vm = BiographyViewModel(spaceXService: spaceXService)
        await vm?.getCompanyInfo()
        XCTAssert(vm?.biograpghy == "SpaceX was founded by Elon Musk in 2002. It has now 9500 employees, 3 launch sites, and is valued at USD 74000000000")
    }
}

