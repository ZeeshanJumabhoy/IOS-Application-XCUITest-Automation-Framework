//
//  AsyncNetworkPerformanceTests.swift
//

import XCTest

final class AsyncNetworkPerformanceTests: BaseTest {

    private var asyncPage: AsyncLoadingPage { AsyncLoadingPage(app: app) }
    private var networkPerfPage: NetworkPerformancePage { NetworkPerformancePage(app: app) }

    func test_asyncLoading_reachesTerminalState() {
        asyncPage.assertAsyncLoadReachesTerminalState()
    }

    func test_networkState_toggleAndRetry() {
        networkPerfPage.assertNetworkToggleAndRetry()
    }

    func test_performanceLoad_searchFiltersList() {
        networkPerfPage.assertLoadTestSearchFiltersToSingleItem()
    }
}
