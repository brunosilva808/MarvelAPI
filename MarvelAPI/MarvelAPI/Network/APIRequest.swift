import Foundation

typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

protocol APIClient {
    func send<T>(_ request: T,
                 completion: @escaping ResultCallback<DataContainer<T.Response>>) where T : APIRequest
}

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    
    var resourceName: String { get }
}
