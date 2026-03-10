//
//  CryptoPaperTests.swift
//  CryptoPaperTests
//
//  Created by Débora Cristina Silva Ferreira on 02/03/26.
//

import XCTest
import SwiftData
@testable import CryptoPaper

final class CryptoPaperTests: XCTestCase {
    var dataController: DataController!
    var service: ServiceManager!
    
    // Criar um banco de dados fake que pode ser utilizados por diferentes testes
    @MainActor
    override func setUpWithError() throws {
        // Usar um banco de dados em memoria e não no disco
        
        // Criar o schema dos dados que serão utilizados
        let schema = Schema([User.self,
                             Coin.self,
                             Transactions.self])
        
        // Criar a configuração
        let config = ModelConfiguration(isStoredInMemoryOnly:  true)
        let container = try ModelContainer(for: schema, configurations: config)

        // Salvando o contexto com o container criado
        self.dataController  = DataController(container: container)
    }
    
    
    override func tearDownWithError() throws {
        dataController = nil
    }
    @MainActor
    func testPersistsRelationshipWithDataController() throws {
        //Given
        let user = User(coins: [], transactions: nil)
        dataController.container.mainContext.insert(user)
        try dataController.container.mainContext.save()
        
        // When
        let coinName = "teste"
        let coinAmount: Double = 50000
        dataController.addCoin(name: coinName, amount: coinAmount)

        //Then
        let fetchedUser = dataController.fetchUser()
        XCTAssertEqual(fetchedUser.coins.count, 1)
        XCTAssertTrue(fetchedUser.coins.contains { $0.name == "teste" && $0.amount == 50000 })
    }
    
    func testGetBalanceCalculateCorrectTotal() throws {
        // Given
        let service = ServiceManager()
        let viewModel = CoinsViewModel(serviceManager: service)
        
        let user = User(coins: [], transactions: nil)
        
        let usd = Coin(name: "usd", amount: 100)
        let btc = Coin(name: "BTC", amount: 2)
        
        user.coins = [usd, btc]
        
        viewModel.user = user
        
        viewModel.coins = [
            CoinWrapper(symbol: "BTC", price: "50000")
        ]
        
        // When
        viewModel.getBalance()
        
        //Then
        XCTAssertEqual(viewModel.totalBalance, 100100)
    }
    
    func testGetBalanceCoinNotFindShouldIgnoreCoin() {
        // Given
        let service = ServiceManager()
        let viewModel = CoinsViewModel(serviceManager: service)
        
        let user = User(coins: [], transactions: nil)
        
        let btc = Coin(name: "BTC", amount: 2)
        
        user.coins = [btc]
        
        viewModel.user = user
        
        viewModel.coins = [
        ]
        
        // When
        viewModel.getBalance()
        
        //Then
        XCTAssertEqual(viewModel.totalBalance, 0.0)
    }
    
    func testGetBalanceWithPriceInvalidShouldIgnoreCoin() {
        // Given
        let service = ServiceManager()
        let viewModel = CoinsViewModel(serviceManager: service)
        
        let user = User(coins: [], transactions: nil)
        
        let btc = Coin(name: "BTC", amount: 2)
        user.coins = [btc]
        viewModel.user = user
        
        
        viewModel.coins = [
            CoinWrapper(symbol: "BTC", price: "abc")
        ]
        
        // When
        viewModel.getBalance()
        
        //Then
        XCTAssertEqual(viewModel.totalBalance, 0.0)
    }
    
    
}

