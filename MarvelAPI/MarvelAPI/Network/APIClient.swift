import Foundation

typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

protocol APIClient {
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>)
}

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    
    var resourceName: String { get }
}
