//
//  CryptoPaperSwiftTests.swift
//  CryptoPaperSwiftTests
//
//  Created by Débora Cristina Silva Ferreira on 04/03/26.
//

import Testing
@testable import CryptoPaper

struct CryptoPaperSwiftTests {

    @Test("Testar se o get balance está calculando corretamente")
    func getBalanceCalculateCorrectTotalTest() async throws {
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
        #expect(viewModel.totalBalance == 100100)
    }
    
    @Test
    func filterCoinIsWorkin() async throws {
        let service = ServiceManager()
        let viewModel = CoinsViewModel(serviceManager: service)
        
        
        viewModel.coins = [
            CoinWrapper(symbol: "BTC", price: "50000")
        ]
        
        viewModel.filterCoins(with: "BTC")
        
        #expect(viewModel.filteredCoins.count == 1)
        #expect(viewModel.filteredCoins.first?.symbol == "BTC")
    }
    
    @Test
    func filterCoinAcceptNullSearch() async throws {
        let service = ServiceManager()
        let viewModel = CoinsViewModel(serviceManager: service)
        
        viewModel.coins = [
            CoinWrapper(symbol: "BTC", price: "50000"),
            CoinWrapper(symbol: "EGH", price: "1000")
        ]
        
        viewModel.filterCoins(with: "")
        
        #expect(viewModel.filteredCoins.count == 2)
        #expect(viewModel.filteredCoins.first?.symbol == "BTC")
        #expect(viewModel.filteredCoins.last?.symbol == "EGH")

        

    }

}
