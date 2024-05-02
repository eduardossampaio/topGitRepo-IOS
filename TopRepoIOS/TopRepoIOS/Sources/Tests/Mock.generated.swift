// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation
import RxSwift
@testable import TopRepoIOS


// MARK: - FlowController

open class FlowControllerMock: FlowController, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func navigateDetails(repository: Repo) {
        addInvocation(.m_navigateDetails__repository_repository(Parameter<Repo>.value(`repository`)))
		let perform = methodPerformValue(.m_navigateDetails__repository_repository(Parameter<Repo>.value(`repository`))) as? (Repo) -> Void
		perform?(`repository`)
    }


    fileprivate enum MethodType {
        case m_navigateDetails__repository_repository(Parameter<Repo>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_navigateDetails__repository_repository(let lhsRepository), .m_navigateDetails__repository_repository(let rhsRepository)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRepository, rhs: rhsRepository, with: matcher), lhsRepository, rhsRepository, "repository"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_navigateDetails__repository_repository(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_navigateDetails__repository_repository: return ".navigateDetails(repository:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func navigateDetails(repository: Parameter<Repo>) -> Verify { return Verify(method: .m_navigateDetails__repository_repository(`repository`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func navigateDetails(repository: Parameter<Repo>, perform: @escaping (Repo) -> Void) -> Perform {
            return Perform(method: .m_navigateDetails__repository_repository(`repository`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GitApiServiceProtocol

open class GitApiServiceProtocolMock: GitApiServiceProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func listAllRepositories(page: Int, searchQuery: SearchQuery?) -> Observable<[Repo]> {
        addInvocation(.m_listAllRepositories__page_pagesearchQuery_searchQuery(Parameter<Int>.value(`page`), Parameter<SearchQuery?>.value(`searchQuery`)))
		let perform = methodPerformValue(.m_listAllRepositories__page_pagesearchQuery_searchQuery(Parameter<Int>.value(`page`), Parameter<SearchQuery?>.value(`searchQuery`))) as? (Int, SearchQuery?) -> Void
		perform?(`page`, `searchQuery`)
		var __value: Observable<[Repo]>
		do {
		    __value = try methodReturnValue(.m_listAllRepositories__page_pagesearchQuery_searchQuery(Parameter<Int>.value(`page`), Parameter<SearchQuery?>.value(`searchQuery`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for listAllRepositories(page: Int, searchQuery: SearchQuery?). Use given")
			Failure("Stub return value not specified for listAllRepositories(page: Int, searchQuery: SearchQuery?). Use given")
		}
		return __value
    }

    open func listPullRequests(repo: Repo) -> Observable<[PullRequest]> {
        addInvocation(.m_listPullRequests__repo_repo(Parameter<Repo>.value(`repo`)))
		let perform = methodPerformValue(.m_listPullRequests__repo_repo(Parameter<Repo>.value(`repo`))) as? (Repo) -> Void
		perform?(`repo`)
		var __value: Observable<[PullRequest]>
		do {
		    __value = try methodReturnValue(.m_listPullRequests__repo_repo(Parameter<Repo>.value(`repo`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for listPullRequests(repo: Repo). Use given")
			Failure("Stub return value not specified for listPullRequests(repo: Repo). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_listAllRepositories__page_pagesearchQuery_searchQuery(Parameter<Int>, Parameter<SearchQuery?>)
        case m_listPullRequests__repo_repo(Parameter<Repo>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_listAllRepositories__page_pagesearchQuery_searchQuery(let lhsPage, let lhsSearchquery), .m_listAllRepositories__page_pagesearchQuery_searchQuery(let rhsPage, let rhsSearchquery)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher), lhsPage, rhsPage, "page"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSearchquery, rhs: rhsSearchquery, with: matcher), lhsSearchquery, rhsSearchquery, "searchQuery"))
				return Matcher.ComparisonResult(results)

            case (.m_listPullRequests__repo_repo(let lhsRepo), .m_listPullRequests__repo_repo(let rhsRepo)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRepo, rhs: rhsRepo, with: matcher), lhsRepo, rhsRepo, "repo"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_listAllRepositories__page_pagesearchQuery_searchQuery(p0, p1): return p0.intValue + p1.intValue
            case let .m_listPullRequests__repo_repo(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_listAllRepositories__page_pagesearchQuery_searchQuery: return ".listAllRepositories(page:searchQuery:)"
            case .m_listPullRequests__repo_repo: return ".listPullRequests(repo:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func listAllRepositories(page: Parameter<Int>, searchQuery: Parameter<SearchQuery?>, willReturn: Observable<[Repo]>...) -> MethodStub {
            return Given(method: .m_listAllRepositories__page_pagesearchQuery_searchQuery(`page`, `searchQuery`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func listPullRequests(repo: Parameter<Repo>, willReturn: Observable<[PullRequest]>...) -> MethodStub {
            return Given(method: .m_listPullRequests__repo_repo(`repo`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func listAllRepositories(page: Parameter<Int>, searchQuery: Parameter<SearchQuery?>, willProduce: (Stubber<Observable<[Repo]>>) -> Void) -> MethodStub {
            let willReturn: [Observable<[Repo]>] = []
			let given: Given = { return Given(method: .m_listAllRepositories__page_pagesearchQuery_searchQuery(`page`, `searchQuery`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<[Repo]>).self)
			willProduce(stubber)
			return given
        }
        public static func listPullRequests(repo: Parameter<Repo>, willProduce: (Stubber<Observable<[PullRequest]>>) -> Void) -> MethodStub {
            let willReturn: [Observable<[PullRequest]>] = []
			let given: Given = { return Given(method: .m_listPullRequests__repo_repo(`repo`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<[PullRequest]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func listAllRepositories(page: Parameter<Int>, searchQuery: Parameter<SearchQuery?>) -> Verify { return Verify(method: .m_listAllRepositories__page_pagesearchQuery_searchQuery(`page`, `searchQuery`))}
        public static func listPullRequests(repo: Parameter<Repo>) -> Verify { return Verify(method: .m_listPullRequests__repo_repo(`repo`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func listAllRepositories(page: Parameter<Int>, searchQuery: Parameter<SearchQuery?>, perform: @escaping (Int, SearchQuery?) -> Void) -> Perform {
            return Perform(method: .m_listAllRepositories__page_pagesearchQuery_searchQuery(`page`, `searchQuery`), performs: perform)
        }
        public static func listPullRequests(repo: Parameter<Repo>, perform: @escaping (Repo) -> Void) -> Perform {
            return Perform(method: .m_listPullRequests__repo_repo(`repo`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

